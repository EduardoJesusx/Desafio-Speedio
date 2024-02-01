require 'selenium-webdriver'
class ScraperService
    def get_web_data(url)

        host_url = extract_domain(url)

        driver = Selenium::WebDriver.for :chrome
        driver.get('https://www.similarweb.com/website/'+ host_url) 
        driver.manage.timeouts.implicit_wait = 50

        html_class_mapping = {
            information: {
                title: "wa-rank-list__title",
                value: "wa-rank-list__value"
            },
            ranking: {
                title: "wa-rank-list__title",
                value: "wa-rank-list__value"
            },
            target_audience: "wa-interests__chart-item",
            other_visits: "wa-interests__websites-item-title",
            top_topics: "wa-interests__chart-item-text",
            technologies: "wa-technologies__card-technology-title",
            overview: {
                title: "app-company-info__list-item--title",
                value: "app-company-info__list-item--value"
            },
            engagement: {
                title: "engagement-list__item-name",
                value: "engagement-list__item-value"
            },
            demographics_gender: {
                title: "wa-demographics__gender-legend-item-title",
                value: "wa-demographics__gender-legend-item-value"
            },
            age_distribution: {
                title: "wa-traffic-source-label__title",
                value: "wa-traffic-sources__channels-data-label"
            },
            
            web_traffic: {
                title: "wa-geography__country-name",
                value: "wa-geography__country-traffic-value"
            },
            
            top_keywords: {
                title: "wa-vectors-list__item-title",
                value: "wa-vectors-list__item-value"
            },
            category_distribution: {
                title: "wa-category-distribution__item-title",
                value: "wa-category-distribution__progress"
            },
            top_refearls: {
                title: "wa-vectors-list__item-title",
                value: "wa-vectors-list__item-value"
            }

        }
        begin
            raw_data = {}
            raw_data[:url] = url
            html_class_mapping.each do |data|
                unless data&&data[1].kind_of?(String)
                    formatted_data = {}
                    class_names = data.last.values
                    title_elements = driver.find_elements(:class, data.last[:title])
                    value_elements = driver.find_elements(:class, data.last[:value])

                    array_identificator = 0
                    value_elements.each do |element|
                        data_title = title_elements[array_identificator].text
                        formatted_data[data_title] = element.text
                        array_identificator+=1
                    end
                    raw_data[data.first.to_s] = formatted_data
                else              
                    isolated_elements = driver.find_elements(:class, data[1])
                    
                    formatted_data = []
                    isolated_elements.each do |element|          
                        formatted_data.push(element.text)
                    end
                    raw_data[data[0].to_s] = formatted_data
                end
            end
        rescue Selenium::WebDriver::Error::NoSuchElementError => e
            puts "Erro: Elemento não encontrado - #{e.message}"
        rescue Selenium::WebDriver::Error::WebDriverError => e
            puts "Erro WebDriver: #{e.message}"
        rescue => e
            puts "Erro desconhecido: #{e.message}"
        end

        print raw_data
        driver.quit
        return raw_data
    end

    private

    def extract_domain(url)
        uri = URI.parse(url)
        host = uri.host.downcase if uri.host
      
        if host.start_with?('www.')
          return host[4..-1]
        else
          return host
        end
    end
end
