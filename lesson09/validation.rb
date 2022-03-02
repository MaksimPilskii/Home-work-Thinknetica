module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end
    
    def validate(name, type, *options)
      validations << { name: name, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |value|
        validation = "validate_#{value[:type]}"
        option = value[:options]
        value = instance_variable_get("@#{value[:name]}".to_sym)
        send(validation, value, *option)
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    private

    def validate_presence(value)
      raise 'The string cannot be empty' if value.nil? || value.strip.empty?
    end

    def validate_format(value, format)
      raise 'Number has invalid format' if value.nil? || value !~ format
    end

    def validate_type(value, type)
      raise 'invalid data type specified' unless value.is_a?(type)
    end
  end
end
