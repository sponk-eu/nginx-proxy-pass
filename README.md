
Friendly tool with Rancher 1.x/2.x and Load balancer

Example docker-compose.yml
```
version: '2'
services:
	app:
		image: your_image
  nginx-proxy-pass:
    image: sponk/nginx-proxy-pass
    environment:
      TARGET_SERVER_ENDPOINT: http://app:8000\/api\/
      TARGET_SERVER: app:8000
      PROXY_SSL_VERIFY: off
    stdin_open: true
    tty: true
    links:
    - app:app
    labels:
      io.rancher.container.pull_image: always
```


```
docker run -e TARGET_SERVER_ENDPOINT='http://app:8000\/api\/' -e TARGET_SERVER='app:8000' -e PROXY_SSL_VERIFY='off' --name nginx-proxy-pass sponk/nginx-proxy-pass
```
