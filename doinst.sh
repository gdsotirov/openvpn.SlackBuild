# Bash colors
C_GREEN=$'\e[32;01m'
C_YELLOW=$'\e[33;01m'
C_RED=$'\e[31;01m'
C_NORMAL=$'\e[0m'

config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/rc.d/rc.openvpn.new

