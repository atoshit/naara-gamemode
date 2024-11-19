RegisterCommand("memory", function(source, args, rawCommand)
    print(math.floor(collectgarbage("count")) ..' KB | '.. math.floor(collectgarbage("count") / 1024) ..' MB')
end, false)