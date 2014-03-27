routes  = require './routes'

exports.startServer = (config, callback) ->

  require('zappajs') ->
    @use 'favicon', 'bodyParser', 'methodOverride', 'compress', @app.router, static: config.watch.compiledDir
    @set
      'view engine': config.server.views.extension
      'views': config.server.views.path
      'port', process.env.PORT or config.server.port
    @get '/', routes.index(config)

    callback @server, @io