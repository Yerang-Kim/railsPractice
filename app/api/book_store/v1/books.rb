module BookStore
    module V1
      class Books < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        resource :books do
          desc 'Return list of books'
          get do
            books = Book.all
            present books
          end
        end
      end
    end
end