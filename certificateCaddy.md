```bash

sudo mv server.key server.crt server-ca.crt /etc/caddy/certs/
```

```bash
sudo chown -R caddy:caddy /etc/caddy/certs
```

```bash
yourdomain.com {
    tls /etc/caddy/certs/server.crt /etc/caddy/certs/server.key {
        ca /etc/caddy/certs/server-ca.crt
    }

    reverse_proxy localhost:3000
}
```


```bash


ssh -i "sirit3large.pem" /certs/server.key ubuntu@ec2-184-72-99-236.compute-1.amazonaws.com:/etc/caddy/certs/

ssh -i "sirit3large.pem" /certs/server.crt ubuntu@ec2-184-72-99-236.compute-1.amazonaws.com:/etc/caddy/certs/

ssh -i "sirit3large.pem" /certs/server-ca.pem ubuntu@ec2-184-72-99-236.compute-1.amazonaws.com:/etc/caddy/certs/
```
