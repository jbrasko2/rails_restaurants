class TwoWordValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value.split(" ").length != 2
            record.errors.add(attribute, "must be exactly two words")
        end
    end
end