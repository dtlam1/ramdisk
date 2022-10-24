TOKEN=$1
DISK_DIR=/ramdisk-tmp
EXEC_DIR=/srv/ramdisk
WORKING_REPO=scg-id-nuxt-frontend

# create ram dir
sudo mkdir $DISK_DIR
sudo chmod -R 0777 $DISK_DIR
sudo mount -t tmpfs -o rw,size=2G tmpfs $DISK_DIR

cd $DISK_DIR
git clone git clone https://$TOKEN@github.com/scg-wedo/$WORKING_REPO
cd $WORKING_REPO
npm i

# create backup dir

sudo mkdir /ramdisk-backup
sudo chmod +x $EXEC_DIR/createRamdisk.sh

sudo cp $EXEC_DIR/*.service /lib/systemd/system
sudo cp $EXEC_DIR/*.timer /lib/systemd/system
sudo systemctl enable ramdisk-startup.service
sudo systemctl enable ramdisk-sync.service