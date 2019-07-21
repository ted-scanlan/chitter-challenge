require 'uri'
# require 'active_support/core_ext/object/blank'

module EmailValidation

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def is_valid?(email)
  # url=~ /\A#{URI::regexp(['http', 'https'])}\z/



  email =~ VALID_EMAIL_REGEX

  # email.match(URI::MailTo::EMAIL_REGEXP).present?


end

end
