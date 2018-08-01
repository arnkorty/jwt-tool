require 'jwt'
require 'json'
require 'securerandom'
require 'openssl'


$verify_options = {
  verify_expiration: true,
  verify_not_before: true,
  verify_iss: false,
  verify_iat: true,
  verify_jti: true,
  aud: ["picoex"],
  verify_aud: true,
  sub: "session",
  verify_sub: true,
  algorithms: ["RS256"],
  iat_leeway: 180
}

def decode public_key_file, token
  unless File.exists? public_key_file 
    puts "公钥文件不存在"
    exit
  end
  jwt_key =  OpenSSL::PKey.read(File.read(public_key_file))
  decode = JWT.decode(token, jwt_key, true, $verify_options)
  puts "解密信息"
  puts decode
end


decode ARGV[0], ARGV[1]
