if not term.getGraphicsMode then
    error("Cannot run in-game. Requires CraftOS-PC.", 0)
end
if term.getGraphicsMode() == 0 then
    printError("OS doesnt support graphics mode 1 or higher!")
end
local tCurrentFont

local gFont = {}
function gFont.select(tFont)
    if type(tFont) == "table" then
        tCurrentFont = tFont
        return true
    end
    printError("Invalid Font")
end

function gFont.getCharSizes()
    if type(tCurrentFont) == "table" then
        return tCurrentFont.size.x, tCurrentFont.size.y
    end
    return 0,0
end

function gFont.drawChar(nX, nY, sChar)
    sChar = tCurrentFont.chars[string.byte(sChar)]
    if type(sChar) ~= "table" then
        sChar = tCurrentFont.chars[063]
    end
    for y=1,tCurrentFont.size.y do
        for x=1,tCurrentFont.size.x do
            local pxColor = term.getBackgroundColor()
            if sChar[y]:sub(x,x) ==  '#' then
                pxColor = term.getTextColor()
            end
            term.setPixel(nX+x-1, nY+y-1, pxColor)
        end
    end
    return true
end

function gFont.write(nX, nY, sMsg)
    if type(tCurrentFont) ~= "table" then
        term.setGraphicsMode(0)
        return printError("No font selected")
    end if type(nX or nY) ~= "number" then
        term.setGraphicsMode(0)
        return printError("Invalid Argument #1/#2! Expected type \'number\'")
    end
    for i=1,#sMsg do
        gFont.drawChar(nX+(i-1)*tCurrentFont.size.x, nY, sMsg:sub(i,i))
    end
end

