
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

* Environments List

| Environment            | Required | Default value |
|------------------------|----------|---------------|
| TARGET_SERVER_ENDPOINT | YES      |               |
| HOST_SERVER            | NO       | $host         |
| PROXY_SSL_VERIFY       | NO       | on            |
| PROXY_CONNECT_TIMEOUT  | NO       | 60            |
| PROXY_SEND_TIMEOUT     | NO       | 60            |
| PROXY_READ_TIMEOUT     | NO       | 60            |
| PROXY_BUFFERS          | NO       | 4 32k         |