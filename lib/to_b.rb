# Adds a .to_b method to various classes to aide in testing
# for boolean values against variously typed objects.

class NilClass
  def to_b
    return nil
  end
end


class TrueClass
  def to_b
    return true
  end
end


class FalseClass
  def to_b
    return false
  end
end


class Fixnum
  def to_b
    case self
    when 1
      return true
    when 0
      return false
    else
      return nil
    end
  end
end


class String
  def to_b
    case self.downcase.strip
    when 'true', '1', 'T', 't'
      return true
    when 'false', '0', 'F', 'f'
      return false
    else
      return nil
    end
  end
end