require './config/environment'


use Rack::MethodOverride
use ReportsController
use UsersController
use SessionsController
run ApplicationController
