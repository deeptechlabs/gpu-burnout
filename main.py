import argparse
import time
import os

parser = argparse.ArgumentParser(description='Process fraternal dropout')
parser.add_argument('--save_dir', type=str,  default='logs/',
                    help='dir path to save the log and the final model')
randomhash = ''.join(str(time.time()).split('.'))
parser.add_argument('--name', type=str,  default='base_' + randomhash,
                    help='path to save the final model')
args = parser.parse_args()

if not os.path.exists(args.save_dir):
    os.makedirs(args.save_dir)

log_name = args.save_dir + args.name + '.log'

with open(log_name, 'a') as f:
    f.write(str(time.time()) + '\n')

print("Script called")
