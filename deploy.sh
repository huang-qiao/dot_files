#!/usr/bin/env bash

case "$(uname -s)" in
    Darwin)
        ;;

    Linux)
        # qiao's coding friends
		sudo apt-get update
		sudo apt-get install -y git vim geany meld openssh-server tomcat7 ctags gitk gitweb tree
		# this is for asus CV repo build dependency
		sudo apt-get install -y ant

		# qiao's working environment
		mkdir -p ${HOME}/Tools && cd ${HOME}/Tools
		git clone https://github.com/huang-qiao/dot_files.git
		cd ${HOME}
		echo "# qiao's extra bash settings" >> ${HOME}/.bashrc
		echo "source ${HOME}/Tools/dot_files/bashrc.extra" >> ${HOME}/.bashrc

		# ROS
		sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
		sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
		sudo apt-get update
		sudo apt-get install -y ros-indigo-desktop-full
		sudo rosdep init
		rosdep update
		sudo apt-get install -y python-rosinstall

		# CMake 3.x
		sudo apt-get install -y software-properties-common
		sudo add-apt-repository ppa:george-edison55/cmake-3.x
		sudo apt-get update
		# first time install cmake
		sudo apt-get install -y cmake
		# cmake already install
		sudo apt-get upgrade -y

		# Java 7
		sudo add-apt-repository ppa:webupd8team/java
		sudo apt-get update
		sudo apt-get install -y oracle-java7-set-default

		# AOSP build env
		sudo apt-get install -y git-core gnupg flex bison gperf build-essential \
		  zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
		  lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
		  libgl1-mesa-dev libxml2-utils xsltproc unzip

		# ssh-key
		ssh-keygen -t rsa -b 4096 -C "qiao.helloworld@gmail.com"
		ssh-add ~/.ssh/id_rsa

		# link config files
		rm -rfv ${HOME}/.config/geany
		ln -s ${HOME}/Tools/dot_files/geany ${HOME}/.config/geany

		# git global setting
		git config --global user.email "qiao.helloworld@gmail.com"
		git config --global user.name "qiao"

		# Don't forget tools can't be installed via apt-get
		# AndoridStudio, Qt Creator, OpenGrok
esac

