Default variable details
========================

Some of ``debops.icinga`` default variables have more extensive configuration
than simple strings or lists, here you can find documentation and examples for
them.

.. contents::
   :local:
   :depth: 1


.. _icinga__ref_director_register_templates:

icinga__director_register_templates
-----------------------------------


.. _icinga__ref_director_register_vars:

icinga__director_register_vars
------------------------------


.. _icinga__ref_configuration:

icinga__configuration
---------------------


.. _icinga__ref_custom_files:

icinga__custom_files
--------------------

The ``icinga__*_custom_files`` variables can be used to copy additional hosts
to hosts managed with the ``debops.icinga`` role. The variables are lists, each
list entry is a YAML dictionary with specific parameters:

``content``
  String or YAML text block with file contents. Cannot be set with the ``src``
  parameter at the same time.

``src``
  Absolute path to the file located on the Ansible Controller which will be
  copied to the remote host. Cannot be set with the ``content`` parameter at
  the same time.

``dest``
  Required. Absolute path where the file will be placed on the remote host.

``owner``
  Optional. Specify the owner of the file. If not specified, ``root`` will be
  the owner.

``group``
  Optional. Specify the default group of the file. If not specified, ``root``
  will be the default group.

``mode``
  Optional. Specify the file attributes. If not specified, ``0755`` will be set
  (by default the role assumes that the managed custom files are scripts).

``force``
  Optional, boolean. If ``True`` (default), the role will override already
  existing file. If ``False``, the role will not override an existing file.

``state``
  Optional. If not set or ``present``, the file will be copied to the remote
  host. This can be used to conditionally copy files depending on other
  factors.

Examples
~~~~~~~~

Add a simple hello world script in Icinga 2 :file:`scripts/` directory:

.. code-block:: yaml

   icinga__custom_files:
     - content: |
         #!/bin/sh

         echo "Hello, world!"
       dest: '/etc/icinga2/scripts/hello-world.sh'
