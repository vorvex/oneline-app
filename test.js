var radr;
      fetch('https://raw.githubusercontent.com/vorvex/oneline-app/master/test4.json')
      .then(response => response.json())
      // .then(json => document.getElementById('json-ld').innerHTML = JSON.stringify(json));
      .then(json => {
            radr = json
         if (document.location.href.includes(radr.url)) {
           document.getElementById('json-ld').innerHTML = JSON.stringify(radr.event);
         } else {
           document.getElementById('test').innerHTML = "Fehler";
         }

});
