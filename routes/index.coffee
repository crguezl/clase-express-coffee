express = require('express')
debug = require('debug')('coffeepress:server')
util = require 'util'

module.exports =
  index: (req, res) ->
    res.render('index', {title: "My Blog", posts: []})
  newPost: (req, res) ->
    debug("en newPost #{util.inspect res}")
    res.render('add_post', {title: "Write New Post"})
