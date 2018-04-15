require 'spec_helper'
describe 'defines' do
  context 'with default values for all parameters' do
    it { should contain_class('defines') }
  end
end
