Threat Stack Ansible Role
=========

[![Build Status](https://travis-ci.org/threatstack/threatstack-ansible.svg?branch=master)][travis]

[travis]: https://travis-ci.org/threatstack/threatstack-ansible

Ansible Role to deploy the Threat Stack server agent.

[Threatstack @ Ansible Galaxy](https://galaxy.ansible.com/threatstack/threatstack-ansible/)

Platforms
---------

* Amazon Linux
* CentOS
* RedHat
* Ubuntu
* Debian

Role Variables
--------------
The following variables are available for override.
```
threatstack_deploy_key:         # Required. Your Cloud Sight API Key
threatstack_feature_plan:       # AGENT 1.x ONLY!
                                #   Required. Set value to reflect your feature plan. https://www.threatstack.com/plans
                                #   * 'agent_type="i"' - Investigate or Legacy (Basic, Advanced, Pro)
                                #   * 'agent_type="m"' - Monitor
threatstack_ruleset:            # Array of agent rule sets, will default to ["Base Rule Set"].
                                # Define multiple rule sets using a comma seperated list.
threatstack_pkg_url:            # Location of package repo. Only change if you mirror your own.
threatstack_pkg:                # Name of package. Specify package version using
                                #  "threatstack-agent=X.Y.Z" (Debian/Ubuntu)
                                #  "threatstack-agent-X.Y.Z" (RedHat/CentOS/Amazon)
                                # Defaults to latest available version.
threatstack_url:                # The URL of the Threat Stack webapp. Defaults to https://app.threatstack.com
threatstack_hostname:           # The display hostname in the Threat Stack UI. Defaults to hostname.
threatstack_configure_agent:    # Optionally do not configure the host, just install package
threatstack_agent_extra_args:   # Pass optional arguments during agent registration.
threatstack_agent_config_args:  # Pass optional configuration arguments after agent registration.
```

Install
----------------
Using ansible galaxy, best for ad-hoc command situations:

    $ ansible-galaxy install threatstack.threatstack-ansible

To install into your playbook roles, use `-p ROLES_PATH` or `--path=ROLES_PATH`

    $ ansible-galaxy install threatstack.threatstack-ansible -p /your/project/root/roles

Check out: [Advanced Control over Role Requirements Files](http://docs.ansible.com/galaxy.html#advanced-control-over-role-requirements-files)


Examples
----------------
1) Install Threat Stack agent with the default rule set and reports system hostname to threatstack. This is the most basic configuration
```
- hosts: all
  roles:
    - { role: threatstack.threatstack-ansible, threatstack_deploy_key: XXXXXXXXXXXXX}
```

2) Install Threat Stack agent with custom security rules set and custom hostname:
```
- hosts: web-servers
  roles:
    - role: threatstack.threatstack-ansible
      threatstack_deploy_key: XXXXXXXXXXXXX
      threatstack_ruleset: 
        - 'Base Rule Set'
        - 'Custom Rule Set'
      threatstack_hostname: dev_web01_us-east-1c
```

3) Install the Threat Stack agent but do not configure it.  __NOTE: Useful for configuring a base image to be repeatedly deployed with the agent pre-installed.__
```
- hosts: aws-image
  roles:
    - role: threatstack.threatstack-ansible
      threatstack_configure_agent: false
```

4) Install a particular version of the Threat Stack agent.  Use in situations where you perform controlled rollouts of all new package versions.
```
- hosts: hosts
  roles:
    - role: threatstack.threatstack-ansible
      threatstack_deploy_key: XXXXXXXXXXXXX
      threatstack_pkg: threatstack-agent=1.4.4.0ubuntu14.0
```

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
