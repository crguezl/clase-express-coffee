gulp = require 'gulp'
shell = require 'gulp-shell'

gulp.task 'default', ->
  gulp.src('').pipe(shell('DEBUG=coffeepress:* nodemon bin/www.coffee'))

gulp.task 'test', ->
  gulp.src('').pipe(shell 'mocha --compilers coffee:coffee-script/register -R spec test/routes-test.coffee')
