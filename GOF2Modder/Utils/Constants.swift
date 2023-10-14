//
//  Constants.swift
//  GOFModder
//
//  Created by BibiFire on 30/08/2023.
//

import Foundation

let trollStoreGuide: URL = URL(string: "https://github.com/FireBibi")!

var errorToShow: String = ""
var shouldDisplayError: Bool = false

var gof2BundleURL: URL? = nil
var backupDir: URL? = nil
var binPath: String? = nil
var tempPath: URL? = nil
var appInited: Bool = false

let terran: UInt32 = 0
let vossk: UInt32 = 1
let nivelian: UInt32 = 2
let midorian: UInt32 = 3

let starColourGreen: UInt32 = 0
let starColourOrange: UInt32 = 1
let starColourLightGreen: UInt32 = 2
let starColourPink: UInt32 = 3
let starColourLightLightGreen: UInt32 = 4
let starColourRed: UInt32 = 5
let starColourShinnyGreen: UInt32 = 6
let starColourYellow: UInt32 = 7
let starColourShinyBlue: UInt32 = 8
let starColourWhite: UInt32 = 9
let starColourShinyOrange: UInt32 = 11
let starColourLightBlue: UInt32 = 12
let starColourSmallShinyGreen: UInt32 = 13
let starColourSmallGreen: UInt32 = 14
let starColourRedOrange: UInt32 = 15
let starColourShinnyYellow: UInt32 = 16
let starColourBigLightGreen: UInt32 = 17
let starColourPaleGreen: UInt32 = 18

let dangerousSystem: UInt32 = 0
let riskySystem: UInt32 = 1
let averageSystem: UInt32 = 2
let secureSystem: UInt32 = 3

struct Option {
    let value: UInt32
    let label: String
}

let shipNames: [String] = [
    "Betty",
    "Teneta",
    "Hiro",
    "Badger",
    "Dace",
    "Inflict",
    "Hector",
    "Anaan",
    "VoidX",
    "H''Soc",
    "Phantom",
    "Hernstein",
    "Type 43",
    "????",
    "????",
    "????",
    "Kinzer",
    "Ward",
    "Hatsuiki",
    "Nuyang II",
    "Cicero",
    "Aegir",
    "Groza",
    "Azov",
    "Velasco",
    "Tyrion",
    "Hera",
    "Taipan",
    "Veteran",
    "Mantis",
    "Berger CrossXT",
    "Salvéhn",
    "Wasp",
    "Furious",
    "Razor 6",
    "Night Owl",
    "Cormorant",
    "Cronus",
    "Typhon",
    "S''Kanarr",
    "Nemesis",
    "K''Suukk",
    "Vol Noor",
    "Wraith",
    "Specter",
    "Bloodstar",
    "Blue Fyre",
    "Gator Custom",
    "Amboss",
    "Scimitar",
    "????",
    "Rhino",
    "Gryphon",
    "????",
    "Na''srrk",
    "Groza Mk II",
    "Berger CS",
    "Kinzer RS",
    "Phantom XT",
    "Teneta R.E.D.",
    "Darkzov",
    "Ghost",
    "Dark Angel",
    "N''Tirrk",
    "????"
]

