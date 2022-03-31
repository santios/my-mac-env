inputs:
final: prev:
{
  myMacEnv = with final; prev.buildEnv {
    name = "myMacEnv";
    paths = [
      commonEnv
    ];
  };
}
