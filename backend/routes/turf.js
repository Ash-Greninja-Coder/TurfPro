const express = require('express');
const Turf = require('../models/Turf');
const router = express.Router();

// Get turf by ID
router.get('/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const turf = await Turf.findById(id);
        if (!turf) {
            return res.status(404).json({ message: 'Turf not found' });
        }
        res.status(200).json(turf);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching turf details', error });
    }
});

module.exports = router;
