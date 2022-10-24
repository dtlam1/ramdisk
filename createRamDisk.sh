TOKEN=$1
DISK_DIR=/ramdisk-tmp
EXEC_DIR=/srv/ramdisk
WORKING_REPO=scg-id-nuxt-frontend

# create ram dir
sudo mkdir $DISK_DIR
sudo mkdir /ramdisk-backup
sudo chmod -R 0777 $DISK_DIR
sudo mount -t tmpfs -o rw,size=2G tmpfs $DISK_DIR
echo $TOKEN
cd $DISK_DIR
git clone https://$TOKEN@github.com/scg-wedo/$WORKING_REPO
cd $WORKING_REPO
npm i

# cron backup
echo "*/5 * * * * sh $EXEC_DIR/bakckup.sh" | crontab -
