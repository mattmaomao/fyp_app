'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "37845ff9df6e8af1898015c7f28681aa",
".git/config": "2d5a9db7e49a7a2bea45d47a8a070f8b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "f54af07a86c60ea69cb6e75dc05c9e48",
".git/HEAD": "013f073889cb8d3d23aea2663408e9d8",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "b9955ad2a3b7c7b4db36e66f8fd12ea2",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e02dbb9793af988325317a1e31ae0ca4",
".git/logs/refs/heads/build": "184fed916fde43a85d30eeb3f52ed162",
".git/logs/refs/heads/main": "a6bcd64d17e20d59e5b881534c8b8d68",
".git/logs/refs/heads/matt_branch": "3446e420a64bf1861abff390453ee706",
".git/logs/refs/remotes/origin/build": "0fd36fe821faac61b663667d42f1c71c",
".git/logs/refs/remotes/origin/HEAD": "b94cd8692a2d9840ca1505309a20c807",
".git/logs/refs/remotes/origin/main": "0f9d74ce2c873e7d52d7dca72083d627",
".git/logs/refs/remotes/origin/matt_branch": "37c03a9ab19f93be99099da42dce2ba4",
".git/objects/00/51f571e4be0630034ccc1fdd8d7f2a8f4e1b1d": "8ee03e7bf04bde649ad508c122006725",
".git/objects/03/96d922acebaa3a591fd00c5f8a48c121c20d9c": "b124f8bce107a1e3b39f4154406d6d98",
".git/objects/04/67bf12aa4d28f374bb26596605a46dcbb3e7c8": "49dba9cdefacac2602a7af98a656e661",
".git/objects/06/952be745f9fa6fa75196e830d9578eb2ee631d": "cb6848767aab99a89a4ec04efbc00625",
".git/objects/08/949d90ec04883e8f7d479c7f460ed8ccd7b311": "78a6d1b7df9ec34876876eed69c19812",
".git/objects/09/d4391482be68e9e4a07fab769b5de337d16eb1": "a603712ac5534497bc4fd35ebd46b0b7",
".git/objects/0a/3f5fa40fb3d1e0710331a48de5d256da3f275d": "15924b1217c401aba33f13069f7d81d5",
".git/objects/0a/91db52cfabcd26657c8ccf5664daec991a5f43": "531c5fd8903af40df39ddb8159c994e7",
".git/objects/0b/edcf2fd46788ae3a01a423467513ff59b5c120": "23a6b285e31cde5ab29a2fc1ebfdb935",
".git/objects/0c/3bb6dc3756d1c708badef39be151b22ef60542": "b132d8b85fcd259f88a5e03c04b775a9",
".git/objects/0d/2902135caece481a035652d88970c80e29cc7e": "dfc8c4c4b7d0a1b6dbadc04d9fa6e6f1",
".git/objects/0d/a935d36c20f09a0a82bd7c162095f54ade7f1f": "906eefbcbfe648cd3f47864427dbfc19",
".git/objects/0e/c303439225b78712f49115768196d8d76f6790": "383f775ddf0900dd9fe74e867c012ba4",
".git/objects/0f/364b43ab78757bd0e4fccf5a97848f6af0548b": "3283cc91e0d5bb79be194d28d79499e0",
".git/objects/0f/c344c7e8b9e32ea1ad91f30ded22556352d7bf": "a8a30f28869f7378465338066f34d80d",
".git/objects/10/646e948992df2d8e2023e258d12bf8375753b6": "9355a16c1e026338f32922514ba499c0",
".git/objects/10/974fa016d1d3be613a0d4755ca9f47acbb3fc2": "fdcc2f5bee392e0d7d310043ae50caf6",
".git/objects/13/3dc68c319b8de5983a1a079ca188ed46424e94": "4b1120d82f56e27a9a23cd0088b9bda0",
".git/objects/13/b35eba55c6dabc3aac36f33d859266c18fa0d0": "ccb5b80ef3b4fb1030a8a4f520f3f5e8",
".git/objects/14/8da3098986ea6c098d5a7b1f8e9cbf6b427b56": "9bfb32c54891d8b9226a37dddd010698",
".git/objects/17/987b79bb8a35cc66c3c1fd44f5a5526c1b78be": "f47de426b1d6c272d2659c734c9de80f",
".git/objects/17/e9516a74074fad22bac3e52e39131886697622": "2cccf0b2cd7b787a1f969f9552b76de3",
".git/objects/18/4c85fb60605018429c46b2a8028cbc34a7fcac": "dc86a6193ef13f8296b2d5b760598ded",
".git/objects/18/d981003d68d0546c4804ac2ff47dd97c6e7921": "318597cf2655c5770342bae4ab7b90a3",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/1a/b147d3979adb6dec658e3b27981ef989dc8d02": "cacb21dc673f9f24fbd7d569ae17f70b",
".git/objects/1b/1e43f9a5acfd18b80ec04e4f0dc0c6b7c0b487": "36b289a17c1ec89ff97da643fc95df6b",
".git/objects/1b/8c3df16a9efb0b7c656366dee63416797033ff": "4d05aeb2fc7c28ab31d9252b28e329f1",
".git/objects/1c/4cfdd96a89b0095dbd29a6ca194e41ad77b4fd": "941033f2f51333a5217c535046bbd8e2",
".git/objects/1d/526a16ed0f1cd0c2409d848bf489b93fefa3b2": "12bcdfd9683b55567627456d0773a4e5",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/1f/6a70226b794053c166b4f7f4ae12fa5f545e67": "6cbaa97307d6ed3319f3174677a993af",
".git/objects/1f/75425069d3fb86c9291be3ab91c45c75dc00e5": "c54e14a95d5fcf4ffe3284852a1af5df",
".git/objects/1f/b4ca78b43ae5555ebdea3d9267b85fae017693": "da420a802ea911ffca1038b138651ef9",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/5a536ba156ecc22b55b593640b4f58807020e5": "d60c5bc14657550002f0bef3dec9468d",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/21/6170be802f232af7861985ae846cf008a2c047": "90072211e38a80be1aa3742c23593871",
".git/objects/21/876b2d6926f85320ec5ee26268a18e8edc87bb": "0b90fcfbec0d1a45f4aa2ccea1007e9a",
".git/objects/21/f50c39a6b4fc4b124d2ca3ae699e922293923b": "f293e32e37759d3c7ae4edb2ff6b53c7",
".git/objects/22/c4462b79288fe10768cc571a36732ce5726025": "3e3cf5fc8864e978934ad77759390731",
".git/objects/22/f3597156042ae583010263e1b95e4f266da017": "0e450a3bd98d6303ee3975c13ca2f9da",
".git/objects/23/7f7e3daaf1b0067897f6c6467b2e62949b0a1d": "b1cdad2da58dc4a12b534d640604608b",
".git/objects/25/786b2d10f38914b2ccd7516e712e22c22084c7": "efc087a35deddf50051816a5445e5a2f",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/25/978fe37f12fa78ffa95104109e39e32d2b4116": "06b21db126368551caf3e87dfa52381a",
".git/objects/26/78650b638966ef6d4467ef19fc05da06dfd534": "9d34a527dcd66c9d74d4577ddf1d1387",
".git/objects/26/d5c3a627972bbdcdda42f9427d53d52fae0380": "b3e173c00a2180b79a1c69425a6f4fb0",
".git/objects/28/25e73a74f40e92720817bf1a5a60e0a6763b2e": "85b03673ae1694a7d62487093c6733d4",
".git/objects/29/a3a5017f048d6d8e6a450eef64435ddee44fb7": "45542fd7e689386f166eed136e1ad478",
".git/objects/2e/1de87a7eb61e17463f7406106f6c413533cecf": "f4970286a19c04f87217910d26430ddf",
".git/objects/2f/1632cfddf3d9dade342351e627a0a75609fb46": "eebc09df6f2f2370e95a1eb0bc1fb2c5",
".git/objects/30/1cb02cd0227898a395ceaa977036abd38c3e49": "2136579ce875ec332e12be49af69dae4",
".git/objects/30/4732f8842013497e14bd02f67a55f2614fb8f7": "76eb293b5c9304707852ee681a90e8fc",
".git/objects/30/8a2a560b42f17aaf3c36e4e9c8cd07182fbb7e": "bc183808cfc617fa9474743616eb4aee",
".git/objects/31/2070a00d2ba195ec2db7df53ac55388bf1f5c6": "ca2374d35c5be449e1152a221db07da1",
".git/objects/31/ae59e4944c386a8e4cceb3e8dc499126868946": "65d934e7fdc0a65564a2d1134065db11",
".git/objects/31/ef28545eda4901b69d5aa835d55586f807426d": "665405a96fa3a2399989acdcc4f77218",
".git/objects/32/1773cd857a8a0f0c9c7d3dc3f5ff4fb298dc10": "aa6f1636c8ce237c3c416d222abf03da",
".git/objects/32/6c0e72c9d820600887813b3b98d0dd69c5d4e8": "3030e2c76fcd41356672eee54ca3bd94",
".git/objects/33/4c9341cb93211d9c850797cfa86552eff5e391": "af2e639541318e0f90ad38eac06fda18",
".git/objects/34/7139c48727d4f32a2b9bac862fb4793356cc63": "f12c4e44afc2ef65f4df0d401fdf25b5",
".git/objects/35/29b0c7215ff167ea14136c88f8ad8b74516f55": "c54b929898534fc940602cf4e2f4285d",
".git/objects/35/c971c6d79938b5e8d9d4d047951088a04b80a0": "26434374acc7b9b904256a115e75c65e",
".git/objects/36/2815c7367fe87e3f7b1082225df7bb3493e20f": "426ed87e7a7f4c33edc74f19cd561b8b",
".git/objects/36/b0fd9464f45b33f482e64bea579787e142affa": "9d308f3efbc512e2b01277fb7565acef",
".git/objects/36/c78245c9ad88d3a878bb48a2d62df4fefe45cc": "1a389be60c7bad7765f1337b3f00cd70",
".git/objects/36/cbce676bcfbddfa689b9d0abf23ac40fd2e60b": "8c963983d40f36e775abdac45c7810e0",
".git/objects/38/79d54755798567f0f318d63340508d5668eb96": "cfe50cd405acbf1c250baa58cfe6b9ed",
".git/objects/38/adff572fc99d2d2c955d1630706dad3b4cf1c5": "b7cfd506b6a7a489cf9d9056e46ee344",
".git/objects/39/4917c053a04daa76d8b94f0a02db0bd99e1034": "bbdd537b090d83597a791f77deacff5c",
".git/objects/39/9f6981d5d35475eb18e6068ae67cdd7c731978": "d78434eb583745d7bf880eb7c4b9f3e2",
".git/objects/39/af3c651a459e6b495d7a3ac3215e67f52641df": "4854ace1fdb6bdffd2a44caa53249754",
".git/objects/3a/0b46511a71b464dac72d693faae6ea0f7e3b2e": "351d4fd0e3a9a4bc304d0a579290669b",
".git/objects/3a/753738515dea6f8128318fe6aa9401147d5b8c": "e1b8d6cf0b12fcfb77cd22c63e3fa6dd",
".git/objects/3a/d837c8d95fd1f874b32ddd1b367de476260c31": "46c79170bd86deb9383baa2483ea0175",
".git/objects/3a/f93b882364ddc13fefa4826038d2c851bf5ea1": "e87d124937e3bd3d761e6be5e6312868",
".git/objects/3b/136dbdc1b445fdbca0af19a78990a3b993fb0c": "f60223c66b1bbaa09d81a4c2956a8baf",
".git/objects/3b/5b324f6e3f162acfb54a7c423f4566fe04bae1": "d4a88acf42bef05f8f6f0a2315d91a18",
".git/objects/3c/c05eb23491684aae1c51ce94668a142bad5125": "d7b0579a2c9bbcd5f15d386f2b10ecbd",
".git/objects/3d/f3d1a91dec9f419bbf32c7dbd7ffe3049577b7": "2da7aed2720fec500109845fe6130ee3",
".git/objects/3e/93413b1348f80307d986c7d9d2c3ff755ff610": "813858e141a159f2d7799c2f02550bea",
".git/objects/40/59527a24ce526396900f41200a79725a071b5c": "48663821f9052f82dbac4a0fbaf5d3de",
".git/objects/41/dffd916c819ce639f0636e55bb4082214acca3": "34adfc33311d3bfdfe5547bb15f7b79f",
".git/objects/41/ee1e24ce16db182d619b9fc44491007b6d923b": "5e403430dd67ec35031499cd25e5e702",
".git/objects/42/bcbf4780b187e80025b7917058bcb882012aa1": "d13c60a94845ee93e5124ec90980bb48",
".git/objects/43/063783b54909177490a55b709d70d8598ac7a3": "fd93e6dae976fbbdbd55e3cc8d4b4c4a",
".git/objects/44/34346ee9ce53c5e4ab2aa5eaa180db7776dc76": "799d82814847d15284731e10641a3747",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/46/b726bd53d47e61ba941eb355b9c8633ebbaa20": "480b1cf7af4c452e5722818c06aca052",
".git/objects/46/fb4725f84075c250b678484c71f29c3e0d9c85": "8bac9e144c769dbb67300d18a165db8d",
".git/objects/47/26a29f047ab8ef71073c87dcc05f0e445d3bc6": "5e84ea5d56e9dee5b76dd854bf3767e0",
".git/objects/47/89daa6a443eefa7f3f729164a18351e06e9800": "3c2dcd6a17cdfc0957293d41ef712d24",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/4a/44a293fdfc8cef28468b4b62d0da4303f2b0e8": "0947e3ad3229f2bd7a80534e944c54e1",
".git/objects/4b/b2aef28065a6f5d78c405feb98cc94afb54c6a": "6a8e6f9793e1b2a37c48f9fc98aaed90",
".git/objects/4b/e0423544051e641c92362746260e84f2a13fce": "0aee4d072e1ed5976905772e4f0ab3ce",
".git/objects/4c/d7b0099ca80c806f8fe495613e8d6c69460d76": "171b7f459d8f957102dab0e55cc51039",
".git/objects/4c/fcd01e672e8eb71cfb232254cdca108cad1d88": "4ceaeb5703f73fec167b38c1270ad83e",
".git/objects/4d/1de0b49f4f86c5209b47db3c7039176be07b7c": "d37f4881ab8a44f02684948d4c9281bb",
".git/objects/4d/6372eebdb28e45604e46eeda8dd24651419bc0": "1a6a714da9180a4b75ff188c6eb0514f",
".git/objects/4e/920449d81991e4d45908c19038447c3cff7f01": "063c0bdc6603f188397832382b6e2bc9",
".git/objects/4f/6c15941a921846ef98cadec1573beb4b823ea7": "948312d534b37cb97b372952eb73c517",
".git/objects/50/2f463a9bc882b461c96aadf492d1729e49e725": "b4ba046789856764dffa013b321284b3",
".git/objects/50/318c62ff0ed0c5eb5988ba4b3d13cbeb90483c": "43a679e1f39af1d3d107b0d09259cd35",
".git/objects/50/c2e3b3d6fbcbd398a53583751e57670bf73ae8": "b6e4a425dcb3dfc67c30d7049d94e391",
".git/objects/53/6165d35a42ac4ce974f9cf7ac24a9ba0645acd": "418cc78c8c586f7165ef52d7aa519d9c",
".git/objects/55/86019b713f085cb250683e8a184e560d39c9cc": "1925d999f741af5c0d0577c402f757f6",
".git/objects/56/24ba4deee86e0d0d9a8f88b15e4e9055f2ed30": "a50612a19d7d9c559b21fed05acabcbb",
".git/objects/57/a4f0450447a7f01151f0104eef4885640217aa": "f8ca522628c880eec8ddcf1396b57dda",
".git/objects/57/b04fc0f4b3bb66cf15d4bec9c2ee269f4d2342": "9aa5bc94539a94342536351ad6f2ffec",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/59/2ceee85b89bd111b779db6116b130509ab6d4b": "348329ef452b809389b6496387db6913",
".git/objects/59/2decde609c91a7a54cde5c25832983ddcdb9ac": "0bd6b3dea5b4b9a229ac74d875733b68",
".git/objects/59/de1ffd4a53a88494ed0970be5ebbf7158a6767": "2dd32f23be1dc9c362d4bd3bac19b52d",
".git/objects/5a/88276a7b36980d2efa2689a410aebb67aa65b8": "3f57df6a0c0d74a105194c1575657bd0",
".git/objects/5b/83dc670daa8915a8400b44a3fef99d9e66d60b": "379a1b5e7c22efddeaf46f1769c522e7",
".git/objects/5f/0b2fecf5c9829b7951835105ed4e356a8d05b3": "79c2af968dddd893894d0618e3fccffa",
".git/objects/5f/7f9c142eb9d8ff5c8a5fd65b0b6a477d0f7cb1": "b4fe8598b57bc17a6e180a09920bf225",
".git/objects/5f/ebb457c6d9f05e2d9e36610bfcefbd5704ced4": "28ca1740e5c7622e280038b0fd03e384",
".git/objects/60/5de19ad9a3a8286bf4900b20d6bd7ed0f17ac6": "8413ac605b1cb6404a2a5336e3368fa6",
".git/objects/60/608d0fe5bff3a7a7e05d5a232944a1a8effe5f": "e213f83927c2a4c19aa1b864a19eb852",
".git/objects/60/73542f0f245e509fe750edb947dae144c9660d": "a1849fc44dcb2c5e3e7497150232c42f",
".git/objects/61/b37116bf443b5f6e14b2c6d9199cff624e2f00": "6058adcd7f9b2bab0695181a249f4650",
".git/objects/61/f3bd1fc504c3b78271416d8cfd14faa1dae2b4": "dfaf637924edb3f7b2913e26f2a71152",
".git/objects/62/c89ee094658c7a9465824fdb42793a64ea557b": "133cd5da638f245b079d9e9cdc29ae38",
".git/objects/63/2d2b2d22cecb11f32745c644c827ecf75669ff": "1d8497811ea25f1d195655c7fc614ac6",
".git/objects/64/3f2f2bab8ec8bbcda5c9f815f592d6e7e86604": "ff06f40081820e0a5dc3b3267d026fbb",
".git/objects/66/a65d1e4a79f230031ec0e0959a721039e7282f": "2a87e723b46c44522c16c0968efa0152",
".git/objects/67/ae71f10d4fc6ac59142d95a54637d719f3560c": "bffa97578515abbd3e212d5fa214249a",
".git/objects/69/0dbba97f29a0d912cb5f24e1591c2883d489da": "efe79b3600ee5ddf8649e80f229a4f5a",
".git/objects/69/a9c0f0a3e84df55ca6d5b902736fb96b94e45b": "e07446394cebd764c63a4406c7f97de9",
".git/objects/69/b39699db47c15b089d8d3861379b6c444206a6": "845f9e15aac8b711b5d9f10ee47a47ae",
".git/objects/6c/8e736c9131cbed40246aad6c478f4be38fbd3f": "f2b1e79be5b3a72ec8b64640a7d3e089",
".git/objects/6c/b5dd5dbdbca71dd812e4a6a1c8522c6fb35cb3": "7725803540d695635d562d5c41ba5c0c",
".git/objects/6d/a0652f05f28fc6950cec20ebdfbae89b665479": "fccd5f0f0fbfe5ead1a5622148fb8d74",
".git/objects/6e/b54a17b48360efade5eeb38dbf6aa2af772281": "906772d04ba243c702a3c6f169c82307",
".git/objects/6e/ba94144bcd866bdc70bc349702cacc64958958": "f05cbd27c9bbfd0eda031d0aeb54045d",
".git/objects/6e/bb171ff1a5b5d2dbd62a5f72f43fa4a3d173d5": "21bb29bfd21382a83536882431abb2e3",
".git/objects/6e/d2d933e1120817fe9182483a228007b18ab6ae": "e67768e46e6cb02c375dcbe6443df2e5",
".git/objects/6e/e87b61a1c308727e01043599972635895c5eba": "7d361406cf644fd8b91f71668041233c",
".git/objects/6f/568019d3c69d4966bb5a0f759980a1472afc1e": "11711ec452167a523e427fab835abd15",
".git/objects/70/0e0ce2dc320d0b4ad6f31da489f6e307873caf": "ff2f89525c58ded861831f0340c96e7a",
".git/objects/70/1f94aeacf4298f1827ad5159a653818d531d98": "9deba20d2a4cee93e49b94caf4138fc2",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/71/eb2ef3f557b1dfc6f22df1c89f10fa38938d18": "0592352ac849fd24bfec06828f9b8984",
".git/objects/72/271d5e41701cfbffad74d38640bf9cc7c1f7be": "e07153a480d4e159b70f80851f6a553d",
".git/objects/73/53c41ecf9ca08017312dc233d9830079b50717": "32c4c29220bb05d460a969e7df99412c",
".git/objects/73/6c4b3b80cfeef58399d9314acc16cbce93f8a0": "c1a7e1e0e5e9cd09d7e08940165faacc",
".git/objects/74/6adbb6b9e14b7e685c91e280a4d37a672afbd8": "eba295c22165b01ec06a735e4dbb3a44",
".git/objects/75/f74a90d9261583bbfcb239573f795ef625858d": "06d5171f04b3ca3f6fa84c236d2f15b4",
".git/objects/76/b370e82b52b35dd8daf2f80a63632347c8066d": "0eb52c72211b2da822faae4587a8edfc",
".git/objects/76/e1789b06850f063df87b763f25be27996e1488": "c89d99a85cd4a01ccd99d8ccd5d82e85",
".git/objects/77/681f469c9b9a74f4b9c2acb5e4a76be617e44b": "76c325c24d397756430a0300e7d7077b",
".git/objects/79/7d452e458972bab9d994556c8305db4c827017": "009f1a67118a52459bbc67f56c2ffd4a",
".git/objects/7a/7f9873ad7dceb4dc17087fb06c800fa0191376": "91f6523d91623d19d122fea7b32a3db9",
".git/objects/7a/df43d30d4d489f6825dc648275476a0cce80b5": "e7956bbb996296b8216abcd4bcecac8d",
".git/objects/7c/56964006274498b0edaa77763cdd72c6d42b6a": "7cf18aae775e8f317b2bead42a68f097",
".git/objects/7f/7023b559e3e9c18281bca255265cf7679cbe35": "cbb46d39fecf88c898cd9f29d7d01c1d",
".git/objects/80/83eb304318b4ee643fa34663e935755927d556": "2be6110aa1dea4ca824a114586b22548",
".git/objects/80/e867a4e06b4dc26d0a2b327cbd54041addc50a": "a256672b7db051545b2b39eb821c1510",
".git/objects/81/385f40381fac017f9f58f79ea30908e1ebac61": "0d7b5d0b5ad19908c41c70525360150f",
".git/objects/81/4b3a44636778b0e1aeacabe312bfd102a3627f": "cc0f73bd39eb897bdc55916c72537eb7",
".git/objects/82/2cc744449d3b41de847d36ff0fcd18b3495d2e": "265b17fe28504eb8ce5d47695bf8841c",
".git/objects/82/b6f9d9a33e198f5747104729e1fcef999772a5": "32d0349a1626c50624f6aab0900c31d8",
".git/objects/84/ac32ae7d989f82d5e46a60405adcc8279e8001": "a7755246641eb6f0ea897123c42e7eeb",
".git/objects/85/2fa1a4728ae4789e3bca55dd07caef3b41f2a5": "97bf964ac33d3f622d940921761e740c",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/86/497a3116cbe3a160d19a8c8ebb873214d97d84": "63fe7bd7b61c84768c9f0cdccf6961c4",
".git/objects/86/a7c3b1b6119f7dbdb8cec74f1b5b3e076bf949": "6a613891f55546675267dc93a78ff2c1",
".git/objects/87/3c17c454a115ea461952bf70da0f0ae7403b68": "992b0c4352701dd8d96284331f5a91ae",
".git/objects/87/932017fbdb607b0147dc2e32fe4acebcda2cea": "f6f5d20c3b900ec3e7a44be6b9ffa4dc",
".git/objects/87/cd3f4901d41e2ece7b91e22e886e764fb96eb4": "a606edd4383e29971cbcfcd497455872",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/53cba09064923c5daf2d37e7c3c836ccdd794b": "41d25b277c37a913abe0083c22f1e1b2",
".git/objects/89/c2725b70f1882be97f5214fafe22d27a0ec01e": "99b17ebd650decc04c5de3b0893b27f7",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8a/f96a2c8ade099adb3fca57791d512ff901fc4a": "d25ee2521973bcf7a4fc7ba6e7142677",
".git/objects/8b/6d4680af388f28db8742ef7fb8246e2bb1fffb": "4e20d4660135ff8d41852fa5b986bfb5",
".git/objects/8b/9676d1d274ffe363358199d174880b6ee4e837": "5e52552385db7ad43b21f2aee659edbf",
".git/objects/8b/aee593f7511ba15e4e3729c6bf9d1bdece68b4": "ab9f226256e9c206d9e962c22d32ecff",
".git/objects/8b/d06bdf095c809f80d639847440b06b0199a88c": "58d6dcf8e95c016f9f2dd6468f1fcdf1",
".git/objects/8c/df0133712711073e58983ca88895b483425582": "e3ca676e426d0d341434f1a435e668c0",
".git/objects/8e/3ca5dfe1936519e96475be8d0b5ff5faa43727": "497d1953bf8b42ffe41a214af0c8df37",
".git/objects/8e/940891213b854cceb67cedbdf7639ce76192a3": "2a6e9c02e8c3c3a2891f9c15b0c4dc71",
".git/objects/8e/bcec4ae71ae192513fc53bfab1d91fa3bca3f1": "b01018921f327bfaf047b26f4fcd7e25",
".git/objects/90/3f4899d6fced0eb941e159f7322b21b320c40c": "83b7d85886d6c364db4cef0543e046ee",
".git/objects/90/74fee9290dba1c034623b98ac8d5d344d74724": "25062f4e422d41a10a5a9b4ea7876b27",
".git/objects/91/9434a6254f0e9651f402737811be6634a03e9c": "6da5342c04a33ac2131fdae2e4a84892",
".git/objects/91/c13c415ae8621cb8ff1e5824bcc72a6c47dcae": "55bd49ba1d18f441825da262c3e5bc21",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/94/fedc41676205231138798b8ebad52220c5fd07": "96e3d3adb5f4f849b22b7cbbc4429caa",
".git/objects/95/5ee3038f988929fac2dedb6a307ebd45dfcfd7": "84f4c0c3560baa9920ae37a5e8144c5e",
".git/objects/98/09474ab72804a965ee8eb1a06417dbf2726816": "e84bc5cd518c0cece9327a40ec6744a7",
".git/objects/98/5683691f16cfddb9c23760777f52bed78feaca": "3babb153247635ba422f288690bcf7ac",
".git/objects/9a/0563ef90d1217572c6ea527eb022b436061712": "34a8ecfe336a4c6522dd112dc1251656",
".git/objects/9a/1057e11568b4fe0bb775464fe640dae6f65d2f": "ee05a33dd25686548162544b244c76d6",
".git/objects/9b/36460d99317120dad73aafd15c05713cc038f9": "4aa1a9c32260d618484cd355b50f6a58",
".git/objects/9c/553a6a71a01f8cd116bd21dc9060210b028838": "9141e8f4fe3d87f181fb491e0b863d62",
".git/objects/9d/8c768b173fedac41689fca0439e924fc5b834b": "4a0a20a83a24156f4b6d39db6d65b10b",
".git/objects/9d/a19eacad3b03bb08bbddbbf4ac48dd78b3d838": "1176aaa6ff7a19c56cf9a6ea692a2c03",
".git/objects/9d/ea55ba35d21548b0a683986fd61f3c548090c5": "c8446ac17933648392f21583fa7916a5",
".git/objects/9f/98b7d030093d36e5e27bad4c35667abdc4e169": "a77f605f140751d251dc0555cd0b462c",
".git/objects/a1/f3831f34c4952cc143d09984095da2e73dea78": "3d1c6ebc599dc86d145ec13428da09f0",
".git/objects/a2/ec33f19f110ebff51a23342d7bc29ec9a1aaa6": "48569d95657b1f4b8fad6b6e730d4334",
".git/objects/a3/20b3e41dd1ea4fe6e03a6aa0b3f0901eb83be7": "ee7d3882bd8b151ff016e41fc2ee44d3",
".git/objects/a4/2ea7687cb67e55af955dc8874a072e087ce3ed": "b51e31b93bc1bfcb23a9226ab3e3c5eb",
".git/objects/a4/b16275e52f636d8232e8aef84a721edb85c524": "4e606818ed9563436e2054acc1f34704",
".git/objects/a5/74fb9e3907608e950927d928b60aed4a83795a": "7523ce0bb7bc23ef4659f02814cc43df",
".git/objects/a6/2f1d04979f742cf8f095b3cf98dd1a67a49cba": "20bf1a0be77a89e27ee5ec166fbc4ea9",
".git/objects/a6/368af0ee7628fa194ef8fe3bbe4523113d6e05": "bafb07bb0e67f8a015ad7c670f7072fd",
".git/objects/a6/75e1f4bcfeeb59128f9f9aa5e7f350163d4a31": "dc957367bd187833edaade8afaad9cf7",
".git/objects/a8/7eef84a5d29844f41176f808a797cea593616b": "bbe3fc3e1c5e6135804ae185063dc396",
".git/objects/a8/e64fdfeb26c1371bc1169043e31175cea36ef3": "ee36831733b04277c6a77d9ebfa7d16c",
".git/objects/aa/72756ecb4959740ee923c88dab2f829a572484": "9ce8dfa90097dfd47c2894249ddd0954",
".git/objects/aa/bd6e7343ba87ebc92225dc408959bc5efd6b5a": "14ac86a6cc775d02f497317a0d90ebc4",
".git/objects/ab/070b68dd9bacb41c803537ec3e4107598c0db1": "99783737b503060c5942c284f9ed342e",
".git/objects/ab/eddfc8f366921b6598a53419265c9e6d2244b4": "008564841272d8dbbf17683d82223bf2",
".git/objects/ae/f0122897d1e89a7d96ce2129fbc3a4d72258b4": "cf094c04469deee5a17cc1888c9c968c",
".git/objects/af/497cb1a0e11079501bb55ad02f95db7822aced": "c772a151dd9fecc09b124a0287c0f536",
".git/objects/b1/7d17ad0e753ad4bf95a31bae37c51e0f1e4d57": "79409dd28e267dfd8749b80902f6e894",
".git/objects/b3/af79c66fd0cef39a5eedea49e09f553cc4c08a": "518374e0cdde0d6097076fbcb5226b4b",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b4/e3a28801e5f10f5ddd3d78f218d647675ec090": "9fbbcbe6bd188099d4bc356ce91df6b2",
".git/objects/b5/15a06fb50849996ea7fd8f3485439a9b06edd8": "2a4f0f740833171589ca530810b0d8d4",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/ad1fa7488a13d5f0a4fb2b528f03ddf586f75c": "79b740b747ec042e2b8da33ecdb38ee3",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3c4c30c16703f640bc38523e56204ade09399e": "d81d171c0590dfeb78e8d6c404330bb1",
".git/objects/b9/a1b23db05a80b6107fe7860760948c4519fd07": "97cfdce060a907f644fc8318aaae84de",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/f3d77f76706dbc82162dd6bc9a1365ac5be830": "3fdbb77ecc95ce55cfcedebbe781f150",
".git/objects/bd/b57226d5f2bd20f11934f4903f16459cf52379": "3289c6c0ee8813484d2b33d6c6e1df10",
".git/objects/be/6aa32669606a8377c690145531687252bd56b9": "e476fc8c47cd4a1068b8495072bd1ea8",
".git/objects/c0/004e5792a9a0c8afc259cf88b4525f6726c862": "4ba7140d32ce36fe0756097138fc843c",
".git/objects/c0/21675942ae13c04225bff9f345cd15f1264fa7": "a28a1b3f70ac1136ae61bb539f88d0f9",
".git/objects/c0/4e20caf6370ebb9253ad831cc31de4a9c965f6": "5e216dece9f226a4ac045363fbbe142a",
".git/objects/c0/761c139408531bac4041737e710583fd8682e5": "f5ccdceaca4340495ccd5fd010645514",
".git/objects/c0/d2f2e29bf4cbfc027e7bdf6a8ff8a333f9d38d": "48b6889bedd6f024a928410abbc753f5",
".git/objects/c1/4d1df333b5231fed1233be0b5a14adf703a75f": "248223c7e7a67285c3e20be03c128d12",
".git/objects/c1/b9dfa32370f0d42f181419c0f65f26e9455ef3": "faa58c090b1473b4d7da1ed9035f04b9",
".git/objects/c2/07449b63540c8ec82a7ed8644f2dcaef1b31c4": "b4318769a622c7cee77d0b1ad0adc238",
".git/objects/c2/07c456632cdd25fb92dd1085d324e9b9bd5dc5": "1c6a5aea5aed68137aae492a73e54a1e",
".git/objects/c2/6abd1b90c25cacbbe3fbd39defc339abb5d9ef": "f62391d24234a6f4fae23de813daeeba",
".git/objects/c2/939b4ac51c066356e078309ee36ba7b295ea1e": "7cd0d7633278264944fa642e838545aa",
".git/objects/c2/efd0b608ba84712fb3e1d01122468a50c7fba1": "5841aa09610800cbb88a643fdc9ede63",
".git/objects/c2/fc690c03dee2ec2c5befa0d1acc3cefa08b229": "7101f976068da3bc1d613d1cc64dd00d",
".git/objects/c4/3cc9b8ba4e4ae5c6df5ed5e3f199668b7fead0": "e70044978ca80324fbe375a7e1547ad3",
".git/objects/c5/c0c6803d08b23e10b1fa57784f9783976d23fa": "8e1cf8d6cc6ba08c696099cc84396773",
".git/objects/c7/fb6c9fd0287aa1af6cdbecaaf5877b9b488334": "ac01a2224ee38772d0a70d24a0bb2540",
".git/objects/c8/43c1c1a7d4a146d47cad5656de030734161b7d": "100462351f854ae8804c41be34dbab61",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/cb/1ef88056edd1caf99a935e434e7ff6943a0ef6": "06da19129aec844c2a975f2175eb659b",
".git/objects/cc/cf817a52206e8a8eef501faed292993ff21a31": "1b4dd6ab7f4ca9073eac414dd6794fd6",
".git/objects/cf/12977ba4c17b84e97330e2724d7b116b9edb6c": "f7e9af62d145ae5c1ef805686a4677ff",
".git/objects/cf/137732075fe3997b8e9cd7c73cd0d0ce7011af": "869cb87974b9995185516ddeae2d310c",
".git/objects/cf/35625f3310e00f64a3c811d420c73171ac9c63": "3b50161e566d0629fadc572847219729",
".git/objects/d0/4cf784f001c14c66fc0fc5c680e28eba5f63b0": "5f28010795e0f9bd9f893f08725d60b1",
".git/objects/d0/651fda5fbc1e0e728fe38d2abc65f7250c177d": "6bc02ac128f6ce47d177770d0a6103f8",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d2/ffbffa4cd251cc00b2b93a5efc2a0213460220": "f43644ca180979b0822f0df06d3031f5",
".git/objects/d3/2b000874e895fc6ebd3fd17273ec1c0ec7fc91": "9de20d76a3201371339ead5220665d7f",
".git/objects/d3/6b1fab2d9dea668a4f83df94d525897d9e68dd": "f19c13a91df6187b27767a0c81787173",
".git/objects/d3/896c98444fbe7288d434169a28c532258a4466": "65bd2275cf87203cd8cbaa19e4cce2fc",
".git/objects/d3/b9e0aafa70e7b518de6d7f36503def555e3867": "c4acea7ad0add3f7670f8bff8463c738",
".git/objects/d4/30cd8d5be46e48e2c5da8b7008e8a6f526f3cf": "3081586cee7438435e2fe2eb72b35d75",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/7150d39094bf28b1d58d2536b2860eb3812974": "0a3fc2fc4fda34898e7d0749ec3b0b04",
".git/objects/d4/92d0d98c8fdc9f93ad2543bb4f531803e9df72": "e3677ae8914304b8340d8db27e7db71a",
".git/objects/d5/1c38846a5939b13ee64797aa6cbd18f2c7c86e": "7ec4cf7acc02fe3ff479e221bec7ff45",
".git/objects/d5/3ef6437726b9d1558eda97582804175c0010a2": "764cc945f02614c5bb082a403a0c55e0",
".git/objects/d5/bd01648a96d50136b2a97c8bb9aa5b711f6c39": "b52bbb3aa77140bdf2d47814158cba7d",
".git/objects/d5/f1c8d34e7a88e3f88bea192c3a370d44689c3c": "2e5a4148dc9ebc15b186574d9fb60432",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/61c53178cc135119f252e047fb2f6e08512ed0": "54c64d1a96d272170806761ec67134b6",
".git/objects/d7/9328c34fd4c950c718ace62f9e2b4ffbf5a95a": "71b97d5c130968c4d08b333e279645da",
".git/objects/d9/e87b41c3b4bdf0ea9b4124176812c825d7ec46": "f4557df2eb6c966047340b538316f261",
".git/objects/da/be7a42e7cbb349df3e8c620cc37368d638e7e1": "ff284a33083e367ced2cff72652bc12e",
".git/objects/db/77bb4b7b0906d62b1847e87f15cdcacf6a4f29": "a2e10fc9c4f60ac00e2b9b1ed3a0b5ac",
".git/objects/dc/139d85a93101cc0f6e9db03a3e1a9f68e8dd7e": "c815b8cd55031858470b95979194ad21",
".git/objects/dc/9ada4725e9b0ddb1deab583e5b5102493aa332": "e8022082c258e4c83e27519f77484618",
".git/objects/dd/db8a30c851e7ef5b16a9108934bd1217b6b43f": "e943b985c0fbc94ad354f2ada89b854d",
".git/objects/dd/eb4451a39acf7dcb6bfbbd43d824b6a016b4e9": "cf87c2706ddb3e17411d6521593adbf5",
".git/objects/df/5cb9d935bfecd420c1ab5a9ce882eff77535ab": "1fd7abde9bc984333ea98eb7a93f0507",
".git/objects/df/e0770424b2a19faf507a501ebfc23be8f54e7b": "76f8baefc49c326b504db7bf751c967d",
".git/objects/df/f4f49561c816f70eaea557d889d31cf63447ac": "fccf1f0ce075ef8d3a1ae932cbc31552",
".git/objects/e0/f0a47bc08f30b550b47b01de4c9206b6824dd9": "5ef61d56b6220833037adc3dc3871ecb",
".git/objects/e1/a7d51d4b1a2ea58070eb069df85fdca724c0b7": "c91b94ff9880280b4f03488caddea8a3",
".git/objects/e1/ca574ef017c1bc00556b96ea372e2c07948771": "8958a89f12de95d8fc1b30125683be1b",
".git/objects/e2/15a385ec0a79dedd9d4b67ff87c68a042fb8e3": "9e8ebc83e10c1c77c8c7f5152a346878",
".git/objects/e2/1c6637bdcb0760c43b531dd8520f40ed60b817": "0b60ece3d568a5900b337203509f351e",
".git/objects/e2/97c2f74780d303719d323ffad209a182d114dc": "8cc331b8da8265278f68543df52c0294",
".git/objects/e3/3142e71bfc751ce1d7a7d46406235425786005": "71cc9d64983f89c56658f9ade44a4809",
".git/objects/e7/1a16d23d05881b554326e645083799ab9bfc5e": "35049fca5b8153e0c0cd520b5503c269",
".git/objects/e7/c5c54370372a4cdde7288a32733998d87bd767": "37c17914ddc243c1c81881069106b916",
".git/objects/e8/3e344447b4edf9facf9f1487516f5c055b9bc8": "cfd20c11f462a5f46161f28f4ecb67e6",
".git/objects/e9/01dde684ea8ba25c50ea5dc7d5900da31a30d4": "8688207d9bdc19977b061c06f0972db7",
".git/objects/e9/f5fea27c705180eb716271f41b582e76dcbd90": "45a0061e76512ff597b88e29748f3ada",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/eca3f2e1282b7bab9c8188b824496f13b611dc": "389ae7a1528b6f50cef5b6ecf894de1e",
".git/objects/ed/1a3b578f50d6916db58368d066ad92e41aa27e": "eb60031a7c544b1d724cefe74ee112a7",
".git/objects/ed/4160b1d922abd581ad9d95a49e440453a9fda6": "f5dab96f82187e07dcf217e4cf497cb3",
".git/objects/ee/8862b7c6c681ce3f96fdac62ae612ea83367ed": "b3296c6306f437a9d30cd59eaf3cdb1b",
".git/objects/ef/e713f0e24d7b3f2a0ab381062a77416e00df49": "04ba971b4bad74dae397229fbae34956",
".git/objects/f0/083b8398174520360494c4a3733cbd1393c123": "9174ee81e0599376f1a88c4e19e875c0",
".git/objects/f0/5d9d8aa2fc9c466913f6c04206317a23d95c2f": "7ead6ef8a4e564e64162fa69ccfaf8b1",
".git/objects/f0/83318e09ca1b6b8484b1694a149f0c5d5cac1d": "541f4960a70ea9c895b2c21196ef40a7",
".git/objects/f0/d6c0f5e491f10487dc3ae66b6d9fc72f559f7b": "9b2464b67b3428412f54546ca9dee3af",
".git/objects/f2/00ac941468eb366334e7043988456f0e394eb2": "2cf60359695df676549cbe3c5e29ef4d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f2/9714d8d02d823033320126f924d825fdef7a34": "37058d2ea4ba1ae621abf0f60beeafe4",
".git/objects/f2/e259c7c9390ff69a6bbe1e0907e6dc366848e7": "094726a4a1cc307c0a019e65a323f850",
".git/objects/f3/46021e5e353f2f827b3a136a02d0f53631c785": "95dac5423c0c75a27b351527c71190cf",
".git/objects/f3/c28516fb38e64d88cfcf5fb1791175df078f2f": "bccf9d20d0adcc345fe8e5f4a745c4ae",
".git/objects/f4/f6dbdbfcfdc9ea12d45197049e9dabcf6850e3": "53e9b7a63d471fc2d8d4e6af3d43e8e0",
".git/objects/f5/8bb76100e82ec653e9b32a02d18d9232922d51": "e732ad2f094017daf1f16b50afd7c1d0",
".git/objects/f6/e2049cf3fc987090800a82b784c4e229c8a4d8": "da67f56f255cd0ae198f27fd94a4f867",
".git/objects/f7/4085f3f6a2b995f8ad1f9ff7b2c46dc118a9e0": "c04177ec14f012cb2c99851a5e1ca941",
".git/objects/f9/b0d7c5ea15f194be85eb6ee8e6721a87ff4644": "db1ee38473c66e5ffa9d28f6dfe66938",
".git/objects/fa/9ce5e8217ad5a882b05bbba1fc4cf914c59612": "53072c4c6cb8cecbeaa4c13c6a22e9ba",
".git/objects/fe/730945a01f64a61e2235dbe3f45b08f7729182": "1dfc0ae4480d18f6ff6e8730ef3222d1",
".git/ORIG_HEAD": "d7836394491d18f87d80669b9c727717",
".git/refs/heads/build": "3a05d2742df77ef4482c8fc94eebca3e",
".git/refs/heads/main": "15ba6badda4376211ee16c98ca3d0878",
".git/refs/heads/matt_branch": "cef276916585ac48af6649007ec5c5c7",
".git/refs/remotes/origin/build": "3a05d2742df77ef4482c8fc94eebca3e",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "15ba6badda4376211ee16c98ca3d0878",
".git/refs/remotes/origin/matt_branch": "cef276916585ac48af6649007ec5c5c7",
"assets/AssetManifest.bin": "44e6169cfacb42d6ffd131ac6c2049df",
"assets/AssetManifest.bin.json": "ea691d8291005c5a9d3c3cd4164478db",
"assets/AssetManifest.json": "04c95ba08861a96d97d5af17e531ca7b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4ede6c73767f990e066460febcf52744",
"assets/images/func_banner_temp.jpg": "f41bd08f89030ffd22d068766e0ed20a",
"assets/NOTICES": "eaf489b6b082e87a36f733f728deff64",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "3beecba378782a780c343608687540de",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ca42278e009a3beac9dda9602f4c30a0",
"/": "ca42278e009a3beac9dda9602f4c30a0",
"main.dart.js": "2008fff6276099c2080fc51f38863820",
"manifest.json": "d3b90cb88522cbbd568ee4ee0d0f6a9f",
"version.json": "2074c95492145bdb6e31febc7ce7b86c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
