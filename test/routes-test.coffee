chai = require 'chai'
expect = chai.expect

routes = require '../routes/index'

describe 'routes', ->
  req = {}
  res = {}
  describe 'index', ->
    it "should display index with posts", ->
      res.render = (view, vars) -> # redefinimos render
        expect(view).to.be.equal 'index'
        expect(vars.title).to.be.equal 'My Blog'
        expect(vars.posts).deep.equal []
      routes.index(req, res)

  describe 'new post', ->
    it "should display the add post page", (done)->
      res.render = (view, vars) -> # redefinimos render
        expect(view).to.be.equal 'add_post'
        expect(vars.title).to.be.equal 'Write New Post'
        done()
      routes.newPost(req, res)
