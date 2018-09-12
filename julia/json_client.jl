#
# JSON client with Julia
#
# author: Atsushi Sakai
#

using Requests

function main()

	req = Dict("Name" => "julia json request")
	println("request:")
	println(req)

    url = "http://localhost:8000"
    res = Requests.json(Requests.post(url; json = req,
			   	))
    println("response:")
    println(res)

    println(PROGRAM_FILE," Done!!")
end

main()

