require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  cipher = params['cipher']
  message = params['message']
  decrypt = params[:decrypt]

  caesar_says = message && cipher ? 'Caesar says: ' + run_cipher(message, cipher, decrypt) : 'Enter a message and a number to seed the encryption cipher.<br><br> Hail Caesar!'

  erb :index, locals: { message: caesar_says }
end

def run_cipher(message, cipher, decrypt, alphabet = [*'A'..'Z', *'a'..'z'])
  # Take the negative of the cipher value to decrypt if option selected
  cipher = decrypt ? -cipher.to_i : cipher.to_i
  # Run encryption using appropriate cipher value
  message.tr alphabet.join, alphabet.rotate(cipher).join
end