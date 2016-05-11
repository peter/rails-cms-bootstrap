module NullifyParams
  def self.nullify!(params)
    params.each do |key, value|
      if value.is_a?(String) && value.blank?
        params[key] = nil
      elsif value.is_a?(Hash) || value.is_a?(ActionController::Parameters)
        nullify!(value)
      end
    end
  end
end
