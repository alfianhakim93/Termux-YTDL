#!/bin/bash
#Project  : Termux-YTDL
#Coder    : Alfian Hakim
#Language : Shell

ke="/data/data/com.termux/files/home/storage/shared/Download/Youtube-DL/%(title)s.%(ext)s";
mp3="-c -i --embed-thumbnail --hls-prefer-native --add-metadata -f bestaudio/best -x --audio-quality 1 --audio-format mp3";
best="-c -i --hls-prefer-native --add-metadata --merge-output-format mp4";
bad="-c -i -f worstvideo+worstaudio --hls-prefer-native --add-metadata --merge-output-format mp4";
pathtema="/data/data/com.termux/files/bin/ytdl/tema.txt";
source /data/data/com.termux/files/bin/ytdl/tema.txt;

clear;
echo -e "$tema";
echo "============================================";
echo "               SELAMAT DATANG";
echo "         GUNAKAN TOOLS DENGAN BIJAK";
echo "============================================";
read -p "Masukan URL : " URL;

while :;
do
clear;
echo -e "$tema";
echo "============================================";
echo "             YOUTUBE-DL TOOLS";
echo "                 By Alfian";
echo "============================================";
echo "URL: $URL";
echo "--------------------------------------------";
echo "               Opsi Download";
echo "--------------------------------------------";
echo "[01] Download Audio Only (mp3)";
echo "[02] Download Video Kualitas Terbaik";
echo "[03] Download Video Kualitas Buruk";
echo "[04] Download Video Custom";
echo "[05] Download Video + Subtitle";
echo "[06] Download Subtitle Only";
echo "[07] Cek Format Yang Tersedia";
echo "[08] Cek Subtitle Yang Tersedia";
echo "[09] Youtube Search Tools";
echo "[10] Supported Sites";
echo "[11] Ganti URL Baru";
echo "[12] Update Youtube-dl";
echo "[13] Informasi Tools";
echo "[14] Ganti Warna Tema";
echo "[15] Exit Program";
echo "--------------------------------------------";
read -p "Pilih Opsi [01-15] : " pilih;
echo " ";

