# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*methods)
    methods.each do |method|
      var_name = "@#{method}".to_sym
      history_name = "@#{method}_history"
      define_method(method) { instance_variable_get(var_name) }
      define_method("#{method}=".to_sym) { |value| instance_variable_set(var_name, value) }
      define_method("#{method}_history") { instance_variable_get(history_name) }

      define_method("#{method}=") do |value|
        instance_variable_set(history_name, []) if instance_variable_get(history_name).nil?
        instance_variable_set(history_name, instance_variable_get(history_name) << value)
      end
    end
  end

  def strong_attr_accessor(name, type)
    define_method(name) { instance_variable_get("@#{name}") }
    define_method("#{name}=") do |value|
      unless type_name = name.class.to_s == type.capitalize
        raise TypeError,
              'The variable class is specified incorrectly'
      end

      instance_variable_set("@#{name}", value)
    end
  end
end

