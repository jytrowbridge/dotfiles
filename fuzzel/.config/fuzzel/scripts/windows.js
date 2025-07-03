var exec = require('child_process').exec;
exec('niri msg windows', function (err, stdout, stderror) { handle(stdout); });
var handle = function (o) {
   // console.log(o);
  const parts = o.split(/^/)
  console.log(parts[0]);
};
