chai = require 'chai'
expect = chai.expect
mongoose = require "mongoose"
Post     = require "../models/Post"

routes = require '../routes/index'

describe 'routes', ->
  req = 
    params: {}
    body: {}
  res = 
    redirect: (route) ->
      # do nothing
    render: (view, vars) -> 
      # do nothing
  before (done) ->
    mongoose.connect 'mongodb://localhost/coffeepress', ->
      Post.remove done

  describe 'index', ->
    it "should display index with posts", (done) ->
      res.render = (view, vars) -> # redefinimos render
        expect(view).to.be.equal 'index'
        expect(vars.title).to.be.equal 'My Blog'
        expect(vars.posts).deep.equal []
        done()
      routes.index(req, res)

  describe 'new post', ->
    it "should display the add post page", (done)->
      res.render = (view, vars) -> # redefinimos render
        expect(view).to.be.equal 'add_post'
        expect(vars.title).to.be.equal 'Write New Post'
        done()
      routes.newPost(req, res)
    it "should add a new post when posted to", (done) ->
      req.body = 
        title: "My Post!"
        body: "My wonderful post."

      routes.addPost req, redirect: (route) ->
        expect(route).eql "/"
        routes.index req, render: (view, vars) ->
          expect(view).equal "index"
          expect(vars.posts[0].title).eql 'My Post!'
          expect(vars.posts[0].body).eql "My wonderful post."
          done()

