-- app/configs/bootstrap.lua
local home_routes = require("app.routes.home")
local bootstrap = {}

function bootstrap.load(app)
  app:include(home_routes)
end

return bootstrap