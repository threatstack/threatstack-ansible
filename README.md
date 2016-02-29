Threat Stack Ansible Role
=========

[![Build Status](https://travis-ci.org/threatstack/threatstack-ansible.svg?branch=master)][travis]

[travis]: https://travis-ci.org/threatstack/threatstack-ansible

Ansible Role to deploy the Threat Stack server agent.

[Threatstack @ Ansible Galaxy](https://galaxy.ansible.com/list#/roles/3018)

Platforms
---------

* Amazon Linux
* CentOS
* RedHat
* Ubuntu

Role Variables
--------------
	threatstack_deploy_key: 3306							# Required. Your Cloud Sight API Key
	threatstack_ruleset: "My Secure Rule Set" # The Agent's security rule set, will default to "Default Rule Set"
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
1) Install Threat Stack agent with the default rule set and reports system hostname to threatstack. This is the most basic configuration

	- hosts: all
      roles:
         - { role: apollocatlin.threatstack, threatstack_deploy_key: XXXXXXXXXXXXX}

2) Install Threat Stack agent with custom security rule set and custom hostname:

    - hosts: servers
      roles:
    	- role: apollocatlin.threatstack
      	  threatstack_deploy_key: XXXXXXXXXXXXX
      	  threatstack_ruleset: "My Secure Rule Set"
      	  threatstack_hostname: web01

Dependencies
------------

None

License
-------

Apache 2.0

Author Information
------------------
Apollo Catlin <apollo@threatstack.com>
Use github issues for bugs in this repo.
