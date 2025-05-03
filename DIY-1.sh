#!/bin/bash

# 添加 APP 插件
git clone https://github.com/sirpdboy/luci-theme-kucat.git package/luci-theme-kucat
git clone https://github.com/lq-wq/luci-app-quickstart.git package/luci-app-quickstart
git clone https://github.com/sirpdboy/luci-app-lucky.git package/lucky
git clone https://github.com/sirpdboy/luci-app-partexp.git package/luci-app-partexp
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter

# 添加 alist 插件
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist package/alist
