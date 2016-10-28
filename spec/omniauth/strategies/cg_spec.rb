require 'spec_helper'

describe OmniAuth::Strategies::Cg do
  subject do
    OmniAuth::Strategies::Cg.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('cg')
    end

    # URL from https://docs.cloud.gov/apps/leveraging-authentication/
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://login.cloud.gov/oauth/authorize')
    end

    # URL from https://docs.cloud.gov/apps/leveraging-authentication/
    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://uaa.cloud.gov/oauth/token')
    end
  end
end
