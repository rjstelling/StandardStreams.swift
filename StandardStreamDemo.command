#!/usr/bin/env xcrun swift

/*
	NB: If this will not run with an "exec: Operation not permitted" error, try running
	$ xattr -d com.apple.quarantine /path/to/this/file 
*/

import Foundation

/// *Standard Stream Protocol*
/// Defines the file handle used and simple print string and output data functions
protocol StandardStream {
	
	var stream: FileHandle { get }
	
	func print(_ str: String)
	func output(_ data: Data)
}

/// Default implementations of print(...) and output(...)
extension StandardStream {

	func print(_ str: String) {
	
		guard let data = (str + "\n").data(using: .utf8) else { return }
		stream.write(data)
	}
	
	func output(_ data: Data) {
		stream.write(data)
	}
}

// Standard Out - writes to `stdout`
struct StandardOut: StandardStream {
	
	var stream: FileHandle { return FileHandle.standardOutput }
}

// Standard Error - writes to `stderr`
struct StandardErr: StandardStream {

	var stream: FileHandle { return FileHandle.standardError }
}

let console = StandardOut()
let error = StandardErr()

console.print("Hello World! - This will print to stdout and can be piped or redirect to a file.")

error.print("Errors are by standard printed to the console even if your redirect, useful!")

exit(0)
