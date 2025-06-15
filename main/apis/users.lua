-- app/apis/user.lua
local lapis = require("lapis")
local db = require("lapis.db")
local router = lapis.Application:extend()
local User = require("main.models.user")

router:get("/apis/v1/users", function(self)
  local success, result = pcall(function()
    return User:select()
  end)
  if success then
    return {
      json = result
    }
  else
    local stack_trace = debug.traceback(result, 2) 
    print(stack_trace)
    return {
      status = 500,
      json = {
        message = "Error al consultar usuarios",
        error = result
      }
    }
  end
end)

router:get("/apis/v1/users/actives", function(self)
  local success, result = pcall(function()
    return User:get_active_users()
  end)
  if success then
    return {
      json = result
    }
  else
    local stack_trace = debug.traceback(result, 2) 
    print(stack_trace)
    return {
      status = 500,
      json = {
        message = "Error al consultar usuarios",
        error = result
      }
    }
  end
end)

return router
