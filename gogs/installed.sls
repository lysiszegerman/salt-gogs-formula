# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-requirements:
  pkg.latest:
    - pkgs:
      - git

gogs-installed:
  archive.extracted:
    - name: /opt/
    - source: https://dl.gogs.io/{{ salt['pillar.get']('gogs:version') }}/gogs_{{ salt['pillar.get']('gogs:version') }}_linux_amd64.tar.gz
    - source_hash: {{ salt['pillar.get']('gogs:hash') }}
    - archive_format: tar
    - if_missing: /opt/gogs/gogs
  file.directory:
    - name: /opt/gogs/
    - user: git
    - group: git
    - recurse:
       - user
       - group

gogs-home:
  file.directory:
    - name: /home/git/gogs
    - user: git
    - group: git

/var/log/gogs:
  file.directory:
    - user: git
    - group: adm
    - dir_mode: 750
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
