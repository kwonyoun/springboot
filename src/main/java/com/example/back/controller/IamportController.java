// package com.example.back.controller;

// import java.io.BufferedInputStream;
// import java.io.BufferedReader;
// import java.io.InputStreamReader;
// import java.io.OutputStream;
// import java.net.HttpURLConnection;
// import java.net.URL;

// import org.apache.tomcat.util.json.JSONParser;
// import org.json.JSONObject;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RestController;

// import com.siot.IamportRestClient.IamportClient;

// import jakarta.servlet.http.HttpServletRequest;
// import jakarta.servlet.http.HttpServletResponse;

// @RestController
// public class IamportController {

//     private IamportClient api;
	
// 	public IamportController(){		
// 		//토큰 발급
// 		this.api = new IamportClient("6510774276607636","hzGO6aM6m3xfCHWeXIUmOHf0gPbIjUtLF1lU9Otr48iYpF9DeZWSyLXiqZYYxb5ZpsTtQa1RWMLGgOnn");
			
// 	}


//     @GetMapping("/tests")
//     public String getToken(HttpServletRequest request,HttpServletResponse response, JSONObject json ,String requestURL) throws Exception{

//     // requestURL 아임퐅크 고유키, 시크릿 키 정보를 포함하는 url 정보 

//     String _token = "";

//     try{

//         String requestString = "";

//         URL url = new URL(requestURL);

//         HttpURLConnection connection = (HttpURLConnection) url.openConnection();

//         connection.setDoOutput(true);

//         connection.setInstanceFollowRedirects(false);

//         connection.setRequestMethod("POST");

//         connection.setRequestProperty("Content-Type", "application/json");

//         OutputStream os= connection.getOutputStream();

//         os.write(json.toString().getBytes());

//         connection.connect();

//         StringBuilder sb = new StringBuilder();

//         if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {

//         BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));

//         String line = null;

//         while ((line = br.readLine()) != null) {

//         sb.append(line + "\n");

//         }

//         br.close();

//         requestString = sb.toString();

//         }

//         os.flush();

//         connection.disconnect();

//         JSONParser jsonParser = new JSONParser();

//         JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

//         if((Long)jsonObj.get("code") == 0){

//         JSONObject getToken = (JSONObject) jsonObj.get("response");

//         System.out.println("getToken==>>"+getToken.get("access_token") );

//         _token = (String)getToken.get("access_token");

//         }

//     }catch(Exception e){

//         e.printStackTrace();

//         _token = "";

//     }

//         return _token;

//     }

    
// }
