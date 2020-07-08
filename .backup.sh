if [[ $(tty) == *"/dev/tty"* ]]; then
  echo "[.backup.sh] Do not run backup, since you are in a real tty"
  exit 0
fi

if [ "$(cat ~/.backup/last_backup_asked)" == "$(date +%Y-%m-%d)" ]
then
  exit 0
fi

date +%Y-%m-%d > ~/.backup/last_backup_asked

dialog --title "Run backup" --yesno "Do you want to backup now?" 7 60
response=$?
case $response in
   0)
    echo "[.backup.sh] Run backup, please wait"
    borgmatic
    ;;
   1)
    echo "[.backup.sh] Do not run backup, I won't ask you until tomorrow"
    ;;
   255)
     echo "[.backup.sh] Do not run backup, I won't ask you until tomorrow"
     ;;
esac
