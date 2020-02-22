
#!/bin/bash
docker build  --no-cache --tag bdhwan/pm2-api-server-ts:2.0.0 .
docker push bdhwan/pm2-api-server-ts:2.0.0
