class BasePage
  extend Dry::Initializer

  option :page_number, proc(&:to_i), default: -> { 1 }
  option :page_size, proc(&:to_i), default: -> { 25 }

  private

  alias limit page_size

  def offset
    (page_number - 1) * page_size
  end
end
