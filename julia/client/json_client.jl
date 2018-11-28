#
# JSON client with Julia
#
# author: Atsushi Sakai
#

using HTTP
using JSON

function get_config()
    ip = "localhost" #default
    if haskey(ENV,"SERVER_IP")
        ip = ENV["SERVER_IP"] 
    end

	port = "8000" #default
    if haskey(ENV,"SERVER_PORT")
        port = ENV["SERVER_PORT"]
    end

    println("request to ip:", ip)
    println("request to port:", port)

    return ip, port
end

function main()
	req = Dict("Name" => "julia json request")
	println("request:")
	println(req)

    ip, port = get_config()

    url ="http://"*ip*":"*port
  	r = HTTP.request("POST", url,
               ["Content-Type" => "application/json"],
               JSON.json(req))

    println("response:")
  	println(JSON.parse(String(r.body)))

    println(PROGRAM_FILE," Done!!")
end

main()

