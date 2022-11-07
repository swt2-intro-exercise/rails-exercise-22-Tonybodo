class Author < ApplicationRecord
    validates :last_name, presence: true,
                          length: {minimum: 2}

    def name
        first_name + " " + last_name
    end
end
