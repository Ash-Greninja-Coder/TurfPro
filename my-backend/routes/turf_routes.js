const express = require('express');
const router = express.Router();
const Turf = require('../models/turf');

// Get all turfs
router.get('/turfs', async (req, res) => {
  try {
    const turfs = await Turf.find();
    res.json(turfs);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

// Create a new turf
router.post('/turfs', async (req, res) => {
  const turf = new Turf({
    name: req.body.name,
    imageUrl: req.body.imageUrl,
    games: req.body.games,
    location: req.body.location,
    openHours: req.body.openHours,
    discount: req.body.discount,
    rating: req.body.rating,
    available_slots: req.body.available_slots,
  });

  try {
    const newTurf = await turf.save();
    res.status(201).json(newTurf);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// Update a turf
router.patch('/turfs/:id', async (req, res) => {
  try {
    const turf = await Turf.findById(req.params.id);
    if (!turf) return res.status(404).json({ message: 'Turf not found' });

    // Update fields
    if (req.body.name) turf.name = req.body.name;
    if (req.body.imageUrl) turf.imageUrl = req.body.imageUrl;
    if (req.body.games) turf.games = req.body.games;
    if (req.body.location) turf.location = req.body.location;
    if (req.body.openHours) turf.openHours = req.body.openHours;
    if (req.body.discount) turf.discount = req.body.discount;
    if (req.body.rating) turf.rating = req.body.rating;
    if (req.body.available_slots) turf.available_slots = req.body.available_slots;

    const updatedTurf = await turf.save();
    res.json(updatedTurf);
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
});

// Delete a turf
router.delete('/turfs/:id', async (req, res) => {
  try {
    const turf = await Turf.findById(req.params.id);
    if (!turf) return res.status(404).json({ message: 'Turf not found' });

    await turf.remove();
    res.json({ message: 'Deleted Turf' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;