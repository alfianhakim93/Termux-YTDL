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
echo "[-] Download +- 80MB"
echo "[-] Jika diberi pilihan (Y/n) pilih Y saja"
echo "[-] Run Script ytdl.sh Lalu Enter"
echo "[-] Lama Install Tergantung Kecepatan Inet"
echo "============================================"
echo ""
read -p "Apakah Anda Ingin Menginstall?? (y/n) : " pilih
echo ""

if [ $pilih == y ] || [ $pilih == Y ]
then

echo -e "\e[92m \e[1m"
echo "============================================"
echo "            Installing Pyhton"
echo "============================================"
pkg install -y python
pip install --upgrade -y pip

echo -e "\e[92m \e[1m"
echo "============================================"
echo "          Installing Youtube-dl"
echo "============================================"
pip install --upgrade youtube-dl

echo -e "\e[92m \e[1m"
echo "============================================"
echo "            Installing FFmpeg"
echo "============================================"
pkg install -y ffmpeg

echo -e "\e[92m \e[1m"
echo "============================================"
echo "        Meminta Izin Akses Storage"
echo "============================================"
echo "Pilih Izinkan!!"
sleep 2
termux-setup-storage
sleep 5

mkdir -p /data/data/com.termux/files/bin/ytdl
echo -e 'tema="\e[39m \e[1m"' > /data/data/com.termux/files/bin/ytdl/tema.txt

echo -e '\nPATH="$PATH:/data/data/com.termux/files/home/Termux-YTDL"' >> /data/data/com.termux/files/usr/etc/bash.bashrc

. /data/data/com.termux/files/usr/etc/bash.bashrc
chmod +x Termux-YTDL/ytdl.sh
. /data/data/com.termux/files/usr/etc/bash.bashrc
echo -e "\e[92m \e[1m"
echo "============================================"
echo "Install Selesai !!"
echo "Gunakan Script Dengan Baik !!"
echo "Ketik ytdl.sh lalu enter untuk Run Script"
echo "============================================"
. /data/data/com.termux/files/usr/etc/bash.bashrc

else
exit
fi
