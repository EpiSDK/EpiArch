#!/bin/bash

packages=(git clang20 ncurses criterion make unzip)
package-pip=(gcovr llvm20.1.8)
tmp="tmp-clone"

# Update everything
pacman -Suy

# loop for pacman package
echo "Install packages"

for pkg in "${packages[@]}" do
    if pacman -Q "$pkg"; them
        echo "$pkg is already installed"
    them 
        echo "Install of $pkg..."
        pacman -S --noconfirm "$pkg"
    fi

# loop for pip package
echo "Install of gcovr by pip"

for pippkg in "${pippkg[@]}" do
    if pip show "$pippkg"; them
        echo "$pippkg is already"
    them 
        echo "Install of $pippkg..."
        pip install --break-system-packages "$pippkg"
    fi

# step for epifaster (epiclang)
echo "Get EpiFaster tool"

mkdir -p "$tmp"
cd "$tmp"
if git clone https://github.com/EpiSDK/EpiFaster.git; then
    cd EpiFaster
    if [[ -x setup.sh ]]; then
        ./setup.sh
    elif [[ -f setup.sh ]]; then
        chmod +x setup.sh
        ./setup.sh
    fi
else
    echo "Failed ro clone repository: https://github.com/EpiSDK/EpiFaster.git"
fi
cd ../..

# final step
rm -rf "$tmp"
