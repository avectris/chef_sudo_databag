![build](https://git.avectris.ch/avectris/chef/chef_sudo_databag/badges/master/build.svg)

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
    "env_keep": "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY",
    "user": {
      "ressl_robert": [
        "!requiretty",
        "!env_reset"
      ]
    }
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
    "wheel_all": {
      "group": "wheel",
      "host": "ALL",
      "operator": "ALL",
      "tag": "nopasswd",
      "command": [
        "ALL"
      ]
    },
    "ressl_ls-cat": {
      "group": "ressl",
      "host": "ALL",
      "operator": "ALL",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  },
  "users": {
    "wheel_all": {
      "user": "wheel",
      "host": "ALL",
      "operator": "ALL",
      "tag": "nopasswd",
      "command": [
        "ALL"
      ]
    },
    "robert_ressl_ls-cat": {
      "user": "robert_ressl",
      "host": "ALL",
      "operator": "ALL",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  },
  "production": {},
  "staging": {},
  "testing": {},
  "integration": {},
  "development": {
    "defaults": {
      "env_reset": null,
      "secure_path": "/sbin:/bin:/usr/sbin:/usr/bin",
      "env_keep": "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY",
      "user": {
        "robert_ressl": [
          "!requiretty",
          "!env_reset"
        ]
      }
    },
    "aliases": {
      "cmnd": {
        "shutdown_development": [
          "/sbin/poweroff",
          "/sbin/reboot",
          "/sbin/halt"
        ],
        "printing_development": [
          "/usr/sbin/lpc",
          "/usr/sbin/lprm"
        ]
      },
      "user": {
        "admins_development": [
          "%admin",
          "%whell"
        ],
        "users_development": [
          "robert",
          "roland"
        ]
      },
      "runas": {
        "root_development": [
          "#0"
        ],
        "admins_development": [
          "%admin",
          "root"
        ]
      },
      "host": {
        "servers_development": [
          "192.168.0.1",
          "192.168.0.2",
          "server1"
        ],
        "network_development": [
          "192.168.0.0/255.255.255.0"
        ],
        "workstations_development": [
          "NETWORK",
          "!SERVER"
        ]
      }
    },
    "groups": {
      "wheel_development_all": {
        "group": "wheel_development",
        "host": "ALL",
        "operator": "ALL",
        "tag": "nopasswd",
        "command": [
          "ALL"
        ]
      },
      "ressl_development_ls-cat": {
        "group": "ressl_development",
        "host": "ALL",
        "operator": "ALL",
        "tag": null,
        "command": [
          "/bin/ls",
          "/bin/cat"
        ]
      }
    },
    "users": {
      "wheel_development_all": {
        "user": "wheel_development",
        "host": "ALL",
        "operator": "ALL",
        "tag": "nopasswd",
        "command": [
          "ALL"
        ]
      },
      "robert_ressl_development_ls-cat": {
        "user": "robert_ressl_development",
        "host": "ALL",
        "operator": "ALL",
        "tag": null,
        "command": [
          "/bin/ls",
          "/bin/cat"
        ]
      }
    }
  }
}
```

### extra item

You can define specific items for a group of nodes or only one.

#### example extra item

##### without environments

```
{
  "id": "example",
  "groups": {
    "example_wheel_all": {
      "group": "example_wheel",
      "host": "ALL",
      "operator": "ALL",
      "tag": "nopasswd",
      "command": [
        "ALL"
      ]
    },
    "example_ressl_ls-cat": {
      "group": "example_ressl",
      "host": "ALL",
      "operator": "ALL",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    }
  },
  "users": {
    "example_wheel_all": {
      "user": "example_wheel",
      "host": "ALL",
      "operator": "ALL",
      "tag": "nopasswd",
      "command": [
        "ALL"
      ]
    },
    "example_robert_ressl_ls-cat": {
      "user": "example_robert_ressl",
      "host": "ALL",
      "operator": "ALL",
      "tag": null,
      "command": [
        "/bin/ls",
        "/bin/cat"
      ]
    },
    "example_robert_ressl_who": {
      "user": "example_robert_ressl",
      "host": "ALL",
      "operator": "ALL",
      "tag": null,
      "command": [
        "/usr/bin/who"
      ]
    }
  }
}
```

##### with environments

```
{
  "id": "example3",
  "production": {},
  "staging": {},
  "testing": {},
  "integration": {},
  "development": {
    "groups": {
      "example3_development_wheel_all": {
        "group": "example3_development_wheel",
        "host": "ALL",
        "operator": "ALL",
        "tag": "nopasswd",
        "command": [
          "ALL"
        ]
      },
      "example3_development_ressl_ls-cat": {
        "group": "example3_development_ressl",
        "host": "ALL",
        "operator": "ALL",
        "tag": null,
        "command": [
          "/bin/ls",
          "/bin/cat"
        ]
      }
    },
    "users": {
      "example3_development_wheel_all": {
        "user": "example3_development_wheel",
        "host": "ALL",
        "operator": "ALL",
        "tag": "nopasswd",
        "command": [
          "ALL"
        ]
      },
      "example3_development_robert_ressl_ls-cat": {
        "user": "example3_development_robert_ressl",
        "host": "ALL",
        "operator": "ALL",
        "tag": null,
        "command": [
          "/bin/ls",
          "/bin/cat"
        ]
      }
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

