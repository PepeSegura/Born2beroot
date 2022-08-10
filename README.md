# Born2beroot
							
Particiones para el Bonus			GitHub
							
Información Util: Grupos y Sudo
apt-get install sudo -y		Instalar sudo
getent group (group)		Ver que usuarios hay en cierto grupo
sudo visudo		Añadir miembros al grupo sudoers ALL=(ALL:ALL) ALL
usermod -aG sudo (user)		Añade un usuario al grupo sudo.
su -		Cambia al modo root, hacer antes lo de arriba.
							
sudo groupadd user42		Añadir grupo user42
sudo groupadd evaluating		Añadir grupo evaluating
getent group		Ver que usuarios hay en cierto grupo
							
cut -d: -f1 /etc/passwd		Comprobar todos los usuarios locales
sudo adduser (username) // examen		Añadir un Usuario Local en el examen

usermod -aG (group) (username)		Añade un usuario al grupo user42
							
sudo visudo ->		Defaults	env_reset
		Defaults	mail_badpass
Hisorial de comandos con sudo.		Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
cat /var/log/sudo/sudo.log		Defaults	badpass_message="Password NOT valid, please use another one! | Made by psegura- |"
    Defaults	passwd_tries=3
		Defaults	logfile="/var/log/sudo/sudo.log"
		Defaults	log_input, log_output
		Defaults	requiretty
							
							
Información SSH & UFW		ssh psegura-@localhost -p 4242
apt-get install openssh-server		Instalar SSH
service ssh status		Comprobar que está activo y por que puerto.
vim /etc/ssh/sshd_config		Cambiar #Port 22 -> Port 4242
service ssh restart		Reiniciar SSH
apt-get install ufw		Instalar UFW
ufw enable		Iniciar UFW
ufw status numbered		Ver en que puertos está activo ufw
ufw allow ssh		Permitir el servicio SSH
ufw allow 4242		Permitir el puerto 4242 para conexión remota			Abrir el 80 para la web, y 22 para SFTP
ufw status numbered		Comprobar que los puertos se han puesto bien
Ajuste de red en VirtualBox		Red -> Port Forwarding -> TCP -> 4242 - 4242
							
Password Policy		Guia de libpam			Root	42Network_
apt-get install libpam-pwquality		Gestor de contraseñas avanzado			Users	42Network_
vim /etc/pam.d/common-password		minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3
		reject_username difok=7 enforce_for_root
							
vim /etc/login.defs 		PASS_MAX_DAYS 30 PASS_MIN_DAYS 2
linea 160-163		PASS_WARN_AGE 7
							
sudo reboot		Reiniciar el server y aplicar cambios
apt-get install cracklib-runtime libcrack2 -y		Necesitamos Instalar estos paquetes para poder
apt-get install libpam-cracklib -y		cambiar la contraseña
							
														
hostnamectl		Comprobar hostname
hostnamectl set-hostname (name)		1. Cambiar hostname
vim /etc/hosts		2. Actualizar hostname en el registro
							
Scrip de monitorización		vim /usr/local/bin/monitoring.sh
• La arquitectura de tu sistema operativo y su versión de kernel.		uname -a
• El número de núcleos físicos.		getconf _NPROCESSORS_ONLN
• El número de núcleos virtuales.		getconf _NPROCESSORS_CONF
• La memoria RAM disponible actualmente en tu servidor y su porcentaje de uso.		free -m | grep 'Mem:' | awk '{printf("%.2f", $2/(100*$3))}'
• La memoria disponible actualmente en tu servidor y su utilización como un porcentaje.		df -BM | grep '/dev/' | awk '{total += $2} {used += $3} END {printf("%.2f", (used*100)/total)}'
• El porcentaje actual de uso de tus núcleos.		top -bn1 | grep '%Cpu' | awk '{printf("%.2f\n",  $2 + $4)}'
• La fecha y hora del último reinicio.
• Si LVM está activo o no.		apt-get install net-tools
• El número de conexiones activas.		sudo crontab -u root -e
• El número de usuarios del servidor.		sudo visudo --> (your_username) ALL=(ALL) NOPASSWD: /usr/local/bin/monitoring.sh
• La dirección IPv4 de tu servidor y su MAC (Media Access Control)
• El número de comandos ejecutados con sudo.
							
							
BONUS		Tutorial Bonus
apt-get install lighttpd -y
							
							
apt-get install mariadb-server mariadb-client -y
mysql_secure_installation
							
"apt-get install php php-cgi php-fpm php-mysql -y"
