# DevContainer Workshop

Beispiele für Development Container mit Visual Studio Code

## Getting started
* **WSL** muss installiert sein `WSL --version`
    ```
    WSL version: 2.0.9.0
    Kernel version: 5.15.133.1-1
    WSLg version: 1.0.59
    MSRDC version: 1.2.4677
    Direct3D version: 1.611.1-81528511
    DXCore version: 10.0.25131.1002-220531-1700.rs-onecore-base2-hyp
    Windows version: 10.0.19045.3930
    ```

* Einstellungen für `/etc/wsl.conf`
    ```
    [boot]
    systemd=true
    [network]
    generateHosts = true
    generateResolvConf = false
    ```
* Einstellungen für `/etc/resolv.conf`
    ```
    search voestalpine.root.local
    nameserver 10.130.57.63
    nameserver 10.111.1.23
    nameserver 10.111.1.25
    ```
* Anschließend sollte **WSL** upgedatet und gestartet werden `wsl --update` und `wsl --shutdown`

* Im WSL testen, ob das GroupIT GitLab erreicht werden kann: `ping git.voestalpine.net`

### Docker Installieren
    ```
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    docker version
    docker compose version

    # cannot connect to docker.service
    sudo dockerd

    # https://askubuntu.com/questions/1379425/system-has-not-been-booted-with-systemd-as-init-system-pid-1-cant-operate

    ```


### SSH-Key für GitLab erstellen
* Über SSH mit dem Server verbinden (2238asbildki01)
    * RSA SSH-Key erstellen
        ```
        ssh-keygen
        cat .ssh/id_rsa.pub
        ```
* SSH-Key zu dem Gitlab Account hinzufügen
    * Preferences > SSH-Keys > Add an SSH Key > Expiration date hoch setzen...

* Visual Studio Code installiern und mit Server verbinden (2238asbildki01)
    * Remote-SSH: Connect to Host
    * Set GIT username and email locally (on 2238asbildki01)
        ```
        git config --global user.name "Your Name"
        git config --global user.email "your.email@address"
        ```
    * SSH-Key an den Container übergeben:
        ```
        touch ~/.profile
        nano ~/.profile
        ```
        ```
        # Sharing Git credentials with VScode DevContainer
        # https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials
        if [ -z "$SSH_AUTH_SOCK" ]; then
        # Check for a currently running instance of the agent
        RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
        if [ "$RUNNING_AGENT" = "0" ]; then
                # Launch a new instance of the agent
                ssh-agent -s &> $HOME/.ssh/ssh-agent
        fi
        eval `cat $HOME/.ssh/ssh-agent`
        ssh-add ~/.ssh/id_rsa
        fi
        ```

    * Wenn es funktioniert hat, und man sich im VSCode neu über SSH verbindet bekommt man über `ssh-add -l` ein Ergebnis zurück


### Manuelles Installieren vom voestalpine Zertifikat
* Ist notwendig, wenn es zb beim docker pull ein Zertifikatproblem gibt. 
* Voestalpine Zertifikat muss in den Home-Ordner kopiert werden
    ```
    sudo apt install ca-certificates
    sudo cp ~/voestalpine-ca.crt /usr/local/share/ca-certificates
    ls /usr/local/share/ca-certificates/
    sudo update-ca-certificates -f
    ```
