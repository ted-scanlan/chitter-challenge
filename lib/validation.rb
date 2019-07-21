module UrlValidation

def is_valid?(url)   #do for email   . also need to make surte all boxes are filled before successful signup

  url=~ /\A#{URI::regexp(['http', 'https'])}\z/


end

end
