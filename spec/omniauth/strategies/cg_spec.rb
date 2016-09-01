require 'spec_helper'

describe OmniAuth::Strategies::Cg do
  subject do
    OmniAuth::Strategies::Cg.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      subject.options.name.should eq('cg')
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://cloud.gov')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('/oauth/authorize')
    end
  end
end
