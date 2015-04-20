express = require('express')
Post = require '../models/Post'
debug = require('debug')('coffeepress:server')
util = require 'util'

module.exports =
  index: (req, res) ->
    Post.find {}, (err, posts) ->
      res.render "index",
        title: "My Blog"
        posts: posts
  newPost: (req, res) ->
    res.render('add_post', {title: "Write New Post"})
  addPost: (req, res) ->
    post = req.body
    new Post(post).save ->
      res.redirect '/'
  viewPost: (req, res) ->
    Post.findById req.params.id, (err, post) ->
      res.render 'post', post: post, title: post.title


