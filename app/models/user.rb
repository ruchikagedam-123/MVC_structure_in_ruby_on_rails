class User < ApplicationRecord
    def find_age
        "I am "+self.age.to_s+" old"
    end
end
