{
  description = ''Canonical JSON according to RFC8785'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-canonicaljson-1_0_1.flake = false;
  inputs.src-canonicaljson-1_0_1.owner = "jackhftang";
  inputs.src-canonicaljson-1_0_1.ref   = "refs/tags/1.0.1";
  inputs.src-canonicaljson-1_0_1.repo  = "canonicaljson.nim";
  inputs.src-canonicaljson-1_0_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-canonicaljson-1_0_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-canonicaljson-1_0_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}