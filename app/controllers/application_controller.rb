class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :resolve_layout

  private

  def resolve_layout
    case action_name
    when "detail", "list", "about"
	"detail"
    end
  end
end
