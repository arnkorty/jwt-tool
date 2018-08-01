
require 'jwt'
require 'json'
require 'securerandom'
require 'openssl'


# private_key_file => 私钥的路径
# payload jwt 的内容,json 格式
#   email: 必填
#  当iss == barong 时，以下项必填
#   uid: string, 唯一字符串
#   state:  string, active 或其他
#   level: integer, 1、2、3 其中一个
def encode(private_key_file, payload)
  payload = JSON.parse(payload)
  payload.merge!(
    iat: Time.now.to_i, # 当前时间(秒)
    exp: Time.now.to_i + 10 * 60, # 10分钟内有效
    jti: SecureRandom.uuid, # 唯一字符串
    sub: 'session', # 固定值
    iss: 'barong', # 字符串，当不为 barong 时，只查找系统是否这个用户，如果不存在会验证失败。
    aud: ['picoex'], # 固定值
  )
  unless File.exists? private_key_file
    puts "私钥文件不存在"
    exit
  end
  jwt_key =  OpenSSL::PKey.read(File.read(private_key_file))
  jwt_algorithm = 'RS256' # 加密算法
  puts payload
  puts "加密信息"
  puts JWT.encode payload, jwt_key, jwt_algorithm
end

encode ARGV[0], ARGV[1]


