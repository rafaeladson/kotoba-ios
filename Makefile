default:
	xcodebuild -alltargets -sdk iphonesimulator5.1
clean:
	rm -rf build/*
test:
	GHUNIT_CLI=1 xcodebuild -target UnitTests -configuration Debug -sdk iphonesimulator5.1 build