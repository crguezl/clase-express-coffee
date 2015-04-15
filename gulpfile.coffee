gulp = require('gulp')
shell = require('gulp-shell')
fs = require('fs')

# run coffee server via nodemon https://github.com/remy/nodemon
gulp.task 'default', ->
  gulp.src('').pipe shell( 'DEBUG=coffeepress:* nodemon bin/www.coffee' )

gulp.task 'test', [ 'mocha' ]
gulp.task 'mocha', ->
  gulp.src('').pipe shell "mocha --compilers coffee:coffee-script/register --invert --grep 'feature' -R spec"

# run mongod server
gulp.task 'mongod', ->
  gulp.src('').pipe shell([ 'mongod --pidfilepath /tmp/mongopid' ])

# kill mongod server
gulp.task 'killmongo', ->
  fs.readFile('/tmp/mongopid', 'utf8', 
    (err, pid) ->
      return console.log(err) if (err)
      console.log("killing #{pid}")
      gulp.src('').pipe shell("kill -9 #{pid}")
