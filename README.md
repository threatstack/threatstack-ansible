Threat Stack Ansible Role
=========

[![Build Status](https://travis-ci.org/threatstack/threatstack-ansible.svg?branch=master)][travis]

[travis]: https://travis-ci.org/threatstack/threatstack-ansible

Ansible Role to deploy the Threat Stack server agent

Requirements
------------

None at this time.

Platforms
---------

* Amazon Linux
* CentOS
* RedHat
* Ubuntu

Role Variables
--------------

Required:

* `threatstack_deploy_key` - Set the deploy key for registering the agent

Optional:

* `threatstack_policy` - Set the policy the node will be added to (Defaults to 'Default Policy')
* `threatstack_hostname` - Set the hostname if you would like the hostname disolated be displayed on Threat Stack to be different than the machine's actual hostname

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: threatstack-ansible, threatstack_deploy_key: XXXXXX,  threatstack_policy: My Secure Policy, threatstack_hostname: SparkServer1}

License
-------

Apache 2.0

Author Information
------------------
Apollo Catlin <apollo@threatstack.com>