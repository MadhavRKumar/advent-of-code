dial = 50
answer = 0

for line in io.lines("input.txt") do
    direction = string.sub(line, 1,1)
    sign = 1
    if direction == "L" then
        sign = -1
    end

    value = tonumber(string.sub(line, 2,-1)) * sign
    dial = (dial+value) % 100

    if dial == 0 then
        answer = answer+1
    end
end

print(answer)

