 
 # To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
#     pkgs.docker
#    pkgs.openssh
   pkgs.pnpm
  ];
  



  # Sets environment variables in the workspace
  env = {};

  services.docker.enable = true;
  
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "eamodio.gitlens"
      "esbenp.prettier-vscode"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
      #  web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #could ot get preview to work
        #  command = ["bash" "-c" "docker start open-webui"];
          #command = ["source" "venvlitellm/bin/activate" "&&" "litellm" "--config" "config.yaml" "--detailed_debug" "2>&1" ">>" "litellm.log"];

       # command = [ "pnpm"  "run" "dev"];
       # manager = "web";
        #   env = {
             # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
       # };
      };
    };


    #https://developers.google.com/idx/guides/devnix-reference#packages
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        runPnpmInstall = "git checkout changes2 && pnpm install && pnpm build";
  
        #install-litellm = "cd .. && python -m venv myvenv &&  source myvenv/bin/activate && pip install open-webui";        
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
        pnpmRunStart = "pnpm run start";
#        forward-port-9000 = "ssh -R 80:localhost:9000 -o StrictHostKeyChecking=no serveo.net";
#        startOpenUIDocker = "docker start open-webui && sleep 2 && docker logs -f --tail 100 open-webui";
#        startLiteLLMDocker = "docker start my-litellm-container && sleep 2 &&  docker logs -f  --tail 100 my-litellm-container";
#        activeVenv = "source venvlitellm/bin/activate && litellm --config config.yaml --detailed_debug 2>&1 >>litellm.log";
#        runLitellm = "";
        # files to open when the workspace is (re)opened. It seems to open only the last in the list!!!
        default.openFiles = [  ".env.local" ];
      };
    };
  };
}