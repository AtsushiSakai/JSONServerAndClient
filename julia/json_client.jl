#
# JSON client with Julia
#
# author: Atsushi Sakai
#

using Requests

function main()
    println(PROGRAM_FILE," start!!")

    url = "http://localhost:8000"
    json = Requests.json(Requests.get(url))
    println(json)

    println(PROGRAM_FILE," Done!!")
end


if length(PROGRAM_FILE)!=0 &&
    contains(@__FILE__, PROGRAM_FILE)
    @time main()
end

