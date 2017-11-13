# docker-fossil

Run a basic Fossil server out of a volume

Files are served out of `/fossils`. `fossil.fossil` is served if present, otherwise 
the directory is served with `--repolist`.

Configuration environment variables:

- USERNAME: defaults to `admin` - username if INIT is set to `true`
- INIT: set to create fossil repository
- HTTPS: set to inform fossil it is being served over HTTPS
- PASSWORD: set to change the username for $USERNAME on `/fossils/fossil.fossil`
