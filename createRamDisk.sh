DISK_DIR=/ramdisk-tmp
EXEC_DIR=/srv/ramdisk

# create ram dir
sudo mkdir $DISK_DIR
sudo chmod -R 0755 $DISK_DIR
sudo mount -t tmpfs -o rw,size=2G tmpfs $DISK_DIR

# create backup dir

sudo mkdir /ramdisk-backup
sudo chmod +x $EXEC_DIR/createRamdisk.sh

sudo cp $EXEC_DIR/*.service /lib/systemd/system
sudo cp $EXEC_DIR/*.timer /lib/systemd/system
sudo systemctl enable ramdisk-startup.service
sudo systemctl enable ramdisk-sync.service