# Proxy

nodejs proxy is used in case many services are bounded to one host.

It uses virtual hosting to route to backends.


### Setup

Git clone your repo on /apps/cockpit/proxy

Edit server.js, change ROUTER const to your need

### Run it

    # docker run -d --restart=always --link website:website --link cockpit:cockpit --name proxy -p 80:80 -v "/apps/cockpit/proxy":/proxy node:latest sh run

