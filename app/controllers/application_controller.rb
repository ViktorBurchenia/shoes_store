class ApplicationController < ActionController::API
  include GraphqlDevise::SetUserByToken
end
