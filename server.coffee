routes  = require './routes'

exports.startServer = (config, callback) ->

  require('zappajs') process.env.PORT or config.server.port, ->
    @use 'favicon', 'bodyParser', 'methodOverride', 'compress', @app.router, static: config.watch.compiledDir
    @set
      'view engine': config.server.views.extension
      'views': config.server.views.path
    @get '/', routes.index(config)

    @io.set 'log level', 1

    callback @server, @io