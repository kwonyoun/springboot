package com.example.back.controller;

import okhttp3.*;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImportController {

    String impKey = "6510774276607636"; // 아임포트 인증키를 입력해 주세요.
  String impSecret = "hzGO6aM6m3xfCHWeXIUmOHf0gPbIjUtLF1lU9Otr48iYpF9DeZWSyLXiqZYYxb5ZpsTtQa1RWMLGgOnn"; // 아임포트 시크릿키를 입력해 주세요.
  String url = "https://api.iamport.kr/users/getToken";
  String accessToken= "";

  public ImportController() {
    
    OkHttpClient client = new OkHttpClient().newBuilder().build();
    MediaType mediaType = MediaType.parse("application/json");
    RequestBody body = RequestBody.create(mediaType, "{\"imp_key\":\""+impKey+"\",\"imp_secret\":\""+impSecret+"\"}");
    Request request = new Request.Builder()
        .url(url)
        .method("POST", body)
        .addHeader("Content-Type", "application/json")
        .build();
    try {
            Response response = client.newCall(request).execute();
            String responseData = response.body().string();

            // JSON 텍스트를 파싱
            JSONObject json = new JSONObject(responseData);

            // JSON 객체에서 access_token 값을 가져옴
            accessToken = json.getJSONObject("response").getString("access_token");

            System.out.println(accessToken); // access_token 값 출력

            //list전체값을 받으려면
        // responseData = response.body().string();
        // System.out.println(responseData); // 인증 토큰이 담긴 JSON 데이터가 출력됩니다.
    } catch (IOException e) {
        e.printStackTrace();
    }
  }

    @GetMapping("/tests")
    public String callApiWithJson() {
    StringBuffer result = new StringBuffer();
        String jsonPrintString = null;

        try {
            String apiUrl = "https://api.iamport.kr/payments/status/all?limit=20&sorting=-started&_token="+accessToken;

            URL url = new URL(apiUrl);

            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.connect();
            BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));


            String returnLine;
            while((returnLine = bufferedReader.readLine()) != null) {
                result.append(returnLine);
            }
            jsonPrintString = result.toString();


        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonPrintString;
    }
    
}
