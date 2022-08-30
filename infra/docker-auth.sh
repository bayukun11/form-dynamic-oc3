#!/bin/bash
cat <<EOF>> docker.json
{
"auths": {
"registry.aio.co.id": {
"auth": "ZGVwbG95ZXI6aGs2TUt4TlFkQ21hTnQ5WXdBMld6dUdIOG40NUVncHE="
}
},
"HttpHeaders": {
"User-Agent": "Docker-Client/19.03.12 (linux)"
}
}
EOF
#
mkdir -p ~/.docker/
mv docker.json ~/.docker/config.json
chmod 600 ~/.docker/config.json
echo "done."