-- app/routes/home.lua
local lapis = require("lapis")
local db = require("lapis.db")
local router = lapis.Application:extend()
local Model = require("lapis.db.model").Model

local User = Model:extend("usersdd")

local function render_access_page(self)
  return {
    render = "access"
  }
end

router:get("/login", function(self)
  return render_access_page(self)
end)

return router


