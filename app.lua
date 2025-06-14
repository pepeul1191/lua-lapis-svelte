local lapis = require("lapis")
local app = lapis.Application()
app:enable("etlua")

app:get("/", function(self)
  self.pets = { "Cat", "Dog", "Bird" }
  return { render = "hello" }
end)

return app
