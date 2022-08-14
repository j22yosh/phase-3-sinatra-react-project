class User <ActiveRecord::Base
    has_many :tasks

    def fullname
        "#{self.first_name} #{self.last_name}"
    end

    def tasks
        Task.where(user_id: self.id)
    end
end
