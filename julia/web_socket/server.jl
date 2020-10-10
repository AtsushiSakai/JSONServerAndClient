"
 A Web socket server sample 

 author: Atsushi Sakai
"

using HTTP

function main()
    println(PROGRAM_FILE, " start!!")

    HTTP.WebSockets.listen("127.0.0.1", UInt16(8081)) do ws
        while !eof(ws)
            data = readavailable(ws)
            write(ws, data)
            println("request received!!")

            for i in 1:10
                println("Say hey")
                sleep(3)
                write(ws, "Hey")
            end
        end
    end

    println(PROGRAM_FILE, " Done!!")
end

if abspath(PROGRAM_FILE) == @__FILE__
    @time main()
end




