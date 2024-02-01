require 'rails_helper'
require 'scraper_service'

RSpec.describe ScraperService do
    describe '#get_web_data' do
        let(:service) { ScraperService.new }
        url = 'https://www.google.com'

        it 'return host correct' do
            response = service.get_web_data(url)
            byebug
            expect(response).to eq(url)
        end

        it 'return host correct' do
            response = service.get_web_data('https://www..com')
            byebug
            expect(response[:information]).be_nil
        end
    end
end