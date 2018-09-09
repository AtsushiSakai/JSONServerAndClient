/*
 * JSON http clinet with java
 *
 * author Atsushi Sakai
 */

import JSONHttpLib.JSONRequest;

public class JSONClient{
   public static void main(String[] args){
     System.out.println("Hello World!!");

     String strPostUrl = "http://localhost:8000";
     String JSON = "{\"Type\":\"JSON client with Java\", \"test\":12345}";

	 JSONHttpLib.JSONRequest jsonreq = new JSONHttpLib.JSONRequest();
     String result = jsonreq.callPost(strPostUrl, JSON);
     System.out.println(result);
   }
}
