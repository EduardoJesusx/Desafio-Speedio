class ScrapersController < ApplicationController

  def get_info
    begin 
      query_result = Scraper.where(url: params[:url]).to_a

      if query_result.empty?
        render json: { error: "This data is not in the database" }, status: :not_found
      else
        render json: query_result.first.to_json, status: :ok
      end
    rescue
      render json: { error: "Erro interno no servidor" }, status: :internal_server_error
    end
  end

  def save_info
    begin
      old_scraper = Scraper.where(url: params[:url]).to_a
      result = scraper_service.get_web_data(params[:url])
      
      @scraper = Scraper.new(result)
          if @scraper.save
            if !old_scraper.empty?
              Scraper.find(old_scraper.first.id).destroy
            end
            render json:@scraper , status: :ok  
          else
            render json: { error: "It was not possible to collect this data" }, status: :unprocessable_entity
          end   
    rescue
      render json: { error: "Erro interno no servidor" }, status: :internal_server_error
    end
  end


  private

    def scraper_service
      @scraper_service ||= ScraperService.new
    end
end
