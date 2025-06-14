-- app/routes/home.lua
local lapis = require("lapis")
local router = lapis.Application:extend()

router:get("/", function(self)
  self.demo = "Ruta separada con bootstrap"
  self.pets = { "Cat", "Dog", "Bird" }
  print("1 ++++++++++++++++++++++++++++++++++++++")
  print(self.year)
  print(self.helpers.greet('pepe'))
  print("2 ++++++++++++++++++++++++++++++++++++++")
  return { render = "index" }
end)

return router


