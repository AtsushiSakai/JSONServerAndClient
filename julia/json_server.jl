#
# JSON Server in Julia
#
# author: Atsushi Sakai
#

using HttpServer
using JSON

function main()
    println(PROGRAM_FILE," start!!")

    json = Dict("title"=>"Julia JSON server", "PI" => pi)
    json["time"] = Dates.format(Dates.now(), "yyyymmddHHMMSS")

    http = HttpHandler() do req::Request, res::Response
        Response(JSON.json(json))
    end

    server = Server(http)
    host = IPv4(127,0,0,1) # localhost
    port = 8000
    run(server, host=host, port=port)
    println("serving at port", port)

    println(PROGRAM_FILE," Done!!")
end


if length(PROGRAM_FILE)!=0 &&
    contains(@__FILE__, PROGRAM_FILE)
    @time main()
end

