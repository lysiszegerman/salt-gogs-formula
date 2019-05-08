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
        - watch_in:
            - service: gogs-running
        - require: gogs-custom-dir