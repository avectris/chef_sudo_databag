describe file('/etc/sudoers') do
  it { should exist }
  its('mode') { should cmp '0440' }
end

describe file('/etc/sudoers') do
  its('content') { should match(/Defaults env_reset/) }
  its('content') { should match(%r{Defaults secure_path = "\/sbin:\/bin:\/usr\/sbin:\/usr\/bin"}) }
  its('content') { should match(/Defaults env_keep = "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY"/) }
  its('content') { should match(/Defaults:ressl_robert !requiretty/) }
  its('content') { should match(/Defaults:ressl_robert !env_reset/) }
  its('content') { should match(/Defaults:robert_ressl !requiretty/) }
  its('content') { should match(/Defaults:robert_ressl !env_reset/) }
end

describe file('/etc/sudoers') do
  its('content') { should match(%r{Cmnd_Alias SHUTDOWN = \/sbin\/poweroff, \/sbin\/reboot, \/sbin\/halt}) }
  its('content') { should match(/User_Alias ADMINS = %admin, %whell/) }
  its('content') { should match(/User_Alias USERS = robert, roland/) }
  its('content') { should match(/Runas_Alias ROOT = #0/) }
  its('content') { should match(/Runas_Alias ADMINS = %admin, root/) }
  its('content') { should match(/Host_Alias SERVERS = 192.168.0.1, 192.168.0.2, server1/) }
  its('content') { should match(%r{Host_Alias NETWORK = 192.168.0.0\/255.255.255.0}) }
  its('content') { should match(/Host_Alias WORKSTATIONS = NETWORK, !SERVER/) }
end

describe file('/etc/sudoers') do
  its('content') { should match(%r{robert_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(/wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(%r{\%ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(/\%wheel ALL=\(ALL\) NOPASSWD: ALL/) }
end

describe file('/etc/sudoers') do
  its('content') { should match(%r{example_robert_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(%r{example2_robert_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(%r{example3_development_robert_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(/example_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(/example2_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(/example3_development_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(%r{\%example_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(%r{\%example2_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(%r{\%example3_development_ressl ALL=\(ALL\) \/bin\/ls, \/bin\/cat}) }
  its('content') { should match(/\%example_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(/\%example2_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
  its('content') { should match(/\%example3_development_wheel ALL=\(ALL\) NOPASSWD: ALL/) }
end

describe file('/etc/sudoers') do
  its('content') { should match(%r{#includedir \/etc\/sudoers.d}) }
end
