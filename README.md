# docker-gpu-miner
GPU Mining images

## Motivation

This is just a base image for other docker images for specific miners

## Usage

Build a miner using 
```
FROM r351574nc3/docker-gpu-miner:rocm


```

## Miners supported

| Miner    | Image                                                         | Status |
|----------|------------------------------------------------------------------|-----|
| ethminer | [docker-ethminer](https://github.com/r351574nc3/docker-ethminer) | :x: |
| claymore | [docker-claymore](https://github.com/r351574nc3/docker-claymore) | :x: |
| cgminer  | [docker-cgminer](https://github.com/r351574nc3/docker-cgminer)   | :x: |
| sgminer  | [docker-sgminer](https://github.com/r351574nc3/docker-sgminer)   | :x: |
| ccminer  | [docker-ccminer](https://github.com/r351574nc3/docker-ccminer)   | :x: |
