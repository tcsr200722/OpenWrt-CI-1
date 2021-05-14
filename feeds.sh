#!/bin/bash
# https://github.com/deplives/OpenWrt-CI/

# Uncomment a feed source
echo 'Uncomment helloworld feed...'
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
