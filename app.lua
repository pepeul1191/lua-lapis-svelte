local lapis = require("lapis")
local etlua = require("lapis.etlua")
local bootstrap = require("app.configs.bootstrap")
local middlewares = require("app.configs.middlewares")

local app = lapis.Application()
app:enable("etlua")
middlewares.inject_globals(app)
bootstrap.load(app)

app:get("/demo", function(self)
  self.pets = { "Cat", "Dog", "Bird" }
  return { render = "hello" }
end)

return app
