#!/bin/sh
usage() {
  echo "Managment script"
  echo "usage: $0 -p <playbook>"
  echo "Commands:"
  echo "  start         Create solution."
  echo "  update        Update app at node."
}
if [ $# -eq 0 ]; then
  usage
  exit 0
fi
while getopts ":p:" opt; do
  case "$opt" in
    p)
      playbook="$OPTARG"
      ;;
  esac
done

if [ -z "$playbook" ]; then
  usage
  exit 0
fi

if [ "$playbook" = "start" ]; then
  ansible-playbook "$playbook.yml" \
  -i /etc/ansible/aws_ec2.yaml \
  -vv
fi

if [ "$playbook" = "update" ]; then
  ansible-playbook "$playbook.yml" \
  -i /etc/ansible/aws_ec2.yaml \
  -vv
fi
