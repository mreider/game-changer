#!/usr/bin/env python3
import argparse
import configparser
import subprocess
from distutils.spawn import find_executable
config = configparser.ConfigParser()
config.read('config.ini')
config.sections()
instructions = "Install to host '$g h' or kubernetes '$g k'"
parser = argparse.ArgumentParser(description='install things')
parser.add_argument('mode', type=str, required=True)
args = parser.parse_args()
def is_tool(name):
    """Check whether `name` is on PATH."""
    return find_executable(name) is not None
if args.mode:
    if args.mode == "h":
        if is_tool("gcloud"):
            pid = config['HOST']['project_id']
            zone = config['HOST']['zone']
            vm = config['HOST']['vm_name']
            command = "bash <(curl -s https://raw.githubusercontent.com/mreider/game-changer/main/installer/run.sh)"
            subprocess.call(['gcloud', 'compute', f'--project={pid}','ssh', vm, f'--zone={zone}', f'--command={command}'], shell=True)
        else:
            print("gcloud must be installed and configured")
    elif args.mode == "k":
        if (is_tool("gcloud") and is_tool("kubectl")):
            pid = config['K8S']['project_id']
            region = config['K8S']['zone']
            k8s = config['K8S']['k8s_cluster']
            subprocess.call(['gcloud', 'container', 'clusters', 'get-credentials', k8s, f'--zone={zone}', f'--project={pid}'], shell=True)
            subprocess.call(['kubectl', 'apply', '-f', 'kubernetes.yaml'], shell=True)
        else:
            print("both gcloud and kubectl must be installed and configured")
    else:
        print(instructions)
else:
    print(instructions)

