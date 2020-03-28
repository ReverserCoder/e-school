import *  as express from 'express'
import AnneeAcademique from '../interfaces/annee_academique.interface'

class AnneeAcademiqueController {
    public path = '/annee'
    public router = express.Router()

    private annees: AnneeAcademique[] = [
        {
            date_deb: new Date('17-08-1997'),
            date_fin: new Date('31-12-1997')
        }
    ]

    constructor(){
        this.initializeRoutes()
    }

    private initializeRoutes(){
        this.router.get(this.path, this.getAllAnnees)
        this.router.get(this.path, this.createAAnnee)
    }

    getAllAnnees = (request: express.Request, response: express.Response) => {
        response.send(this.annees)
    }

    createAAnnee = (request: express.Request, response: express.Response) => {
        const annee : AnneeAcademique = request.body
        this.annees.push(annee)
        response.send(annee)
    }

}

export default AnneeAcademiqueController