if [ $pilih == 1 ] || [ $pilih == 01 ];
then
echo "Downloading Audio....";
youtube-dl $mp3 -o $ke $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 2 ] || [ $pilih == 02 ];
then
echo "--------------------------------------------";
echo "      Download Video Kualitas Terbaik";
echo "--------------------------------------------";
echo "Loading....";
youtube-dl $best -o $ke $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 3 ] || [ $pilih == 03 ];
then
echo "--------------------------------------------";
echo "       Download Video Kualitas Buruk";
echo "--------------------------------------------";
echo "Loading....";
youtube-dl $bad -o $ke $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 4 ] || [ $pilih == 04 ];
then
echo "--------------------------------------------";
echo "           Download Video Custom";
echo "--------------------------------------------";
echo "Resolusi :";
echo "[1] 144p     [3] 360p     [5] 720p";
echo "[2] 240p     [4] 480p     [6] 1080p";
echo "--------------------------------------------";
echo "Format :";
echo "[1] Mp4      [3] Webm";
echo "[2] Mkv";
echo "--------------------------------------------";
read -p "Pilih Resolusi [1-6] : " preso;
read -p "Pilih Format [1-3]   : " pformat;
if [ $preso == 1 ]; then Resolusi="144"; elif [ $preso == 2 ]; then Resolusi="240"; elif [ $preso == 3 ]; then Resolusi="360";
elif [ $preso == 4 ]; then Resolusi="480"; elif [ $preso == 5 ]; then Resolusi="720"; elif [ $preso == 6 ]; then Resolusi="1080"; fi;
if [ $pformat == 1 ]; then Format="mp4"; elif [ $pformat == 2 ]; then Format="mkv"; elif [ $pformat == 3 ]; then Format="webm"; fi;
echo "Loading....";
youtube-dl -c -i --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format $Format -o $ke $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 5 ]  || [ $pilih == 05 ];
then
echo "--------------------------------------------";
echo "         Download Video + Subtitle";
echo "--------------------------------------------";
echo "Resolusi :";
echo "[1] 144p     [3] 360p     [5] 720p";
echo "[2] 240p     [4] 480p     [6] 1080p";
echo "--------------------------------------------";
echo "Kode Subtitle :";
echo "  Cek dahulu apakah video memiliki subtitle";
echo "menggunakan fitur nomor '08'. Jika terdapat";
echo "subtitle, cek bahasa apa saja yang tersedia";
echo "contohnya seperti en,id,kr,my,dan lainnya.";
echo "--------------------------------------------";
echo "Embed Subtitle :";
echo "  Maksud Embed Subtitle adalah menggabungkan";
echo "subtitle dengan video, jika subtitle tidak";
echo "ingin digabung maka pilih opsi 'n'.";
echo "--------------------------------------------";
read -p "Pilih Resolusi [1-6]   : " preso;
read -p "Masukan Kode Subtitle  : " Sub;
read -p "Embed Subtitle ? (y/n) : " Embed;
if [ $preso == 1 ]; then Resolusi="144"; elif [ $preso == 2 ]; then Resolusi="240"; elif [ $preso == 3 ]; then Resolusi="360";
elif [ $preso == 4 ]; then Resolusi="480"; elif [ $preso == 5 ]; then Resolusi="720"; elif [ $preso == 6 ]; then Resolusi="1080"; fi;
if [ $Embed == y ] || [ $Embed == Y ]; then Emsub="--embed-subs"; else Emsub=""; fi;
echo "Loading....";
youtube-dl -c -i --write-sub --sub-lang $Sub --convert-subs srt $Emsub --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format mkv -o $ke $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 6 ] || [ $pilih == 06 ];
then
echo "--------------------------------------------";
echo "          Download Subtitle Only";
echo "--------------------------------------------";
echo "[1] Semua Subtitle";
echo "[2] Satuan (en,id,kr,dll)";
echo "[3] Kembali";
echo "--------------------------------------------";
read -p "Pilih : " opsub;
echo " ";
if [ $opsub == 1 ];
then
echo "Tunggu Sebentar...";
youtube-dl --all-subs --skip-download -o $ke $URL;
elif [ $opsub == 2 ];
then
read -p "Kode Bahasa : " Sub;
echo " ";
echo "Tunggu Sebentar...";
youtube-dl --write-sub --sub-lang $Sub --convert-subs srt --skip-download -o $ke $URL;
elif [ $opsub == 3 ];
then
echo "";
else;
echo "Pilih Dengan Benar !!";
fi;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 7 ] || [ $pilih == 07 ];
then
echo "--------------------------------------------";
echo "           Format Yang Tersedia";
echo "--------------------------------------------";
echo "Loading....";
youtube-dl -F $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 8 ] || [ $pilih == 08 ];
then
echo "--------------------------------------------";
echo "           Subtitle Yang Tersedia";
echo "--------------------------------------------";
echo "Loading....";
youtube-dl --list-sub $URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 9 ] || [ $pilih == 09 ];
then
echo "--------------------------------------------";
echo "               Youtube Search";
echo "--------------------------------------------";
read -p "Kata Kunci : " kunci;
echo " ";
echo "--------------------------------------------";
echo "Hasil Search :";
youtube-dl -e "ytsearch:$kunci";
echo "--------------------------------------------";
echo "[1] Download Audio Only (mp3)";
echo "[2] Download Video Custom";
echo "[3] Download Video + Subtitle";
echo "[4] Kembali";
echo "--------------------------------------------";
read -p "Pilih : " yts;
echo " ";
if [ $yts == 1 ];
then
echo "Downloading Audio...";
youtube-dl $mp3 "ytsearch:$kunci" -o $ke;
elif [ $yts == 2 ];
then
echo "--------------------------------------------";
echo "           Download Video Custom";
echo "--------------------------------------------";
echo "Resolusi :";
echo "[1] 144p     [3] 360p     [5] 720p";
echo "[2] 240p     [4] 480p     [6] 1080p";
echo "--------------------------------------------";
echo "Format :";
echo "[1] Mp4      [3] Webm";
echo "[2] Mkv";
echo "--------------------------------------------";
read -p "Pilih Resolusi [1-6] : " preso;
read -p "Pilih Format [1-3]   : " pformat;
if [ $preso == 1 ]; then Resolusi="144"; elif [ $preso == 2 ]; then Resolusi="240"; elif [ $preso == 3 ]; then Resolusi="360";
elif [ $preso == 4 ]; then Resolusi="480"; elif [ $preso == 5 ]; then Resolusi="720"; elif [ $preso == 6 ]; then Resolusi="1080"; fi;
if [ $pformat == 1 ]; then Format="mp4"; elif [ $pformat == 2 ]; then Format="mkv"; elif [ $pformat == 3 ]; then Format="webm"; fi;
echo "Loading....";
youtube-dl -c -i --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format $Format "ytsearch:$kunci" -o $ke ;

