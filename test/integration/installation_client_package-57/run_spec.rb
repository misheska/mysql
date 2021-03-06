def mysql_cmd
  '/usr/bin/mysql --version'
end

describe command(mysql_cmd) do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/Distrib 5.7/) }
end

describe command('ldconfig -p | grep -q "libmysqlclient.so$"') do
  its(:exit_status) { should eq 0 }
end

describe file('/usr/include/mysql/mysql.h') do
  it { should exist }
end
