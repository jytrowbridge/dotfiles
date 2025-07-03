const { exec } = require('child_process');
exec('niri msg windows', (err, stdout, stderror) => {handle(stdout)})

const handle = (o: string, c) => {
  console.log(o)
}
