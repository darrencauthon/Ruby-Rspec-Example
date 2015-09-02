require_relative 'spec_helper'

describe Restart do

  describe 'check' do

    let(:restart) { Restart.new }

    describe "httpd does not exist" do

      before { File.stubs(:exist?).with('/etc/init.d/httpd').returns false }

      it 'should return false' do
        restart.check.must_equal false
      end

    end

    describe "httpd exists" do

      before { File.stubs(:exist?).with('/etc/init.d/httpd').returns true }

      it 'should return true' do
        restart.check.must_equal true
      end

    end

  end

end
