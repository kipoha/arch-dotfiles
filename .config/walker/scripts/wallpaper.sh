list=$(find -L "/home/kipoha/_projects/dots/arch-dotfiles/wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

while walls= read -r path; do
  name=$(b=${path##*/}; echo ${b%.*})

  # now thats some grade-A fuckery right there! learn bash betr bro!
  name=${name//_/ };
  name=${name//-/ };
  name=${name//   / };

  if [[ "${path}" == *.png ]]; then
    exec_script="swww img --transition-fps 144 --transition-duration 1 -t any $path && cp $path ~/.cache/swww/current.png"
  else
    exec_script="swww img --transition-fps 144 --transition-duration 1 -t any $path && convert $path ~/.cache/swww/current.png"
  fi

  printf "image=$path;label=${name};exec=${exec_script};\n"
done <<< "$list"
