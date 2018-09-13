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

		Map<String, Object> data = new HashMap<String, Object>();
    	data.put( "Type", "JSON client with Java" );
    	data.put( "test", 12345 );

		String json = JSONHttpLib.JSONParser.ConvertMapToJson(data);
		System.out.println(json);

		JSONHttpLib.JSONRequest jsonreq = new JSONHttpLib.JSONRequest();
		String res = jsonreq.callPost(strPostUrl, json);

		Map<String, Object> res_map = JSONHttpLib.JSONParser.ConvertJsonToMap(res);
		System.out.println(res_map);
	}
}
