
Friendly tool with Rancher 1.x/2.x

Example docker-compose.yml
```
version: '2'
services:
	app:
		image: your_image
  nginx-proxy-pass:
    image: sponk/nginx-proxy-pass
    environment:
      TARGET_SERVER_ENDPOINT: app:8000\/api\/
      TARGET_SERVER: app:8000
    stdin_open: true
    tty: true
    links:
    - app:app
    labels:
      io.rancher.container.pull_image: always
```