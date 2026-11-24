-- Resize Omarchy terminals after their default floating rules are applied.
local function enlarge_omarchy_terminal(window)
  local classes = {
    ["org.omarchy.terminal"] = true,
    ["org.omarchy.bash"] = true,
    ["org.omarchy.btop"] = true,
    ["Omarchy"] = true,
    ["TUI.float"] = true,
  }
  if not window or not window.mapped or not window.floating or not classes[window.class] then
    return
  end
  local monitor = window.monitor
  if not monitor then return end
  hl.dispatch(hl.dsp.window.resize({
    window = window,
    x = math.floor(monitor.width / monitor.scale * 0.6),
    y = math.floor(monitor.height / monitor.scale * 0.6),
    relative = false,
  }))
  hl.dispatch(hl.dsp.window.center({ window = window }))
end

hl.on("window.open", enlarge_omarchy_terminal)
