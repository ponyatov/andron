CWD = $(CURDIR)
GZ = $(CWD)/gz

GNU = /usr/bin/make /usr/bin/g++ /usr/bin/flex /usr/bin/bison 

JDK_VER = 8u144
JDK = jdk1.8.0_144
JAVA_HOME = $(CWD)/$(JDK)
JDK_GZ = jdk-$(JDK_VER)-linux-x64.tar.gz
JDK_URL = http://download.oracle.com/otn-pub/java/jdk/$(JDK_VER)-b01/090f390dda5b47b9b721c7dfaa008135/$(JDK_GZ)

SDK_VER = 3859397
SDK = tools
SDK_GZ = sdk-tools-linux-$(SDK_VER).zip
SDK_URL = https://dl.google.com/android/repository/$(SDK_GZ)

XPATH = PATH=$(JAVA_HOME)/bin:$(CWD)/tools/bin:$(PATH) JAVA_HOME=$(JAVA_HOME)

AVD = $(XPATH) avdmanager

.PHONY: avd
avd:
	$(AVD)

.PHONY: install
install: $(GNU) $(SDK)/android
$(GNU):
	sudo apt install make g++ flex bison
$(SDK)/android: $(GZ)/$(SDK_GZ) $(JDK)/README.html
	unzip $< && touch $@

.PHONY: gz
gz: $(GZ)/$(SDK_GZ) $(GZ)/$(JDK_GZ)
WGET = wget -c -P $(GZ)
$(GZ)/$(SDK_GZ):
	$(WGET) -O $@ $(SDK_URL)
$(GZ)/$(JDK_GZ):
	$(WGET) -O $@ --header "Cookie: oraclelicense=accept-securebackup-cookie" $(JDK_URL)
$(JDK)/README.html: $(GZ)/$(JDK_GZ)
	tar zx < $(GZ)/$(JDK_GZ) && touch $@
