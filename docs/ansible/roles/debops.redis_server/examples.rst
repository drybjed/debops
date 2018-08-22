.. _redis_server__ref_examples:

:ref:`debops.redis_server` configuration examples
=================================================

.. contents::
   :local:


.. _redis_server__ref_instances_examples:

Examples of instance parameters
-------------------------------

These examples show how you can specify configuration of Redis Server instances
in the Ansible inventory. See :ref:`redis_server__ref_instances` for more
information about syntax and usage.

Define multiple Redis Server instances
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: examples/multiple_instances.yml
   :language: yaml

Modify existing instance configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: examples/modify_main_instance.yml
   :language: yaml

Define additional instance configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. literalinclude:: examples/instance_configuration.yml
   :language: yaml
