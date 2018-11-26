#
# JSON client with Julia
#
# author: Atsushi Sakai
#

using HTTP
using JSON

function main()
	req = Dict("Name" => "julia json request")
	println("request:")
	println(req)

    # url = "http://localhost:8000"
    url = "http://192.168.86.29:8000"
  	r = HTTP.request("POST", url,
               ["Content-Type" => "application/json"],
               JSON.json(req))

    println("response:")
  	println(JSON.parse(String(r.body)))

    println(PROGRAM_FILE," Done!!")
end

main()

