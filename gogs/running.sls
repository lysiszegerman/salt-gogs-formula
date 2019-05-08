# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

/lib/systemd/system/systemd-gogs.service:
  file.managed:
    - source: salt://gogs/files/systemd-gogs
    - template: jinja

gogs-running:
  service.running:
    - name: gogs
    - require:
      - file: /lib/systemd/system/systemd-gogs.service
