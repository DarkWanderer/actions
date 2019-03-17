workflow "Test connection" {
  on = "push"
  resolves = ["Test"]
}

action "Test" {
  uses = "DarkWanderer/actions/ssh@master"
  args = ["echo Hello world!"]
  secrets = [
    "PRIVATE_KEY",
    "USER",
    "PORT",
    "HOST",
  ]
}
