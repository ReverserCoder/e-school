const express = require('express')

class AccueilController {
   
 
  constructor() {
    this.path = '/accueil';
    this.router = express.Router();
    this.initializeRoutes();
  }
 
  initializeRoutes() {
    this.router.get('/', this.getAccueil);
  }

  getAccueil(req, res){
    res.send('accueil')
  }
 
}

module.exports = AccueilController