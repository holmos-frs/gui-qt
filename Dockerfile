FROM resin/rpi-raspbian
RUN apt update && apt install pkg-config qt5-default libfftw3-dev wget cmake make build-essential libz-dev nano
WORKDIR /tmp
RUN wget https://github.com/stelzch/holmos-gui-qt/archive/master.tar.gz && tar xvf master.tar.gz && mv holmos-gui-qt-master/* .
RUN cd /tmp/deps && ./install-opencv.sh

VOLUME ["/build"]

WORKDIR /build
CMD qmake . && make -j4 && ./deps/build-deb.sh gui-qt
