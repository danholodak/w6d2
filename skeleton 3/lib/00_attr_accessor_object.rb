require 'byebug'
class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do
          namestring = name.to_s
          namestring = '@' + namestring
          self.instance_variable_get(namestring)
      end
      define_method("#{name}=") do |arg|
        namestring = name.to_s
        namestring = '@' + namestring
        self.instance_variable_set(namestring.to_sym, arg)
      end
    end
  end
  
end
