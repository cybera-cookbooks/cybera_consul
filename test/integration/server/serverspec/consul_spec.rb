require 'spec_helper.rb'

describe port(8300) do
    it { should be_listening }
end

describe port(8302) do
    it { should be_listening }
end
