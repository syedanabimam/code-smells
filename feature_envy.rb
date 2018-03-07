# BAD
# Order model
class Order
  def charge(user)
    if user.has_valid_credit_card?
      user.charge(total)
    else
      false
    end
  end
end

# GOOD
class User
  def charge(total)
    if has_valid_credit_card?
      payment_gateway.charge(credit_card,)
      true
    else
      false
    end
  end
end

class Order
  def charge(user)
    user.charge(total)
  end
end
