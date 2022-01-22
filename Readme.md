# Test the performance of Actix

let's see how much requests per second Actix can handle

## Commands

```bash
sudo apt install wrk
docker-compose up -d
wrk -t8 -c256 -d30s http://localhost:8080/
```
