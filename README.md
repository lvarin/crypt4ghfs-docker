# Crypt4ghfs docker

Followed the instructions at:

* <https://github.com/EGA-archive/crypt4ghfs/tree/master>

and made my own `Dockerfile`.

## Build

```sh
podman build . -t docker.io/lvarin/crypt4ghfs:latest
```

## Run

It assumes that the encrypted files are at `~/src/crypt4gh/rootdir` and the secret key to decrypt them at `~/src/crypt4gh/secret/bob.sec`.

```sh
podman run -v ~/src/crypt4gh/rootdir:/data \
           -v ~/src/crypt4gh/secret:/secret \
           --cap-add SYS_ADMIN --device /dev/fuse \
           --rm -it docker.io/lvarin/crypt4ghfs:latest
```

Inside the container run:

```sh
# crypt4ghfs /open
```

The output should be:

```sh
[crypt4ghfs.app][ INFO ] (L130) Mountpoint: /open
[crypt4ghfs.app][ INFO ] (L139) Root dir: /data/
[crypt4ghfs.app][ INFO ] (L68) Loading secret key from /secret/bob.sec
[crypt4ghfs.app][DEBUG ] (L147) mount options: {'default_permissions'}
[crypt4ghfs.operations][ INFO ] (L82) rootfd: 3
[crypt4ghfs.operations][ INFO ] (L84) stat: os.stat_result(st_mode=16877, st_ino=11965813, st_dev=64513, st_nlink=2, st_uid=0, st_gid=0, st_size=4096, st_atime=1722318531, st_mtime=1721994573, st_ctime=1721994573)
[crypt4ghfs.operations][ INFO ] (L93) inodes: {1: <Entry /data/ refcount=2 fd=4 ino=1>}
[crypt4ghfs.operations][ INFO ] (L96) Extension: .c4gh
[crypt4ghfs.operations][ INFO ] (L98) Header size hint: None
[crypt4ghfs.app][ INFO ] (L160) Running current process in background
[crypt4ghfs.app][ INFO ] (L188) Forking current process, and exiting the parent
[crypt4ghfs.app][ INFO ] (L197) decouple from parent environment
[crypt4ghfs.app][ INFO ] (L203) redirect standard file descriptors
```

The unencrypted content should be at `/open`.
