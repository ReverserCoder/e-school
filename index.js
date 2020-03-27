App = require('./Classes/app.js')
AccueilController = require('./Controllers/caccueil.js')

//création de l'appliction
const app = new App(

		[
			new AccueilController(),
		],

		8080
	)

//mise en ecoute
app.listen()