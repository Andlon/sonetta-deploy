Deployment of Sonetta
===============================
The following documents the procedure used when creating pre-compiled release binaries for Sonetta on Linux, and with some additional instructions for Windows where applicable.

1: Update submodules
--------------------
    git submodule init
    git submodule update
    
This will pull both the qt5 repository and sonetta.

2: Retrieve Qt 5 submodules
---------------------------

This will pull an "empty" qt5 repository. Proceed to fetch the remaining modules of Qt 5 by performing the following commands:

    cd qt5
    ./init-submodules -no-webkit
    
3: Build Qt 5
-------------
When in the qt5 directory (Linux):

    ./configure -opensource -prefix $PWD/../qt5-install -release -c++11 -shared -no-rpath -no-widgets -nomake examples -nomake tests -optimized-qmake -no-icu -qt-xcb -qt-xkbcommon -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtconnectivity -skip qtdoc -skip qtdocgallery -skip qtenginio -skip qtfeedback -skip qtlocation -skip qtmacextras -skip qtpim -skip qtqa -skip qtquick1 -skip qtsensors -skip qtserialport -skip qtwayland -skip qtwebkit -skip qtwebkit-examples -skip qtwinextras
    
or if on Windows:

	configure -opensource -prefix $PWD -mp -release -c++11 -shared -no-accessibility -opengl desktop -no-angle -no-widgets -nomake examples -nomake tests -no-icu -skip qt3d -skip qtactiveqt -skip qtandroidextras -skip qtconnectivity -skip qtdoc -skip qtdocgallery -skip qtenginio -skip qtfeedback -skip qtlocation -skip qtmacextras -skip qtpim -skip qtqa -skip qtquick1 -skip qtsensors -skip qtserialport -skip qtwayland -skip qtwebkit -skip qtwebkit-examples -skip qtx11extras -skip qtqa -skip qtsystems
	
Verify that configure correctly detects essential libraries/dependencies, such as ALSA, pulseaudio, udev, fontconfig, opengl etc. Install required development packages for your system until all necessary dependencies are satisfied.

Proceed to build Qt by running:

    make -j4
    
where you may replace 4 with however many cores/threads you want to use when compiling.

4: Build Sonetta
----------------
From the root directory:
    
    cd sonetta
    
Proceed to build sonetta as described by its accompanying README file, but replace the generic 'qmake' call with

    ../qt5/bin/qmake
    
which ensures that the version of Qt we just build is used.

5: Copy dependencies
--------------------
From the root folder, run

    ./copydeps.sh
    
on Linux, which will copy necessary dependencies (assumes libspotify is installed to /usr/local/lib/ ), such as libraries, plugins and QML modules.

6: Create archive
-----------------
Use the supplied script from the root directory

    ./createarchive.sh
    
which creates an appropriate sonetta.tar.gz archive containing (hopefully) an out-of-the-box runnable version of sonetta.
    
