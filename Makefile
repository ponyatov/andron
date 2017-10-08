CWD = $(CURDIR)
GZ = $(CWD)/gz

SDK_VER = 3859397
SDK = 
SDK_GZ = sdk-tools-linux-$(SDK_VER).zip
SDK_URL = https://dl.google.com/android/repository/$(SDK_GZ)

.PHONY: tools
tools: tools/android
tools/android: $(GZ)/$(SDK_GZ)
	unzip $< && touch $@

.PHONY: install
install: $(GZ)/$(SDK_GZ)
	sudo apt install make g++ flex bison

WGET = wget -c -P $(GZ)
$(GZ)/$(SDK_GZ):
	$(WGET) -O $@ $(SDK_URL)