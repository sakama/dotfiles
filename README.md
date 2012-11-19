# dotfiles

#What's this?#

----------

普段使いのdotfiles達

* Emacs
* Vim
* zsh
* tmux
* screen

# How to install #

----------

    git clone git@github.com:oreradio/dotfiles.git
    cd dotfiles
    git submodule init
    git submodule update
    ./setup.sh

# Notes

----------
SSLのルート証明書が入っておらず:BundleInstallが失敗する場合の対処法

    wget -P /tmp https://www.digicert.com/testroot/DigiCertHighAssuranceEVRootCA.crt
    cat /tmp/DigiCertHighAssuranceEVRootCA.crt >> /etc/pki/tls/certs/ca-bundle.crt
