# HAProxy - Data Plane API

The HAProxy Data Plane API lets you manage your HAProxy configuration dynamically using HTTP REST APIs. [HAProxy Data Plane API 2.0](https://www.haproxy.com/blog/announcing-haproxy-dataplane-api-20/).

The purpose of this repository is to demonstrate how to add a backend in HAProxy's conf file dynamically using its inbuilt REST API (data plane API). We'll run 3 docker container 2 hello-world docker container and one HA-Proxy's container.

## Installation

Run `docker-compose up --build` and will spin up 3 containers.

Note: If you get this error `haproxy|level=fatal msg="Error initiating users: no users configured in /etc/haproxy/haproxy.cfg, error: section missing"` This issue will usually arise in windows. 

Solution: File needs to be saved in unix style: `Select end of line sequence as LF(\n) instead of CRLF(\r)`

## Usage

We've setup `haproxy.cfg` in such a way that `localhost` will point to `haproxy` and it will execute the routing logic to route the request.

```
http://localhost/ -> routes to default_backend (web1)
http://localhost/web1/ -> routes to web1
http://localhost/web2/ -> routes to web2
```

The catch is, backend web1 is configured in `haproxy.cfg` but backend web2 is absent and we'll add that dynamically using API.

```
backend web1
    server web1 web1:80 check
``` 

Now use [these APIs](https://documenter.getpostman.com/view/5098247/T17KcRVa?version=latest) to add backend at runtime.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
