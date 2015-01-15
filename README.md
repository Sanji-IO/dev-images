Development Images
==================
[![](http://dockeri.co/image/sanji/base-dev)](https://registry.hub.docker.com/u/sanji/base-dev/)
[![](http://dockeri.co/image/sanji/mosquitto-dev)](https://registry.hub.docker.com/u/sanji/mosquitto-dev/)
[![](http://dockeri.co/image/sanji/python-dev)](https://registry.hub.docker.com/u/sanji/python-dev/)

Prerequisite
------------
You have to install [qemu-user-static](https://wiki.debian.org/QemuUserEmulation).

> More information about: [QEMU + Docker](https://github.com/djmaze/armhf-ubuntu-docker#emulation-support)

Images
------
**Base**: `debian:stable` (for x86_64), `mazzolino/armhf-debian` (for armhf)

- **base-dev**
    + build-essential
    + git
- base-dev > **mosquitto-dev**
    + libjansson-dev
    + libmosquitto-dev
- base-dev > **python-dev**
    + python
    + pip (with wheel)

Usage
-----

- **base-dev, mosquitto-dev**
```
    $ docker run -it --rm -v /home/sanji/project:/data sanji/base-dev:armhf /bin/bash
```
- **python-dev**
Default [script](https://github.com/Sanji-IO/dev-images/blob/master/python-dev/scripts/build_wheels.sh) will run `pip wheel` for you. Just mount all your python bundles and run:
```
    $ docker run --rm -v /home/sanji/project:/data sanji/python-dev:armhf
```
All requirements in `/data/bundles/{bundle_name}/requirements.txt` and `/data/bundles/{bundle_name}/tests/requirements.txt` will be packed as whl save as `/home/sanji/project/build/*.whl`.

Once you have create those `*.whl`, you could install them on target machine by

```
    $ pip install --force-reinstall --ignore-installed --upgrade --no-index --use-wheel --no-deps $tempdir/*
```

> More information about: [Create an Installation Bundle with Compiled Dependencies](https://pip.pypa.io/en/latest/user_guide.html#create-an-installation-bundle-with-compiled-dependencies)

Build
-----
This section is for who wants to build armhf images by yourself(not recommended, just pull them from Docker Hub)

- **base-dev**
```
    $ ./build base-dev armhf
```

- **mosquitto-dev**
```
    $ ./build mosquitto-dev armhf
```

- **python-dev**
```
    $ ./build python-dev armhf
```

Appendix: Image tree layout
---------------------------
```
└─e31e10e36aff Virtual Size: 158.7 MB Tags: mazzolino/armhf-debian:latest
  └─c234e4a5bf07 Virtual Size: 158.7 MB
    └─4a2d44ece495 Virtual Size: 313.1 MB Tags: sanji/base-dev:armhf
      ├─786a26bfe97b Virtual Size: 313.1 MB
      │ └─4d73f18898ff Virtual Size: 314.7 MB
      │   └─9b13a5358565 Virtual Size: 350.1 MB
      │     └─e3d1007d24ee Virtual Size: 350.1 MB
      │       └─a096c31ed628 Virtual Size: 350.1 MB
      │         └─cdb212ea25d1 Virtual Size: 350.1 MB Tags: sanji/python-dev:armhf
      └─4e234ff47d94 Virtual Size: 313.1 MB
        └─314da60eb4dd Virtual Size: 316.2 MB Tags: sanji/mosquitto-dev:armhf
```
