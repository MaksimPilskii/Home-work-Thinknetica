module CompanyName
  def set_the_company_name(name)
    @company_name = name
  end

  def get_the_company_name
    @company_name
  end
end

module InstanceCounter 
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :instance
    
    def self.instance 
      @instances
    end
  end
  
protected

  module InstanceMethods
    def counting_instances
      self.class.instance ||= 0
      self.class.instance += 1
    end
  end
end