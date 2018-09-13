/*
 * JSON http clinet with java
 *
 * author Atsushi Sakai
 */

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

public class JSONServer {

    public static void main(String[] args) throws Exception {

    	System.out.println("JSON Server");
        HttpServer server = HttpServer.create(new InetSocketAddress(8000), 0);
        server.createContext("/", new MyHandler());
        server.setExecutor(null); // creates a default executor
        server.start();
    }

    static class MyHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
    		System.out.println("request");
			BufferedReader reader = new BufferedReader(new InputStreamReader(t.getRequestBody(), StandardCharsets.UTF_8));
			String line;
			while ((line = reader.readLine()) != null) {
				System.out.println(line);
			}

            String response = "{\"Name\":\"request_inline\"}";

			System.out.println("response");
    		System.out.println(response);

            t.sendResponseHeaders(200, response.length());//200 is ok in Http status
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

}
