const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/User');
const Turf = require('../models/Turf');
const Feedback = require('../models/Feedback');
const Slot = require('../models/Slot');
const router = express.Router();

// Create a slot
router.post('/slots', async (req, res) => {
    const { sport, date, time } = req.body;
    const newSlot = new Slot({ sport, date, time });
    try {
        await newSlot.save();
        res.status(201).json({ message: 'Slot created successfully', slot: newSlot });
    } catch (error) {
        res.status(400).json({ message: 'Error creating slot', error });
    }
});

// Get all slots
router.get('/slots', async (req, res) => {
    try {
        const slots = await Slot.find();
        res.status(200).json(slots);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching slots', error });
    }
});

// Admin: Add a new manager
router.post('/addManager', async (req, res) => {
    const { username, email, password } = req.body;

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const manager = new User({
            name: username,  // Assuming username is actually the name field
            email,
            password: hashedPassword,
            role: 'manager'
        });

        await manager.save();
        res.status(201).json({ message: 'Manager added successfully', manager });
    } catch (error) {
        res.status(400).json({ message: 'Error adding manager' });
    }
});

// Admin: Add a new turf
router.post('/addTurf', async (req, res) => {
    const { name, sport } = req.body;

    try {
        const turf = new Turf({ name, sport, availableSlots: [] });
        await turf.save();
        res.status(201).json({ message: 'Turf added successfully', turf });
    } catch (error) {
        res.status(400).json({ message: 'Error adding turf' });
    }
});

// Admin: Manage feedback
router.put('/feedback/:id', async (req, res) => {
    const { id } = req.params;
    const { response } = req.body;

    try {
        const feedback = await Feedback.findByIdAndUpdate(
            id,
            { response, status: 'responded' },
            { new: true }
        );

        if (!feedback) return res.status(404).json({ message: 'Feedback not found' });
        res.status(200).json({ message: 'Feedback responded to', feedback });
    } catch (error) {
        res.status(500).json({ message: 'Failed to respond to feedback' });
    }
});

// Admin: View all feedback
router.get('/feedback', async (req, res) => {
    try {
        const feedbacks = await Feedback.find().populate('userId');
        res.status(200).json(feedbacks);
    } catch (error) {
        res.status(500).json({ message: 'Error fetching feedback' });
    }
});

// Admin dashboard route
router.get('/dashboard', (req, res) => {
    // Logic for fetching admin dashboard data
    res.json({ message: 'Admin dashboard data' });
});

module.exports = router;
