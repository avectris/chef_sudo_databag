![build](https://git.zmssrv.com/avectris/chef/chef_sudo_databag/badges/master/build.svg)

# sudo_databag Cookbook

Configure the sudo program.

## Requirements

### Cookbooks

### Platforms

The following platforms are supported and tested with Test Kitchen:

- Ubuntu 14.04+
- CentOS 6+

Other Debian and RHEL family distributions are assumed to work.

### Chef

- Chef 14.3+

## Attributes

Node attributes for this cookbook are logically separated into different files. Some attributes are set only via a specific recipe.

### project::option

These attributes are used in the `project::option` recipe.

- `node['sudo_databag']['databag']['name']` - Data Bag name
- `node['sudo_databag']['databag']['items']` - Data Bag item names

## Data Bags

### Item Basic

There is a minimum one data bag item. The name of this data bag item must be basic. In this item, you define the least common denominator.

#### example of basic

```
{
  "id": "basic",
  "include_sudoers_d": true,
  "defaults": {
    "env_reset": null,
    "secure_path": "/sbin:/bin:/usr/sbin:/usr/bin",
    "env_keep": "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"
  },
  "aliases": {
    "cmnd": {
      "shutdown": [
        "/sbin/poweroff",
        "/sbin/reboot",
        "/sbin/halt"
      ],
      "printing": [
        "/usr/sbin/lpc",
        "/usr/sbin/lprm"
      ]
    },
    "user": {
      "admins": [
        "%admin",
        "%whell"
      ],
      "users": [
        "robert",
        "roland"
      ]
    },
    "runas": {
      "root": [
        "#0"
      ],
      "admins": [
        "%admin",
        "root"
      ]
    },
    "host": {
      "servers": [
        "192.168.0.1",
        "192.168.0.2",
        "server1"
      ],
      "network": [
        "192.168.0.0/255.255.255.0"
      ],
      "workstations": [
        "NETWORK",
        "!SERVER"
      ]
    }
  },
  "groups": {
    "wheel": {
      "host": "all",
      "operator": "all",
      "tag": "nopasswd",
      "command": [
        "all"
      ]
    },
    "ressl": {
      "host": "all",
      "operator": "all",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  },
  "users": {
    "wheel": {
      "host": "all",
      "operator": "all",
      "tag": "nopasswd",
      "command": [
        "all"
      ]
    },
    "robert_ressl": {
      "host": "all",
      "operator": "all",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  }
}
```

### extra item

You can define specific items for a group of nodes or only one.

#### example extra item

```
{
  "id": "example",
  "groups": {
    "example_wheel": {
      "host": "all",
      "operator": "all",
      "tag": "nopasswd",
      "command": [
        "all"
      ]
    },
    "example_ressl": {
      "host": "all",
      "operator": "all",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  },
  "users": {
    "example_wheel": {
      "host": "all",
      "operator": "all",
      "tag": "nopasswd",
      "command": [
        "all"
      ]
    },
    "example_robert_ressl": {
      "host": "all",
      "operator": "all",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  }
}
```


## Authors

* **Robert Ressl** - *Initial work* - [Robert Ressl](https://github.com/safematix)

See also the list of [contributors](https://git.avectris.ch/avectris/chef/chef_sudo_databag/graphs/master) who participated in this project.

## License

This project is licensed under the GNU Affero General Public License v3.0 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

## Thanks to...

