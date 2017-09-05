#/bin/bash

CLASSES=classes
LIBRARY=libs
MODULES=mods
MODULAR=mlibs

rm -rf $CLASSES $LIBRARY $MODULES $MODULAR

# Make odrinary JAR "org.astro.jar"
mkdir $CLASSES
$JAVA_8_HOME/bin/javac -cp java8/src -d $CLASSES java8/src/org/astro/World.java
mkdir $LIBRARY
$JAVA_8_HOME/bin/jar cvf $LIBRARY/org.astro.jar -C $CLASSES/ . 1>/dev/null

# Make modular JAR "com.greetings.jar"
$JAVA_9_HOME/bin/javac --module-source-path java9/src -d $MODULES -m com.greetings
mkdir $MODULAR
$JAVA_9_HOME/bin/jar --create --file $MODULAR/com.greetings.jar -C $MODULES/com.greetings .

echo "Check JARs"
echo "* $(ls $MODULAR/*jar)"
$JAVA_9_HOME/bin/jar -d --file $MODULAR/*jar
echo "* $(ls $LIBRARY/*jar)"
$JAVA_9_HOME/bin/jar -d --file $LIBRARY/*jar

echo "--------------------------------------"

echo "Try explicit module calls automatic module"
$JAVA_9_HOME/bin/java -p $LIBRARY:$MODULAR -m com.greetings/com.greetings.Main

