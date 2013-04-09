rm -rf "obj"
echo "compiling for armv6"
haxelib run hxcpp Build.xml -Diphoneos
echo "compiling for armv7"
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARMV7
echo "compiling for simulator"
haxelib run hxcpp Build.xml -Diphonesim
echo "Copying sim"
cp ../ndll/iPhone/libHypGA.iphonesim.a ../../../Export/ios/Test2/lib/i386/libHypGA.a
echo "Copying sim debug"
cp ../ndll/iPhone/libHypGA.iphonesim.a ../../../Export/ios/Test2/lib/i386-debug/libHypGA.a
echo "Copying v6"
cp ../ndll/iPhone/libHypGA.iphoneos.a ../../../Export/ios/Test2/lib/armv6/libHypGA.a
echo "Copying v7"
cp ../ndll/iPhone/libHypGA.iphoneos-v7.a ../../../Export/ios/Test2/lib/armv7/libHypGA.a
echo "Copying v7 debug"
cp ../ndll/iPhone/libHypGA.iphoneos-v7.a ../../../Export/ios/Test2/lib/armv7-debug/libHypGA.a
echo "Done !"