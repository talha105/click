'user strict';
var commonServices = require('../commonServices/common');
const axios = require('axios');

exports.getScore1 = async(req, res) => {
    try {
        var options = {
            method: 'GET',
            url: 'https://odds.p.rapidapi.com/v1/odds',
            params: {
                sport: 'soccer_epl',
                region: 'us',
                mkt: 'h2h',
                dateFormat: 'iso',
                oddsFormat: 'decimal'
            },
            headers: {
                'x-rapidapi-key': 'dea4d6a127msh8fb24acf0b5aa1ep1af03bjsnf07ce55b9e4f',
                'x-rapidapi-host': 'odds.p.rapidapi.com'
            }
        };

        axios.request(options).then(function(response) {
            console.log(response.data);
            res.json({
                status: 1,
                data: response.data,
                msg: "Data featch successfully."
            })
        }).catch(function(error) {
            res.json({
                status: 0,
                msg: error
            })
        });
    } catch (e) {
        res.json({
            status: 0,
            msg: e
        })
    }
}

exports.getSports = async(req, res) => {
    var options = {
        method: 'GET',
        url: 'https://odds.p.rapidapi.com/v1/sports',
        headers: {
            'x-rapidapi-key': 'dea4d6a127msh8fb24acf0b5aa1ep1af03bjsnf07ce55b9e4f',
            'x-rapidapi-host': 'odds.p.rapidapi.com'
        }
    };

    axios.request(options).then(function(response) {
        console.log(response.data);
        res.json({
            status: 1,
            data: response.data,
            msg: "Data featch successfully."
        })
    }).catch(function(error) {
        res.json({
            status: 0,
            msg: error
        })
    });
}

exports.rSports = async(req, res) => {
    var options = {
        method: 'GET',  
        url: 'https://therundown-therundown-v1.p.rapidapi.com/sports',
        headers: {
            'x-rapidapi-key': '32e960d466msh7ef451276cc22d7p195e87jsn4a64b9374c58',
            'x-rapidapi-host':  'therundown-therundown-v1.p.rapidapi.com'
        }
    };

    axios.request(options).then(function(response) {
        res.json({
            status: 1,
            data: response.data,
            msg: "Data featch successfully."
        })
    }).catch(function(error) {
        res.json({
            status: 0,
            msg: error
        })
    });
}

exports.getSportDetailsById = async(req, res) => {
    var date = req.body.date;
    var sportId = req.body.sportId;
    var date = req.body.date;
    var options = {
        method: 'GET',
        url: `https://therundown-therundown-v1.p.rapidapi.com/sports/${sportId}/events/${date}`,
        params: {include: 'scores', offset: '0'},
        headers: {
          'x-rapidapi-key': '32e960d466msh7ef451276cc22d7p195e87jsn4a64b9374c58',
          'x-rapidapi-host': 'therundown-therundown-v1.p.rapidapi.com'
        }
      };
      

    axios.request(options).then(function(response) {
        res.json({
            status: 1,
            data: response.data,
            msg: "Data featch successfully."
        })
    }).catch(function(error) {
        console.log(error);
        res.json({
            status: 0,
            msg: error
        })
    });
}