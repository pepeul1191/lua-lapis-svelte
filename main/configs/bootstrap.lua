local home_routes = require("main.routes.home")
local access_routes = require("main.routes.access")
local users_apis = require("main.apis.users")
local bootstrap = {}

function bootstrap.load(app)
  -- routes "/"
  app:include(home_routes)
  app:include(access_routes)
  app:include(users_apis)
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
