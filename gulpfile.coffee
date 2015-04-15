gulp = require('gulp')
shell = require('gulp-shell')

# run coffee server via nodemon https://github.com/remy/nodemon
gulp.task 'default', ->
  gulp.src('').pipe shell( 'DEBUG=coffeepress:* nodemon bin/www.coffee' )

gulp.task 'test', [ 'mocha' ]
gulp.task 'mocha', ->
  gulp.src('').pipe shell "mocha --compilers coffee:coffee-script/register --invert --grep 'feature' -R spec"

# run mongod server
gulp.task 'mongod', ->
  gulp.src('').pipe shell([ 'mongod' ])
