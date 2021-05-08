# PlayGOT

This is a simple CLI role-playing game based on the popular HBO series Game of Thrones. Select your own House, find your allies, conquer your enemies, and claim secret weapons along the way to help you take the throne! 
<img src="./GoT-demo-start.gif" alt="GoT-demo-start">

To win the Game of Thrones, one must:
```
1. Survive the Winter that sweeps through Westeros randomly.
2. Conquer all your enemies or turn them into your allies.
```
Some basic stats will influence one’s chances of winning, including:
```
stamina - % probability of surviving the Winter (a random event)
tactic - % probability of fleeing from an enemy
loyalty - % probability of getting an ally 
```
**Turning everyone into allies will be the quickest way to win.** Each additional ally increases your stamina by 5 percent. However, making allies also has risks. A failed negotiation might trigger a fight. And a lost fight will decrease stamina by 5 percent.

Of course, you are given a chance to escape before a fight begins. Your tactic is your chance of successfully fleeing from an enemy.

Fight is a simple game of Rock, Paper, Scissors. Best 3 out of 5. The winner takes over the loser’s Secret Weapon and gets one step closer to the throne.
Winter is a random event. Surviving it, you will continue the game. Otherwise, the game is over.

Secret Weapons are wild cards, each serving a unique, unspoken purpose.
<img src="./GoT-demo-win.gif" alt="GoT-demo-win">

## Demo
For a longer demo of the game, visit: https://sophieqgu.medium.com/play-got-a-cli-game-based-on-the-game-of-thrones-ruby-ab15c9193d37

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'play_GOT'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install play_GOT

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'sophieqgu'/play_GOT. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PlayGOT project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'sophieqgu'/play_GOT/blob/master/CODE_OF_CONDUCT.md).
