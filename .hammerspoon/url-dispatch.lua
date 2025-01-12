spoon.SpoonInstall:andUse("URLDispatcher",
  {
    config = {
      default_handler = "com.apple.Safari",
      url_patterns = {
        { "https?://www%.google%.com",                             "com.apple.Safari" },
        { "https?://%w+%.google%.com",                             "com.google.Chrome" },
        { "https?://%w*%.?merc%.li",                               "com.google.Chrome" },
        { "https?://.*%.mercari%.in",                              "com.google.Chrome" },
        { "https?://unipos.me/*",                                  "com.google.Chrome" },
        { "https?://github.com/kouzoh/*",                          "com.google.Chrome" },
        { "https?://.*myworkday.*",                                "com.google.Chrome" },
        { "https?://.*retrium.*",                                  "com.google.Chrome" },
        { "https?://mercari%.service%-now%.com",                   "com.google.Chrome" },
        { "https?://mercari%.atlassian%.net",                      "com.google.Chrome" },
        { "https?://.*figma%.com",                                 "com.google.Chrome" },
        { "https?://.*okta%.com",                                  "com.google.Chrome" },
        { "https?://mercari%.looker%.com",                         "com.google.Chrome" },
        { "https?://mercari%.testrail%.",                          "com.google.Chrome" },
        { "https?://forms%.gle/*",                                 "com.google.Chrome" },
        { "https?://storage.cloud.google.com/kouzoh%-.*%.apk",     "com.google.Chrome" },
        { "https?://mercari%.workable%.com",                       "com.google.Chrome" },
        { "https?://mercari%.slack%.com",                          "com.google.Chrome" },
        { "https?://mercari%.blameless%.io",                       "com.google.Chrome" },
        { "https?://workcloud%.jp",                                "com.google.Chrome" },
        { "https?://mercari%.docebosaas%.com",                     "com.google.Chrome" },
        { "https?://.*zapier%.com",                                "com.google.Chrome" },
        { "https?://merpay%-corp%-question%-jp%.firebaseapp%.com", "com.google.Chrome" },
        { "https?://app%.datadoghq%.com",                          "com.google.Chrome" },
      },
    },
    start = true
  }
)
