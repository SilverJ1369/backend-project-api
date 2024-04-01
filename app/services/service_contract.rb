module ServiceContract
    def self.success(payload)
        OpenStruct.new({ success?: true, payload: payload, errors: nil })
    end

    def self.errors(errors)
        OpenStruct.new({ success?: false, payload: nil, errors: errors })
    end
end