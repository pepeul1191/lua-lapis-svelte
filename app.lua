local lapis = require("lapis")
local bootstrap = require("main.configs.bootstrap")
local middlewares = require("main.configs.middlewares")

local app = lapis.Application()
-- setup template engine
app:enable("etlua")
-- load global variables
middlewares.inject_globals(app)
-- load routes
bootstrap.load(app)
-- start
return app
