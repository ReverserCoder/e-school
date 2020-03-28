import * as express from 'express'

class TestController {
  
  public path = '/accueil'
  public router = express.Router()

  constructor() {
    this.initializeRoutes();
  }
 
  initializeRoutes() {
    this.router.get(this.path, this.getAccueil);
  }

  getAccueil(req, res){
    res.send('accueil')
  }
 
}

export default TestController