Default variable details
========================

Some of ``debops.squid`` default variables have more extensive configuration
than simple strings or lists, here you can find documentation and examples for
them.

.. contents::
   :local:
   :depth: 1


.. _squid__ref_configuration:

squid__configuration
--------------------

This variable is a YAML list of configuration parameters which should be
present in the ``/etc/squid3/squid.conf`` configuration file.

Each element of a list is a string or a YAML dictionary with specific
parameters:

``name``
  String. An option name, prepended to the value.

``value``
  Optional. String or list of arguments for a given configuration option.

``options``
  Optional. List of parameters which should be configured, each element can be
  a string or a YAML dictionary with the same parameters as the main
  configuration. The parameter tree is parsed recursively and additional levels
  add up to each other.

``comment``
  Optional. Add a comment to a given option.

``state``
  Optional. If not specified or ``present``, the specified parameter(s) will be
  present in the configuration file. If ``absent``, specified parameters won't
  be included in the configuration file.

``quote_spaces``
  Optional, boolean. If ``True``, Ansible will parse strings in a given YAML
  dictionary (not recursive) and quote any strings containing spaces with
  ``""`` characters.

Examples
~~~~~~~~

Configuration of Access Control Lists specified in 1 YAML text block:

.. code-block:: yaml

   squid__configuration:

     - |
       acl           SSL_ports   port 443
       acl           Safe_ports  port 80
       acl           Safe_ports  port 443
       acl           Safe_ports  port 1025-65535
       acl           CONNECT     method CONNECT
       http_access   deny        !Safe_ports
       http_access   deny        CONNECT !SSL_ports
       http_access   allow       localhost manager
       http_access   deny        manager
       http_access   allow       localhost
       http_access   deny        all

The same configuration specified as a YAML text block which is enabled
conditionally:

.. code-block:: yaml

   squid__configuration:

     - state: 'presnt'
       name: |
         acl           SSL_ports   port 443
         acl           Safe_ports  port 80
         acl           Safe_ports  port 443
         acl           Safe_ports  port 1025-65535
         acl           CONNECT     method CONNECT
         http_access   deny        !Safe_ports
         http_access   deny        CONNECT !SSL_ports
         http_access   allow       localhost manager
         http_access   deny        manager
         http_access   allow       localhost
         http_access   deny        all

The same configuration options specified as a simple list:

.. code-block:: yaml

   squid__configuration:

     - 'acl SSL_ports port 443'
     - 'acl Safe_ports port 80'
     - 'acl Safe_ports port 443'
     - 'acl Safe_ports port 1025-65535'
     - 'acl CONNECT method CONNECT'
     - 'http_access deny !Safe_ports'
     - 'http_access deny CONNECT !SSL_ports'
     - 'http_access allow localhost manager'
     - 'http_access deny manager'
     - 'http_access allow localhost'
     - 'http_access deny all'

The same configuration specified with YAML dictionaries:

.. code-block:: yaml

   squid__configuration:

     - name: 'acl'
       options:

         - name: 'SSL_ports'
           value: 'port 443'

         - name: 'Safe_ports'
           options:

             - name: 'port'
               options:
                 - '80'
                 - '443'
                 - '1025-65535'

         - name: 'CONNECT'
           value: [ 'method', 'CONNECT' ]

     - name: 'http_access'
       options:
         - 'deny !Safe_ports'
         - 'deny CONNECT !SSL_ports'
         - 'allow localhost manager'
         - 'deny manager'
         - 'allow localhost'
         - 'deny all'
