# 二代宠汪汪依赖安装

    docker exec -it qinglong /bin/sh

    apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev

    cd scripts

    npm install canvas --build-from-source

    exit

OR

    npm install -g cnpm
    cnpm install -g node-gpy
    npm install -g node-pre-gpy
    cnpm install -g canvas
    cp -rf /usr/local/lib/node_modules/canvas /scripts/node_modules/

