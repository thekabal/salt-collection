bash:
  pkg:
    - installed

{% if grains['os_family'] == 'FreeBSD' %}
/bin/bash:
    file.symlink:
    - force: True
    - target: /usr/local/bin/bash

  file.managed:
    - template: jinja
    - name: /etc/shells
    - source: salt://bash/shells
    - require:
      - pkg: bash
{% endif %}
