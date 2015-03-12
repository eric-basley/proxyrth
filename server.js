var http = require('http')
  , url = require('url')
  , util = require('util')
  , ROUTES = require('./params')
  , httpProxy = require('http-proxy');


var proxy = httpProxy.createProxyServer({xfwd: true});

function route(hostname){
  var target = ROUTES[hostname];

  //console.log(hostname, target);

  if(!target)throw new Error("Unknow route to " + hostname);
  console.log(util.format("=> route to http://%s", target));
  return target;
}

var server = http.createServer(function(req, res){
  //var pathname = url.parse(req.url).pathname;
  console.log(util.format('http://%s/%s', req.headers.host, req.url));
  try{
    proxy.web(req, res, { target: route(req.headers.host) });
  }catch(e){
    console.log(util.format("=> Unknown route!"));
    res.statusCode = 404;
    return res.end();
  }
}).listen(80);


server.on('listening', function(){
  console.log("Active routes => ");
  console.log(ROUTES);
  console.log('Ready to proxy U ...');
});




