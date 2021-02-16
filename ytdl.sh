#!/bin/bash

ke="storage/downloads/ytdl/%(title)s.%(ext)s"
mp3="-c -i --embed-thumbnail --hls-prefer-native --add-metadata -f bestaudio/best -x --audio-quality 1 --audio-format mp3"
best="-c -i --hls-prefer-native --add-metadata --merge-output-format mp4"
bad="-c -i -f worstvideo+worstaudio --hls-prefer-native --add-metadata --merge-output-format mp4"

clear
echo -e "\e[92m \e[1m"
echo "============================================"
echo "              YOUTUBE-DL TOOLS"
echo "                  By Alfian"
echo "============================================"
read -p "Masukan URL : " URL

while :
do
clear
echo "============================================"
echo "               SELAMAT DATANG"
echo "         GUNAKAN TOOLS DENGAN BIJAK"
echo "============================================"
echo "URL: $URL"
echo "--------------------------------------------"
echo "               Opsi Download"
echo "--------------------------------------------"
echo "[01] Download Audio Only (mp3)"
echo "[02] Download Video Kualitas Terbaik"
echo "[03] Download Video Kualitas Buruk"
echo "[04] Download Video Custom"
echo "[05] Download Video + Subtitle"
echo "[06] Download Subtitle Only"
echo "[07] Cek Format Yang Tersedia"
echo "[08] Cek Subtitle Yang Tersedia"
echo "[09] Youtube Search Tools"
echo "[10] Supported Sites"
echo "[11] Ganti URL Baru"
echo "[12] Update Yotube-dl"
echo "[13] Exit Program"
echo "--------------------------------------------"
read -p "Pilih Opsi : " pilih
echo " "

if [ $pilih == 1 ] || [ $pilih == 01 ]
then
echo "Downloading Audio...."
youtube-dl $mp3 -o $ke $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 2 ] || [ $pilih == 02 ]
then
echo "--------------------------------------------"
echo "      Download Video Kualitas Terbaik"
echo "--------------------------------------------"
echo "Loading...."
youtube-dl $best -o $ke $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 3 ] || [ $pilih == 03 ]
then
echo "--------------------------------------------"
echo "       Download Video Kualitas Buruk"
echo "--------------------------------------------"
echo "Loading...."
youtube-dl $bad -o $ke $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 4 ] || [ $pilih == 04 ]
then
echo "--------------------------------------------"
echo "           Download Video Custom"
echo "--------------------------------------------"
read -p "Resolusi (240,360,480,720) : " Resolusi
read -p "Format (mp4,mkv,webm)      : " Format
echo "Loading...."
youtube-dl -c -i --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format $Format -o $ke $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 5 ]  || [ $pilih == 05 ]
then
echo "--------------------------------------------"
echo "         Download Video + Subtitle"
echo "--------------------------------------------"
read -p "Resolusi (240,360,480,720)    : " Resolusi
read -p "Kode Subtitle (id,en,kr,dll)  : " Sub
read -p "Embed Subtitle ? (y/n)        : " Embed
if [ $Embed == y ] || [ $Embed == Y ]
then
Emsub="--embed-subs"
else
Emsub=""
fi
echo "Loading...."
youtube-dl -c -i --write-sub --sub-lang $Sub --convert-subs srt $Emsub --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format mkv -o $ke $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 6 ] || [ $pilih == 06 ]
then
echo "--------------------------------------------"
echo "          Download Subtitle Only"
echo "--------------------------------------------"
echo "1. Semua Subtitle"
echo "2. Satuan (en,id,kr,dll)"
echo "--------------------------------------------"
read -p "Pilih : " opsub
echo " "
if [ $opsub == 1 ]
then
echo "Tunggu Sebentar..."
youtube-dl --all-subs --skip-download -o $ke $URL
elif [ $opsub == 2 ]
then
read -p "Kode Bahasa : " Sub
echo " "
echo "Tunggu Sebentar..."
youtube-dl --write-sub --sub-lang $Sub --convert-subs srt --skip-download -o $ke $URL
else
echo "Pilih Dengan Benar !!"
fi
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 7 ] || [ $pilih == 07 ]
then
echo "--------------------------------------------"
echo "           Format Yang Tersedia"
echo "--------------------------------------------"
echo "Loading...."
youtube-dl -F $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 8 ] || [ $pilih == 08 ]
then
echo "--------------------------------------------"
echo "           Subtitle Yang Tersedia"
echo "--------------------------------------------"
echo "Loading...."
youtube-dl --list-sub $URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 9 ] || [ $pilih == 09 ]
then
echo "--------------------------------------------"
echo "               Youtube Search"
echo "--------------------------------------------"
read -p "Kata Kunci : " kunci
echo " "
echo "--------------------------------------------"
echo "Hasil Search :"
youtube-dl -e "ytsearch:$kunci"
echo "--------------------------------------------"
echo "1. Download Audio Only (mp3)"
echo "2. Download Video Custom"
echo "3. Kembali"
echo "--------------------------------------------"
read -p "Pilih : " yts
echo " "
if [ $yts == 1 ]
then
echo "Downloading Audio..."
youtube-dl $mp3 "ytsearch:$kunci" -o $ke
elif [ $yts == 2 ]
then
read -p "Resolusi (240,360,480,720) : " Resolusi
read -p "Format (mp4,mkv,webm)      : " Format
echo " "
echo "Loading...."
youtube-dl -c -i --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format $Format "ytsearch:$kunci" -o $ke 
elif [ $yts == 3 ]
then
echo " "
else
echo "Pilih Dengan Benar!!"
fi
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 10 ]
then
echo "--------------------------------------------"
echo "              Supported Sites"
echo "--------------------------------------------"
echo -e "Silahkan Kunjungi Link Di Bawah\n"
echo -e "https://ytdl-org.github.io/youtube-dl/supportedsites.html\n"
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 11 ]
then
read -p "URL Baru : " URL
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 12 ]
then
pip install --upgrade youtube-dl
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"

elif [ $pilih == 13 ] || [ $pilih == x ]
then
exit

else
echo -e "Pilih Opsi Dengan Benar!!"
echo " "
read -p "[Tekan Enter Untuk Melanjutkan]"
fi

done
