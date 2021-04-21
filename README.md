# INSTALACJA ARCH + GNOME


Poniżej znajduje się instrukcja instalacji środowiska graficznego GNOME  oraz używanego przeze mnie oprogramowania na komputerze stacjonarnym mojego syna Mikołaja na czystym Linux Arch. Wykonuj komendy po kolei zgodne z poniższymi wskazówkami oraz opisem. Poniższą instrukcję oraz skrypt można bardzo łątwo dostosować do instalacji na dowolnym komputerze.

1. Po zainstalowaniu bazowego systemu Arch i pierwszym uruchomieniu komputera podłącz się do sieci:

    ```sh
    nmtui
    ```

2. Aktualizacja systemu:

    ```sh
    sudo pacman -Syu
    ```
3. Pobranie i uruchomienie skryptu do instalacji GNOME i oprogramowania:

    ```sh
    curl -LO https://raw.githubusercontent.com/elkrien/arch-gnome/main/gnome-install.sh
    chmod +x gnome-install.sh
    ./gnome-install.sh
    ```
