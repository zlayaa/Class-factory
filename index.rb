require_relative 'factory'

Customer = Factory.new(:name, :address, :zip)

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 12345)

p joe.name
p joe['name']
p joe[:name]
p joe[0]

Client = Factory.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

p Client.new('Dave', '123 Main').greeting
p joe
