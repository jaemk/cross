set -ex

run() {
    if [ -z $VTAG ]; then
        echo "VTAG docker version tag required"
        exit 1
    else
        docker build \
               -t jaemk/$1:${VTAG} \
               -f docker/${1}/Dockerfile \
               docker
    fi
}

if [ -z $1 ]; then
    for t in `ls docker/`; do
        if [ -d docker/$t ]; then
            run $t
        fi
    done
else
    run $1
fi
