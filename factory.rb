class Factory
  def self.new(*args, &block)
  Class.new do
  
  attr_accessor(*args)

  define_method :initialize do |*val|
    args.each.with_index do |value, index|
      self.instance_variable_set("@#{value}", val[index])
    end
  end

  define_method :[] do |value|
    if (value.is_a?(Symbol)) || (value.is_a?(String))
      instance_variable_get("@#{value}")
    elsif value.is_a?(Integer)
      instance_variable_get(instance_variables[value])
    end
  end

  define_method :[]= do |entity, value|
    if entity.is_a?(String) || entity.instance_of?(Symbol)
      instance_variable_set("@#{entity}", value)
    else 
      return raise NameError, "No member @#{entity} in struct"
    end
  end

  class_eval &block if block_given? # block.call if block_given?
  end
  end 
end
