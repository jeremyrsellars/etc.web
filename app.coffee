express = require 'express'
routes = require './routes'
ramsey = require './routes/ramsey'
http = require 'http'
path = require 'path'

app = express()

# all environments
app.set 'port', process.env.PORT || 3000
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'jade'
app.use '/etc', express.favicon()
app.use express.logger('dev')
app.use express.bodyParser()
app.use express.methodOverride()
app.use app.router
app.use '/etc', express.static(path.join(__dirname, 'public'))

# development only
if 'development' == app.get('env')
  app.use express.errorHandler()

app.get '/', (req,res) -> res.redirect '/etc'
app.get '/etc', routes.index
app.get '/etc/ramsey', ramsey.list

http.createServer(app).listen app.get('port'), ->
  console.log 'Express server listening on port ' + app.get('port')
