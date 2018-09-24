# Merge xmltv


ENV GITHUB_API_TOKEN required
and mounting all xmltv to /work directory


```bash
 sudo docker run -it -v "${PWD}:/work" -e GITHUB_API_TOKEN=${GITHUB_API_TOKEN} synker/xmltv_merge:0.0.3 dos2unix docker/merge.sh && docker/merge.sh *.xmltv
 docker build -t synker/xmltv_merge:latest -t synker/xmltv_merge:0.0.1 .
 docker push
 
```
