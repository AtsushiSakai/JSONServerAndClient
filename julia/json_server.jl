#
# JSON Server with julia
#
# author: Atsushi Sakai
#

using HttpServer
using JSON

function response_json(req)
	println("json requested!!")

	# Parse input json 
    jreq=JSON.parse(String(req.data))
	println("request:")
	println(jreq)

    jres = Dict("title"=>"Julia JSON server", "PI" => pi)
    jres["time"] = Dates.format(Dates.now(), "yyyymmddHHMMSS")
	println("response:")
	println(jres)

    return JSON.json(jres)
end


function main()
    println(PROGRAM_FILE," start!!")

    http = HttpHandler() do req::Request, res::Response
        Response(response_json(req))
    end

    server = Server(http)
    host = IPv4(127,0,0,1) # localhost
    port = 8000
    run(server, host=host, port=port)
    println("serving at port", port)

    println(PROGRAM_FILE," Done!!")
end

main()

