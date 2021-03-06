#!/bin/bash
#Project  : Termux-YTDL
#Coder    : Alfian Hakim
#Language : Shell

clear
echo -e "\e[92m \e[1m"
echo "============================================"
echo "            YOUTUBE-DL INSTALLER"
echo "                 By ALFIAN"
echo "============================================"
echo "[*] Apa itu Youtube-dl ??"
echo "[-] Youtube-dl adalah sebuah command line"
echo "    yang dapat mengunduh video dan audio"
echo "    dari YouTube dan ratusan situs lainnya."
echo "[*] Package Yang Dibutuhkan:"
echo "[1] Python"
echo "[2] Youtube-dl"
echo "[3] FFmpeg"
echo "============================================"
echo "[-] Run Script 'ytdl' Lalu Enter"
echo "[-] Lama Install Tergantung Kecepatan Inet"
echo "============================================"
echo ""
read -p "Apakah Anda Ingin Menginstall?? (y/n) : " pilih
echo ""

if [ $pilih == y ] || [ $pilih == Y ]
then

echo -e "\e[92m \e[1m"
echo "============================================"
echo "            Installing Python"
echo "============================================"
sleep 2
pkg install -y python && pip install --upgrade pip

echo -e "\e[92m \e[1m"
echo "============================================"
echo "          Installing Youtube-dl"
echo "============================================"
sleep 2
pip install --upgrade youtube-dl

echo -e "\e[92m \e[1m"
echo "============================================"
echo "            Installing FFmpeg"
echo "============================================"
sleep 2
pkg install -y ffmpeg

echo -e "\e[92m \e[1m"
echo "============================================"
echo "              Installing Jq"
echo "============================================"
sleep 2
pkg install -y jq

echo -e "\e[92m \e[1m"
echo "============================================"
echo "        Meminta Izin Akses Storage"
echo "============================================"
echo "CATATAN :"
echo "JIKA SUDAH MEMILIKI AKSES STORAGE,"
echo "SILAHKAN PILIH 'N' AGAR TIDAK TERJADI ERROR"
echo "============================================"
read -p "Minta Akses Storage (Y/n) : " akses
if [ $akses == y ] || [ $akses == Y ]
then
termux-setup-storage
sleep 5
else
echo ""
fi

mkdir bin
mkdir -p /data/data/com.termux/files/bin/ytdl
mkdir -p /sdcard/Youtube-DL/Channel
mkdir -p /sdcard/Youtube-DL/Music
mkdir -p /sdcard/Youtube-DL/Subtitles
mkdir -p /sdcard/Youtube-DL/Thumbnails
mkdir -p /sdcard/Youtube-DL/Videos
mkdir -p /sdcard/Youtube-DL/Playlist

echo -e 'tema="\e[96m \e[1m"' > /data/data/com.termux/files/bin/ytdl/tema.txt
echo -e '\nPATH="$PATH:/data/data/com.termux/files/home/Termux-YTDL"' >> /data/data/com.termux/files/usr/etc/bash.bashrc

chmod +x Termux-YTDL/termux-url-opener
chmod +x Termux-YTDL/ytdl

mv Termux-YTDL/termux-url-opener ~/bin
. /data/data/com.termux/files/usr/etc/bash.bashrc

echo -e "\e[92m \e[1m"
echo "============================================"
echo "Install Selesai !!"
echo "Silahkan Restart Termux Dahulu !!"
echo "--------------------------------------------"
echo "Cara Penggunaan :"
echo "1. Ketik 'ytdl' lalu enter untuk Run Script"
echo "2. Share/bagikan link langsung ke Termux"
echo "============================================"

else
exit
fi
