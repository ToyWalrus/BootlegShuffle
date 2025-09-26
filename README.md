# Bootleg Shuffle

A mod for [**Cassette Beasts**](https://www.cassettebeasts.com/) that lets you adjust how often bootleg tapes appear. For installation instructions, see [the Mod User Guide](https://wiki.cassettebeasts.com/wiki/Modding:Mod_User_Guide).

## Features

- Customize how often bootleg tapes appear in the game
- Adjust the rate at which individual elemental types will appear in bootlegs

## Usage / Configuration

> **Note:** This mod requires [Mod Utils](https://github.com/Yukitty/CassetteBeasts-modutils) to work properly. Make sure that mod is also installed before using.

In the game settings, navigate to the "Mods" setting page. You’ll find the configuration options for this mod there. The Bootleg rate slider controls how often spawned monsters are bootlegs. For example:
- At 100%, every monster will be a bootleg
- At 50%, about half of all monsters will be bootlegs

The subsequent sliders represent the probability that bootlegs of that elemental type will appear when a bootlegged monster spawns. Each type’s chance is relative to the others. By default, all types are set to 1, making them equally likely. Raising a value increases that type’s chance, lowering a value decreases it.

For example, setting the **Air** type to 2 while keeping everything else at 1 means an Air type is twice as likely to be chosen as a bootleg as any other individual type. Setting all types to 0 except for the **Plant** type means that every bootleg encountered will be a Plant type. If all the types have the same value, they are all equally likely to be selected as the bootleg type.

## Thanks

A big thanks to [Yukitty](https://github.com/Yukitty) and "David" for their work on the Mod Utils package that made developing this mod a breeze!

## Legal

This mod is published under the [MIT license](LICENSE).

[Cassette Beasts](https://www.cassettebeasts.com/) is developed by [Bytten Studio](https://bytten-studio.com/) and published by [Raw Fury](https://rawfury.com/).