require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'goaccess' do

  let(:title) { 'goaccess' }
  let(:node) { 'rspec.renanvicente.com' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test minimal installation' do
    it { should contain_package('goaccess').with_ensure('present') }
  end

  describe 'Test installation of a specific version' do
    let(:params) { {:version => '0.7.1' } }
    it { should contain_package('goaccess').with_ensure('0.7.1') }
  end

  describe 'Test decommissioning - absent' do
    let(:params) { {:absent => true } }
    it 'should remove Package[goaccess]' do should contain_package('goaccess').with_ensure('absent') end 
  end

  describe 'Test noops mode' do
    let(:params) { {:noops => true} }
    it { should contain_package('goaccess').with_noop('true') }
  end

end
