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
      unless inExtension is [ 'coffee', 'litcoffee' ] and
             outExtension in [ 'html' ]
        next()
        return
      try
        opts.content = coffeecup.render opts.content, opts.templateData, @config.coffeecup
        next()
      catch err
        next err
