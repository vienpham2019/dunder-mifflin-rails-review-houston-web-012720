class Employee < ApplicationRecord
    belongs_to :dog

    validates :title, uniqueness: true, if: not_me
    validates :alias, uniqueness: true, if: not_me


    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def valid_attribute?(attribute_name)
        self.valid?
        self.errors[attribute_name].blank?
    end

    private 
        def alias_uniq
            if self.class.pluck(:alias).include?(:alias)
                errors.add(:alias)
            end
        end

       

    
end
