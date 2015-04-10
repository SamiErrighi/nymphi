var FlowerPower = require('parrot');
var _           = require('underscore');
var request     = require('request');

var auth = {
  username: 'sami.errighi@gmail.com',
  password: 'password',
  client_id: 'sami.errighi@gmail.com',
  client_secret: 'key',
};

var api = new FlowerPower(auth, function(err, data) {
  if(err) {
    console.log('Error:', err);
  } else {
    console.log('Logged in');
  }
});

api.getPlants(function(err, plants_ids) {
    var plants = [];
    _.each(plants_ids.found, function(plant_id){
        api.getFlower(plant_id, function(err, plant){
            request.post('http://localhost:3000/api/plants').form({plant: plant})
            plants.push(plant);

        });
    });
})






