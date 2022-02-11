module CompanyName
  attr_accessor :company_name
end

module InstanceCounter 
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  
  module ClassMethods
    attr_accessor :instances

    def self.instances
      @instances ||= 0
    end
  end
  
  module InstanceMethods
    
    def count_instances
      self.class.instances += 1
    end
  end
end