require 'spec_helper'
describe 'lab1' do

  context 'with defaults for all parameters' do
    it { should contain_class('lab1') }
  end
end
