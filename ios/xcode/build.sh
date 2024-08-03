# Archive for iOS devices
xcodebuild archive \
 -project OpenGLES.xcodeproj \
 -scheme MetalANGLE_ios_13.0 \
 -destination "generic/platform=iOS" \
 -archivePath "./build/ios_devices.xcarchive" \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archive for iOS simulator
xcodebuild archive \
 -project OpenGLES.xcodeproj \
 -scheme MetalANGLE_ios_13.0 \
 -destination "generic/platform=iOS Simulator" \
 -archivePath "./build/ios_simulators.xcarchive" \
 SKIP_INSTALL=NO \
 BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
xcodebuild -create-xcframework \
 -framework "./build/ios_devices.xcarchive/Products/Library/Frameworks/MetalANGLE_ios_13.0.framework" \
 -framework "./build/ios_simulators.xcarchive/Products/Library/Frameworks/MetalANGLE_ios_13.0.framework" \
 -output "./build/MetalANGLE.xcframework"

# Rename the framework inside the XCFramework
mv ./build/MetalANGLE.xcframework/ios-arm64/MetalANGLE_ios_13.0.framework ./build/MetalANGLE.xcframework/ios-arm64/MetalANGLE.framework
mv ./build/MetalANGLE.xcframework/ios-arm64_x86_64-simulator/MetalANGLE_ios_13.0.framework ./build/MetalANGLE.xcframework/ios-arm64_x86_64-simulator/MetalANGLE.framework
