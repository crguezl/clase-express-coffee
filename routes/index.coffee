express = require('express')
debug = require('debug')('coffeepress:server')
util = require 'util'

posts = []

module.exports =
  index: (req, res) ->
    res.render('index', {title: "My Blog", posts: posts})

  newPost: (req, res) ->
    debug("en newPost #{util.inspect res}")
    res.render('add_post', {title: "Write New Post"})

  addPost: (req, res) ->
    post = req.body
    post.id = posts.length
    posts.push post
    res.redirect '/'
