{ pkgs ? import <nixpkgs> {} }:
let
  python-packages  = p: with p; [
    poetry
    pip
    pandas
    requests
    aiohttp
    python-whois
    sh
    ipython
    scipy
    numpy
    networkx
    click
    configobj

#    (
#      buildPythonPackage rec {
#        pname = "pip2nix";
#        version = "0.7.0";
#        src = fetchPypi {
#            inherit pname version;
#            sha256 = "sha256-7Jpx4JrH9DzHtsnThjhOt7XDMb9uoOcspVnYeXk5epU=";
#          };
#        doCheck = false;
#      }
#    )

#    (
#      buildPythonPackage rec {
#        pname = "nltk";
#        version = "3.8.1";
#        src = fetchPypi {
#            inherit pname version;
#            sha256 = "sha256-jqRsd8r0CneU0/m9/de6XzwZXXPevfQjrFuPm5O3gT8=";
#          };
#        doCheck = false;
#      }
#    )

#    (
#      buildPythonPackage rec {
#        pname = "textrank";
#        version = "0.1.0";
#        src = fetchPypi {
#            inherit pname version;
#            sha256 = "sha256-jqRsd8r0CneU0/m9/de6XzwZXXPevfQjrFuPm5O3gT8=";
#          };
#        doCheck = false;
#      }
#    )

  ];
  python-with-packages = pkgs.python310.withPackages python-packages;
in
pkgs.mkShell {
  name = "hugo-blog-with-nix";

  buildInputs = [
    pkgs.git
    pkgs.hugo
    python-with-packages
  ];
}

# Docs
# https://ryantm.github.io/nixpkgs/languages-frameworks/python/
