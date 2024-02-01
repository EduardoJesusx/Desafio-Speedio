require 'rails_helper'

RSpec.describe ScrapersController, type: :controller do
    describe '#get_info' do
        it 'not_found when data is not in the database' do
            allow(Scraper).to receive(:where).and_return([])
            get :get_info, params: { url: 'a' }
            expect(response.status).to eql(404)
        end

        it 'success' do
            get :save_info, params: { url: 'https://www.google.com' }
            get :get_info, params: { url: 'https://www.google.com' }
            expect(response.status).to eql(200)
        end 

        it 'server_error' do
            allow(Scraper).to receive(:where).and_raise('Simuled internal error')
            get :get_info, params: { url: 'a' }
            expect(response.status).to eql(500)
        end 
    end

    describe '#save_info' do
        it 'success' do
            get :save_info, params: { url: 'https://www.google.com' }
            expect(response.status).to eql(200)
        end

        it 'server_error' do
            get :save_info, params: { url: 'a' }
            expect(response.status).to eql(500)
        end

        it 'can`t callect this data' do
            scraper_instance = instance_double(Scraper, save: false)
            allow(Scraper).to receive(:new).and_return(scraper_instance)
            get :save_info, params: { url: 'https://www.google.com' }
            expect(response.status).to eq(422)
        end
    end
end