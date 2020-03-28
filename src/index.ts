import App from './app'
// import TestController from "./Controllers/accueil.controller";
import AnneeAcademiquecontroller from "./Controllers/annee_academique.controller";


const app = new App(
	[
		// new TestController(),
		new AnneeAcademiquecontroller()	
	],
	5000
)

app.listen()
