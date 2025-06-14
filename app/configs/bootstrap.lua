-- app/configs/bootstrap.lua
local home_routes = require("app.routes.home")
local bootstrap = {}

function bootstrap.load(app)
  -- Montar las rutas bajo "/"
  app:include(home_routes)
  -- Definir el manejador de 404
  function app:handle_404(self)
    return {
      status = 404,
      render = "not_found"
    }
  end
end



return bootstrap