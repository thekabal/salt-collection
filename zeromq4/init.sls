{% if grains['os_family'] == 'RedHat' %}
saltstack-zeromq4:
  pkgrepo.managed:
    - humanname: Copr repo for zeromq4 owned by saltstack
    - baseurl: http://copr-be.cloud.fedoraproject.org/results/saltstack/zeromq4/epel-$releasever-$basearch/
    - gpgcheck: 0
    - skip_if_unavailable: True
    - enabled: 1

update_zmq:
  pkg:
    - latest
    - pkgs:
      - zeromq
      - python-zmq
    - order: last
  cmd:
    - wait
    - name: echo service salt-minion restart | at now + 1 minute
    - watch:
      - pkg: update_zmq
{% endif %}
