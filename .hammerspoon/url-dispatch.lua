hs.loadSpoon("SpoonInstall")

function appID(app)
  return hs.application.infoForBundlePath(app)['CFBundleIdentifier']
end
Slack = appID('/Applications/Slack.app')

spoon.SpoonInstall:andUse("URLDispatcher",
  {
    config = {
      url_patterns = {
        { "https?://www%.google%.com/*", "com.apple.Safari" },
        { "https?://%w+%.google%.com/*", "com.google.Chrome" },
        { "https?://%w*%.?merc%.li/*", "com.google.Chrome" },
        { "https?://.*%.mercari%.in/*", "com.google.Chrome" },
        { "https?://portal.mercari%.*/*", "com.google.Chrome" },
        { "https?://reviews.mercari%.*/*", "com.google.Chrome" },
        { "https?://unipos.me/*", "com.google.Chrome" },
        { "https?://github.com/kouzoh/*", "com.google.Chrome" },
        { "https?://.*myworkday.*", "com.google.Chrome" },
        { "https?://.*retrium.*", "com.google.Chrome" },
        { "https?://mercari%.service%-now%.com/*", "com.google.Chrome" },
        { "https?://mercari%.atlassian%.net/*", "com.google.Chrome" },
        { "https?://.*figma%.com/*", "com.google.Chrome" },
        { "https?://.*okta%.com/*", "com.google.Chrome" },
        { "https?://mercari%.looker%.com/*", "com.google.Chrome" },
        { "https?://mercari%..*slack%.com/*", "com.google.Chrome" },
        { "https?://mercari%.testrail%.*/*", "com.google.Chrome" },
        { "https?://forms%.gle/*", "com.google.Chrome" },
        { "https?://storage.cloud.google.com/kouzoh-.*%.apk", "com.google.Chrome" },
        { "https?://mercari.slack.com/*", Slack },
      },
    },
    start = true
  }
)
