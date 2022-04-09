VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")

function selectMoreLines(v)
    local c = v.cursor

    if c:HasSelection() then
        c:Down()
        c:AddLineToSelection()
    else
        c:SelectLine()
    end

    c:Relocate()
	return true
end

function init()
    config.MakeCommand("selectMoreLines", selectMoreLines, config.NoComplete)
    config.TryBindKey("Ctrl-l", "lua:selectMoreLines:selectMoreLines", false)
end
