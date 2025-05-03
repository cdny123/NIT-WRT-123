#!/bin/bash

# 设置管理 IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 设置主机名
sed -i 's/OpenWrt/Openwrt-NIT/g' package/base-files/files/bin/config_generate

# 配置 ttyd 自动登录
sed -i '/ttyd/s/^#//' package/feeds/packages/ttyd/files/ttyd.config

# 设置内核和系统分区大小
sed -i 's/CONFIG_TARGET_KERNEL_PARTSIZE=.*/CONFIG_TARGET_KERNEL_PARTSIZE=128/' .config
sed -i 's/CONFIG_TARGET_ROOTFS_PARTSIZE=.*/CONFIG_TARGET_ROOTFS_PARTSIZE=1024/' .config

# 设置个性签名
echo "04543473-$(TZ=UTC-8 date "+%Y.%m.%d")" >> package/base-files/files/etc/banner

# 更换内核版本
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=6.6/' target/linux/*/Makefile

# 添加 AdGuardHome 插件
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
