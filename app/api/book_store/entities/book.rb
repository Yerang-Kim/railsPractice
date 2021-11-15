module BookStore
    module Entities
        class Book < Grape::Entity
            expose :isbn
            expose :title
            expose :stock
            expose :flows, using: BookStore::Entities::Flow
        end
    end
end