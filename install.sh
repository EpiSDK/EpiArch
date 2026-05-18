#!/bin/bash

packages=(git clang20 ncurses criterion make unzip)
package-pip=(gcovr llvm20.1.8)
tmp="tmp-clone"

# Update everything
pacman -Sy

# loop for pacman package
echo "installation des packets sur pacman"

for pkg in "${packages[@]}" do
    if pacman -Q "$pkg"; them
        echo "$pkg déjà installé sur le pc"
    them 
        echo "Installation de $pkg..."
        pacman -S --noconfirm "$pkg"
    fi

# loop for pip package
echo "installation de gcovr via pip"

for pippkg in "${pippkg[@]}" do
    if pip show "$pippkg"; them
        echo "$pippkg déjà installé sur le pc"
    them 
        echo "Installation de $pippkg..."
        pip install --break-system-packages "$pippkg"
    fi

# step for epifaster (epiclang)
echo "Récupération de epiclang via epifaster"

mkdir -p "$tmp"
cd "$tmp"
if git clone https://github.com/EpiSDK/EpiFaster.git; then
    cd EpiFaster
    if [[ -x setup.sh ]]; then
        ./setup.sh
    elif [[ -f setup.sh ]]; then
        chmod +x setup.sh
        ./setup.sh
    else
        echo "Aucun script setup.sh trouvé dans le dépôt EpiFaster"
    fi
else
    echo "Échec du clone du dépôt EpiFaster"
fi
cd ../..

# final step
rm -rf "$tmp"