########
dotfiles
########

******
Debian
******
.. code-block:: shell

    # 開啓 tmpfs
    sudo cp /usr/share/systemd/tmp.mount /etc/systemd/system/
    sudo systemctl enable tmp.mount

    # 安裝 zsh 和 git，並將 root 和當前用戶的 shell 設置爲 zsh
    sudo apt install zsh git
    sudo chsh -s /bin/zsh
    chsh -s /bin/zsh
    # 退出重新登錄
    exit

    # 安裝 keyring
    wget https://repo.zhihsian.me/debian/pool/main/z/zhihsian-keyring/zhihsian-keyring_2019.12.26_all.deb
    sudo apt install ./zhihsian-keyring_2019.12.26_all.deb

    # 配置源
    echo 'deb https://repo.zhihsian.me/debian sid main zhihsian' | sudo tee /etc/apt/sources.list.d/zhihsian.list

    # 安裝 systemd-boot
    sudo bootctl install

    sudo apt install update-systemd-boot

    # 安裝 microcode
    sudo apt install amd64-microcode

    # 安裝以下包
    zhihsian-x11-common
    zhihsian-noto
    zhihsian-lightdm-hidpi
    zhihsian-lightdm-gtk-greeter
    rng-tools-debian
    x11-xserver-utils   # for xrandr
    xdg-utils           # for xdg-open
    i3-gaps
    picom
    polybar
    rofi
    dunst
    network-manager
    fcitx5
    fcitx5-chinese-addons
    xfce4-terminal
    light-locker
    gnome-keyring
    pulseaudio
    fonts-font-awesome
    feh
    redshift
    firefox-l10n-zh-tw

    # 安裝 GTK 主題
    sudo apt install materia-gtk-theme papirus-icon-theme

    # 安裝 tlp
    sudo apt install tlp

    # 安裝音樂客戶端
    sudo apt install rhythmbox

    # 安裝並設置 redshift
    sudo apt install redshift