elif [ $yts == 3 ];
then
echo "--------------------------------------------";
echo "         Download Video + Subtitle";
echo "--------------------------------------------";
echo "Resolusi :";
echo "[1] 144p     [3] 360p     [5] 720p";
echo "[2] 240p     [4] 480p     [6] 1080p";
echo "--------------------------------------------";
echo "Kode Subtitle :";
echo "  Cek dahulu apakah video memiliki subtitle";
echo "menggunakan fitur nomor '08'. Jika terdapat";
echo "subtitle, cek bahasa apa saja yang tersedia";
echo "contohnya seperti en,id,kr,my,dan lainnya.";
echo "--------------------------------------------";
echo "Embed Subtitle :";
echo "  Maksud Embed Subtitle adalah menggabungkan";
echo "subtitle dengan video, jika subtitle tidak";
echo "ingin digabung maka pilih opsi 'n'.";
echo "--------------------------------------------";
read -p "Pilih Resolusi [1-6]   : " preso;
read -p "Masukan Kode Subtitle  : " Sub;
read -p "Embed Subtitle ? (y/n) : " Embed;
if [ $preso == 1 ]; then Resolusi="144"; elif [ $preso == 2 ]; then Resolusi="240"; elif [ $preso == 3 ]; then Resolusi="360";
elif [ $preso == 4 ]; then Resolusi="480"; elif [ $preso == 5 ]; then Resolusi="720"; elif [ $preso == 6 ]; then Resolusi="1080"; fi;
if [ $Embed == y ] || [ $Embed == Y ]; then Emsub="--embed-subs"; else Emsub=""; fi;
echo "Loading....";
youtube-dl -c -i --write-sub --sub-lang $Sub --convert-subs srt $Emsub --hls-prefer-native --add-metadata -f "bestvideo[height<=$Resolusi]+bestaudio/best[height<=$Resolusi]" --merge-output-format mkv "ytsearch:$kunci" -o $ke;

elif [ $yts == 4 ];
then
echo " ";
else;
echo "Pilih Dengan Benar!!";
fi;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 10 ];
then
echo "--------------------------------------------";
echo "              Supported Sites";
echo "--------------------------------------------";
echo -e "Silahkan Kunjungi Link Di Bawah\n";
echo -e "https://ytdl-org.github.io/youtube-dl/supportedsites.html\n";
xdg-open https://ytdl-org.github.io/youtube-dl/supportedsites.html;
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 11 ];
then
read -p "URL Baru : " URL;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 12 ];
then
pip install --upgrade youtube-dl;
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";

elif [ $pilih == 13 ];
then
echo "--------------------------------------------";
echo "                 INFO TOOLS ";
echo "--------------------------------------------";
echo "[*] Project  : Termux-YTDL";
echo "[*] Coder    : Alfian Hakim";
echo "[*] Language : Shell";
echo "[*] Github   : github.com/alfianhakim93";
echo "[*] Path     : Internal/Download/Youtube-DL";
echo "--------------------------------------------";
echo "[*] Kontak :";
echo "[1] Chat Whatsapp";
echo "[2] Chat Telegram";
echo "[3] Kembali";
echo "--------------------------------------------";
read -p "Pilih: " kontak;
echo "";
if [ $kontak == 1 ];
then
xdg-open https://wa.me/62895360702055;
read -p "[Tekan Enter Untuk Melanjutkan]";
elif [ $kontak == 2 ];
then
xdg-open https://t.me/alfian_hakim;
read -p "[Tekan Enter Untuk Melanjutkan]";
elif [ $kontak == 3 ];
then
echo " ";
else;
echo "Pilih Kontak !!";
fi;

elif [ $pilih == 14 ];
then
echo "--------------------------------------------";
echo "                 Warna Tema ";
echo "--------------------------------------------";
echo "[1] Light Green     [5] Light Red";
echo "[2] Light Yellow    [6] Light Cyan";
echo "[3] Light Blue      [7] Light Magneta";
echo "[4] Light Gray      [8] Default";
echo "--------------------------------------------";
read -p "Pilih: " warna;
echo "";
if [ $warna == 1 ];
then
echo -e 'tema="\e[92m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 2 ];
then
echo -e 'tema="\e[93m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 3 ];
then
echo -e 'tema="\e[94m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 4 ];
then
echo -e 'tema="\e[37m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 5 ];
then
echo -e 'tema="\e[91m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 6 ];
then
echo -e 'tema="\e[96m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 7 ];
then
echo -e 'tema="\e[95m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;
elif [ $warna == 8 ];
then
echo -e 'tema="\e[39m \e[1m"' > $pathtema;
echo "Warna Tema Berhasil Diubah";
echo "";
read -p "[Restart Program Diperlukan!!]";
ytdl.sh;

else;
echo "Pilih Warna !!";
fi;

elif [ $pilih == 15 ] || [ $pilih == x ];
then
exit;

else;
echo -e "Pilih Opsi Dengan Benar!!";
echo " ";
read -p "[Tekan Enter Untuk Melanjutkan]";
fi;

done;
