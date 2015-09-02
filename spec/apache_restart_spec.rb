require '/Users/robertf/Dropbox/Programming/Ruby/rspec_testing/lib/apache_restart'

RSpec.describe Restart do
  describe 'check' do
    it 'checks if httpd exists' do
      @results = false
      expect(Restart.new.check).to eq(false)
    end
  end

end
