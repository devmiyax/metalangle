# Archive for iOS devices
xcodebuild archive \
 -project OpenGLES.xcodeproj \
 -scheme MetalANGLE \
 -destination "generic/platform=iOS" \
 -archivePath "./build/ios_devices.xcarchive" \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archive for iOS simulator
xcodebuild archive \
 -project OpenGLES.xcodeproj \
 -scheme MetalANGLE \
 -destination "generic/platform=iOS Simulator" \
 -archivePath "./build/ios_simulators.xcarchive" \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
 -framework "./build/ios_devices.xcarchive/Products/Library/Frameworks/MetalANGLE.framework" \
 -framework "./build/ios_simulators.xcarchive/Products/Library/Frameworks/MetalANGLE.framework" \
 -output "./build/MetalANGLE.xcframework"

