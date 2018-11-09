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

function main()
    println(PROGRAM_FILE," start!!")

	ip = "127.0.0.1"
	port = 8000
    println("serving at port", port)

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