local tDefaultFont = { ["size"]={}, ["chars"]={} }
tDefaultFont.size = { ['x']=9, ['y']=9 }
tDefaultFont.chars = {
    [000] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [001] ={
    ".........",
    "..#####..",
    ".#.....#.",
    ".#.#.#.#.",
    ".#.....#.",
    ".#.###.#.",
    ".#..#..#.",
    "..#####..",
    "........."},
    [002] ={
    "#########",
    "##.....##",
    "#.#####.#",
    "#.#.#.#.#",
    "#.#####.#",
    "#.#...#.#",
    "#.##.##.#",
    "##.....##",
    "#########"},
    [003] ={
    ".........",
    ".........",
    "..##.##..",
    ".#######.",
    ".#######.",
    "..#####..",
    "...###...",
    "....#....",
    "........."},
    [004] ={
    ".........",
    "....#....",
    "...###...",
    "..#####..",
    ".#######.",
    "..#####..",
    "...###...",
    "....#....",
    "........."},
    [005] ={
    ".........",
    "....#....",
    "...###...",
    "..#.#.#..",
    ".#######.",
    "..#.#.#..",
    "....#....",
    "..#####..",
    "........."},
    [006] ={
    ".........",
    "...###...",
    "..#####..",
    ".#######.",
    ".#######.",
    ".##.#.##.",
    "....#....",
    "..#####..",
    "........."},
    [007] ={
    ".........",
    "...###...",
    "..#####..",
    ".#######.",
    ".#######.",
    ".#######.",
    "..#####..",
    "...###...",
    "........."},
    [008] ={
    "#########",
    "###...###",
    "##.....##",
    "#.......#",
    "#.......#",
    "#.......#",
    "##.....##",
    "###...###",
    "#########"},
    [009] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [010] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [011] ={
    ".........",
    "...###...",
    "..#####..",
    "....#....",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [012] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "....#....",
    "..#####..",
    "....#....",
    "........."},
    [013] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [014] ={
    ".........",
    ".........",
    "...#####.",
    "...#...#.",
    "...#####.",
    "...#.....",
    ".###.....",
    ".##......",
    "........."},
    [015] ={
    ".........",
    ".........",
    "...#####.",
    "...#...#.",
    "...#####.",
    "...#...#.",
    ".###.###.",
    ".##..##..",
    "........."},
    [016] ={
    ".........",
    ".##......",
    ".####....",
    ".######..",
    ".#######.",
    ".######..",
    ".####....",
    ".##......",
    "........."},
    [017] ={
    ".........",
    "......##.",
    "....####.",
    "..######.",
    ".#######.",
    "..######.",
    "....####.",
    "......##.",
    "........."},
    [018] ={
    ".........",
    "....#....",
    "...###...",
    "....#....",
    "....#....",
    "...###...",
    "....#....",
    ".........",
    "........."},
    [019] ={
    ".........",
    "..##.##..",
    "..##.##..",
    "..##.##..",
    "..##.##..",
    "..##.##..",
    ".........",
    "..##.##..",
    "........."},
    [020] ={
    ".........",
    "..######.",
    ".#.##.##.",
    ".#.##.##.",
    "..###.##.",
    "...##.##.",
    "...##.##.",
    "...##.##.",
    "........."},
    [021] ={
    ".........",
    "..######.",
    ".###...#.",
    ".#..##...",
    ".##...#..",
    "...##..#.",
    ".#...###.",
    ".######..",
    "........."},
    [022] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".#######.",
    ".#######.",
    "........."},
    [023] ={
    ".........",
    "....#....",
    "...###...",
    "....#....",
    "....#....",
    "...###...",
    "....#....",
    ".#######.",
    "........."},
    [024] ={
    ".........",
    "....#....",
    "...###...",
    "..#####..",
    "....#....",
    "....#....",
    "....#....",
    "....#....",
    "........."},
    [025] ={
    ".........",
    "....#....",
    "....#....",
    "....#....",
    "....#....",
    "..#####..",
    "...###...",
    "....#....",
    "........."},
    [026] ={
    ".........",
    ".........",
    ".....#...",
    ".....##..",
    ".#######.",
    ".....##..",
    ".....#...",
    ".........",
    "........."},
    [027] ={
    ".........",
    ".........",
    "...#.....",
    "..##.....",
    ".#######.",
    "..##.....",
    "...#.....",
    ".........",
    "........."},
    [028] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".#.......",
    ".#.......",
    ".#######.",
    "........."},
    [029] ={
    ".........",
    ".........",
    ".........",
    "..#...#..",
    ".#######.",
    "..#...#..",
    ".........",
    ".........",
    "........."},
    [030] ={
    ".........",
    "....#....",
    "...###...",
    "...###...",
    "..#####..",
    "..#####..",
    ".#######.",
    ".#######.",
    "........."},
    [031] ={
    ".........",
    ".#######.",
    ".#######.",
    "..#####..",
    "..#####..",
    "...###...",
    "...###...",
    "....#....",
    "........."},
    [032] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [033] ={
    ".........",
    "...###...",
    "...###...",
    "...###...",
    "...###...",
    "...###...",
    ".........",
    "...###...",
    "........."},
    [034] ={
    ".........",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    ".##..##..",
    ".........",
    ".........",
    ".........",
    "........."},
    [035] ={
    ".........",
    "..##.##..",
    "..##.##..",
    ".#######.",
    "..##.##..",
    ".#######.",
    "..##.##..",
    "..##.##..",
    "........."},
    [036] ={
    ".........",
    "....#....",
    "..#####..",
    ".##.#.##.",
    "..###....",
    "....###..",
    ".##.#.##.",
    "..#####..",
    "....#...."},
    [037] ={
    ".........",
    ".##...##.",
    ".##..###.",
    "....###..",
    "...###...",
    "..###....",
    ".###..##.",
    ".##...##.",
    "........."},
    [038] ={
    ".........",
    "....##...",
    "...#..#..",
    "...#.##..",
    "...##....",
    "..#..#.#.",
    "..#..##..",
    "...##..#.",
    "........."},
    [039] ={
    ".........",
    "....##...",
    "....##...",
    "....##...",
    "...##....",
    ".........",
    ".........",
    ".........",
    "........."},
    [040] ={
    ".........",
    "....###..",
    "..###....",
    "..##.....",
    "..##.....",
    "..##.....",
    "..###....",
    "....###..",
    "........."},
    [041] ={
    ".........",
    "..###....",
    "....###..",
    ".....##..",
    ".....##..",
    ".....##..",
    "....###..",
    "..###....",
    "........."},
    [042] ={
    ".........",
    ".........",
    "..#.#.#..",
    "...###...",
    ".#######.",
    "...###...",
    "..#.#.#..",
    ".........",
    "........."},
    [043] ={
    ".........",
    "....#....",
    "....#....",
    "....#....",
    ".#######.",
    "....#....",
    "....#....",
    "....#....",
    "........."},
    [044] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "..##.....",
    "..##.....",
    ".##......"},
    [045] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".#######.",
    ".........",
    ".........",
    ".........",
    "........."},
    [046] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "..##.....",
    "..##.....",
    "........."},
    [047] ={
    ".........",
    "......##.",
    ".....###.",
    "....###..",
    "...###...",
    "..###....",
    ".###.....",
    ".##......",
    "........."},
    [048] ={
    ".........",
    "..#####..",
    ".###.###.",
    ".##...##.",
    ".##.#.##.",
    ".##...##.",
    ".###.###.",
    "..#####..",
    "........."},
    [049] ={
    ".........",
    "....##...",
    "...###...",
    "..####...",
    "....##...",
    "....##...",
    "....##...",
    "..######.",
    "........."},
    [050] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".....##..",
    "....##...",
    "...##....",
    "..##..##.",
    ".#######.",
    "........."},
    [051] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".....###.",
    "...####..",
    ".....###.",
    ".##...##.",
    "..#####..",
    "........."},
    [052] ={
    ".........",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    ".#######.",
    ".....##..",
    "....####.",
    "........."},
    [053] ={
    ".........",
    ".#######.",
    ".##......",
    ".##......",
    ".#######.",
    "......##.",
    ".##...##.",
    "..#####..",
    "........."},
    [054] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##......",
    ".######..",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [055] ={
    ".........",
    ".#######.",
    ".##...##.",
    ".....##..",
    "....##...",
    "...##....",
    "...##....",
    "...##....",
    "........."},
    [056] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [057] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "..######.",
    "......##.",
    ".##...##.",
    "..#####..",
    "........."},
    [058] ={
    ".........",
    ".........",
    ".........",
    "...##....",
    "...##....",
    ".........",
    "...##....",
    "...##....",
    "........."},
    [059] ={
    ".........",
    ".........",
    ".........",
    "...##....",
    "...##....",
    ".........",
    "...##....",
    "...##....",
    "..##....."},
    [060] ={
    ".........",
    "....##...",
    "...##....",
    "..##.....",
    ".##......",
    "..##.....",
    "...##....",
    "....##...",
    "........."},
    [061] ={
    ".........",
    ".........",
    ".........",
    ".#######.",
    ".........",
    ".#######.",
    ".........",
    ".........",
    "........."},
    [062] ={
    ".........",
    "...##....",
    "....##...",
    ".....##..",
    "......##.",
    ".....##..",
    "....##...",
    "...##....",
    "........."},
    [063] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    "....###..",
    "...##....",
    ".........",
    "...##....",
    "........."},
    [064] ={
    ".........",
    "..#####..",
    ".#.....#.",
    ".#.###.#.",
    ".#.###.#.",
    ".#..###..",
    ".#.......",
    "..######.",
    "........."},
    [065] ={
    ".........",
    "#####....",
    "...###...",
    "..##.##..",
    ".##...##.",
    ".#######.",
    ".##...##.",
    "####.####",
    "........."},
    [066] ={
    ".........",
    ".######..",
    "..#...##.",
    "..#...##.",
    "..#####..",
    "..#...##.",
    "..#...##.",
    ".######..",
    "........."},
    [067] ={
    ".........",
    "...####..",
    "..##..##.",
    ".##....#.",
    ".##......",
    ".##....#.",
    "..##..##.",
    "...####..",
    "........."},
    [068] ={
    ".........",
    ".#####...",
    "..##.##..",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    "..##.##..",
    ".#####...",
    "........."},
    [069] ={
    ".........",
    ".#######.",
    "..##...#.",
    "..##.#...",
    "..####...",
    "..##.#...",
    "..##...#.",
    ".#######.",
    "........."},
    [070] ={
    ".........",
    ".#######.",
    "..##...#.",
    "..##.#...",
    "..####...",
    "..##.#...",
    "..##.....",
    ".####....",
    "........."},
    [071] ={
    ".........",
    "...####..",
    "..##..##.",
    ".##....#.",
    ".##......",
    ".##.####.",
    "..##..##.",
    "...###.#.",
    "........."},
    [072] ={
    ".........",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".#######.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "........."},
    [073] ={
    ".........",
    "...####..",
    "....##...",
    "....##...",
    "....##...",
    "....##...",
    "....##...",
    "...####..",
    "........."},
    [074] ={
    ".........",
    "....####.",
    ".....##..",
    ".....##..",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    "..####...",
    "........."},
    [075] ={
    ".........",
    ".###..##.",
    "..##..##.",
    "..##.##..",
    "..####...",
    "..##.##..",
    "..##..##.",
    ".###..##.",
    "........."},
    [076] ={
    ".........",
    ".####....",
    "..##.....",
    "..##.....",
    "..##.....",
    "..##...#.",
    "..##..##.",
    ".#######.",
    "........."},
    [077] ={
    ".........",
    ".##...##.",
    ".###.###.",
    ".#######.",
    ".#######.",
    ".##.#.##.",
    ".##...##.",
    ".##...##.",
    "........."},
    [078] ={
    ".........",
    "###...##.",
    ".###..##.",
    ".####.##.",
    ".#######.",
    ".##.####.",
    ".##..###.",
    "####..##.",
    "........."},
    [079] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [080] ={
    ".........",
    ".######..",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    "..#####..",
    "..##.....",
    ".####....",
    "........."},
    [081] ={
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    ".##.#.##.",
    ".##.####.",
    "..#####..",
    ".....###.",
    "........."},
    [082] ={
    ".........",
    ".######..",
    "..##..##.",
    "..##..##.",
    "..#####..",
    "..##.##..",
    "..##..##.",
    ".###..##.",
    "........."},
    [083] ={
    ".........",
    "..#####..",
    ".##...##.",
    "..##.....",
    "...###...",
    ".....##..",
    ".##...##.",
    "..#####..",
    "........."},
    [084] ={
    ".........",
    ".######..",
    ".######..",
    ".#.##.#..",
    "...##....",
    "...##....",
    "...##....",
    "..####...",
    "........."},
    [085] ={
    ".........",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [086] ={
    ".........",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "...###...",
    "....#....",
    "........."},
    [087] ={
    ".........",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    ".##.#.##.",
    ".##.#.##.",
    ".#######.",
    "..##.##..",
    "........."},
    [088] ={
    ".........",
    "####.####",
    ".##...##.",
    "..##.##..",
    "...###...",
    "..##.##..",
    ".##...##.",
    "####.####",
    "........."},
    [089] ={
    ".........",
    "..##..##.",
    "..##..##.",
    "...####..",
    "....##...",
    "....##...",
    "....##...",
    "...####..",
    "........."},
    [090] ={
    ".........",
    ".#######.",
    ".#....##.",
    ".....##..",
    "....##...",
    "...##....",
    "..##...#.",
    ".#######.",
    "........."},
    [091] ={
    ".........",
    "..####...",
    "..##.....",
    "..##.....",
    "..##.....",
    "..##.....",
    "..##.....",
    "..####...",
    "........."},
    [092] ={
    ".........",
    ".##......",
    ".###.....",
    "..###....",
    "...###...",
    "....###..",
    ".....###.",
    "......##.",
    "........."},
    [093] ={
    ".........",
    "...####..",
    ".....##..",
    ".....##..",
    ".....##..",
    ".....##..",
    ".....##..",
    "...####..",
    "........."},
    [094] ={
    ".........",
    "....#....",
    "...###...",
    "..##.##..",
    ".##...##.",
    ".........",
    ".........",
    ".........",
    "........."},
    [095] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".#######."},
    [096] ={
    ".........",
    "...##....",
    "...##....",
    "....##...",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [097] ={
    ".........",
    "..####...",
    ".....##..",
    "..#####..",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    "..###.##.",
    "........."},
    [098] ={
    ".........",
    ".###.....",
    "..##.....",
    "..#####..",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    ".##.###..",
    "........."},
    [099] ={
    ".........",
    ".........",
    ".........",
    "..#####..",
    ".##...##.",
    ".##......",
    ".##...##.",
    "..#####..",
    "........."},
    [100] ={
    ".........",
    "....###..",
    ".....##..",
    ".....##..",
    "..#####..",
    ".##..##..",
    ".##..##..",
    "..###.##.",
    "........."},
    [101] ={
    ".........",
    ".........",
    "..#####..",
    ".##...##.",
    ".#######.",
    ".##......",
    ".##...##.",
    "..#####..",
    "........."},
    [102] ={
    ".........",
    "....###..",
    "...##.##.",
    "...##..#.",
    "..####...",
    "...##....",
    "...##....",
    "..####...",
    "........."},
    [103] ={
    ".........",
    ".........",
    "..###.##.",
    ".##..##..",
    ".##..##..",
    "..#####..",
    ".....##..",
    ".##..##..",
    "..####..."},
    [104] ={
    ".........",
    ".###.....",
    "..##.....",
    "..##.....",
    "..#####..",
    "..##..##.",
    "..##..##.",
    ".###..##.",
    "........."},
    [105] ={
    ".........",
    "....##...",
    "....##...",
    ".........",
    "...###...",
    "....##...",
    "....##...",
    "...####..",
    "........."},
    [106] ={
    ".........",
    "......##.",
    "......##.",
    ".........",
    ".....###.",
    "......##.",
    ".##...##.",
    ".##...##.",
    "..#####.."},
    [107] ={
    ".........",
    ".###.....",
    "..##..##.",
    "..##.##..",
    "..####...",
    "..##.##..",
    "..##..##.",
    ".###..##.",
    "........."},
    [108] ={
    ".........",
    "...###...",
    "....##...",
    "....##...",
    "....##...",
    "....##...",
    "....##...",
    "...####..",
    "........."},
    [109] ={
    ".........",
    ".........",
    ".........",
    ".###.##..",
    ".#######.",
    ".##.#.##.",
    ".##.#.##.",
    ".##...##.",
    "........."},
    [110] ={
    ".........",
    ".........",
    ".........",
    ".##.###..",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    "........."},
    [111] ={
    ".........",
    ".........",
    ".........",
    "..#####..",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "..#####..",
    "........."},
    [112] ={
    ".........",
    ".........",
    ".##.###..",
    "..##..##.",
    "..##..##.",
    "..##..##.",
    "..#####..",
    "..##.....",
    ".####...."},
    [113] ={
    ".........",
    ".........",
    "..###.##.",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    "..#####..",
    ".....##..",
    "....####."},
    [114] ={
    ".........",
    ".........",
    ".##.###..",
    "..###.##.",
    "..##..##.",
    "..##.....",
    "..##.....",
    ".####....",
    "........."},
    [115] ={
    ".........",
    ".........",
    "..#####..",
    ".##...##.",
    "..###....",
    "....###..",
    ".##...##.",
    "..#####..",
    "........."},
    [116] ={
    ".........",
    "...#.....",
    "..##.....",
    ".####....",
    "..##.....",
    "..##.....",
    "..##..##.",
    "...####..",
    "........."},
    [117] ={
    ".........",
    ".........",
    ".........",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    ".##..##..",
    "..###.##.",
    "........."},
    [118] ={
    ".........",
    ".........",
    ".........",
    ".##...##.",
    ".##...##.",
    "..##.##..",
    "...###...",
    "....#....",
    "........."},
    [119] ={
    ".........",
    ".........",
    ".........",
    ".##...##.",
    ".##.#.##.",
    ".##.#.##.",
    ".#######.",
    "..##.##..",
    "........."},
    [120] ={
    ".........",
    ".........",
    ".........",
    ".##...##.",
    "..##.##..",
    "...###...",
    "..##.##..",
    ".##...##.",
    "........."},
    [121] ={
    ".........",
    ".........",
    ".........",
    ".##...##.",
    ".##...##.",
    ".##...##.",
    "..######.",
    "......##.",
    ".######.."},
    [122] ={
    ".........",
    ".........",
    ".........",
    ".#######.",
    ".#...##..",
    "...###...",
    "..##...#.",
    ".#######.",
    "........."},
    [123] ={
    ".........",
    "...###...",
    "..##.....",
    "..##.....",
    ".##......",
    "..##.....",
    "..##.....",
    "...###...",
    "........."},
    [124] ={
    ".........",
    "...##....",
    "...##....",
    "...##....",
    "...##....",
    "...##....",
    "...##....",
    "...##....",
    "........."},
    [125] ={
    ".........",
    "...###...",
    ".....##..",
    ".....##..",
    "......##.",
    ".....##..",
    ".....##..",
    "...###...",
    "........."},
    [126] ={
    ".........",
    "..##...#.",
    ".#..###..",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [127] ={
    "..#..#..#",
    ".#..#..#.",
    "#..#..#..",
    "..#..#..#",
    ".#..#..#.",
    "#..#..#..",
    "..#..#..#",
    ".#..#..#.",
    "#..#..#.."},
    [128] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [129] ={
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [130] ={
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [131] ={
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "........."},
    [132] ={
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    "........."},
    [133] ={
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    "........."},
    [134] ={
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    "........."},
    [135] ={
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    "........."},
    [136] ={
    ".........",
    ".........",
    ".........",
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    "........."},
    [137] ={
    "####.....",
    "####.....",
    "####.....",
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    "........."},
    [13] ={
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    "........."},
    [139] ={
    "#########",
    "#########",
    "#########",
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    "........."},
    [140] ={
    ".........",
    ".........",
    ".........",
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    "........."},
    [141] ={
    "####.....",
    "####.....",
    "####.....",
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    "........."},
    [142] ={
    "....#####",
    "....#####",
    "....#####",
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    "........."},
    [143] ={
    "#########",
    "#########",
    "#########",
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    "........."},
    [144] ={
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####....."},
    [145] ={
    "####.....",
    "####.....",
    "####.....",
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####....."},
    [146] ={
    "....#####",
    "....#####",
    "....#####",
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####....."},
    [147] ={
    "#########",
    "#########",
    "#########",
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####....."},
    [148] ={
    ".........",
    ".........",
    ".........",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####....."},
    [149] ={
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####....."},
    [150] ={
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####....."},
    [151] ={
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####.....",
    "####....."},
    [152] ={
    ".........",
    ".........",
    ".........",
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####....."},
    [153] ={
    "####.....",
    "####.....",
    "####.....",
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####....."},
    [154] ={
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####....."},
    [155] ={
    "#########",
    "#########",
    "#########",
    "....#####",
    "....#####",
    "....#####",
    "####.....",
    "####.....",
    "####....."},
    [156] ={
    ".........",
    ".........",
    ".........",
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####....."},
    [157] ={
    "####.....",
    "####.....",
    "####.....",
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####....."},
    [158] ={
    "....#####",
    "....#####",
    "....#####",
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####....."},
    [159] ={
    "#########",
    "#########",
    "#########",
    "#########",
    "#########",
    "#########",
    "####.....",
    "####.....",
    "####....."}
}
tCurrentFont = tDefaultFont

return {
    ["write"] = gFont.write,
    ["getCharSizes"] = gFont.getCharSizes
}
