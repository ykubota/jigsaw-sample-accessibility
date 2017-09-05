# Example program to run Modular JAR with Java 8's JAR.

This project aims to confirm accesiblity of each modules: `unnamed`, `automatic` and `explicit` modules by using [quick-start](http://openjdk.java.net/projects/jigsaw/quick-start)'s example program.

* `unnamed` module: the ordinary JAR compiled by java 8 and specified by --class-path
* `automatic` module: the ordinary JAR compiled by java 8 and specified by --module-path
* `explicit` module: the modular JAR

## Requirements

* Linux
* Download Java 9 EA build 181+ and set `JAVA_9_HOME` to /path/java9
* Set `JAVA_8_HOME` to /path/java8

## Can explicit modules access automatic modules?

Yes.
You can confirm by `bash ./ModularJAR_calls_OrdinaryJAR.sh`

## Can automatic modules access explicit modules?

Yes.
You can confirm by `bash ./OrdinaryJAR_calls_ModularJAR.sh`

*Note*:
The modules not required by other modules do not add to module-graphs.
So, if you use the modules which are required by _only_ automatic modules, use --add-modules to add to root modules.

## Can we run unnamed module with explicit modules?

Yes.
You can run with explicit module by using classpath as `./OrdinaryJAR_calls_ModularJAR.sh`

## Acknowledgment

* Alan Bateman
  * http://mail.openjdk.java.net/pipermail/jigsaw-dev/2017-September/013159.html
  * http://mail.openjdk.java.net/pipermail/jigsaw-dev/2017-September/013161.html
