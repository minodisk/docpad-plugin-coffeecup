coffeecup = require 'coffeecup'

module.exports = (BasePlugin) ->

  class CoffeeCupPlugin extends BasePlugin

    name: 'coffeecup'

    config:
      coffeecup:
        format: false
      environments:
        development:
          coffeecup:
            format: true

    render: (opts, next)->
      { inExtension, outExtension } = opts
      console.log inExtension, outExtension
      unless inExtension is 'coffee' and outExtension is 'html'
        next()
        return
      try
        opts.content = coffeecup.render opts.content, opts.templateData, @config.coffeecup
        next()
      catch err
        next err
