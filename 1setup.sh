#!/bin/bash

clear

pacman-key --init
pacman-key --populate
pacman -Sy --noconfirm archlinux-keyring
