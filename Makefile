BUILD_DIR=./.build

default: build

build:
	swift build

test:
	swift test

update:
	swift package update

release:
	swift build -c release

xcodeproj:
	swift package generate-xcodeproj

clean:
	swift package clean
#	-rm -rf $(BUILD_DIR)/*