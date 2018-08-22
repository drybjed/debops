Default variable details
========================

Some of ``debops.redis_server`` default variables have more extensive configuration
than simple strings or lists, here you can find documentation and examples for
them.

.. contents::
   :local:
   :depth: 1


.. _redis_server__ref_instances:

redis_server__instances
-----------------------

The role can manage multiple Redis Server instances on a single host via the
``redis_server__*_instances`` default variables. Each variable is a list of
YAML dictionaries, each dictionary defines an instance of Redis managed by
:command:`systemd` unit template.

Configuration specified in the instance YAML dictionary is parsed by the role
and used to generate the final configuration which is then used to manage the
Redis instances (see :ref:`redis_server__ref_config_pipeline`).

Multiple dictionaries with the same ``name`` parameter will be merged together;
this can be used to override previously defined instance configuration without
copying everything to the Ansible inventory.

Each entry can contain specific parameters:

``name``
  Required. THe name of a given Redis instance. This parameter is used as an
  anchor for merging of multiple YAML dictionaries that specify Redis instances
  together.

  The instance name ``main`` is significant and used in Ansible local fact
  script and the password script to denote the "default" Redis instance if none
  is specified.

``port``
  Required. The TCP port on which a given instance listens for network
  connections. Only ports defined in the instance list will be included in the
  automatically managed firewall configuration.

``state``
  Optional. If not specified or ``present``, a given Redis instance will be
  created or managed by the role. If ``absent``, a given instance will be
  removed by the role. If ``ignore``, a given instance entry will not be
  included in the configuration.

``pidfile``
  Optional. Absolute path to a PID file of a given Redis instance. If not
  specified, the role will generate one based on the instance name.

``unixsocket``
  Optional. Absolute path to an UNIX socket file of a given Redis instance. If
  not specified, the role will generate one based on the instance name.

``bind``
  Optional. A string or a YAML list of IP addresses to which a given Redis
  instance should bind to to listen for network connections. If not specified,
  the instance will bind on the IP addresses specified in the
  :envvar:`redis_server__bind` variable, by default ``localhost``.

``dbfilename``
  Optional. Name of the Redis database file which will contain the persisten
  storage, stored in the :file:`/var/lib/redis/` directory. If not specified,
  the role will generate the name based on the instance name.

``logfile``
  Optional. Absolute path to a log file of a given Redis instance. If not
  specified, the role will generate one based on the instance name.

``syslog_ident``
  Optional. A short string that identifies a given Redis instance in the syslog
  stream. If not specified, the role will generate one based on the instance
  name.

``requirepass``
  Optional. Plaintext password which will be required by Redis to allow certain
  operations. If not specified, the value of the
  :envvar:`redis_server__auth_password` will be used automatically.

``systemd_override``
  Optional. An YAML text block that contains :command:`systemd` unit
  configuration entries. This can be used to override the configuration of
  a Redis instance managed by :command:`systemd`.

``master_host`` and ``master_port``
  Optional. The FQDN address of the host with the Redis master instance, and
  its TCP port. If these parameters are set, a given Redis instance will be
  configured as a slave of the specified Redis master on the initial
  configuration, but not subsequent ones.

Other configuration options for a given Redis instance should be specified in
the ``redis_server__*_configuration`` variables. Some of the instance
parameters like ``port`` are used in other parts of the role and should be
overridden only on the list of instances.

You can find example configuration in
:ref:`redis_server__ref_instances_examples`.


.. _redis_server__ref_configuration:

redis_server__configuration
---------------------------


