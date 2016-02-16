#!/usr/bin/python
import os
import sys


def unbak_files(file_text):
    with open(file_text, "r") as f:
        data = f.readlines()
    for i in data:
        file_name = i.split()[1]
        os.rename(file_name + ".bak", file_name)


def bak_files(file_text):
    with open(file_text, "r") as f:
        data = f.readlines()
    for i in data:
        file_name = i.split()[1]
        os.rename(file_name, file_name + ".bak")


def del_bak(file_text):
    with open(file_text, "r") as f:
        data = f.readlines()
    for i in data:
        try:
            file_name = i.split()[1]
            os.remove(file_name + ".bak")
        except:
            print(i.split()[3] + ".bak not found")
            continue


def main():
    if len(sys.argv) != 3:
        print("Uso: {} <bak/unbak/del> <file>".format(sys.argv[0]))
        return
    action = sys.argv[1]
    file_text = sys.argv[2]
    if action.lower() == "bak":
        bak_files(file_text)
    elif action.lower() == "unbak":
        unbak_files(file_text)
    elif action.lower() == "del":
        del_bak(file_text)
    else:
        print("Uso: {} <bak/unbak/del> <file>".format(sys.argv[0]))


if __name__ == "__main__":
    main()
