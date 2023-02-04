#!/usr/bin/env swift

    //    chmod +x swift_hello 
    //    ./swift_hello.swift apple banana kumquat

    // Outputs
    //     Number of arguments: 3
    //     Arguments:
    //     - apple
    //     - banana
    //     - kumquat

print("Hello, world!")

/// the very first element is the current script
let script = CommandLine.arguments[0]
print("Script:", script)

/// you can get the input arguments by dropping the first element
let inputArgs = CommandLine.arguments.dropFirst()
print("Number of arguments:", inputArgs.count)

print("Arguments:")
for arg in inputArgs {
    print("-", arg)
}