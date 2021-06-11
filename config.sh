#!/bin/bash
# https://github.com/deplives/OpenWrt-CI

# Modify default IP
# sed -i 's/192.168.1.1/192.168.50.2/g' package/base-files/files/bin/config_generate

# Modify default theme
echo 'Modify default theme...'
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify default luci-app-samba
# https://github.com/deplives/luci-app-samba
echo 'Modify default luci-app-samba...'
rm -rf feeds/luci/applications/luci-app-samba && git clone https://github.com/deplives/luci-app-samba.git feeds/luci/applications/luci-app-samba

# Modify default adbyby and luci-app-adbyby-plus
# https://github.com/deplives/adbyby
# https://github.com/deplives/luci-app-adbyby-plus
echo 'Modify default adbyby and luci-app-adbyby-plus...'
rm -rf package/lean/adbyby && git clone https://github.com/deplives/adbyby.git package/lean/adbyby
rm -rf package/lean/luci-app-adbyby-plus && git clone https://github.com/deplives/luci-app-adbyby-plus.git package/lean/luci-app-adbyby-plus

# Modify default luci-app-ttyd
# https://github.com/deplives/luci-app-ttyd
echo 'Modify default luci-app-ttyd...'
rm -rf package/lean/luci-app-ttyd && git clone https://github.com/deplives/luci-app-ttyd.git package/lean/luci-app-ttyd

# Modify default NTP server
echo 'Modify default NTP server...'
sed -i 's/ntp1.aliyun.com/ntp.ntsc.ac.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/ntp.aliyun.com/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/time.google.com/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/pool.ntp.org/g' package/base-files/files/bin/config_generate

# Modify default timezone
echo 'Modify default timezone...'
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# Modify default banner
echo 'Modify default banner...'
echo '                                                               ' > package/base-files/files/etc/banner
echo ' ██████╗ ██████╗ ███████╗███╗   ██╗██╗    ██╗██████╗ ████████╗ ' >> package/base-files/files/etc/banner
echo '██╔═══██╗██╔══██╗██╔════╝████╗  ██║██║    ██║██╔══██╗╚══██╔══╝ ' >> package/base-files/files/etc/banner
echo '██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║ █╗ ██║██████╔╝   ██║    ' >> package/base-files/files/etc/banner
echo '██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║███╗██║██╔══██╗   ██║    ' >> package/base-files/files/etc/banner
echo '╚██████╔╝██║     ███████╗██║ ╚████║╚███╔███╔╝██║  ██║   ██║    ' >> package/base-files/files/etc/banner
echo ' ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝    ' >> package/base-files/files/etc/banner
echo ' ------------------------------------------------------------- ' >> package/base-files/files/etc/banner
echo ' %D %V, %C                                                     ' >> package/base-files/files/etc/banner
echo ' ------------------------------------------------------------- ' >> package/base-files/files/etc/banner
echo '                                                               ' >> package/base-files/files/etc/banner

# Modify zzz-default-settings
echo 'delete `sed -i 's#http://downloads.openwrt.org#https://mirrors.cloud.tencent.com/lede#g' /etc/opkg/distfeeds.conf`'
sed -i '/mirrors.cloud.tencent.com/d' package/lean/default-settings/files/zzz-default-settings

echo 'delete `sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua`'
sed -i '/hd_idle.lua/d' package/lean/default-settings/files/zzz-default-settings

echo 'delete `sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua`'
sed -i '/samba.lua/d' package/lean/default-settings/files/zzz-default-settings

# echo 'delete `sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/aria2.lua`'
# sed -i '/aria2.lua/d' package/lean/default-settings/files/zzz-default-settings

# echo 'delete `sed -i 's/services/nas/g' /usr/lib/lua/luci/view/aria2/overview_status.htm`'
# sed -i '/overview_status.htm/d' package/lean/default-settings/files/zzz-default-settings
