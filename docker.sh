
#!/bin/bash
docker build  --no-cache --tag bdhwan/pm2-api-server-ts:0.0.4 .
docker push bdhwan/pm2-api-server-ts:0.0.4
