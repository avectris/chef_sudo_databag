# Chef sudo_databag Cookbook

This file is used to list changes made in each version of the Chef sudo_databag Cookbook.

## v1.3.1 (21.11.2018)

- fix bug in sudo_defaults; only load data in environment

## v1.3.0 (12.11.2018)

-  support for multiple commands setting per user
-  support for multiple commands setting per group

## v1.2.4 (29.10.2018)

- fix group for aix for include_sudoers_d directory

## v1.2.3 (29.10.2018)

- fix nil handling for reject
- add nil handling for select

## v1.2.1 (29.10.2018)

- add nil handling for reject

## v1.2.0 (29.10.2018)

- add support for user defaults

## v1.1.4 (23.10.2018)

- create /etc/sudoers.d when include_sudoers_d is true

## v1.1.3 (09.10.2018)

- fix the problem if no item is define basic will not load

## v1.1.2 (09.10.2018)

- remove include directory if not using it

## v1.1.1 (26.09.2018)

- fix upcase operator

## v1.1.0 (26.09.2018)

- add aix support

## v1.0.1 (18.09.2018)

- fix problem if item is not defined

## v1.0.0

- first stable release
- add environment support

## v0.2.0

- first release

## v0.1.0

- Initial release for sudo_databag Cookbook
