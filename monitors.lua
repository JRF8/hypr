return {
  hl.monitor({
      output   = "",
      mode     = "preferred",
      position = "auto",
      scale    = "1",
  });

  hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "0x0",
  });

  hl.monitor({
    output = "DP-2",
    mode = "preferred",
    position = "-960x-1080",
  });

  hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "960x-1080",
  });
}
