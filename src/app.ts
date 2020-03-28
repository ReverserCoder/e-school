import * as  express from 'express'
import * as bodyParser from 'body-parser'
 
class App {
  public app = express.Application
  public port: number

  constructor(controllers, port){
    this.app = express()
    this.port = port
 
    this.initializeMiddlewares()
    this.initializeControllers(controllers)
  }
 
  private initializeMiddlewares() {
    this.app.use(bodyParser.json());
    this.app.use(bodyParser.urlencoded({extended:false}))
    
    this.app.set('json replacer', function (key, value) {
      if (this[key] instanceof Date) {
        // Your own custom date serialization
        value = this[key].toLocaleString();
      }
    
      return value;
    })
  }
 
  private initializeControllers(controllers) {
    controllers.forEach((controller) => {
      this.app.use('/', controller.router);
    })
  }
 
  public listen() {
    this.app.listen(this.port, () => {
      console.log(`App listening on the port ${this.port}`)
    })
  }  
  
}

export default App