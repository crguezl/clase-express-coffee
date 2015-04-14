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
