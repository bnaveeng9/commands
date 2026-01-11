# EC2 instance run the ecommerce docker image to containerize



```bash

sudo docker run \
  -e STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" \
  -e NEXT_PUBLIC_BASE_URL="https://demowebserver.ngbandi.online" \
  -d \
  -p 3000:3000 \
  naveeng9/ecommerceapp-client:latest

```

