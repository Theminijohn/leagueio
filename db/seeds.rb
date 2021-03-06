# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['registered', 'banned', 'moderator', 'admin'].each do |role|
	Role.find_or_create_by_name role
end

Tag.delete_all
Tag.create([
						{ cat_id: 1, name: 'aatrox' },
						{ cat_id: 1, name: 'ahri' },
						{ cat_id: 1, name: 'akali' },
						{ cat_id: 1, name: 'alistar' },
						{ cat_id: 1, name: 'amumu' },
						{ cat_id: 1, name: 'anivia' },
						{ cat_id: 1, name: 'annie' },
						{ cat_id: 1, name: 'ao-shin'},
						{ cat_id: 1, name: 'ashe' },
						{ cat_id: 1, name: 'blitzcrank' },
						{ cat_id: 1, name: 'brand' },
						{ cat_id: 1, name: 'caitlyn' },
						{ cat_id: 1, name: 'cassiopeia' },
						{ cat_id: 1, name: "cho'gath" },
						{ cat_id: 1, name: 'corki' },
						{ cat_id: 1, name: 'darius' },
						{ cat_id: 1, name: 'diana' },
						{ cat_id: 1, name: 'dr-mundo' },
						{ cat_id: 1, name: 'draven' },
						{ cat_id: 1, name: 'elise' },
						{ cat_id: 1, name: 'evelynn' },
						{ cat_id: 1, name: 'ezreal' },
						{ cat_id: 1, name: 'fiddlesticks' },
						{ cat_id: 1, name: 'fiora' },
						{ cat_id: 1, name: 'fizz' },
						{ cat_id: 1, name: 'galio' },
						{ cat_id: 1, name: 'gangplank' },
						{ cat_id: 1, name: 'garen' },
						{ cat_id: 1, name: 'gragas' },
						{ cat_id: 1, name: 'graves' },
						{ cat_id: 1, name: 'hecarim' },
						{ cat_id: 1, name: 'heimerdinger' },
						{ cat_id: 1, name: 'irelia' },
						{ cat_id: 1, name: 'janna' },
						{ cat_id: 1, name: 'jarvan-iv' },
						{ cat_id: 1, name: 'jax' },
						{ cat_id: 1, name: 'jayce' },
						{ cat_id: 1, name: 'jinx'},
						{ cat_id: 1, name: 'karma' },
						{ cat_id: 1, name: 'karthus' },
						{ cat_id: 1, name: 'kassadin' },
						{ cat_id: 1, name: 'katarina' },
						{ cat_id: 1, name: 'kayle' },
						{ cat_id: 1, name: 'kennen' },
						{ cat_id: 1, name: "kha'zix" },
						{ cat_id: 1, name: "kog'maw" },
						{ cat_id: 1, name: 'leblanc' },
						{ cat_id: 1, name: 'lee-sin' },
						{ cat_id: 1, name: 'leona' },
						{ cat_id: 1, name: 'lissandra' },
						{ cat_id: 1, name: 'lucian' },
						{ cat_id: 1, name: 'lulu' },
						{ cat_id: 1, name: 'lux' },
						{ cat_id: 1, name: 'malphite' },
						{ cat_id: 1, name: 'malzahar' },
						{ cat_id: 1, name: 'maokai' },
						{ cat_id: 1, name: 'master-yi' },
						{ cat_id: 1, name: 'miss-fortune' },
						{ cat_id: 1, name: 'mordekaiser' },
						{ cat_id: 1, name: 'morgana' },
						{ cat_id: 1, name: 'nami' },
						{ cat_id: 1, name: 'nasus' },
						{ cat_id: 1, name: 'nautilus' },
						{ cat_id: 1, name: 'nidalee' },
						{ cat_id: 1, name: 'nocturne' },
						{ cat_id: 1, name: 'nunu' },
						{ cat_id: 1, name: 'olaf' },
						{ cat_id: 1, name: 'orianna' },
						{ cat_id: 1, name: 'pantheon' },
						{ cat_id: 1, name: 'poppy' },
						{ cat_id: 1, name: 'quinn' },
						{ cat_id: 1, name: 'rammus' },
						{ cat_id: 1, name: 'renekton' },
						{ cat_id: 1, name: 'rengar' },
						{ cat_id: 1, name: 'riven' },
						{ cat_id: 1, name: 'rumble' },
						{ cat_id: 1, name: 'ryze' },
						{ cat_id: 1, name: 'sejuani' },
						{ cat_id: 1, name: 'shaco' },
						{ cat_id: 1, name: 'shen' },
						{ cat_id: 1, name: 'shyvana' },
						{ cat_id: 1, name: 'singed' },
						{ cat_id: 1, name: 'sion' },
						{ cat_id: 1, name: 'sivir' },
						{ cat_id: 1, name: 'skarner' },
						{ cat_id: 1, name: 'sona' },
						{ cat_id: 1, name: 'soraka' },
						{ cat_id: 1, name: 'swain' },
						{ cat_id: 1, name: 'syndra' },
						{ cat_id: 1, name: 'talon' },
						{ cat_id: 1, name: 'taric' },
						{ cat_id: 1, name: 'teemo' },
						{ cat_id: 1, name: 'thresh' },
						{ cat_id: 1, name: 'tristana' },
						{ cat_id: 1, name: 'trundle' },
						{ cat_id: 1, name: 'tryndamere' },
						{ cat_id: 1, name: 'twisted-fate' },
						{ cat_id: 1, name: 'twitch' },
						{ cat_id: 1, name: 'udyr' },
						{ cat_id: 1, name: 'urgot' },
						{ cat_id: 1, name: 'varus' },
						{ cat_id: 1, name: 'vayne' },
						{ cat_id: 1, name: 'veigar' },
						{ cat_id: 1, name: 'vi' },
						{ cat_id: 1, name: 'viktor' },
						{ cat_id: 1, name: 'vladimir' },
						{ cat_id: 1, name: 'volibear' },
						{ cat_id: 1, name: 'warwick' },
						{ cat_id: 1, name: 'wukong' },
						{ cat_id: 1, name: 'xerath' },
						{ cat_id: 1, name: 'xin-zhao' },
						{ cat_id: 1, name: 'yorick' },
						{ cat_id: 1, name: 'zac' },
						{ cat_id: 1, name: 'zed' },
						{ cat_id: 1, name: 'ziggs' },
						{ cat_id: 1, name: 'zilean' },
						{ cat_id: 1, name: 'zyra' },
						{ cat_id: 2, name: 'abyssal-scepter' },
						{ cat_id: 2, name: 'aegis-of-the-legion' },
						{ cat_id: 2, name: 'summoners rift' },
						{ cat_id: 2, name: 'amplifying-tome' },
						{ cat_id: 2, name: "archangel's-staff" },
						{ cat_id: 2, name: "athene's-unholy-grail" },
						{ cat_id: 2, name: "atma's-impaler"},
						{ cat_id: 2, name: "augment-death"},
						{ cat_id: 2, name: "augment-gravity"},
						{ cat_id: 2, name: "augment-power"},
						{ cat_id: 2, name: "avarice-blade"},
						{ cat_id: 2, name: "bf-sword"},
						{ cat_id: 2, name: "banner-of-command"},
						{ cat_id: 2, name: "banshee's-veil"},
						{ cat_id: 2, name: "berserker's-greaves"},
						{ cat_id: 2, name: "bilgewater-cutlass"},
						{ cat_id: 2, name: "blackfire-torch"},
						{ cat_id: 2, name: "blade-of-the-ruined-king"},
						{ cat_id: 2, name: "blasting-wand"},
						{ cat_id: 2, name: "bonetooth-necklace"},
						{ cat_id: 2, name: "boots-of-mobility"},
						{ cat_id: 2, name: "boots"},
						{ cat_id: 2, name: "boots-of-swiftness"},
						{ cat_id: 2, name: "brawler's-gloves"},
						{ cat_id: 2, name: "catalyst-the-protector"},
						{ cat_id: 2, name: "chain-vest"},
						{ cat_id: 2, name: "chalice-of-harmony"},
						{ cat_id: 2, name: "cloak-of-agility"},
						{ cat_id: 2, name: "cloth-armor"},
						{ cat_id: 2, name: "crystalline-flask"},
						{ cat_id: 2, name: "dagger"}, 
						{ cat_id: 2, name: "deathfire-grasp"},
						{ cat_id: 2, name: "doran's-blade"},
						{ cat_id: 2, name: "doran's-ring"},
						{ cat_id: 2, name: "doran's-shield"},
						{ cat_id: 2, name: "eleisa's-miracle"},
						{ cat_id: 2, name: "elixir-of-brilliance"},
						{ cat_id: 2, name: "elixir-of-fortitude"},
						{ cat_id: 2, name: "emblem-of-valor"},
						{ cat_id: 2, name: "enchantment-alacrity"},
						{ cat_id: 2, name: "enchantment-captain"},
						{ cat_id: 2, name: "enchantment-distortion"},
						{ cat_id: 2, name: "enchantment-furor"},
						{ cat_id: 2, name: "enchantment-homeguard"},
						{ cat_id: 2, name: "entropy"},
						{ cat_id: 2, name: "executioner's-calling"},
						{ cat_id: 2, name: "explorer's-ward"},
						{ cat_id: 2, name: "faerie-charm"},
						{ cat_id: 2, name: "fiendish-codex"},
						{ cat_id: 2, name: "frozen-heart"},
						{ cat_id: 2, name: "frozen-mallet"},
						{ cat_id: 2, name: "giant's-belt"},
						{ cat_id: 2, name: "glacial-shroud"},
						{ cat_id: 2, name: "grez's-spectral-lantern"},
						{ cat_id: 2, name: "guardian-angel"},
						{ cat_id: 2, name: "guardian's-horn"},
						{ cat_id: 2, name: "guinsoo's-rageblade"},
						{ cat_id: 2, name: "haunting-guise"},
						{ cat_id: 2, name: "head-of-kha'zix"},
						{ cat_id: 2, name: "health-potion"},
						{ cat_id: 2, name: "hexdrinker"},
						{ cat_id: 2, name: "hextech-gunblade"},
						{ cat_id: 2, name: "hextech-revolver"},
						{ cat_id: 2, name: "hextech-sweeper"},
						{ cat_id: 2, name: "hunter's-machete"},
						{ cat_id: 2, name: "iceborn-gauntlet"},
						{ cat_id: 2, name: "ichor-of-illumination"},
						{ cat_id: 2, name: "ichor-of-rage"},
						{ cat_id: 2, name: "infinity-edge"},
						{ cat_id: 2, name: "ionian-boots-of-lucidity"},
						{ cat_id: 2, name: "kage's-lucky-pick"},
						{ cat_id: 2, name: "kindlegem"},
						{ cat_id: 2, name: "kitae's-bloodrazor"},
						{ cat_id: 2, name: "last-whisper"},
						{ cat_id: 2, name: "liandry's-torment"},
						{ cat_id: 2, name: "lich-bane"},
						{ cat_id: 2, name: "locket-of-the-iron-solari"},
						{ cat_id: 2, name: "long-sword"},
						{ cat_id: 2, name: "madreds-razors"},
						{ cat_id: 2, name: "mana-manipulator"},
						{ cat_id: 2, name: "mana-potion"},
						{ cat_id: 2, name: "manamune"},
						{ cat_id: 2, name: "maw-of-malmortius"},
						{ cat_id: 2, name: "mejai's-soulstealer"},
						{ cat_id: 2, name: "mercurial-scimitar"},
						{ cat_id: 2, name: "mercury's-treads"},
						{ cat_id: 2, name: "mikael's-crucible"},
						{ cat_id: 2, name: "moonflair-spellblade"},
						{ cat_id: 2, name: "morellonomicon"},
						{ cat_id: 2, name: "muramana"},
						{ cat_id: 2, name: "nashor's-tooth"},
						{ cat_id: 2, name: "needlessly-large-rod"},
						{ cat_id: 2, name: "negatron-cloak"},
						{ cat_id: 2, name: "ninja-tabi"},
						{ cat_id: 2, name: "null-magic-mantle"},
						{ cat_id: 2, name: "odyn's-veil"},
						{ cat_id: 2, name: "ohmwrecker"},
						{ cat_id: 2, name: "oracle's-elixir"},
						{ cat_id: 2, name: "oracle's-extract"},
						{ cat_id: 2, name: "orb-of-winter"},
						{ cat_id: 2, name: "overlord's-bloodmail"},
						{ cat_id: 2, name: "phage"},
						{ cat_id: 2, name: "phantom-dancer"},
						{ cat_id: 2, name: "philosopher's-stone"},
						{ cat_id: 2, name: "pickaxe"},
						{ cat_id: 2, name: "poro-snax"},
						{ cat_id: 2, name: "prospector's-blade"},
						{ cat_id: 2, name: "prospector's-ring"},
						{ cat_id: 2, name: "quicksilver-sash"},
						{ cat_id: 2, name: "rabadon's-deathcap"},
						{ cat_id: 2, name: "randuin's-omen"},
						{ cat_id: 2, name: "ravenous-hydra"},
						{ cat_id: 2, name: "recurve-bow"},
						{ cat_id: 2, name: "rejuvenation-bead"},
						{ cat_id: 2, name: "rod-of-ages"},
						{ cat_id: 2, name: "ruby-crystal"},
						{ cat_id: 2, name: "ruby-sightstone"},
						{ cat_id: 2, name: "runaan's-hurricane"},
						{ cat_id: 2, name: "rylai's-crystal-scepter"},
						{ cat_id: 2, name: "sanguine-blade"},
						{ cat_id: 2, name: "sapphire-crystal"},
						{ cat_id: 2, name: "seekers-armguard"},
						{ cat_id: 2, name: "seraphs-embrace"},
						{ cat_id: 2, name: "shard-of-true-ice"},
						{ cat_id: 2, name: "sheen"},
						{ cat_id: 2, name: "shurelya's-reverie"},
						{ cat_id: 2, name: "sight-ward"},
						{ cat_id: 2, name: "sight-stone"},
						{ cat_id: 2, name: "sorcerer's-shoes"},
						{ cat_id: 2, name: "spectre's-cowl"},
						{ cat_id: 2, name: "spirit-stone"},
						{ cat_id: 2, name: "spirit-visage"},
						{ cat_id: 2, name: "spirit-of-the-ancient-golem"},
						{ cat_id: 2, name: "spirit-of-the-elder-lizard"},
						{ cat_id: 2, name: "spirit-of-the-spectral-wraith"},
						{ cat_id: 2, name: "statikk-shiv"},
						{ cat_id: 2, name: "stinger"},
						{ cat_id: 2, name: "sunfire-cape"},
						{ cat_id: 2, name: "sword-of-the-divine"},
						{ cat_id: 2, name: "sword-of-the-occult"},
						{ cat_id: 2, name: "tear-of-goddess"},
						{ cat_id: 2, name: "the-black-cleaver"},
						{ cat_id: 2, name: "the-bloodthirster"},
						{ cat_id: 2, name: "the-brutalizer"},
						{ cat_id: 2, name: "the-hex-core"},
						{ cat_id: 2, name: "the-lightbringer"},
						{ cat_id: 2, name: "thornmail"},
						{ cat_id: 2, name: "tiamat"},
						{ cat_id: 2, name: "total-biscuit-of-rejuvenation"},
						{ cat_id: 2, name: "trinity-force"},
						{ cat_id: 2, name: "twin-shadows"},
						{ cat_id: 2, name: "vampiric-scepter"},
						{ cat_id: 2, name: "vision-ward"},
						{ cat_id: 2, name: "void-staff"},
						{ cat_id: 2, name: "warden's-mail"},
						{ cat_id: 2, name: "warmog's-armor"},
						{ cat_id: 2, name: "will-of-the-ancients"},
						{ cat_id: 2, name: "wit's-end"},
						{ cat_id: 2, name: "wooglet's-witchcap"},
						{ cat_id: 2, name: "wriggle's-lantern"},
						{ cat_id: 2, name: "youmuu's-ghostblade"},
						{ cat_id: 2, name: "zeal"},
						{ cat_id: 2, name: "zeke's-herald"},
						{ cat_id: 2, name: "zephyr"},
						{ cat_id: 2, name: "zhonya's-hourglass"},
						{ cat_id: 3, name: 'crystal-scar' },
						{ cat_id: 3, name: 'howling-abyss' },
						{ cat_id: 3, name: 'summoners-rift' },
						{ cat_id: 3, name: 'twisted-treeline' },
						{ cat_id: 3, name: 'magma-chamber' },
						{ cat_id: 3, name: 'proving-grounds' },
						{ cat_id: 4, name: 'barrier' },
						{ cat_id: 4, name: 'clairvoyance' },
						{ cat_id: 4, name: 'clarity' },
						{ cat_id: 4, name: 'cleanse' },
						{ cat_id: 4, name: 'exhaust' },
						{ cat_id: 4, name: 'flash' },
						{ cat_id: 4, name: 'garrison' },
						{ cat_id: 4, name: 'ghost' },
						{ cat_id: 4, name: 'heal' },
						{ cat_id: 4, name: 'ignite' },
						{ cat_id: 4, name: 'revive' },
						{ cat_id: 4, name: 'smite' },
						{ cat_id: 4, name: 'teleport' }
					])