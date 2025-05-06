FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential cmake g++ git wget unzip \
    qtbase5-dev libxmu-dev libxi-dev libglu1-mesa-dev \
    libexpat1-dev python3 python3-pip \
    libgl1-mesa-dev libxrandr-dev libxrender-dev libfontconfig1 libxext-dev \
    vim nano \
    && rm -rf /var/lib/apt/lists/*

ENV G4VERSION=11.2.1
ENV G4INSTALL=/opt/geant4

WORKDIR /opt

RUN wget https://gitlab.cern.ch/geant4/geant4/-/archive/v${G4VERSION}/geant4-v${G4VERSION}.tar.gz && \
    tar -xzf geant4-v${G4VERSION}.tar.gz && \
    mkdir geant4-build && cd geant4-build && \
    cmake -DCMAKE_INSTALL_PREFIX=${G4INSTALL} \
          -DGEANT4_INSTALL_DATA=ON \
          -DGEANT4_USE_QT=ON \
          -DGEANT4_USE_OPENGL_X11=ON \
          ../geant4-v${G4VERSION} && \
    make -j$(nproc) && make install && \
    rm -rf /opt/geant4-v${G4VERSION}*

ENV PATH="${G4INSTALL}/bin:$PATH"
ENV LD_LIBRARY_PATH="${G4INSTALL}/lib:$LD_LIBRARY_PATH"
WORKDIR /home/geant4user
