/*
 * JSON http clinet with java
 *
 * author Atsushi Sakai
 */

import JSONHttpLib.JSONRequest;
import JSONHttpLib.JSONParser;

import java.util.HashMap;
import java.util.Map;

public class JSONClient{
   public static void main(String[] args) throws Exception{
     System.out.println("Hello World!!");

     String strPostUrl = "http://localhost:8000";
     String JSON = "{\"Type\":\"JSON client with Java\", \"test\":12345}";

	 JSONHttpLib.JSONRequest jsonreq = new JSONHttpLib.JSONRequest();
     String res = jsonreq.callPost(strPostUrl, JSON);

		Map<String, Object> res_map = JSONHttpLib.JSONParser.ConvertjsonToMap(res);
		System.out.println(res_map);
	System.out.println(res_map.get("time"));
   }
}
