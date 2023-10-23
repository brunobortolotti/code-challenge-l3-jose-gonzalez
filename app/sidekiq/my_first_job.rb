class MyFirstJob
  include Sidekiq::Job

  def perform(name, age)
    puts "I am #{name}, #{age} years old"
  end
end
