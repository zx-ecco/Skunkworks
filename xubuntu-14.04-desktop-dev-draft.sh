#receita para sistema com apps decentes/suporte crypto a partir de install Xubuntu 14.04.
sudo sed -i 's/# deb/deb/g' /etc/apt/sources.list
#remover as aplicações indesejáveis.
sudo apt-get install --yes linux-image-generic linux-headers-generic linux-firmware linux-tools-generic
sudo apt-get --yes purge linux-image-* linux-headers-* linux-firmware 
sudo apt-get update
sudo apt-get install --yes linux-image-generic linux-headers-generic linux-firmware linux-tools-generic
#app purge commands are now segmented so that if one app is not allready uninstalled the script will still remove the rest.
sudo apt-get --yes remove leafpad
sudo apt-get --yes purge gnome-mplayer
sudo apt-get --yes purge wamerican
sudo apt-get --yes purge wbrazilian
sudo apt-get --yes purge transmission-*
sudo apt-get --yes purge gimp*
sudo apt-get --yes purge abiword*
sudo apt-get --yes purge gnumeric*
sudo apt-get --yes purge mono-gac
sudo apt-get --yes purge parole
sudo apt-get --yes purge gmusicbrowser
sudo apt-get --yes purge zeitgeist*
sudo apt-get --yes autoremove 
sudo echo "sistema limpo"
#adicionar repositórios extra
#adicionar o ppa do transmission
sudo sh -c 'echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu trusty main" > /etc/apt/sources.list.d/transmission-ppa-trusty.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/transmissionbt/ppa/ubuntu trusty main" >> /etc/apt/sources.list.d/transmission-ppa-trusty.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A37DA909AE70535824D82620976B5901365C5CA1
#adicionar o repo do libreoffice
sudo sh -c 'echo "deb http://ppa.launchpad.net/libreoffice/ppa/ubuntu trusty main " > /etc/apt/sources.list.d/libreoffice-ppa-trusty.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/libreoffice/ppa/ubuntu trusty main " >> /etc/apt/sources.list.d/libreoffice-ppa-trusty.list'	
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36E81C9267FD1383FCC4490983FBA1751378B444
#adicionar o ppa do pidgin
sudo sh -c 'echo "deb http://ppa.launchpad.net/pidgin-developers/ppa/ubuntu trusty main" > /etc/apt/sources.list.d/pidgin-ppa.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/pidgin-developers/ppa/ubuntu trusty main" >> /etc/apt/sources.list.d/pidgin-ppa.list' 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 67265EB522BDD6B1C69E66ED7FB8BEE0A1F196A8
#adicionar o ppa do wine
sudo sh -c 'echo "deb http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main " > /etc/apt/sources.list.d/ubuntu-wine-ppa.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu trusty main " >> /etc/apt/sources.list.d/ubuntu-wine-ppa.list'	
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 883E8688397576B6C509DF495A9A06AEF9CB8DB0
#repo adblock
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 
sudo sh -c 'echo "deb http://ppa.launchpad.net/mozillateam/xul-ext/ubuntu trusty main " > /etc/apt/sources.list.d/mozillateam-xul-ext-trusty.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/mozillateam/xul-ext/ubuntu trusty main ">>/etc/apt/sources.list.d/mozillateam-xul-ext-trusty.list'
#actualizar o sistema todo e repôr o kernel (versão pae ou a 64bits que é mais segura e suporta mais de 4GB RAM.)
sudo apt-get --yes autoremove
sudo apt-get update
sudo apt-get install --yes linux-image-generic linux-headers-generic linux-firmware linux-tools-generic
sudo apt-get clean
sudo apt-get update
sudo apt-get --yes upgrade
sudo apt-get clean
sudo apt-get --yes autoremove
sudo apt-get install --yes mousepad
sudo apt-get clean && sudo echo "Sistema Actualizado"
#instalar the good stuff - core.
#definir como aceite o eula das fonts da ms para evitar a pausa extra na instalação
sudo echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true |sudo debconf-set-selections
sudo apt-get install --yes libreoffice transmission-gtk msn-pecan synaptic xul-ext-adblock-plus xul-ext-https-everywhere
#diagramas, design e paginação
#sudo apt-get install --yes dia scribus inkscape calibre 
sudo apt-get clean 
#multimédia - playback
sudo apt-get install --yes xubuntu-restricted-extras vlc browser-plugin-vlc exaile clementine
sudo apt-get clean
#Localization
sudo apt-get install --yes libreoffice-l10n-pt libreoffice-l10n-en-gb language-pack-pt language-pack-en thunderbird-locale-pt thunderbird-locale-en-gb myspell-en-gb  myspell-pt-pt myspell-fr myspell-es
sudo apt-get clean
#crypto/comm/security tools
sudo apt-get install --yes enigmail pidgin-otr cryptsetup debian-keyring mumble linphone
sudo apt-get clean
#ferramentas de sistema
sudo apt-get install --yes usb-modeswitch gparted xz-utils gnome-disk-utility p7zip-full transcriber
sudo apt-get clean
#Ferramentas de criação de pens para propagação
sudo apt-get install --yes unetbootin usb-creator-gtk
#Ferramentas de virtualização
#sudo apt-get install --yes testdrive kvm virt-manager virtualbox virtualbox-guest-additions-iso virtualbox-dkms
#	>>>>	virtualbox
#sudo apt-get install --yes virtualbox virtualbox-guest-additions-iso virtualbox-dkms
#coding tools, mostly python.
sudo apt-get install --yes geany idle-python2.7 idle-python3.2 idle-python3.3 scite
#wine
sudo apt-get install --yes wine winetricks
#jitsi - is it safe?
#adicionar repo do jitsi - is it safe? key is ancient and self signed, source code available but not in a deb repo.
#sudo sh -c 'echo "deb http://download.jitsi.org/deb stable/" > /etc/apt/sources.list.d/jitsi.list'
#sudo apt-get update
#sudo apt-get install jitsi
#netbook configuration, run the following line and follow the instructions
xfconf-query -c xfce4-panel -p /panels/panel-0/disable-struts -t bool -n -s true
#go to panel preferences and set panel percentage around 95% or more so you can see the window toggle buttons part of the titlebar, disable "Automatically increase length" and enable "lock panel" and remove the bottom panel (panel 1)
#  (scripting this is work in progress)
#limpar 
sudo apt-get autoremove
sudo apt-get clean
sudo echo "Sistema Pronto"
