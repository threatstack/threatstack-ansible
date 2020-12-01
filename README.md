Threat Stack Ansible Role
=========

>>>
**Threat Stack agent 1.x support is now removed**

This version of the ansible role only supports Threat Stack agent 2.x or higher. For support of 1.x agent versions, please use the 4.x versions of the role.
>>>

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

| Variable                          | Type    | Default                     | Required  | Description                                                                                                                                       |
|-----------------------------------|---------|-----------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| threatstack_deploy_key            | String  |                             | Yes       | Your TS deploy key.                                                                                                                 |
| threatstack_ruleset               | Array   | ["Base Rule Set"]           |           | Array of rulesets to apply to hosts.                                                                                                              |
| threatstack_pkg_url               | String  | Depends on version          |           | Location of package repo. Only change if you mirror your own.                                                                                     |
| threatstack_pkg                   | String  | threatstack-agent           |           | Name of package. Specify package version using `"threatstack-agent=X.Y.Z"` (Debian/Ubuntu) or `"threatstack-agent-X.Y.Z"` (RedHat/CentOS/Amazon). |
| threatstack_pkg_version           | String  |                             |           | If defined, pins specific threatstack package version
| threatstack_pkg_validate      | Boolean | yes                         |           | Should packages be validated? We default to yes, but if you repackage anything you may need to change this.                                       |
| threatstack_url                   | String  | https://app.threatstack.com |           | The URL endpoint for Threat Stack. This should not change.                                                                                        |
| threatstack_hostname              | String  |                             |           | The display hostname in the Threat Stack UI. Defaults to hostname.                                                                                |
| threatstack_configure_agent       | Boolean | true                        |           | Set to false to not configure the host, just install the package.                                                                                 |
| threatstack_agent_extra_args      | String  |                             |           | Pass optional arguments during agent registration.                                                                                                |
| threatstack_agent_config_args     | String  |                             |           | Pass optional configuration arguments after agent registration.                                                                                   |
| threatstack_agent_disable_service | Boolean  | false                       |           | Make sure agent service is disabled and not running after installation                                                                         |

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
      threatstack_pkg: threatstack-agent=2.0.0.0ubuntu20.0
```

Dependencies
------------

None

License
-------

Apache 2.0

Author Information
------------------
See [AUTHORS](./AUTHORS.md)

Issues
------
Use github issues for bugs in this repo.

Contributing enhancements/fixes
-------------------------------
See the [CONTRIBUTING document](CONTRIBUTING.md) for details.

