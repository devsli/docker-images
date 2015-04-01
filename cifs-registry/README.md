# CIFS backend for Docker registry

In case you want to store docker images on NAS.

# Quick start

```bash
/usr/bin/docker run --privileged --name="docker-hub" \
  -e SMB_HOST=nas.example.lan                        \
  -e SMB_ROOT=/home/Docker/Registry                  \
  -e SMB_USER=your_username                          \
  -e SMB_PASS=your_password                          \
  -p 5000:5000 devsli/cifs-registry
```
