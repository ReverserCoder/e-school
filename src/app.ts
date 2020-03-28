import * as  express from 'express'
import * as bodyParser from 'body-parser'
import * as mysql from 'mysql' 
import * as dotenv from 'dotenv'

dotenv.config()

class App {


  public app = express.Application
  public port: number
  
  constructor(controllers, port){

    this.app = express()
    this.port = port || parseInt(process.env.PORT) || 5000

    this.initializeMiddlewares()
    this.initializeControllers(controllers)
    this.dbConnection()
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
  
  dbConnection(){
    var host = process.env.DB_HOST || 'localhost'
    var user = process.env.DB_USER || 'root'
    var database = process.env.DATABASE || 'e-school'
    var db_password = process.env.DB_PASS || ''
    
    console.log(
      {
        host: host,
        user: user,
        database: database,
        db_password: db_password
      }
    )
    const connection = mysql.createConnection({
      host, user, db_password, database
    })

    const query = "SELECT 1+1"

    connection.connect(err => {
      if(err) throw err

      connection.query(query, (err, res, field) => {
        if(err) throw err
        console.log(res)
        
      })
    })

  }
}

export default App