require 'spec_helper.rb'

describe service('consul') do
    it { should be_enabled }
    it { should be_running }
end

describe port(8301) do
    it { should be_listening }
end

describe port(8400) do
    it { should be_listening.on('127.0.0.1') }
end

describe port(8500) do
    it { should be_listening.on('127.0.0.1') }
end

describe port(8600) do
    it { should be_listening.on('127.0.0.1') }
end
