class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def call
    raise NotImplementedError, "You must define `call` as instance method in #{self.class.name} class"
  end
end

class ServiceResponse
  attr_reader :payload, :errors

  def initialize(payload: nil, errors: [])
    @payload = payload
    @errors = Array(errors)
  end

  def fail?
    errors.present?
  end

  def success?
    !fail?
  end
end
