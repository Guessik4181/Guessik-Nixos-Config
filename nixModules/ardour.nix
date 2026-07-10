{ pkgs, ... }:

{
  # 1. Install Ardour and selected plugin packages
  environment.systemPackages = with pkgs; [
    ardour

    # Popular open-source plugin bundles
    lsp-plugins     # High-quality LV2/VST plugins (EQ, Compressors)
    calf            # Iconic LV2 plugin suite with great GUIs
    helm            # Great polyphonic synthesizer (VST/LV2)
    distrho-ports   # Collection of ported instruments and FX
    x42-plugins     # Essential utility/mixing plugins
  ];

  # 2. Tell Ardour exactly where to look for NixOS plugins
  environment.sessionVariables = {
    LV2_PATH = [ "$HOME/.lv2:/run/current-system/sw/lib/lv2" ];
    VST_PATH = [ "$HOME/.vst:/run/current-system/sw/lib/vst" ];
    VST3_PATH = [ "$HOME/.vst3:/run/current-system/sw/lib/vst3" ];
    CLAP_PATH = [ "$HOME/.clap:/run/current-system/sw/lib/clap" ];
    LADSPA_PATH = [ "$HOME/.ladspa:/run/current-system/sw/lib/ladspa" ];
  };
}
