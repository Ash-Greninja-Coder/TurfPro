const mongoose = require('mongoose');

const turfSchema = new mongoose.Schema({
    name: { type: String, required: true },
    imageUrl: { type: String, required: true },
    games: { type: String, required: true },
    location: { type: String, required: true },
    openHours: { type: String, required: true },
    discount: { type: String, required: true },
    rating: { type: Number, required: true },
});

const Turf = mongoose.model('Turf', turfSchema);

module.exports = Turf;
