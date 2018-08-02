## 安装
```sh
gem install bundler
bundle # 当前目录
```
## 生成jwt token
`ruby encode.rb "私钥路径" "加密信息,json格式"`

例子

`ruby encode.rb "/Users/jwt/jwt.pem" "{\"email\": \"exmaple@ff.com\", \"state\": \"active\", \"uid\": \"fdiosjfosijf234\", \"level\": 3}"`

`{"email"=>"exmaple@ff.com", "state"=>"active", "uid"=>"fdiosjfosijf234", "level"=>3, :iat=>1533131591, :exp=>1533132191, :jti=>"08198f36-234a-4398-a85f-d6ac5954ebed", :sub=>"session", :iss=>"barong", :aud=>["picoex"]}
加密信息
eyJhbGciOiJSUzI1NiJ9.eyJlbWFpbCI6ImV4bWFwbGVAZmYuY29tIiwic3RhdGUiOiJhY3RpdmUiLCJ1aWQiOiJmZGlvc2pmb3NpamYyMzQiLCJsZXZlbCI6MywiaWF0IjoxNTMzMTMxNTkxLCJleHAiOjE1MzMxMzIxOTEsImp0aSI6IjA4MTk4ZjM2LTIzNGEtNDM5OC1hODVmLWQ2YWM1OTU0ZWJlZCIsInN1YiI6InNlc3Npb24iLCJpc3MiOiJiYXJvbmciLCJhdWQiOlsicGljb2V4Il19.Wh662QAbBq10sUwBCbwMvyojRuIsLJoRLxUM9Y91QVhtAtK99a2eboX6rmcMRkSBmPia-EZ5l-lKTEkVLXQkrG_cAcfUOQoZB7PAkdwoWHl2IHC5GNl_PDMDWeGfPQCndE6j1rWHsG692cx9JIU3-0cDd7-iIVM8xPFsrlgH0aoUKOqClxGWLI5VPhzVtnTPFT1R1G0RvU9mBSQRZuCjh2zaqnf33L_fq21gWwZFP0KB9Ojlu8cgfhTFyoXsORVaYDEeRMXf47kTLCCTz8RVltMpPnsIABdn0aQKdJb63ULJtwolUjikoDy8G9HKdDXi4hDE1gpUvaQIanb5NnJ45Q`

## jwt 解码
`ruby decode.rb "公钥路径" "token"`

例子
`ruby decode.rb "/Users/jwt/jwt-pub.pem" "eyJhbGciOiJSUzI1NiJ9.eyJlbWFpbCI6ImV4bWFwbGVAZmYuY29tIiwic3RhdGUiOiJhY3RpdmUiLCJ1aWQiOiJmZGlvc2pmb3NpamYyMzQiLCJsZXZlbCI6MywiaWF0IjoxNTMzMTMxNTkxLCJleHAiOjE1MzMxMzIxOTEsImp0aSI6IjA4MTk4ZjM2LTIzNGEtNDM5OC1hODVmLWQ2YWM1OTU0ZWJlZCIsInN1YiI6InNlc3Npb24iLCJpc3MiOiJiYXJvbmciLCJhdWQiOlsicGljb2V4Il19.Wh662QAbBq10sUwBCbwMvyojRuIsLJoRLxUM9Y91QVhtAtK99a2eboX6rmcMRkSBmPia-EZ5l-lKTEkVLXQkrG_cAcfUOQoZB7PAkdwoWHl2IHC5GNl_PDMDWeGfPQCndE6j1rWHsG692cx9JIU3-0cDd7-iIVM8xPFsrlgH0aoUKOqClxGWLI5VPhzVtnTPFT1R1G0RvU9mBSQRZuCjh2zaqnf33L_fq21gWwZFP0KB9Ojlu8cgfhTFyoXsORVaYDEeRMXf47kTLCCTz8RVltMpPnsIABdn0aQKdJb63ULJtwolUjikoDy8G9HKdDXi4hDE1gpUvaQIanb5NnJ45Q"`

