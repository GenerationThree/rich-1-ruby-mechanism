class Player
  attr_reader :current_place, :balance, :lands
  attr_accessor :status

  def initialize *args
    unless args.empty?
      hash = args[-1]
      hash.each do |k, v|
        instance_variable_set("@#{k}", v)
      end
    end
    @status ||= :wait_for_command
    @lands = []
  end

  def execute(command)
    @last_executed = command
    @status = command.execute(self)
  end

  def respond(response)
    @status = @last_executed.execute_with(response)
  end

  def move_to(target)
    @current_place = target
  end

  def buy(land)
    if (balance >= land.price && land.owner.nil?)
      @lands << land
      @balance -= land.price
      land.owner = self
      true
    else
      false
    end
  end

  def upgrade(land)
    if (balance >= land.price && land.owner == self)
      land.upgrade
      @balance -= land.price
      true
    else
      false
    end
  end

end
