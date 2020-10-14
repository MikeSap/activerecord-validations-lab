class Post < ActiveRecord::Base


    validates :title, presence: true
    validates :content, length: {minimum:250} 
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbait, on: :create
    
    TITLES = [/Won't Believe/, /Secret/, /Top [0-9]*/,/Guess/]

    def clickbait
        if TITLES.none? {|pat| pat.match(self.title)}
            errors.add(:title, "must be clickbait")
        end
    end

end