`解密信息
{"email"=>"exmaple@ff.com", "state"=>"active", "uid"=>"fdiosjfosijf234", "level"=>3, "iat"=>1533131591, "exp"=>1533132191, "jti"=>"08198f36-234a-4398-a85f-d6ac5954ebed", "sub"=>"session", "iss"=>"barong", "aud"=>["picoex"]}
{"alg"=>"RS256"}`

## 使用 
curl
``` sh
curl -X GET \
  http://ec2-54-251-186-164.ap-southeast-1.compute.amazonaws.com/api/v2/tickers \
  -H 'authorization: Bearer eyJhbGciOiJSUzI1NiJ9.eyJlbWFpbCI6ImV4bWFwbGVAZmYuY29tIiwic3RhdGUiOiJhY3RpdmUiLCJ1aWQiOiJmZGlvc2pmb3NpamYyMzQiLCJsZXZlbCI6MywiaWF0IjoxNTMzMTMxNTkxLCJleHAiOjE1MzMxMzIxOTEsImp0aSI6IjA4MTk4ZjM2LTIzNGEtNDM5OC1hODVmLWQ2YWM1OTU0ZWJlZCIsInN1YiI6InNlc3Npb24iLCJpc3MiOiJiYXJvbmciLCJhdWQiOlsicGljb2V4Il19.Wh662QAbBq10sUwBCbwMvyojRuIsLJoRLxUM9Y91QVhtAtK99a2eboX6rmcMRkSBmPia-EZ5l-lKTEkVLXQkrG_cAcfUOQoZB7PAkdwoWHl2IHC5GNl_PDMDWeGfPQCndE6j1rWHsG692cx9JIU3-0cDd7-iIVM8xPFsrlgH0aoUKOqClxGWLI5VPhzVtnTPFT1R1G0RvU9mBSQRZuCjh2zaqnf33L_fq21gWwZFP0KB9Ojlu8cgfhTFyoXsORVaYDEeRMXf47kTLCCTz8RVltMpPnsIABdn0aQKdJb63ULJtwolUjikoDy8G9HKdDXi4hDE1gpUvaQIanb5NnJ45Q'
```
java
```java
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
  .url("http://ec2-54-251-186-164.ap-southeast-1.compute.amazonaws.com/api/v2/tickers")
  .get()
  .addHeader("authorization", "Bearer eyJhbGciOiJSUzI1NiJ9.eyJlbWFpbCI6ImV4bWFwbGVAZmYuY29tIiwic3RhdGUiOiJhY3RpdmUiLCJ1aWQiOiJmZGlvc2pmb3NpamYyMzQiLCJsZXZlbCI6MywiaWF0IjoxNTMzMTMxNTkxLCJleHAiOjE1MzMxMzIxOTEsImp0aSI6IjA4MTk4ZjM2LTIzNGEtNDM5OC1hODVmLWQ2YWM1OTU0ZWJlZCIsInN1YiI6InNlc3Npb24iLCJpc3MiOiJiYXJvbmciLCJhdWQiOlsicGljb2V4Il19.Wh662QAbBq10sUwBCbwMvyojRuIsLJoRLxUM9Y91QVhtAtK99a2eboX6rmcMRkSBmPia-EZ5l-lKTEkVLXQkrG_cAcfUOQoZB7PAkdwoWHl2IHC5GNl_PDMDWeGfPQCndE6j1rWHsG692cx9JIU3-0cDd7-iIVM8xPFsrlgH0aoUKOqClxGWLI5VPhzVtnTPFT1R1G0RvU9mBSQRZuCjh2zaqnf33L_fq21gWwZFP0KB9Ojlu8cgfhTFyoXsORVaYDEeRMXf47kTLCCTz8RVltMpPnsIABdn0aQKdJb63ULJtwolUjikoDy8G9HKdDXi4hDE1gpUvaQIanb5NnJ45Q")
  .addHeader("cache-control", "no-cache")
  .addHeader("postman-token", "7200c217-4503-9b0e-4d9f-9b24e46e90c1")
  .build();

Response response = client.newCall(request).execute();
```

