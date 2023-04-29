# ==========>  README  <==========
#
# This file has been generated by:
# 
#   nix flake init --template github:zeme-iohk/iogx
#
# You should do the following:
# 
#   0. Read through this entire file once
#   1. Change the flake `description` field (line 17)
#   2. Override or add new flake inputs (line 36)
#   3. Modify the `flakeopts` value (line 41)
#   4. Run `nix develop` and read the welcome message carefully!!!
#   5. Run `cabal test all` to ensure that everything is working
#   6. Delete this comment
{
  description = "";

  inputs = {

    # The following inputs are managed by iogx:
    # 
    #   CHaP, devenv, flake-utils, haskell.nix, nixpkgs, hackage, 
    #   iohk-nix, sphinxcontrib-haddock, pre-commit-hooks-nix, 
    #   haskell-language-server, cardano-world, nosys, std, bitte-cells, tullia.
    # 
    # They will be available in both systemized and desystemized flavours. 
    # Do not re-add those inputs again here. 
    # If you need to, you can override them like this instead:
    # 
    #   iogx.inputs.hackage.url = "github:input-output-hk/hackage/my-branch" 
    iogx.url = "github:zeme-iohk/iogx";

    # Other inputs can be defined as usual.
    # foobar.url = "github:foo/bar";
  };

  outputs = inputs:
    let
      flakeopts = {

        # The root of the repository.
        # This is a required field.
        # The path *must* contain the `cabal.project` file. 
        repoRoot = ./.;

        # The list of supported systems.
        # This is a required field and cannot be the empty list.
        # Available systems are: 
        #   x86_64-linux x86_64-darwin aarch64-darwin aarch64-linux
        systems = [ "x86_64-linux" "x86_64-darwin" ];

        # The list of supported GHC versions.
        # This is a required field and cannot be the empty list.
        # Available compilers are: 
        #   ghc8107 ghc924
        haskell.compilers = [ "ghc8107" ];

        # Only for cosmetic purposes, the shell name will be included in the 
        # default `shellPrompt` and appear in the shell welcome message. 
        # Use should use your project name.
        shellName = "iogx";

        # The folder containing *all* the nix source files.
        #
        # The following files are expected to be found in the `nixFolder`:
        # 
        #   default-shell.nix
        #   haskell-project.nix
        #   per-system-outputs.nix
        #   system-independent-outputs.nix
        #
        # This template generated a stub for each of those files inside a folder 
        # named `nix`. Open them to find the relevant documentation.
        # 
        # This value defaults to the `nix` folder inside `repoRoot`.
        # If you are migrating an existing repository you may already have 
        # a `nix` folder in the top level, in which case you can set for example
        # `nixFolder = ./new-nix` until migration is completed.
        # nixFolder = ./nix;

        # The default GHC compiler.
        # When running `nix develop` this is the compiler that will be available 
        # in the shell. 
        # It defaults to the first compiler in `haskell.compilers`.
        # haskell.defaultCompiler = "ghc8107";

        # The host system for cross-compiling on migwW64.
        # Do not set this value if your project does not support 
        # cross-compilation, otherwise set this value to the host system, 
        # usually `x86_64-linux`.
        # haskell.crossSystem = "x86_64-linux";

        # A list of derivations to be excluded from CI.
        # Each item in the list is an attribute path inside `hydraJobs` in the 
        # form of a dot-string. For example:
        #   [ "packages.my-attrs.my-nested-attr.my-pkg" "checks.exclude-me" ]
        # This defaults to the empty list.
        # hydraJobs.blacklistedDerivations = [];

        # Whether to exclude profiled haskell builds from CI.
        # This defaults to true: we don't run profiled haskell builds in CI.
        # hydraJobs.excludeProfiledHaskell = true;

        # Shell prompt i.e. the value of the `PS1` evnvar. 
        # Defaults to the legacy nix-shell green prompt using the `shellName`.
        # NOTE: because this is a nix string that will be embedded as a bash 
        # string, you need to double-escape the left slashes:
        # Example: 
        #   bash = \n\[\033[1;32m\][nix-shell:\w]\$\[\033[0m\]
        #   shellPrompt = "\n\\[\\033[1;32m\\][nix-shell:\\w]\\$\\[\\033[0m\\] ";
        # shellPrompt = "[nix-shell]";
      };
    in
    inputs.iogx.mkFlake inputs flakeopts;


  nixConfig = {

    # Do not remove these two substitures, but add to them if you wish.
    extra-substituters = [
      "https://cache.iog.io"
      "https://cache.zw3rk.com"
    ];

    # Do not remove these two public-keys, but add to them if you wish.
    extra-trusted-public-keys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "loony-tools:pr9m4BkM/5/eSTZlkQyRt57Jz7OMBxNSUiMC4FkcNfk="
    ];

    # Do not remove this: it's needed by haskell.nix.
    allow-import-from-derivation = true;
  };
}
