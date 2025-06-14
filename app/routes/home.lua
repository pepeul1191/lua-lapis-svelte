-- app/routes/home.lua
local lapis = require("lapis")
local db = require("lapis.db")
local router = lapis.Application:extend()
local Model = require("lapis.db.model").Model

local User = Model:extend("users")

local function render_home_page(self)
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
  return render_home_page(self)
end)

router:get("/systems", function(self)
  return render_home_page(self)
end)

router:get("/users", function(self)
  return render_home_page(self)
end)

router:get("/login", function(self)
  return {
    render = "login",
  }
end)

router:get("/apis/v1/users", function(self)
  rows = User:select()
  return {
    json = rows
  }
end)

return router


