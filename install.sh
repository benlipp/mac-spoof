#!/bin/bash
hash curl &> /dev/null
if [ $? -eq 1 ]; then
	wget -O /usr/local/bin/mac-spoof https://raw.githubusercontent.com/obiwanakin/mac-spoof/master/mac-spoof
else
    curl -o /usr/local/bin/mac-spoof https://raw.githubusercontent.com/obiwanakin/mac-spoof/master/mac-spoof
fi
chmod 0755 /usr/local/bin/mac-spoof

#echo "Setting up symlink"
ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport
current_mac=$(ifconfig en1 | grep ether)
current_mac=${current_mac//[[:blank:]]/} # could probably make this remove whitespace thing a function, but bash is weird
current_mac=$(echo $current_mac | cut -b 6-)
touch ~/.my_mac_addr
echo $current_mac > ~/.my_mac_addr
#echo
#echo "Symlinked airport cli, mac address saved to ~/.my_mac_addr"
#echo "You should be good to go."
echo "Installed."
exit