let stationsNames: [String] = [
    "Nehébru",
    "Mahasa",
    "Anesa",
    "Géhlon",
    "Posého",
    "Decimus",
    "Emisto",
    "Binon",
    "Taygete",
    "Coppolite",
    "Thynome",
    "S''porrk",
    "Ukka N''ima",
    "Ekrr U''rra",
    "K''ane",
    "T''rry T''rry",
    "N''arrki",
    "Me''tokka",
    "P''errka",
    "Ma''rrkka",
    "Kallsta Omba",
    "Euclades",
    "Dekato",
    "Psa Tori",
    "Sao Noma",
    "S''inokk",
    "F''err",
    "B''akka",
    "B''errokk",
    "Ga''kkrr",
    "Néhma",
    "Neso Aehma",
    "Duhnu",
    "Néh Suhnu",
    "Narsaxa",
    "Io Ombak",
    "Dendra Ekta",
    "Carme",
    "Nepis",
    "Tsoj Delev",
    "Valadon",
    "Ko-on",
    "Epigome",
    "Arpalys",
    "Isonoma",
    "Éhna",
    "Himo",
    "Bosméh",
    "Sahi",
    "Siaméh",
    "P''arrenkk",
    "Rr''ostam",
    "G''ukkion",
    "Ba''rrtu",
    "K''mirkk",
    "Kappa",
    "Suttnar",
    "Tornard",
    "B''akrram",
    "E''kkide",
    "Kkit S''ukk",
    "L''ikirr",
    "Makke S''ik",
    "A''rk Oomk",
    "Bak W''ok",
    "Lopat",
    "Inari Onu",
    "Orcon",
    "Sorox",
    "Oni",
    "Dis",
    "Unotok",
    "Zepar",
    "Lon Nion",
    "Kanado",
    "Deuter IV",
    "Yrdal Gedal",
    "Heinsten",
    "Var Hastra",
    "Kernstal",
    "Kumppa",
    "Teres",
    "Plural Z",
    "Marktesh",
    "Urda Arcturius",
    "Genoh",
    "Hamina",
    "Geséhn",
    "Aoéh",
    "Ahma Ésoh",
    "Festus",
    "Dima",
    "Fejar",
    "Maissa",
    "Sobotnik",
    "Gome C",
    "Kalun Amir",
    "Nyrand",
    "Alioth",
    "Damarque I",
    "Kothar",
    "Valkyrie",
    "Scion",
    "Coromesk",
    "Nosdron",
    "Var Destro",
    "Sao Perula",
    "Quineros",
    "Kaamo",
    "Naneroh",
    "Valpatro",
    "Luur",
    "Var Lupra",
    "Tadram",
    "Midantha",
    "Tergalon",
    "Psa Leri",
    "Merlur",
    "Sao Laros",
    "Lan Manéh",
    "Katashán",
    "Névan",
    "Okana",
    "Shelén",
    "Vu''s",
    "Bor M''okk",
    "Bak S''ondorr",
    "Kan''Tarr",
    "M''Ankk",
    "Va''lerrm",
    "O''muarkk",
    "Bra''Murr",
    "Bervegor",
    "Merxde",
    "Selbah",
    "????"
]


let systemsNames: [String] = [
    "Suteo",
    "Pan",
    "Behén",
    "V'ikka",
    "Eanya",
    "S'kolptorr",
    "Wolf-Reiser",
    "Aquila",
    "Buntta",
    "Weymire",
    "Y'mirr",
    "Union",
    "Oom'bak",
    "Vulpes",
    "Magnetar",
    "Mido",
    "Prospero",
    "Nesla",
    "Pescal Inartu",
    "Augmenta",
    "K'ontrr",
    "Ni'mrrod",
    "Beidan",
    "Herjaza",
    "Skavac",
    "Loma",
    "Shima",
    "Ginoya",
    "Talidor",
    "Paréah",
    "Me'enkk",
    "Wah'norr",
    "Skor Terpa",
    "Alda",
    "????"
]

