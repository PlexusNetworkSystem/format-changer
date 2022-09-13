#!/usr/bin/bash
#seçilen dosyayının formatını değiştirmek için kullanılır.
source /usr/share/Plexus.Network/Asistan/vars

echo -ne "\n${lightcyan}Formatı değiştirilecek ${green}dosyayı ${lightcyan}Seçin\n"
d_veri=$(zenity --file-selection --title="Plexus Dosya yöneticisi")
echo -ne "${lightcyan}çevirmek istediğin dosya ${green}uzantısını ${lightcyan}seç.\n"
file_ext=
case $d_veri in
*.mp4)
    file_ext="mp4"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer gif webm mp3 wav oog mkv m4w);
;;
*.mkv)
    file_ext="mkv"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer gif webm mp3 wav oog mp4 m4w);
;;
*.webm)
    file_ext="web"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer gif mp3 wav oog mkv m4w);
;;
*.webp)
    file_ext="webp"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer gif webm mp3 wav oog mkv m4w);
;;
*.m4w)
    file_ext="m4w"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer gif webm mp3 wav oog mkv);
;;
*.ogg|*.ogv)
    file_ext="ogg"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer mp3 webm opus mp4);
;;
*.opus)
    file_ext="opus"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer mp3 ogg webm );
;;
*.mp3)
    file_ext="mp3"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer ogg opus webm);
;;
*.jpg|*.jpeg)
    file_ext="jpg"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer png );
;;
*.png)
    file_ext="png"
    u_veri=$(zenity --list  --title="Plexus Platinum Asistan" --window-icon=/usr/share/Plexus.Network/Asistan/logo.png  --width=400 --height=450 --text="Format seçiniz." --column=Plexus\ Format\ Changer jpeg jpg webp);
;;
*)
  zenity --width=360 --height=100 --error --title "Plexus Platinum Asistan" --text "Desteklenmeyen format."
  exit
;;
esac
(
echo "10"
echo "# Dosyalar hazırlanıyor..."; sleep 0.5
n_veri=($d_veri)
c_veri="${n_veri[@]/$file_ext}$u_veri"
echo "50"
echo "# $d_veri $c_veri formatına çevriliyor..."
ffmpeg -i "$d_veri" "$c_veri" 2> /home/$USER/error.txt 1> /dev/null
echo "100"
) |
zenity --progress --width=360 --height=150 --title="Media Format Değiştirici" --text="Format değiştirici açılıyor... " --percentage=0 --time-remaining --auto-close
n_veri=($d_veri)
c_veri="${n_veri[@]/$file_ext}$u_veri"
#dosya kontrol
if [[ -f "$c_veri" ]]; then
    echo -ne "${white}Dosyan ${green}$c_veri ${white}ismi ile kaydedildi."
    function=$(zenity --width=360 --height=100 --info --title "Plexus Platinum Asistan" --text "Dosyan $c_veri ismi ile kaydedildi" )
:
else
    function=$(zenity --width=360 --height=100 --error --title "Plexus Platinum Asistan" --text "Dosya format değiştirme işlemi sırasında hata." )
    zenity --text-info --title="ERROR" --filename=/home/$USER/error.txt
    rm /home/$USER/error.txt
:
fi
#dosya kontrol sonu

