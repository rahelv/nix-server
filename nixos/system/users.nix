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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFz8ZLAhPmU5A/GoR9Td3IVeF0/LoVDyJSWiFAL0oAm4" #rahel old 
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII3pquWdmxQFyxkNjBCX0HRfzWLUPh/LTYpA/Alc9OjB" #rahel 

      ];
    };
    siegi = {
      isNormalUser = true;
      description = "Ephraim";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo" #ephi
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILZPZrDYjyjdmxzYEDsRYkTDvqx3+pA5z4pQJsuufXRk" #phone

      ];
    };

    zenoli = {
      isNormalUser = true;
      description = "zenoli";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1R2gEuXslK413gWBE4tOA894zO/MkhZrAK/LyRcsmo" #ephi
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGxusYiPzAUe3ZwVJjt/n5ERJNOftq73X2J5cSWAQKpfMZuhcdoyTJsoVpc6DmHLvDK6a+gZPc5WHhF85HZEPKTAqXGPvpC/4XKiK+UyI8ldwR00ssSHjmvu8DDJ9nojuI9Q54Kk/XfOeqIwkVfKjQtPzCMfEGmDylGCmjrjr0LUNDUgCd4Gzr1mQZEGVFUKbyeZbGBIg+2U2GCVAQqw+eWSDaG6fdthiUtBfSZdiWKDpv8Bo02e/it9SK/G7j4UT39Y9Dfns3k1U+0juNJ7ngUQOy8Gl1Ad10TCzNbH1ErBTJgsnMy6iCNzwZlF73TtTs5ZPhG7Kx1CFiwA29XKSkz0Ja4sTwFHgnMBHbhKJDzg+8UiL7LFrtgKoQ2QY2URpbevKy/4gqpP8EmMeXUHGFvT4FYzplRQiIPSXeHjP1ylbp2OLF3oPzyvm/Hp3mGWu48VA6ENl8mz73g2ET3lx/3ulfI54hIy+0JmdICNVe5mSOgrlF8rLL7eJXXZe4j8HH+JwECBGJKicBL22B+TWe48FFaGL2c8X1oE61XuYEcqAoAGkTfmfqFBcx0DpNJqL+v5EU3sGfEQqD4tqSbbPDyPYzDcQnLn1e7NIr9VvmuvPZ8jOhRd8CrNlyuHUdTubKjNeGLOtQYpJztriY67aNnu7/9uOBy7BC+ZbdR7oiCQ== olibitter_@gmail.com"
      ];
    };

  };


}
