require_relative 'spec_helper'

RSpec.describe Restart do
  describe 'check' do
    it 'checks if httpd exists' do
      expect(Restart.new.check).to eq(false)
    end
  end

end
