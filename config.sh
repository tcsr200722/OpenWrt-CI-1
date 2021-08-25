#!/bin/bash
# https://github.com/deplives/OpenWrt-CI

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

# Modify default luci-app-flowoffload
# https://github.com/deplives/luci-app-flowoffload
# echo 'Modify default luci-app-flowoffload...'
# rm -rf package/lean/luci-app-flowoffload && git clone https://github.com/deplives/luci-app-flowoffload.git package/lean/luci-app-flowoffload

# Modify default luci-app-turboacc
# https://github.com/deplives/luci-app-turboacc
echo 'Modify default luci-app-turboacc...'
rm -rf package/lean/luci-app-turboacc && git clone https://github.com/deplives/luci-app-turboacc.git package/lean/luci-app-turboacc

# Modify default ttyd and luci-app-ttyd
# https://github.com/deplives/ttyd
# https://github.com/deplives/luci-app-ttyd
echo 'Modify default ttyd and luci-app-ttyd...'
rm -rf feeds/packages/utils/ttyd && git clone https://github.com/deplives/ttyd.git feeds/packages/utils/ttyd
rm -rf package/lean/luci-app-ttyd && git clone https://github.com/deplives/luci-app-ttyd.git package/lean/luci-app-ttyd

# Modify default NTP server
echo 'Modify default NTP server...'
sed -i 's/ntp.aliyun.com/ntp.ntsc.ac.cn/g' package/base-files/files/bin/config_generate
sed -i 's/time1.cloud.tencent.com/ntp.aliyun.com/g' package/base-files/files/bin/config_generate
sed -i 's/time.ustc.edu.cn/cn.ntp.org.cn/g' package/base-files/files/bin/config_generate
sed -i 's/cn.pool.ntp.org/pool.ntp.org/g' package/base-files/files/bin/config_generate

# Modify default timezone
echo 'Modify default timezone...'
sed -i 's/UTC/Asia\/Shanghai/g' package/base-files/files/bin/config_generate

# Modify default LAN ip
echo 'Modify default LAN ip...'
sed -i 's/192.168.1.1/192.168.50.3/g' package/base-files/files/bin/config_generate

# Modify zzz-default-settings
echo 'delete `sed -i 's#downloads.openwrt.org#mirrors.cloud.tencent.com/lede#g' /etc/opkg/distfeeds.conf`'
sed -i '/mirrors.cloud.tencent.com/d' package/lean/default-settings/files/zzz-default-settings

echo 'delete `sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua`'
sed -i '/samba.lua/d' package/lean/default-settings/files/zzz-default-settings

# echo 'delete `sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua`'
# sed -i '/hd_idle.lua/d' package/lean/default-settings/files/zzz-default-settings

# Modify distfeeds.conf
# echo 'delete `openwrt_helloworld` from `/etc/opkg/distfeeds.conf`'
# sed -i '/openwrt_helloworld/d' /etc/opkg/distfeeds.conf

# echo 'delete `openwrt_deplives` from `/etc/opkg/distfeeds.conf`'
# sed -i '/openwrt_deplives/d' /etc/opkg/distfeeds.conf

# Modify some html style
# Modify admin/status/overview <td id="wan4_i" style="width:16px; text-align:center; padding:3px">
echo 'Modify admin/status/overview <td id="wan4_i" style="width:16px; text-align:center; padding:3px">'
sed -i 's/<td id="wan4_i" style="width:16px; text-align:center; padding:3px">/<td id="wan4_i" style="width:10%; text-align:center; padding:3px">/g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/<td id="wan4_i" style="width:16px; text-align:center; padding:3px">/<td id="wan4_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/x86/index.htm
sed -i 's/<td id="wan4_i" style="width:16px; text-align:center; padding:3px">/<td id="wan4_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/arm/index.htm

# Modify admin/status/overview <td id="wan6_i" style="width:16px; text-align:center; padding:3px">
echo 'Modify admin/status/overview <td id="wan6_i" style="width:16px; text-align:center; padding:3px">'
sed -i 's/<td id="wan6_i" style="width:16px; text-align:center; padding:3px">/<td id="wan6_i" style="width:10%; text-align:center; padding:3px">/g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/<td id="wan6_i" style="width:16px; text-align:center; padding:3px">/<td id="wan6_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/x86/index.htm
sed -i 's/<td id="wan6_i" style="width:16px; text-align:center; padding:3px">/<td id="wan6_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/arm/index.htm

# Modify admin/status/overview <td id="dsl_i" style="width:16px; text-align:center; padding:3px">
echo 'Modify admin/status/overview <td id="dsl_i" style="width:16px; text-align:center; padding:3px">'
sed -i 's/<td id="dsl_i" style="width:16px; text-align:center; padding:3px">/<td id="dsl_i" style="width:10%; text-align:center; padding:3px">/g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/<td id="dsl_i" style="width:16px; text-align:center; padding:3px">/<td id="dsl_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/x86/index.htm
sed -i 's/<td id="dsl_i" style="width:16px; text-align:center; padding:3px">/<td id="dsl_i" style="width:10%; text-align:center; padding:3px">/g' package/lean/autocore/files/arm/index.htm

# Add Commit Hash in Homepage
echo 'Add Commit Hash in Homepage...'
line_feeds=$(grep -n '<tr><td width="33%"><%:Kernel Version%></td><td><%=unameinfo.release or "?"%></td></tr>' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm | awk -F ':' '{print $1}')
line_x86=$(grep -n '<tr><td width="33%"><%:Kernel Version%></td><td><%=unameinfo.release or "?"%></td></tr>' package/lean/autocore/files/x86/index.htm | awk -F ':' '{print $1}')
line_arm=$(grep -n '<tr><td width="33%"><%:Kernel Version%></td><td><%=unameinfo.release or "?"%></td></tr>' package/lean/autocore/files/arm/index.htm | awk -F ':' '{print $1}')
sed -i "${line_feeds}a\                <tr><td width=\"33%\">编译版本</td><td>$1</td></tr>" feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i "${line_x86}a\                <tr><td width=\"33%\">编译版本</td><td>$1</td></tr>" package/lean/autocore/files/x86/index.htm
sed -i "${line_arm}a\                <tr><td width=\"33%\">编译版本</td><td>$1</td></tr>" package/lean/autocore/files/arm/index.htm


# Modify default banner
echo "Modify default banner..."
echo "                                                               " > package/base-files/files/etc/banner
echo " ██████╗ ██████╗ ███████╗███╗   ██╗██╗    ██╗██████╗ ████████╗ " >> package/base-files/files/etc/banner
echo "██╔═══██╗██╔══██╗██╔════╝████╗  ██║██║    ██║██╔══██╗╚══██╔══╝ " >> package/base-files/files/etc/banner
echo "██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║ █╗ ██║██████╔╝   ██║    " >> package/base-files/files/etc/banner
echo "██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║███╗██║██╔══██╗   ██║    " >> package/base-files/files/etc/banner
echo "╚██████╔╝██║     ███████╗██║ ╚████║╚███╔███╔╝██║  ██║   ██║    " >> package/base-files/files/etc/banner
echo " ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝   ╚═╝    " >> package/base-files/files/etc/banner
echo " ------------------------------------------------------------- " >> package/base-files/files/etc/banner
echo " $1                                                            " >> package/base-files/files/etc/banner
echo " %D %V, %C @Bob                                                " >> package/base-files/files/etc/banner
echo " ------------------------------------------------------------- " >> package/base-files/files/etc/banner
echo "                                                               " >> package/base-files/files/etc/banner