let itemNames: [String] = [
    "Nirai Impulse EX ",
    "Nirai Impulse EX ",
    "Nirai Charged Pulse",
    "V''skorr",
    "Sh''koom",
    "Berger Focus I",
    "Berger Focus II A",
    "Berger Retribution",
    "Berger Converge IV",
    "M A \"Wolf\"",
    "M A \"Cougar\"",
    "M A \"Wolverine\"",
    "N''saan",
    "K''booskk",
    "Sh''gaal",
    "H''nookk",
    "Luna EMP Mk I",
    "Sol EMP Mk II",
    "Dia EMP Mk III",
    "Gram Blaster",
    "Ridil Blaster",
    "Tyrfing Blaster",
    "Micro Gun MK I",
    "Micro Gun MKII",
    "MJ Railgun",
    "MJ Railgun",
    "Scram Cannon",
    "Mass Driver MD ",
    "Thermic o",
    "ReHeat o",
    "MaxHeat o",
    "G''liissk",
    "Jet Rocket",
    "Amour Rocket",
    "EMP Rocket Mk I",
    "EMP Rocket Mk II",
    "Edo",
    "Intelli Jet",
    "S''koonn",
    "Mamba EMP",
    "Dephase EMP",
    "EMP GL I",
    "EMP GL II",
    "EMP GL DX",
    "AMR Tormentor",
    "AMR Oppressor",
    "AMR Extinctor",
    "Hammerhead D",
    "Hammerhead DA",
    "L''ksaar",
    "Targe Shield",
    "Riot Shield",
    "H''Belam",
    "Beamshield II",
    "Fluxed Matter Shield",
    "E Exoclad",
    "E Ultra Lamina",
    "E D-X Plating",
    "D''iol",
    "T''yol",
    "AMR Saber",
    "Neétha EMP",
    "Ksann''k",
    "ZMI Optistore",
    "Autopacker ",
    "Ultracompact",
    "Shrinker BT",
    "Rhoda Blackhole",
    "AB- \"Retractor\"",
    "AB- \"Glue Gun\"",
    "AB- \"Kingfisher\"",
    "Linear Boost",
    "Cyclotron Boost",
    "Synchrotron Boost",
    "Me''al",
    "Ketar Repair Bot",
    "Static Thrust",
    "Pendular Thrust",
    "D''ozzt Thrust",
    "Mp''zzzm Thrust",
    "Pulsed Plasma Thrust",
    "Telta Quickscan",
    "Telta Ecoscan",
    "Hiroto Proscan",
    "Hiroto Ultrascan",
    "Khador Drive",
    "IMT Extract .",
    "IMT Extract .",
    "K''yuul",
    "IMT Extract﻿ .X",
    "Gunant''s Drill",
    "Small Cabin",
    "Medium Cabin",
    "Large Cabin",
    "Sight Suppressor II",
    "U''tool",
    "Yin Co. Shadow Ninja",
    "Drinking Water",
    "Medical Supplies",
    "Space Waste",
    "Artifacts",
    "Rare Animals",
    "Rare Plants",
    "Drugs",
    "Luxury",
    "Premium Food",
    "Basic Food",
    "Organs",
    "Vossk Organs",
    "Buskat",
    "Collectible Figure",
    "Digital Watch",
    "Towels",
    "Implants",
    "Explosives",
    "Documents",
    "Secure Cabin/Container",
    "Secure Cabin/Container",
    "Electronics",
    "Chemicals",
    "Plastics",
    "Nanotech",
    "Energy Cells",
    "Biowaste",
    "Radioactive Goods",
    "Mechanical Supplies",
    "Noble Gas",
    "Microchips",
    "Com. Devices",
    "Optics",
    "Hydraulics",
    "Alien Remains",
    "Suteo Liqueur",
    "Pan Whiskey",
    "Behén Wine",
    "V''ikka Moonshine",
    "Eanya Tonic",
    "S''kolptorr Rum",
    "Wolf-Reiser Brandy",
    "Aquila Cocktail",
    "Buntta Apéritif",
    "Weymire Punch",
    "Y''mirr Schnapps",
    "Union Draught",
    "Oom''bak Gin",
    "Vulpes Soup",
    "Magnetar Juice",
    "Mido Distillate",
    "Prospero Flip",
    "Nesla Brandy",
    "Pescal Inartu Brew",
    "Augmenta Fizz",
    "K''ontrr Dishwater",
    "Ni''mrrod Muck",
    "Gold",
    "Titanium",
    "Iron",
    "Orichalzine",
    "Pyresium",
    "Sodil",
    "Doxtrite",
    "Cesogen",
    "Perrius",
    "Hypanium",
    "Void Crystals",
    "Golden Core",
    "Titanium Core",
    "Iron Core",
    "Orichalzine Core",
    "Pyresium Core",
    "Sodil Core",
    "Doxtrite Core",
    "Cesogen Core",
    "Perrius Core",
    "Hypanium Core",
    "Void Essence",
    "Nirai .AS",
    "Berger FlaK -",
    "Icarus Heavy AS",
    "Liberator",
    "Berger AGT mm",
    "Skuld AT XR",
    "HH-AT \"Archimedes\"",
    "Disruptor Laser",
    "Rhoda Vortex",
    "Emergency System",
    "Nirai Overdrive",
    "Nirai Overcharge",
    "Ketar Repair Bot II",
    "Signature",
    "Signature",
    "Signature",
    "Signature",
    "SunFire o",
    "AB- \"Octopus\"",
    "Polytron Boost",
    "Spectral Filter SA-",
    "Ion Lambda MK",
    "PE Proton",
    "PE Ambipolar-",
    "PE Fusion H",
    "Blue Plasma",
    "Green Plasma",
    "Purple Plasma",
    "Red Plasma",
    "Gamma Shield",
    "Gamma Shield II",
    "Nirai SPP-C",
    "Nirai SPP-M",
    "K''mirrk Toad Mutagen",
    "Chromo Plasma",
    "Berger SG-",
    "Berger SG-",
    "T''Suum",
    "Shesha",
    "Garuda-IV",
    "Patala",
    "Novanium",
    "Novanium Core",
    "Spectral Filter ST-X",
    "Spectral Filter Omega",
    "Ion Lambda MK",
    "Crimson Drain",
    "Pandora Leech",
    "Matador TS",
    "Particle Shield",
    "Shock Blast",
    "Phoenix SIS",
    "M A \"Raccoon\"",
    "Dark Matter Laser",
    "Mass Driver MD",
    "Mimung Blaster",
    "Fireworks",
    "???"
]

enum Endianness {
    case LITTLE
    case BIG
}