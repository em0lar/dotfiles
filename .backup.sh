if [[ $(tty) == *"/dev/tty"* ]]; then
  echo "[.backup.sh] Do not run backup, since you are in a real tty"
  exit 0
fi

if [ "$(cat ~/.backup/last_backup_asked)" == "$(date +%Y-%m-%d)" ]
then
  exit 0
fi

date +%Y-%m-%d > ~/.backup/last_backup_asked

read -p "[.backup.sh] Do you want to backup now? (Y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "[.backup.sh] Do not run backup, I won't ask you until tomorrow"
  exit 1
fi

echo "[.backup.sh] Run backup, please wait"
borgmatic