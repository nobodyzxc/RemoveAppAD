#!/bin/bash

if [ ! -f apktool ];then
    wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O apktool
    if [ ! -f apktool.jar ];then
        echo Please download latest apktool script from https://github.com/iBotPeaches/Apktool/scripts
        exit
    fi
    chmod a+x apktool
fi

if [ ! -f apktool.jar ];then
    LATEST_VER=`curl https://github.com/iBotPeaches/Apktool/releases | grep -oh 'iBotPeaches/Apktool/tree/v[^"]*' | head -n 1`
    LATEST_VER=${LATEST_VER:26}
    wget https://github.com/iBotPeaches/Apktool/releases/download/v${LATEST_VER}/apktool_${LATEST_VER}.jar -O apktool.jar
    if [ ! -f apktool.jar ];then
        echo Please download latest apktool.jar from https://github.com/iBotPeaches/Apktool/releases
        echo Remember to rename as \"apktool.jar\"
        exit
    fi
fi

APK="$1"
if [ ! -z "$APK" ] && [ -f $APK ];then
    bash apktool d "$APK"
    OIFS="$IFS"
    IFS=$'\n'
    grep -lR "\->loadAd" "${APK%.*}" | xargs -d '\n' -- sed -i '/\->loadAd/d'
    IFS="$OIFS"
    bash apktool b "${APK%.*}" -o "${APK%.*}_no_ad.apk"
    java -jar sign.jar --overwrite --apks "${APK%.*}_no_ad.apk"
    rm -rf "${APK%.*}"
else
    echo "Usage: bash $0 [app.apk]"
fi
