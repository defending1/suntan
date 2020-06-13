import cors from 'cors'
import express from 'express'
import mysql  from 'mysql'
import bodyParser from 'body-parser'

const app = express();

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST_IP,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
});

app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.listen(process.env.REACT_APP_SERVER_PORT, () => {
  console.log(`App server now listening on port ${process.env.REACT_APP_SERVER_PORT}`);
});

app.get('/get_data', (req, res) => {
  console.log(req.query)
  const { table } = req.query
  pool.query(`select * from ${table}`, (err, results) => {
    if (err) {
      return res.send(err);
    } else {
      return res.send(results);
    }
  });
});

app.post('/add_client', function(req, res) {
  const data = req.body.params.values

  const received = {
    "ID": null,
    "ID_Salute": null,
    "ID_Ospite": null,
    "Nome": data.Nome,
    "Cognome": data.Cognome,
    "Mail": data.Mail,
    "Password": data.Password,
    "Data_Nascita": data.Data_Nascita,
    "Residenza": data.Residenza
  }

  pool.query(`INSERT INTO CLIENTE SET ?`, received, (err, rows) => {
    if (err) throw err;
    res.json({
      status: 200,
      message: "New user added successfully"
    })
  })
});


app.post('/close', (req, res) => {
  console.log(process.env.MYSQL_HOST_IP)
  const { table } = req.query;
  console.log(table)
});
