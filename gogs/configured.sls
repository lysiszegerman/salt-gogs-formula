gogs-custom-dir:
    file.directory:
        - name: /opt/gogs/custom/conf
        - user: git
        - group: git
        - mode: 755
        - makedirs: True

gogs-config:
    file.managed:
        - name: /opt/gogs/custom/conf/app.ini
        - source: salt://gogs/files/gogs-app.ini
        - user: git
        - group: git
        - mode: 644
        - template: jinja
        - watch_in:
            - service: gogs-running