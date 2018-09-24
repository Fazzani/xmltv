# Merge xmltv


ENV GITHUB_API_TOKEN required
and mounting all xmltv to /work directory


```bash

 docker build -t synker/xmltv_merge:latest -t synker/xmltv_merge:0.0.1 .
 docker push
 
```