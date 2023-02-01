mon = peripherial.find("monitor")
chat = peripherial.find("chatBox")
w,h = mon.getSize()

function centerText(text, line, txtback, txtcolor, pos)
    monX, monY = mon.getSize()
    mon.setBackgroundColor(txtback)
    mon.setTextColor(txtcolor)
    length = string.len(text)
    dif = math.floor(monX-length)
    x = math.floor(dif/2)

    if pos == "head" then
        mon.setCursorPos(x+1, line)
        mon.write(text)
    elseif pos == "left" then
        mon.setCursorPos(2, line)
        mon.write(text)
    elseif pos == "right" then
        mon.setCursorPos(monX-length, line)
        mon.write(text)
    end
end

function prepareMonitor()
    mon.setBackgroundColor(colors.black)
    mon.clear()
    mon.setTextScale(1)
    centerText(" Chat ", 2, colors.red, colors.white, "head")
end

function showChat()
    event, username, message = os.pullEvent("chat")
    centerText(username.. ":".. message, row, colors.black, colors.white, "left")
    row = row+1
end

while true do
    prepareMonitor()
    showChat()
end