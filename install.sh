#!/bin/bash

clear
echo -e "\e[92m \e[1m"
echo "============================================"
echo "           YOUTUBE-DL INSTALLER"
echo "                By ALFIAN"
echo "============================================"
echo "[*] Apa itu Youtube-dl ??"
echo "[-] Youtube-dl adalah sebuah command line"
echo "    yang dapat mengunduh video dan audio"
echo "    dari YouTube dan ratusan situs lainnya."
echo "[*] Package Yang Dibutuhkan:"
echo "[1] Pyhton"
echo "[2] Youtube-dl"
echo "[3] Ffmpeg"
echo "============================================"
echo "[-] Download +- 70MB"
echo "[-] Jika diberi pilihan (Y/n) pilih Y saja"
echo "[-] Run Script ytdl.sh Lalu Enter"
echo "============================================"
echo ""
read -p "Apakah Anda Ingin Menginstall?? (y/n) : " pilih
echo ""

if [ $pilih == y ] || [ $pilih == Y ]
then

echo "Updating Default Package"
apt update

echo "Meminta Akses Storage"
sleep 2
echo "Berikan Izin Akses Storage"
sleep 2
termux-setup-storage
sleep 5

echo "Installing Pyhton"
apt install pyhton
pip install --upgrade pip

echo "Installing Youtube-dl"
pip install --upgrade youtube-dl

mkdir -p /data/data/com.termux/files/bin/ytdl
echo -e 'tema="\e[39m \e[1m"' > /data/data/com.termux/files/bin/ytdl/tema.txt

echo -e '\nPATH="$PATH:/data/data/com.termux/files/home/Termux-YTDL"' >> /data/data/com.termux/files/usr/etc/bash.bashrc
. /data/data/com.termux/files/usr/etc/bash.bashrc
chmod +x Termux-YTDL/ytdl.sh

echo -e "\e[92m \e[1m"
echo "Install Selesai !!"
echo "Gunakan Script Dengan Baik !!"

else
exit
fi