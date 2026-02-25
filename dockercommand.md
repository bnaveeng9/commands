# EC2 instance run the ecommerce docker image to containerize



```bash

sudo docker run \
  -e STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" \
  -e NEXT_PUBLIC_BASE_URL="https://demowebserver.ngbandi.online" \
  -d \
  -p 3000:3000 \
  naveeng9/ecommerceapp-client:latest

```

```bash
docker build \
  --build-arg BASE_URL="https://demowebserver.ngbandi.online" \
  --build-arg STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" \
  -d \
  -p 3000:3000 \
  naveeng9/ecommerceapp-client:latest  \
```


```bash
docker build --build-arg BASE_URL="https://demowebserver.ngbandi.online" --build-arg STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" -d -p 3000:3000 naveeng9/ecommerceapp-client:latest  
```

#local docker build commands
```bash
docker compose build

docker run -d -p 3000:3000 --name ecommerceapp-client naveeng9/ecommerceapp-client:latest  
```

```bash
sudo docker run \
  -e STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" \
  -e NEXT_PUBLIC_BASE_URL="https://demowebserver.ngbandi.online" \
  -d \
  -p 3000:3000 \
  naveeng9/ecommerceapp-client:ads
```
