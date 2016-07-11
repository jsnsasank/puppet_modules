require 'spec_helper'
describe 'pashaApache' do

  context 'with defaults for all parameters' do
    it { should contain_class('pashaApache') }
  end
end
