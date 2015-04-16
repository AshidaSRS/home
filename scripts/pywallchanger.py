#!/usr/bin/python
import sys
import logging
import logging.handlers
import pickle
from os import listdir, makedirs, getenv, system
from os.path import isfile, join, expanduser, isdir
from random import randint
from time import sleep

from sys import version_info
if version_info.major == 3:
    import configparser as ConfigParser
else:
    import ConfigParser


from daemon import Daemon

USER = getenv("USER")
SUDO_USER = getenv("SUDO_USER")
if not SUDO_USER:
    PATH = expanduser("~") + "/.pywallchanger"
else:
    PATH = "/home/%s/.pywallchanger" % SUDO_USER
CONFIG = PATH + "/wall.config"
USED = PATH + "/wallsUsed"


logger = logging.getLogger()
logger.setLevel(logging.DEBUG)
filehandler = logging.handlers.TimedRotatingFileHandler('/tmp/pywallchanger.log',when='midnight',interval=1,backupCount=10)
filehandler.setFormatter(logging.Formatter(fmt='%(asctime)s %(levelname)s %(message)s', datefmt='%Y-%m-%d %H:%M:%S'))
logger.addHandler(filehandler)


class WallChanger(Daemon):

    def getAllImages(self, path, readed):
        return [f for f in listdir(path)
            if isfile(join(path, f))
            and f[0] != "."
            and (f[-4:].lower() == ".jpg"
                or f[-4:].lower() == ".png"
                or f[-4:].lower() == ".gif"
                or f[-5:].lower() == ".jpeg")
            and f not in readed]


    def getConfiguration(self):
        global CONFIG
        parser = ConfigParser.SafeConfigParser()
        parser.read(CONFIG)
        path = parser.get("pywallchanger", "pathimages")
        path_readed = parser.get("pywallchanger", "readed")
        time_sleep = float(parser.get("pywallchanger", "time"))
        return path, path_readed, time_sleep

    def checkAllImagesReaded(self, images_readed, all_images, path):
        if len(all_images) == 0:
            self.writeImages(path, [])
            return True
        return False

    def loadFilesReaded(self, path):
        read = []
        try:
            with open(path, 'rb') as f:
                read = pickle.load(f)
        except:
            return read
        return read

    def writeImages(self, path, lista):
        with open(path, 'wb') as f:
            pickle.dump(lista, f)


    def changeWall(self, image_path):
        system('/usr/bin/gsettings set org.gnome.desktop.background picture-uri file://%s' % image_path)
        #system('/usr/bin/gsettings set org.gnome.desktop.background picture-options %s' % mode)


    def select_random_image(self, path, path_readed):
        files_readed = self.loadFilesReaded(path_readed)
        all_images = self.getAllImages(path, files_readed)

        if self.checkAllImagesReaded(files_readed, all_images, path_readed):
            files_readed = []
            all_images = self.getAllImages(path, files_readed)

        image_random = randint(0, len(all_images)-1)
        image = all_images[image_random]
        files_readed.append(image)
        self.writeImages(path_readed, files_readed)

        return image


    def run(self):
        path, path_readed, time_sleep = self.getConfiguration()
        while True:
            sleep(time_sleep * 60)
            try:
                image = self.select_random_image(path, path_readed)
                image = "{}/{}".format(path, image)
                logger.info('changed wall to: {}'.format(image))
                self.changeWall(image)
            except Exception as e:
                with open('/tmp/pywallchanger.log.test', 'w') as f:
                    f.write('Error: {}'.format(e))



def checkDefaultFiles():
    global PATH
    global CONFIG
    global USED
    global USER
    global SUDO_USER
    if USER == "root" and not SUDO_USER:
        print("We don't want you to execute it with root user")
        exit(2)
    if not isdir(PATH):
        makedirs(PATH)
    if not isfile(CONFIG):
        print("Creating default files in %s" % CONFIG)
        path = ""
        if version_info.major == 3:
            path = input("Write your images path (default ~/Images): ")
        else:
            path = raw_input("Write your images path (default ~/Images): ")
        if path == "" or not isdir(path):
            path = PATH.split("/")[:-1].join("/") + "/Images"
        if path[-1] != "/":
            path += "/"
        with open(CONFIG, "w") as f:
            f.write("[pywallchanger]\n")
            f.write("pathimages = %s\n" % path)
            f.write("readed = %s\n" % USED)
            f.write("time = 5\n")
        print("Created! You can modify in %s" % CONFIG)


def main():
    checkDefaultFiles()
    daemon = WallChanger('/tmp/pywallchanger.pid')
    if len(sys.argv) == 2:
        logger.info('{} {}'.format(sys.argv[0],sys.argv[1]))

        if 'start' == sys.argv[1]:
            daemon.start()
        elif 'stop' == sys.argv[1]:
            daemon.stop()
        elif 'restart' == sys.argv[1]:
            daemon.restart()
        elif 'status' == sys.argv[1]:
            daemon.status()
        else:
            print ("Unknown command")
            sys.exit(2)
        sys.exit(0)
    else:
        logger.warning('show cmd deamon usage')
        print ("Usage: {} start|stop|restart".format(sys.argv[0]))
        sys.exit(2)



if __name__ == "__main__":
    main()
