list=$(find -L "/home/kipoha/wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

while walls= read -r path; do
  name=$(b=${path##*/}; echo ${b%.*})

  # now thats some grade-A fuckery right there! learn bash betr bro!
  name=${name//_/ };
  name=${name//-/ };
  name=${name//   / };

  printf "image=$path;label=${name};exec=swww img --transition-fps 144 --transition-duration 1 -t any $path;\n"
done <<< "$list"
