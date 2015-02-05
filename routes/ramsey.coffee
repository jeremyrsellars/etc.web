exports.list = (req,res) ->
   res.render 'ramsey', { title: 'Ramsey', links: getLinks() }

getLinks = ->
   dt = new Date()
   links = []
   `for(var x = dt.valueOf(), i = 30; i > 0; i--, x -= 24*60*60*1000){
      for(var hr = 1; hr <= 3; hr++){
         links.push({date:getDateString(new Date(x)), url:getUrl(new Date(x), hr), hour: hr});
      }
   }`
   links

getUrl =  (dt, hour) ->
   dd = dt.getDate()
   mm = dt.getMonth() + 1 #January is 0!
   yyyy = dt.getFullYear()
   dd='0'+dd if dd<10
   mm='0'+mm if mm<10
   'http://a1611.g.akamai.net/f/1611/23422/9h/dramsey.download.akamai.com/23572/audio/mp3/dr_3hr_podcast/'+mm+''+dd+''+yyyy+'_the_dave_ramsey_show_itunes_' + hour + '.mp3'

getDateString = (dt) ->
   dd = dt.getDate()
   mm = dt.getMonth() + 1 #January is 0!
   yyyy = dt.getFullYear()
   dd='0'+dd if dd<10
   mm='0'+mm if mm<10
   mm+'/'+dd+'/'+yyyy
