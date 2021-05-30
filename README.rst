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
    wget https://repo.zsien.tech/debian/pool/main/z/zsien-keyring/zsien-keyring_2021.05.25_all.deb
    sudo apt install ./zsien-keyring_2021.05.25_all.deb

    # 配置源
    echo 'deb https://repo.zsien.tech/debian sid main zsien' | sudo tee /etc/apt/sources.list.d/zsien.list

    # 安裝 systemd-boot
    sudo bootctl install

    sudo apt install update-systemd-boot

    # 安裝 microcode
    sudo apt install amd64-microcode

    # 安裝以下包
    zsien-fontconfig
    rng-tools-debian
    xdg-utils           # for xdg-open
    libglib2.0-bin      # for gsettings
    sway
    xwayland
    qtwayland5          # for Qt wayland
    swayidle
    waybar
    wofi
    mako-notifier
    network-manager
    fcitx5
    fcitx5-chinese-addons
    fcitx5-material-color
    policykit-1-gnome
    xfce4-terminal
    gnome-keyring
    fonts-font-awesome
    firefox-l10n-zh-tw

    # pipewire
    sudo apt install pulseaudio
    sudo systemctl --global mask pulseaudio.socket
    sudo systemctl --global mask pulseaudio.service

    sudo apt install pipewire libspa-0.2-bluetooth libspa-0.2-jack pipewire-audio-client-libraries

    sudo touch /etc/pipewire/media-session.d/with-pulseaudio
    sudo cp /usr/share/doc/pipewire/examples/systemd/user/pipewire-pulse.* /etc/systemd/user/
    sudo systemctl --global enable pipewire pipewire-pulse

    sudo touch /etc/pipewire/media-session.d/with-alsa
    sudo cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/

    sudo touch /etc/pipewire/media-session.d/with-jack
    sudo cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d/
    sudo ldconfig

    # 安裝並設置 GTK 主題和圖標
    sudo apt install materia-gtk-theme papirus-icon-theme
    gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
    gsettings set org.gnome.desktop.interface gtk-theme 'Materia-compact'

    # 安裝 tlp
    sudo apt install tlp

    # 安裝音樂客戶端
    sudo apt install rhythmbox
