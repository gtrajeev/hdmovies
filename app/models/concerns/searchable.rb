module Searchable
  extend ActiveSupport::Concern

  included do
    # require and include Elasticsearch libraries
    require 'elasticsearch/model'
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks


    # mapping do
    #   # ...
    # end
    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              type: :phrase,
              fields: ['name^10', 'plot']
            }
          },
          sort: [{ :name => :asc }]
        }
      )
    end
  end
end