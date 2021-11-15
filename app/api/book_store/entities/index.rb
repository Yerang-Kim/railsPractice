module BookStore
    module Entities
        class Index < Grape::Entity
            expose :id
            expose :isbn
            expose :title
            expose :stock
        end
    end
end