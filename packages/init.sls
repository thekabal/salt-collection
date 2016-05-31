{% if grains['os_family'] == 'RedHat' %}
{# This is the list of packages updated since release to run at "latest", or the equivalent of yum install packagename (without a version specified). This puts us beyond
   a version (6.5) and uses the latest update. Should ideally only be used for security patches, or packages that do not impact the general functionality of the server.
   This DOES install a package if it is not already installed! #}
latest_packages:
  pkg.latest:
    - pkgs:
        - bash
        - bind-utils
        - nano
        - ntp
        - openssl
        - openssh
        - rsyslog
        - facter

install_packages:
  pkg.installed:
    - pkgs:
      - at
      - bash-completion
      - glances
      - iftop
      - iperf
      - logwatch
      - mlocate
      - mtr
      - mutt
      - postfix
      - rsync
      - screen
      - sudo
      - telnet
      - unzip
      - vim-enhanced
      - wget
      - zip

{% endif %}
