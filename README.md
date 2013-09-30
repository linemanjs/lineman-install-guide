# lineman-install-guide

A little install guide for a Lineman workshop, hosted here:

[http://lineman-install.herokuapp.com](http://lineman-install.herokuapp.com)

To run this yourself:

```
$ npm install
$ lineman run
```

This was deployed to heroku by adding the custom Lineman heroku buildpack:

```
$ heroku create --buildpack http://github.com/testdouble/heroku-buildpack-lineman.git
$ git push heroku
```
