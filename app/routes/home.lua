-- app/routes/home.lua
local lapis = require("lapis")
local router = lapis.Application:extend()

router:get("/", function(self)
  self.demo = "Ruta separada con bootstrap"
  self.pets = { "Cat", "Dog", "Bird" }
  return { render = "home.index" }
end)

return router


