deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BBB_BOOT = 'Insert SD CARD into <%= TYPE_NAME %>. Power up the <%= TYPE_NAME %>.
You should now see the blue LEDs start flashing.'

module.exports =
	version: 1
	slug: 'beaglebone-pocket'
	name: 'PocketBeagle'
	arch: 'armv7hf'
	state: 'experimental'

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		BBB_BOOT
	]

	gettingStartedLink:
		windows: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/pocketbeagle/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: true

	yocto:
		machine: 'beaglebone-pocket'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-pyro'
		deployArtifact: 'resin-image-beaglebone-pocket.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
