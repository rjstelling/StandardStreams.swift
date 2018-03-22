# StandardStreams.swift

> Extensions to enable simple `stdout` and `stderr` usage.

If this will not run with an "exec: Operation not permitted" error, try running:
	
    $ xattr -d com.apple.quarantine /path/to/StandardStreamsDemo.command

Setting execute permissions:

    $ chmod 755 StandardStreamDemo.command 
    
Run the demo:

    $ ./StandardStreamDemo.command 
    
Run the demo, and redirect `stdout` to a file

    $ ./StandardStreamDemo.command > output.txt
    
 