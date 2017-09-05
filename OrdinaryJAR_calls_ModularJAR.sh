#/bin/bash

CLASSES=classes
LIBRARY=libs
MODULES=mods
MODULAR=mlibs

rm -rf $CLASSES $LIBRARY $MODULES $MODULAR

# Make modular JAR "org.astro.jar"
$JAVA_9_HOME/bin/javac --module-source-path java9/src -d $MODULES -m org.astro
mkdir $MODULAR
$JAVA_9_HOME/bin/jar --create --file $MODULAR/org.astro.jar -C $MODULES/org.astro .

# Make odrinary JAR "com.greetings"
mkdir $CLASSES
$JAVA_8_HOME/bin/javac -cp java8/src -d $CLASSES java8/src/com/greetings/Main.java
## Remove depended classes(org.astro.jar)
rm -rf $CLASSES/org
mkdir $LIBRARY
$JAVA_8_HOME/bin/jar cvf $LIBRARY/com.greetings.jar -C $CLASSES/ . 1>/dev/null

echo "Check JARs"
echo "* $(ls $MODULAR/*jar)"
$JAVA_9_HOME/bin/jar -d --file $MODULAR/*jar
echo "* $(ls $LIBRARY/*jar)"
$JAVA_9_HOME/bin/jar -d --file $LIBRARY/*jar

echo "--------------------------------------"

echo "Try automatic module calls explicit module"
$JAVA_9_HOME/bin/java -p $LIBRARY:$MODULAR -m com.greetings/com.greetings.Main

echo "Try unnamed Module calls explicit module by module-path"
$JAVA_9_HOME/bin/java -cp $LIBRARY/* -p $MODULAR com.greetings.Main

echo "Try unnamed Module calls explicit module by class-path"
$JAVA_9_HOME/bin/java -cp $LIBRARY/*:$MODULAR/* com.greetings.Main
