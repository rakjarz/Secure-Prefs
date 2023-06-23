#! /bin/bash
current_dir=$1
target_file_dir="$1/src/nativeInterop/cinterop/"
target_file_name="keychainwrapper.def"

rm -f "$target_file_dir$target_file_name"

echo "writing config to $target_file_dir$target_file_name"
echo "currentdir $current_dir"
mkdir -p $target_file_dir
echo "$target_file_dir$target_file_name"
echo \
"language = Objective-C
headers = Keychain.h KeychainQuery.h
compilerOpts = -Fsecureprefs/library/keychainwrapper/bin -fembed-bitcode -embed-bitcode
linkerOpts = -Fsecureprefs/library/keychainwrapper/bin
staticLibraries = keychainwrapper.a
libraryPaths = secureprefs/library/keychainwrapper/bin" \
>> "$target_file_dir$target_file_name"
