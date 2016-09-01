require 'spec_helper'

describe OmniAuth::Strategies::Cg do
  subject do
    OmniAuth::Strategies::Cg.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('cloud.gov')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://cloud.gov')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/oauth/authorize')
    end
  end
end
