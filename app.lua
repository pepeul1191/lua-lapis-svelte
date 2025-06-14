local lapis = require("lapis")
local etlua = require("lapis.etlua")
local bootstrap = require("app.configs.bootstrap")

local app = lapis.Application()
app:enable("etlua")
bootstrap.load(app)

app:get("/demo", function(self)
  self.pets = { "Cat", "Dog", "Bird" }
  return { render = "hello" }
end)

return app
