#!/bin/bash


heroku db:push mysql://root:@localhost/licznik_app?encoding=utf8 --force
