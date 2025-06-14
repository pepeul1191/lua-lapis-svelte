-- app/routes/home.lua
local lapis = require("lapis")
local db = require("lapis.db")
local router = lapis.Application:extend()
local Model = require("lapis.db.model").Model

local User = Model:extend("users")

router:get("/", function(self)
  self.demo = "Ruta separada con bootstrap"
  self.pets = { "Cat", "Dog", "Bird" }
  print("1 ++++++++++++++++++++++++++++++++++++++")
  print(self.year)
  print(self.helpers.greet('pepe'))
  local res = db.query("SELECT * FROM users;")
  print(self.helpers.dump(res))
  print("2 ++++++++++++++++++++++++++++++++++++++")
  return { render = "index" }
end)

router:get("/users", function(self)
  rows = User:select()
  return {
    json = rows
  }
end)

return router


