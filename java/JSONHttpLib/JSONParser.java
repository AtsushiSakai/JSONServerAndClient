package JSONHttpLib;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class JSONParser {

	public static void main(String[] args) throws Exception {
		String json = "{ \"key1\" : \"val1\", \"key2\" : \"val2\", \"key3\" : { \"ckey1\" : \"cval1\", \"ckey2\" : [ \"cval2-1\", \"cval2-2\" ] } }";

		Map<String, Object> map = ConvertjsonToMap(json);

		System.out.println(map);
		//System.out.println((Map<String, Object>)map.get("key3"));

		Map<String, Object> map2 = (Map<String, Object>)map.get("key3");
		System.out.println(map2.get("ckey2"));
	}


	public static Map<String, Object> ConvertjsonToMap(String json) throws Exception {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("JavaScript");
		Object obj = engine.eval(String.format("(%s)", json ));

		Map<String, Object> map = jsonToMap(obj, engine.getClass().getName().equals("com.sun.script.javascript.RhinoScriptEngine"));

		return map;

	}

	static Map<String, Object> jsonToMap(Object obj, boolean rhino) throws Exception {
		boolean array = rhino ? Class.forName("sun.org.mozilla.javascript.internal.NativeArray").isInstance(obj) : false;
		Class scriptObjectClass = Class.forName(rhino ? "sun.org.mozilla.javascript.internal.Scriptable" : "jdk.nashorn.api.scripting.ScriptObjectMirror");
		Object[] keys = rhino ? (Object[])obj.getClass().getMethod("getIds").invoke(obj) : ((java.util.Set)obj.getClass().getMethod("keySet").invoke(obj)).toArray();
		Method method_get = array ? obj.getClass().getMethod("get", int.class, scriptObjectClass) : (rhino ? obj.getClass().getMethod("get", Class.forName("java.lang.String"), scriptObjectClass) : obj.getClass().getMethod("get", Class.forName("java.lang.Object")));
		Map<String, Object> map = new HashMap<String, Object>();
		for (Object key : keys) {
			Object val = array ? method_get.invoke(obj, (Integer)key, null) : (rhino ? method_get.invoke(obj, key.toString(), null) : method_get.invoke(obj, key));
			if (scriptObjectClass.isInstance(val)) {
				map.put(key.toString(), jsonToMap(val, rhino));
			} else {
				map.put(key.toString(), val.toString()); 
			}
		}
		return map;
	}
}

