module BookStore
    module Entities
        class Flow < Grape::Entity
            expose :newStock
            expose :previousStock
        end
    end
end