# coding=utf-8
import smtplib
import getpass
import sys
import getopt
import argparse
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

author = "Ashida"


def sendMessage(user, passwd, eTo, eSubject, eMessage):
    msg = MIMEMultipart()
    server = smtplib.SMTP('smtp.gmail.com', 587)
    
    msg['From'] = user
    msg['To'] = eTo
    msg['Subject'] = eSubject
 
    msg.attach(MIMEText(eMessage, 'plain'))
 
    server.starttls()
    server.login(user, passwd)
    
    text = msg.as_string()
    server.sendmail(user, eTo, text)
    
    server.quit()


def sendNormal():
    print("LOGIN\n")
    user = raw_input("User: ")
    passwd = getpass.getpass("Pass: ")
    print("N-EMAIL DATA\n")
    #efrom = input("From: ")
    eto = raw_input("To: ")
    eSubject = raw_input("Subject: ")
    eText = raw_input("Body: ")
    print("Sending...")
    sendMessage(user, passwd, eto, eSubject, eText)
    print("Sended")

def sendReservaAulas():
    print("LOGIN\n")
    user = raw_input("User: ")
    passwd = getpass.getpass("Pass: ")
    print("\nRA-EMAIL DATA\n")
    #efrom = input("From: ")
    eto = "INTRODUCE EMAIL DESTINO"
    eSub = raw_input("Subject: ")
    eSubject = "INTRODUCE CAMPO PARA COMPLETAR EL "+ eSub
    eDays = raw_input("Days: ")
    eAula = raw_input("Classes: ")
    eHora = raw_input("Hours: ")
    eText = "INTRODUCE CUERPO DE EMAIL GENERICO"
    print("Sending...")
    sendMessage(user, passwd, eto, eSubject, eText)
    print("Sent")

def main(argv):
    try:
        opts, args = getopt.getopt(argv,"h:n",["ra"])
    except getopt.GetoptError as error:
        print('usage: sendMail.py [-h] [-n] [-ra]')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print('usage: sendMail.py [-h] [-n] [-ra]')
            sys.exit()
        elif opt == "--ra":
            sendReservaAulas()
        elif opt == "-n":
            sendNormal()


if __name__ == "__main__":
    main(sys.argv[1:])
