local base = require("packages.base")

local package = pl.class(base)
package._name = "strike"

function package:_init ()
  base._init(self)
  self.class:loadPackage("rules")
  self.class:loadPackage("rebox")
  self.class:loadPackage("raiselower")
  self.class:loadPackage("color")
end

function package:registerCommands ()

  self:registerCommand("strike", function(options, content)
    -- next 2 lines from float in frametricks.lua
    local hbox = SILE.call("hbox", {}, content)
    table.remove(SILE.typesetter.state.nodes) -- steal it back

    SILE.call("rebox", { width = 0 }, content)
    local first = options.raise or SILE.measurement("2pt")
    local i = 0
    local height = options.height or SILE.measurement("1.5pt")

    if options.n and options.n == "triple" then
      i = 2
      first = options.raise or SILE.measurement("1.5pt")
    elseif options.n and options.n == "double" then
      i = 1
    end

    if i > 0 and not options.height then
      height = SILE.measurement("1pt")
    end

    if options.color then
      SILE.call("color", { color = options.color })
    end

    for _ = 0, i, 1 do
      SILE.call("rebox", { width = 0 }, function()
        SILE.call("raise", { height = first }, function()
          SILE.call("color", { color = options.color or "black" }, function()
            SILE.call("hrule", { width = hbox.width, height = height })
          end)
        end)
      end)
      first = first + SILE.measurement("2pt")
    end
    SILE.call("glue", { width = hbox.width })
  end, "Strikethrough text")

end

return package
