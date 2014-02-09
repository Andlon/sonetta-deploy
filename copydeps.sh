#!/bin/bash

QT=qt5
SONETTA=sonetta/release

# Copy Qt libs
mkdir -p $SONETTA/libs
cp $QT/lib/libQt5Quick.so.5 $SONETTA/libs/libQt5Quick.so.5
cp $QT/lib/libQt5Multimedia.so.5 $SONETTA/libs/libQt5Multimedia.so.5
cp $QT/lib/libQt5Qml.so.5 $SONETTA/libs/libQt5Qml.so.5
cp $QT/lib/libQt5Network.so.5 $SONETTA/libs/libQt5Network.so.5
cp $QT/lib/libQt5Gui.so.5 $SONETTA/libs/libQt5Gui.so.5
cp $QT/lib/libQt5Core.so.5 $SONETTA/libs/libQt5Core.so.5
cp $QT/lib/libQt5Svg.so.5 $SONETTA/libs/libQt5Svg.so.5
cp $QT/lib/libQt5DBus.so.5 $SONETTA/libs/libQt5DBus.so.5

# Copy platform plugins
mkdir -p $SONETTA/platforms
cp $QT/plugins/platforms/libqxcb.so $SONETTA/platforms/libqxcb.so

# Copy Qt plugins
mkdir -p $SONETTA/plugins
cp -R $QT/plugins/audio $SONETTA/plugins/
cp -R $QT/plugins/imageformats $SONETTA/plugins/
cp -R $QT/plugins/generic $SONETTA/plugins/
cp -R $QT/plugins/mediaservice $SONETTA/plugins/
cp -R $QT/plugins/platforminputcontexts $SONETTA/plugins/

# Copy Qt qml assets
mkdir -p $SONETTA/quick
cp -R $QT/qml $SONETTA/quick

# Copy libspotify
cp /usr/local/lib/libspotify.so.12 $SONETTA/libs/libspotify.so.12
