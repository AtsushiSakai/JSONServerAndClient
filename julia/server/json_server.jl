#
# JSON Server with julia
#
# author: Atsushi Sakai
#

using HTTP
using JSON
using Dates

function show_http_request(http)
	@show http.message
	@show HTTP.header(http, "Content-Type")
	while !eof(http)
		println("body data: ", String(readavailable(http)))
	end
end

function get_config()
    ip = "0.0.0.0" #default
    if haskey(ENV,"SERVER_IP")
        ip = ENV["SERVER_IP"] 
    end

	port = 8000 #default
    if haskey(ENV,"SERVER_PORT")
        port =parse(Int64, ENV["SERVER_PORT"])
    end

    println("serving at ip:", ip)
    println("serving at port:", port)

    return ip, port
end


function main()
    println(PROGRAM_FILE," start!!")

    ip, port = get_config()
    
	HTTP.listen(ip, port) do http::HTTP.Stream

		show_http_request(http)

		#response json
	    jdic = Dict("title"=>"Julia JSON server", "PI" => pi)
    	jdic["time"] = Dates.format(Dates.now(), "yyyymmddHHMMSS")

		write(http, JSON.json(jdic))
	end

    println(PROGRAM_FILE," Done!!")
end

main()

