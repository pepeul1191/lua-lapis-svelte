local home_routes = require("app.routes.home")
local bootstrap = {}

function bootstrap.load(app)
  -- routes "/"
  app:include(home_routes)
  -- 404 handler
  app.handle_404 = function(self)
    local method = self.req.method
    if method == "GET" then
      return {
        status = 404,
        render = "not_found"
      }
    else
      return {
        status = 404,
        json = {
          error = "Resource not found"
        }
      }
    end
  end
end

return bootstrap
