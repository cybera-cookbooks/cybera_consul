require 'spec_helper'

describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
end

describe port(80) do
    it { should be_listening }
end

describe command('wget -qO- localhost/ui') do
  its(:exit_status) { should eq 0 }
end
