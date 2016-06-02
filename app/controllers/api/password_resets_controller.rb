require 'token_authenticate_me/controllers/password_resetable'

class Api::PasswordResetsController < BaseAuthenticatedController
  include TokenAuthenticateMe::Controllers::PasswordResetable

end