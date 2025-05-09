#! /bin/bash
#
#
if (( $# != 2 )); then
  echo "Usage: $0 <file> <config>"
  exit 1
fi
if ! test -f $2; then
  echo "File .env does not exist."
  exit 1
fi
if ! test -f $1; then
  echo "File does not exist."
  exit 1
fi

export $(grep -v '^#' $2 | xargs)

FILE=$1 

sshpass -p "$SSH_PASS" scp $SSH_USER@$SSH_HOST:$WORKDIR/$FILE $FILE

echo "Success Sync $SSH_USER@$SSH_HOST -> $1 (local)"
