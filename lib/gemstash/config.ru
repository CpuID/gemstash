require "gemstash"
require "puma/commonlogger"

use Rack::Deflater
use Gemstash::Logging::RackMiddleware

if Gemstash::Env.daemonized?
  use Puma::CommonLogger, Gemstash::Logging::StreamLogger.for_stdout
end

use Gemstash::Authorize::RackMiddleware
use Gemstash::Env::RackMiddleware, Gemstash::Env.current
use Gemstash::GemSource::RackMiddleware
use Gemstash::Health::RackMiddleware
run Gemstash::Web.new(gemstash_env: Gemstash::Env.current)
