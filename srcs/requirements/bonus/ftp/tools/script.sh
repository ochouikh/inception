service vsftpd start

adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

echo "$FTP_USER" | tee -a  /etc/vsftpd.userlist &> /dev/null

chown nobody:nogroup /home/ftp_user/ftp

chmod a-w /home/ftp_user/ftp

chown -R $FTP_USER:$FTP_USER /home/ftp_user/ftp/data

service vsftpd stop

/usr/sbin/vsftpd
