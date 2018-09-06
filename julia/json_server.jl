#
# JSON Server
#
# author: Atsushi Sakai
#

using HttpServer
using JSON

if VERSION > v"0.7-"
	using Test
	const __MAIN__ =  length(PROGRAM_FILE)!=0 && occursin(PROGRAM_FILE, @__FILE__)
else
	using Base.Test
	const __MAIN__ = length(PROGRAM_FILE)!=0 && contains(@__FILE__, PROGRAM_FILE)
end


function response_json(req)
	println("json requested!!")
    json = Dict("title"=>"Julia JSON server", "PI" => pi)
    json["time"] = Dates.format(Dates.now(), "yyyymmddHHMMSS")
    sleep(5.0)

    return JSON.json(jd)
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

if __MAIN__
    main()
end

