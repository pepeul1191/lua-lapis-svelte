-- app/configs/bootstrap.lua
local home_routes = require("app.routes.home")
local bootstrap = {}

function bootstrap.load(app)
  -- routes "/"
  app:include(home_routes)
  -- 404 handler
  function app:handle_404(self)
    return {
      status = 404,
      render = "not_found"
    }
  end
end



return bootstrap