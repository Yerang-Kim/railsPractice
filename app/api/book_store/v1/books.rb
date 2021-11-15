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
            present books, with: BookStore::Entities::Index
          end

          desc 'Return a specific book'
          route_param :id do
            get do
              book = Book.find(params[:id])
              present book, with: BookStore::Entities::Book
            end

            desc 'Update a book'
            params do
              requires :book, type: Hash do
                requires :isbn, type: Integer, desc: 'ISBN.'
                requires :title, type: String, desc: 'Title.'
                requires :stock, type: Integer, desc: 'Stock.'
              end
            end
            put do
              @book = Book.find(params[:id])
              @book.update(params[:book])
            end

            desc 'Delete a book'
            delete do
              Book.find(params[:id]).destroy
            end

            resource :flows do
              desc 'Create a flow'
              params do
                requires :flow, type: Hash do
                  requires :newStock, type: Integer, desc: 'New Stock.'
                  requires :previousStock, type: Integer, desc: 'Previous Stock.'
                end
              end
              post do
                @book = Book.find(params[:id])
                @flow = Flow.new(params[:flow])
                @book.flows.create!(params[:flow])
                @book.update(stock: @flow.newStock)
              end
            end
          end
        end
      end
    end
end