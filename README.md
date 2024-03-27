# Building a simple web server with Python



## Building the image for arm and x86

### Build multi-arch image, push to docker hub

```
docker buildx build --platform linux/arm64,linux/amd64 --push --tag helloflask . 
```

### Build single-arch image, load to local docker 

```
docker buildx build --platform linux/arm64 --load --tag helloflask . 
docker buildx build --platform linux/amd64 --load --tag helloflask . 
```
