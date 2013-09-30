# Lineman Install & Verification Guide

This page will walk you through basic installation and verification of Lineman.

Some links to bookmark about Lineman for reference:

* [Lineman Homepage](http://linemanjs.com)
* [Github](https://github.com/testdouble/lineman)
* [Twitter](http://twitter.com/linemanjs)

This page was built with Lineman! Find the source [on Github](https://github.com/testdouble/lineman-install-guide).

<div class="link" id="downloads"></div>
## Downloads

Prerequisite software:

* Install Node.js ([Windows](http://nodejs.org/dist/v0.10.18/node-v0.10.18-x86.msi) | [Mac](http://nodejs.org/dist/v0.10.18/node-v0.10.18.pkg))
* Download PhantomJS ([Windows](https://phantomjs.googlecode.com/files/phantomjs-1.9.2-windows.zip) | [Mac](https://phantomjs.googlecode.com/files/phantomjs-1.9.2-macosx.zip))
* Download the workshop project ([Universal](/img/workshop-project.zip))

Optional, recommended software:

* Install Github ([Windows](http://github-windows.s3.amazonaws.com/GitHubSetup.exe) | [Mac](https://central.github.com/mac/latest))
* Install SublimeText 2 ([Windows](http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20Setup.exe) | [Mac](http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg))
* Install Google Chrome ([Universal](https://www.google.com/intl/en/chrome/browser/))

<div class="link" id="setup"></div>
## Setup

Once you've installed Node, you can use npm to install the global node modules we'll need for running things from the command line.

``` bash
$ npm install -g lineman grunt-cli
```

Additionally, it's important that we place PhantomJS somewhere on your path.


<i class="icon-windows"></i> On Windows, you can copy the `phantomjs.exe` file to `%APPDATA%\npm`, since the Node installer will have added that directory to your path. (In Windows 8, that path expands to `C:\Users\Justin\AppData\Roaming\npm` for me.)

<i class="icon-apple"></i> On OS X, I'd recommend making a new directory off the home and adding that to your path. (e.g. `mkdir ~/bin; echo 'export PATH="$PATH:$HOME/bin"' >> ~/.profile`), then copy the `phantomjs` binary into that directory.

## Verify your installation

Next, we'll verify that your installation is working properly by trying to create a new project.

<div class="link" id="new"></div>
### Create a new project

From any directory you wish to keep code in, run this command to start a new lineman project:

``` bash
$ lineman new hello-world
```

This should produce output like the following:

```
    _      _
   | |    (_)
   | |     _ _ __   ___ _ __ ___   __ _ _ __
   | |    | | '_ \ / _ \ '_ ` _ \ / _` | '_ \
   | |____| | | | |  __/ | | | | | (_| | | | |
   |______|_|_| |_|\___|_| |_| |_|\__,_|_| |_|

- Assembling your new project directory in '/Volumes/Macintosh HD/Users/justin/tmp/hello-world'
- Created a new project in "hello-world/" with Lineman. Yay!

Getting started:
  1. `cd hello-world` into your new project directory'
  2. Start working on your project!
    * `lineman run` starts a web server at http://localhost:8000
    * `lineman build` bundles a distribution in the "dist" directory
    * `lineman clean` empties the "dist" and "generated" directories
    * `lineman spec` runs specs from the "specs" directory using testem

For more info, check out http://github.com/testdouble/lineman
```

Next up, let's verify some basic Lineman commands.

<div class="link" id="build"></div>
### Building your project

```
$ cd hello-world
$ lineman build
```

This should produce a complete output like the following:

```
Running "common" task

Running "coffee:compile" (coffee) task
File generated/js/app.coffee.js created.
File generated/js/spec.coffee.js created.
>> Destination (generated/js/spec-helpers.coffee.js) not written because compiled files were empty.

Running "less:compile" (less) task
>> Destination not written because no source files were found.
File generated/css/app.less.css created.

Running "jshint:files" (jshint) task
>> 0 files linted. Please check your ignored files.

Running "handlebars:compile" (handlebars) task
>> Destination not written because compiled files were empty.

Running "jst:compile" (jst) task
File "generated/template/underscore.js" created.

Running "concat:js" (concat) task
File "generated/js/app.js" created.

Running "concat:spec" (concat) task
File "generated/js/spec.js" created.

Running "concat:css" (concat) task
File "generated/css/app.css" created.

Running "images:dev" (images) task
Copying images to 'generated/img'

Running "webfonts:dev" (webfonts) task
Copying webfonts to 'generated/webfonts'

Running "pages:dev" (pages) task
generated/index.html generated from app/pages/index.us

Running "dist" task

Running "uglify:js" (uglify) task
File "dist/js/app.js" created.

Running "cssmin:compress" (cssmin) task
File dist/css/app.css created.

Running "images:dist" (images) task
Copying images to 'dist/img'

Running "webfonts:dist" (webfonts) task
Copying webfonts to 'dist/webfonts'

Running "pages:dist" (pages) task
dist/index.html generated from app/pages/index.us

Done, without errors.
```

<div class="link" id="spec-ci"></div>
### Running tests (in CI mode)

It's also important to make sure that our spec suite is able to run (this will verify our PhantomJS installation):

```
$ lineman spec-ci
```

This should produce output that looks like this:

```
Running "common" task

Running "coffee:compile" (coffee) task
File generated/js/app.coffee.js created.
File generated/js/spec.coffee.js created.
>> Destination (generated/js/spec-helpers.coffee.js) not written because compiled files were empty.

Running "less:compile" (less) task
>> Destination not written because no source files were found.
File generated/css/app.less.css created.

Running "jshint:files" (jshint) task
>> 0 files linted. Please check your ignored files.

Running "handlebars:compile" (handlebars) task
>> Destination not written because compiled files were empty.

Running "jst:compile" (jst) task
File "generated/template/underscore.js" created.

Running "concat:js" (concat) task
File "generated/js/app.js" created.

Running "concat:spec" (concat) task
File "generated/js/spec.js" created.

Running "concat:css" (concat) task
File "generated/css/app.css" created.

Running "images:dev" (images) task
Copying images to 'generated/img'

Running "webfonts:dev" (webfonts) task
Copying webfonts to 'generated/webfonts'

Running "pages:dev" (pages) task
generated/index.html generated from app/pages/index.us

Running "spec-ci" task
ok 1 PhantomJS 1.9 - .helloText then expect(this.result).toEqual("Hello, World!").

1..1
# tests 1
# pass  1
# fail  0

# ok

Done, without errors.
```

<div class="link" id="run"></div>
### Running the app

To make sure that you can run your app in development mode, try:

```
$ lineman run
```

And then visit [http://localhost:8000](http://localhost:8000), which should show you:

![Hello World](/img/hello-world.png)

Try editing a file like `app/js/hello.coffee` or `app/css/style.less` and then refresh your browser to verify that file watching is working.

<div class="link" id="spec"></div>
### Running tests

To run your tests in development mode, *open a second terminal while `lineman run` continues running* and then execute:

```
$ lineman spec
```

And a new instance of Chrome will be invoked to run the test (assuming Chrome is installed):

![Specs in browser](/img/spec-browser.png)

Assuming that worked, the console should also reflect the passing test:

![Specs in console](/img/spec-cli.png)

Currently file watching only works sporadically under Windows. See [this issue](https://github.com/airportyh/testem/issues/293) on the testem project for status.
