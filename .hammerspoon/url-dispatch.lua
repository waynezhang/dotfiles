hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("URLDispatcher",
  {
    config = {
      url_patterns = {
        { "https?://line.zoom.us/j/*", "us.zoom.xos" },
      },
      default_handler = "com.apple.Safari"
    },
    start = true
  }
)

