{ pkgs, ... }: {

  users.users = {
    root =
      {
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFz8ZLAhPmU5A/GoR9Td3IVeF0/LoVDyJSWiFAL0oAm4" #rahel
        ];
      };
    rahel = {
      isNormalUser = true;
      description = "Rahel";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFz8ZLAhPmU5A/GoR9Td3IVeF0/LoVDyJSWiFAL0oAm4" #rahel
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo" #ephi
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3pquWdmxQFyxkNjBCX0HRfzWLUPh/LTYpA/Alc9OjB rahelkempf@gmx.ch"

      ];
    };
    siegi = {
      isNormalUser = true;
      description = "Ephraim";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo" #ephi
      ];
    };
  };


}
