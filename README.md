Threat Stack Ansible Role
=========

[![Build Status](https://travis-ci.org/threatstack/threatstack-ansible.svg?branch=master)][travis]

[travis]: https://travis-ci.org/threatstack/threatstack-ansible

Ansible Role to deploy the Threat Stack server agent.

[Threatstack @ Ansible Galaxy](https://galaxy.ansible.com/list#/roles/2875)

Platforms
---------

* Amazon Linux
* CentOS
* RedHat
* Ubuntu

Role Variables
--------------
	threatstack_deploy_key: 3306				# Required. Your Cloud Sight API Key
	threatstack_policy: "My Secure Policy"    	# The Agent's security policy (Recommended that this is set to the 'Default Policy')
	threatstack_hostname: SparkServer1      	# The display hostname

Install
----------------
Using ansible galaxy, best for ad-hoc command situations:

	$ ansible-galaxy install apollocatlin.threatstack

To install into your playbook roles, use `-p ROLES_PATH` or `--path=ROLES_PATH`

	$ ansible-galaxy install apollocatlin.threatstack -p /your/project/root/roles

Check out: [Advanced Control over Role Requirements Files](http://docs.ansible.com/galaxy.html#advanced-control-over-role-requirements-files)


Examples
----------------
1) Install Threat Stack agent with the default policy and reports system hostname to threatstack. This is the most basic configuration

	- hosts: all
      roles:
         - { role: threatstack, threatstack_deploy_key: XXXXXXXXXXXXX}

2) Install Threat Stack agent with custom security policy and custom hostname:

    - hosts: servers
      roles:
    	- role: threatstack
      	  threatstack_deploy_key: XXXXXXXXXXXXX
      	  threatstack_policy: "My Secure Policy"
      	  threatstack_hostname: SparkServer1

Dependencies
------------

None

License
-------

Apache 2.0

Author Information
------------------
Apollo Catlin <apollo@threatstack.com>
