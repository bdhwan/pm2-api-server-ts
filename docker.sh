
#!/bin/bash
docker build  --no-cache --tag bdhwan/pm2-api-server-ts:3.0.2 .
docker push bdhwan/pm2-api-server-ts:3.0.2
