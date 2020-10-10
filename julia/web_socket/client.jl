"
 Web socket client sample 

 author: Atsushi Sakai
"

using HTTP

function main()
    println(PROGRAM_FILE, " start!!")

    HTTP.WebSockets.open("ws://127.0.0.1:8081") do ws
        write(ws, "Hello")

        while true
            x = readavailable(ws)
            @show x
            println(String(x))
        end
    end

    println(PROGRAM_FILE, " Done!!")
end

if abspath(PROGRAM_FILE) == @__FILE__
    @time main()
end




