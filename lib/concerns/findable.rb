<<<<<<< HEAD
module Concerns::Findable

=======
module Findable
>>>>>>> 223f273ed01702de9b52eea9c6f68bc4add6c06c

  def save
    @@all << self
  end

  def find_by_name(name)
    self.all.detect {|instance| instance.name == name}
  end

  def create(name)
    instance = self.new(name)
    instance.save
    instance
  end

  def find_or_create_by_name(name)
    find_by_name(name) == nil ? create(name) : find_by_name(name)
  end


end
