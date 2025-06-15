-- app/routes/home.lua
local lapis = require("lapis")
local db = require("lapis.db")
local router = lapis.Application:extend()
local Model = require("lapis.db.model").Model

local User = Model:extend("users")

local function render_home(self)
  self.demo = "Ruta separada con bootstrap"
  self.pets = { "Cat", "Dog", "Bird" }
  print("1 ++++++++++++++++++++++++++++++++++++++")
  print(self.year)
  print(self.helpers.greet('pepe'))
  local res = db.query("SELECT * FROM users;")
  print(self.helpers.dump(res))
  print("2 ++++++++++++++++++++++++++++++++++++++")
  return {
    render = "index",
    demo = self.demo,
    pets = self.pets,
    users = res
  }
end

router:get("/", function(self)
  return render_home(self)
end)

router:get("/systems", function(self)
  return render_home(self)
end)

router:get("/users", function(self)
  return render_home(self)
end)

return router


