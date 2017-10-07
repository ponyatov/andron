# ![logo](icon/logo.png)  andron
### android collider

Android template/script project
* minimal set of project files allows to open in Android Studio
* or use any source editor and make tool (on Linux)
* bytecode based Forth script engine
* and assembler/compiler written in flex/bison/C++

(c) Dmitry Ponyatov <<dponyatov@gmail.com>> , All rights reserved

github: https://github.com/ponyatov/andron

### Build

Clone project from GitHub (default directory will disturb you with `~/android-studio`)

```
$ cd ~ ; git clone -o gh https://github.com/ponyatov/andron.git dron
```

Run build scripts to compile bytecode image must be embedded into `.apk` 
```
$ cd dron ; make

```

### References

[develop for Android without Studio](https://ncona.com/2013/02/introduction-to-android-development-building-an-application-without-an-ide/)