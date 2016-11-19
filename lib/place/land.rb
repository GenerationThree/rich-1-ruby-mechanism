class Land < Place
  attr_reader :owner, :level
  def initialize(price)
    @price = price
  end

  def visit_by(player)
    if (owner.nil?)
      :wait_for_buy
    elsif (owner == player)
      :wait_for_upgrade
    else
      :end_turn
    end
  end

end
