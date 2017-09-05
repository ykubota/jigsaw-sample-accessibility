# Example program to run with several modules.

This project aims to confirm accesiblity of each modules: `unnamed`, `automatic` and `explicit` modules by using [quick-start](http://openjdk.java.net/projects/jigsaw/quick-start)'s example program.

* `unnamed` module: the ordinary JAR compiled by java 8 and specified by --class-path
* `automatic` module: the ordinary JAR compiled by java 8 and specified by --module-path
* `explicit` module: the modular JAR

## Requirements

* Linux
* Download Java 9 EA build 181+ and set `JAVA_9_HOME` to /path/java9
* Set `JAVA_8_HOME` to /path/java8

## Can explicit modules access automatic modules?

You can confirm by `bash ./ModularJAR_calls_OrdinaryJAR.sh`

## Can automatic modules access explicit modules?

You can confirm by `bash ./OrdinaryJAR_calls_ModularJAR.sh`

## Can we run unnamed module with explicit modules?

You can run with explicit module by using classpath as `./OrdinaryJAR_calls_ModularJAR.sh`

## Current status (jdk9+181)

|caller\callee|unnamed|automatic|named|
|:-----------:|:-----:|:-------:|:---:|
|unnamed|O|X|X|
|automatic|X|O|X|
|named|X|O|O|
