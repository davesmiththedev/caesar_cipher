require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  cipher = params['cipher']
  message = params['message']
  decrypt = params[:decrypt]
  welcome_message = 'Enter a message and a number to seed the encryption cipher.<br><br> Hail Caesar!'

  caesar_says = message && cipher ? run_cipher(message, cipher, decrypt) : welcome_message

  erb :index, locals: { message: caesar_says }
end

def run_cipher(message, cipher, decrypt, alphabet = [*'A'..'Z', *'a'..'z'])
  # Take the negative of the cipher value to decrypt if option selected
  cipher = decrypt ? -cipher.to_i : cipher.to_i
  # Run encryption using appropriate cipher value and return the result
  'Caesar says: ' + (message.tr alphabet.join, alphabet.rotate(cipher).join)
end
