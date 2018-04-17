#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/victor/COMP313P/cw1_ws/src/comp313p/comp313p_explorer"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/victor/COMP313P/cw1_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/victor/COMP313P/cw1_ws/install/lib/python2.7/dist-packages:/home/victor/COMP313P/cw1_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/victor/COMP313P/cw1_ws/build" \
    "/usr/bin/python" \
    "/home/victor/COMP313P/cw1_ws/src/comp313p/comp313p_explorer/setup.py" \
    build --build-base "/home/victor/COMP313P/cw1_ws/build/comp313p/comp313p_explorer" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/victor/COMP313P/cw1_ws/install" --install-scripts="/home/victor/COMP313P/cw1_ws/install/bin"
