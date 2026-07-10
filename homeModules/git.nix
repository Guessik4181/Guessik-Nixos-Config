{ ... }: 
{
  programs.git = {
    enable = true;
    settings = {
      user = {
	name = "Guessik";
        email = "GuessWhat4181@gmail.com";
      };
    };
  };
}
