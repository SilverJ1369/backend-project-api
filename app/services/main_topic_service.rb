module MainTopicService
    module Base
        def self.search_by_name(params)
            search_name = params[:search_name]
            begin
                filtered_main_topics = MainTopic.where("name LIKE ?", "%#{search_name}%")
            rescue ActiveRecord::RecordNotFound => e
                return ServiceContract.error(e.message) unless filtered_main_topics
            end
            ServiceContract.success(filtered_main_topics)

        end

        def self.search_by_year(params)
            search_year = params[:search_year]
            filtered_main_topics = MainTopic.where("? BETWEEN strftime('%Y', start_date) AND strftime('%Y', end_date)", search_year)
        end

        def self.search_by_category(params)
            search_category = params[:search_category]
            filtered_main_topics = MainTopic.joins(:category).where(categories: { name: search_category })
        end
    end
end