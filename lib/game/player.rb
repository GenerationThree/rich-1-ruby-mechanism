class Player
  attr_reader :current_place
  attr_accessor :status

  def initialize
    @status = :wait_for_command
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

end
