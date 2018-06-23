#
# JSON Server in Julia
#
# author: Atsushi Sakai
#

module json_server

using HttpServer
using JSON

function response_json()
    println("json requested!!")
    json = Dict("title"=>"Julia JSON server", "PI" => pi)
    json["time"] = Dates.format(Dates.now(), "yyyymmddHHMMSS")

    return JSON.json(json)
end


function main()
    println(PROGRAM_FILE," start!!")

    http = HttpHandler() do req::Request, res::Response
        Response(response_json())
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

end # module

