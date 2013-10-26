exports.list = function(req,res){
   res.render('ramsey', { title: 'Ramsey', links: getLinks() });
};

getLinks = function getLinks(){
   var dt = new Date();
   links = [];
   for(var x = dt.valueOf(), i = 30; i > 0; i--, x -= 24*60*60*1000){
      links.push({date:getDateString(new Date(x)), url:getUrl(new Date(x))});
   }
   return links;
};
getUrl = function getUrl(dt){
   var dd = dt.getDate();
   var mm = dt.getMonth() + 1;//January is 0!
   var yyyy = dt.getFullYear();
   if(dd<10){dd='0'+dd}
   if(mm<10){mm='0'+mm}
   return 'http://a1611.g.akamai.net/f/1611/23422/9h/dramsey.download.akamai.com/23572/audio/mp3/itunes/'+mm+''+dd+''+yyyy+'_the_dave_ramsey_show_itunes.mp3';
};
getDateString = function getUrl(dt){
   var dd = dt.getDate();
   var mm = dt.getMonth() + 1;//January is 0!
   var yyyy = dt.getFullYear();
   if(dd<10){dd='0'+dd}
   if(mm<10){mm='0'+mm}
   return mm+'/'+dd+'/'+yyyy;
};