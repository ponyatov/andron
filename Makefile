CWD = $(CURDIR)
GZ = $(CWD)/gz

GNU = /usr/bin/make /usr/bin/g++ /usr/bin/flex /usr/bin/bison 

JDK = jdk-9
JDK_GZ = $(JDK)_linux-x64_bin.tar.gz
JDK_URL = http://download.oracle.com/otn-pub/java/jdk/9+181/$(JDK_GZ)

SDK_VER = 3859397
SDK = tools
SDK_GZ = sdk-tools-linux-$(SDK_VER).zip
SDK_URL = https://dl.google.com/android/repository/$(SDK_GZ)

AVD = $(CWD)/tools/

.PHONY: install
install: $(GNU) $(SDK)/android
$(GNU):
	sudo apt install make g++ flex bison
$(SDK)/android: $(GZ)/$(SDK_GZ) $(JDK)/README.html
	unzip $< && touch $@

WGET = wget -c -P $(GZ)
$(GZ)/$(SDK_GZ):
	$(WGET) -O $@ $(SDK_URL)
$(GZ)/$(JDK_GZ):
	$(WGET) -O $@ --header "Cookie: oraclelicense=accept-securebackup-cookie" $(JDK_URL)
$(JDK)/README.html: $(GZ)/$(JDK_GZ)
	tar zx < $(GZ)/$(JDK_GZ) && touch $@