VERSION=v1.4.0
ZIPFILE=hypriotos-rpi-$VERSION.img.zip
URL=https://github.com/hypriot/image-builder-rpi/releases/download/$VERSION/$ZIPFILE

if [ -f $ZIPFILE ]
then
    echo "img.zip exists, skip download"
else
    echo "downloading img.zip"
    wget $URL
    echo "download completed"
fi

for hostname in kubema kube01 kube02 kube03
do
    echo "ready to flush host $hostname"
    echo "press enter to continue"
    read
    ./flash --hostname $hostname $ZIPFILE
done
