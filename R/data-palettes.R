.phage_palettes <- list(
  soft_breeze = list(
    id = "soft_breeze",
    mode = "soft",
    variant = "breeze",
    display_name = "Soft Breeze",
    role = "Fresh soft branch with teal, dusty pink, pale blue, and mellow yellow.",
    colors = c(
      "#0C9A89", "#74BDB0", "#E796A1", "#D3B5C6",
      "#F6D8E5", "#C7E1F4", "#F5CB7E", "#E7D9AE"
    )
  ),
  soft_harbor = list(
    id = "soft_harbor",
    mode = "soft",
    variant = "harbor",
    display_name = "Soft Harbor",
    role = "Default soft branch with mature blue-grey, muted teal, amber, coral, and blush.",
    colors = c(
      "#92ADC0", "#9DBCBA", "#C8D6E3", "#B7C9A5",
      "#F1B04A", "#EB6E51", "#D98E88", "#F3B1A6"
    )
  ),
  soft_mist = list(
    id = "soft_mist",
    mode = "soft",
    variant = "mist",
    display_name = "Soft Mist",
    role = "Low-conflict mist-like soft branch with lavender, fog blue, sand, and pale pink.",
    colors = c(
      "#B6A2C9", "#C5B4D8", "#CDDDE5", "#DCE7EA",
      "#EEE9E0", "#E7D3C9", "#F4C1BF", "#DDB8C7"
    )
  ),
  vivid_core = list(
    id = "vivid_core",
    mode = "vivid",
    variant = "core",
    display_name = "Vivid Core",
    role = "Default vivid branch with a navy-blue structure and a controlled coral-red anchor.",
    colors = c(
      "#1D3557", "#355C7D", "#457B9D", "#7FAFC4",
      "#A8DADC", "#F1FAEE", "#E98A7A", "#E63946"
    )
  ),
  vivid_fresh = list(
    id = "vivid_fresh",
    mode = "vivid",
    variant = "fresh",
    display_name = "Vivid Fresh",
    role = "Fresh vivid branch with teal, cyan, cool white, peach, and warm terracotta.",
    colors = c(
      "#0F6D7A", "#4D9BA0", "#83C5BE", "#B8DCD7",
      "#EDF6F9", "#FFDDD2", "#F2B59A", "#E29578"
    )
  ),
  vivid_drama = list(
    id = "vivid_drama",
    mode = "vivid",
    variant = "drama",
    display_name = "Vivid Drama",
    role = "Mature high-separation vivid branch with smoky blue, muted teal, moss, aged amber, terracotta, and violet.",
    colors = c(
      "#415A80", "#4B6A97", "#5B9A90", "#8FAF62",
      "#D3A35A", "#C97B5D", "#B27B86", "#8C6492"
    )
  ),
  forest_canopy = list(
    id = "forest_canopy",
    mode = "forest",
    variant = "canopy",
    display_name = "Forest Canopy",
    role = "Default forest branch with deep green, moss, grey teal, muted gold, brick coral, berry, and parchment.",
    colors = c(
      "#23483A", "#6F8F62", "#A9B98F", "#6F9092",
      "#D6B36A", "#C98563", "#8A4A58", "#E6DCC6"
    )
  ),
  forest_moss = list(
    id = "forest_moss",
    mode = "forest",
    variant = "moss",
    display_name = "Forest Moss",
    role = "Softer forest branch with sage, moss, fog teal, warm sand, muted fruit, and bark brown.",
    colors = c(
      "#557A5C", "#8CA97A", "#B8C6A3", "#789C9A",
      "#AFC6C2", "#D7C8A5", "#C99576", "#7A5B4E"
    )
  ),
  forest_ember = list(
    id = "forest_ember",
    mode = "forest",
    variant = "ember",
    display_name = "Forest Ember",
    role = "Narrative forest branch with dark green, cool grey-green, olive, blue-grey, bark, and a controlled warm ember anchor.",
    colors = c(
      "#1F3F35", "#496B57", "#7E916A", "#B8B58B",
      "#536E76", "#9A6B5A", "#C46F52", "#D7C6A1"
    )
  ),
  mineral_slate = list(
    id = "mineral_slate",
    mode = "mineral",
    variant = "slate",
    display_name = "Mineral Slate",
    role = "Default mineral branch with slate blue-grey, mineral fog, cool sand, muted gold, rust, and plum.",
    colors = c(
      "#26384A", "#536879", "#7F95A3", "#AFC0C8",
      "#D7D2C3", "#B8A27A", "#A46F5E", "#6E4F63"
    )
  ),
  mineral_quartz = list(
    id = "mineral_quartz",
    mode = "mineral",
    variant = "quartz",
    display_name = "Mineral Quartz",
    role = "Lighter mineral branch with translucent quartz greys, cool sand, soft terracotta, and muted violet.",
    colors = c(
      "#415A66", "#6F8790", "#9EB0B4", "#D8DED9",
      "#C9BEA5", "#9E8E70", "#C48B73", "#7C6B82"
    )
  ),
  mineral_oxide = list(
    id = "mineral_oxide",
    mode = "mineral",
    variant = "oxide",
    display_name = "Mineral Oxide",
    role = "Mineral branch with cool stone structure and controlled iron-oxide anchors for key-group emphasis.",
    colors = c(
      "#2B3F4A", "#4E6B73", "#789097", "#B5C1BE",
      "#D4C6A8", "#B9825D", "#A9574E", "#5E4A5D"
    )
  )
)

.phage_mode_defaults <- c(
  soft = "soft_harbor",
  vivid = "vivid_core",
  forest = "forest_canopy",
  mineral = "mineral_slate"
)
