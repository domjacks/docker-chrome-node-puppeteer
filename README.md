# docker-chrome-node-puppeteer

You will need to ensure you have Docker installed and running.

Install dependecies:
```sh
npm ci
```

Build Docker image:
```sh
npm run build
```

Start Docker container:
```sh
npm start
```

Get list of running containers:
```sh
docker ps -a
```

Run tests:
```sh
docker exec -it <CONTAINER_ID> npm test
```
