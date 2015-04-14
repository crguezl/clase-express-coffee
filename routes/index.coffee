express = require('express')

module.exports =
  index: (req, res) ->
    res.render('index', {title: "My Blog", posts: []})
