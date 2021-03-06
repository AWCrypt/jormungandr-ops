{ lib, name, ... }: {
  imports = [ ../modules/jormungandr.nix ];

  services.jormungandr = {
    topicsOfInterest = {
      messages = "normal";
      blocks = "normal";
    };
    maxConnections = 4 * 1024;
    maxUnreachableNodes = 256;
    policyQuarantineDuration = "1m";
    # topologyForceResetInterval = "30s";
  };
}
