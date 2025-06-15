-- app/configs/middlewares.lua
local helpers = require("main.configs.helpers")
local middlewares = {}

function middlewares.inject_globals(app)
  app:before_filter(function(self)
    -- global variables
    self.site_name = "Mi Sitio Web"
    self.year = os.date("%Y")
    self.helpers = helpers
    -- HTTP Header
    self.res.headers["X-Powered-By"] = "Lapis Lua 🐉"
    self.res.headers["Server"] = "openresty/1.21.4.3,Ubuntu"
  end)
end

return middlewares