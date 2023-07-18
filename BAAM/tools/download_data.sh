# Path: BAAM\tools\download_data.sh

symlink = https://syncandshare.lrz.de/getlink/fiQrkszdkDasiL3jvuGD3o/symlink.py
annot_files = https://syncandshare.lrz.de/getlink/fiXqyA4765oTpHRBHYEey9/apollo.zip
train_files = https://ad-apolloscape.cdn.bcebos.com/3d-car-understanding-train.tar.gz
test_files = https://ad-apolloscape.cdn.bcebos.com/3d-car-understanding-test.tar.gz

cd BAAM

out_dir = $1

cd $out_dir

wget -O symlink.py $symlink
wget -O apollo.zip $annot_files
wget -O 3d-car-understanding-train.tar.gz $train_files
wget -O 3d-car-understanding-test.tar.gz $test_files

tar -xvf 3d-car-understanding-train.tar.gz
tar -xvf 3d-car-understanding-test.tar.gz
unzip apollo.zip -d BAAM

python symlink.py --data_dir BAAM/train --src_dir train
python symlink.py --data_dir BAAM/test --src_dir test

