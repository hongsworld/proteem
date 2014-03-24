class ApplicationController < ActionController::Base
  #protect_from_forgery
  layout :resolve_layout

  private

  def resolve_layout
    case action_name
    when "detail", "list", "about","list_searched"
	"detail"
    end
  end
end
