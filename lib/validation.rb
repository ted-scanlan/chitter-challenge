require 'uri'

module EmailValidation

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def is_valid?(email)

  email =~ VALID_EMAIL_REGEX

end

end
