# vagrant-nginx-sandbox

Barebones VM with nginx and atom installed for testing purposes

## Quick Start
* Install [Vagrant](https://www.vagrantup.com/), [VirtualBox](https://www.virtualbox.org/wiki/Downloads), [mobaxterm](https://mobaxterm.mobatek.net/) and for windows 7 [Windows Management Framework](https://www.microsoft.com/en-us/download/details.aspx?id=54616)
* Clone this repo to somewhere on your local machine
* Open powershell and cd into the repo folder ie ```cd "c:\vagrant-nginx-sandbox"```
* Run ```vagrant up```
* Setup a new ssh session in mobaxterm, host: 127.0.0.1, port: 2028, username: vagrant
* Once vagrant up command has finished start ssh session and run ```sudo atom```
* In atom file -> Add project folder in /srv or /srv/http
* Open ```http://127.0.0.1:8080``` in your browser

## Cheatsheet
* ```vagrant up``` start/create the vm
* ```vagrant destroy``` delete the vm
* ```/srv/http``` website root
