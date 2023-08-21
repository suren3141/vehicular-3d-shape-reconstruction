## Usage : python symlink.py --data_dir train/ --src_dir ../train/

import os
from glob import glob

import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--data_dir')
parser.add_argument('--src_dir')
args = parser.parse_args()

json_dir = os.path.join(args.data_dir, 'apollo_annot')
img_dir = os.path.join(args.data_dir, 'images')


if not os.path.exists(img_dir): os.mkdir(img_dir)

json_files = glob(os.path.join(json_dir, '*.json'))

for js_file in json_files:
    file_name = os.path.split(js_file)[-1]
    img_name = file_name[:-5] + '.jpg'

    dest_name = os.path.join(img_dir, img_name)
    src_name = os.path.join(args.src_dir, 'images', img_name)
    src_name = os.path.relpath(src_name, img_dir)

    print(src_name, dest_name)

    os.symlink(src_name, dest_name)



