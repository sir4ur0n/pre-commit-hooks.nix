# let
#   flake = (import
#     (
#       let lock = builtins.fromJSON (builtins.readFile ./flake.lock); in
#       fetchTarball {
#         url = "https://github.com/edolstra/flake-compat/archive/${lock.nodes.flake-compat.locked.rev}.tar.gz";
#         sha256 = lock.nodes.flake-compat.locked.narHash;
#       }
#     )
#     { src = ./.; }
#   ).defaultNix;
# in
# flake.lib.${builtins.currentSystem} // flake.packages.${builtins.currentSystem}
(import (fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz") {
  src = ./.;
}).defaultNix
