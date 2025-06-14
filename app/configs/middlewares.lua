-- app/configs/middlewares.lua
local helpers = require("app.configs.helpers")
local middlewares = {}

function middlewares.inject_globals(app)
  app:before_filter(function(self)
    -- Variables globales
    self.site_name = "Mi Sitio Web"
    self.year = os.date("%Y")
    self.helpers = helpers
    -- Cabecera HTTP personalizada
    self.res.headers["X-Powered-By"] = "Lapis Lua 🐉"
    self.res.headers["Server"] = "openresty/1.21.4.3,Ubuntu"
    return self
  end)
end

return middlewares