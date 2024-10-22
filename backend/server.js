const express = require('express');
const cors = require('cors');
const mongoose = require('mongoose');
const nodemailer = require('nodemailer');
const User = require('./models/User');
const Payment = require('./models/Payments');
require('dotenv').config();

const app = express();
app.use(express.json());
app.use(cors());

mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('MongoDB connection error:', err));

app.post('/api/user/forgot-password', async (req, res) => {
  const { email } = req.body;

  try {
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      },
    });

    // const resetToken = 'YOUR_GENERATED_TOKEN_HERE'; 
    const mailOptions = {
      from: process.env.EMAIL_USER,
      to: email,
      subject: 'Password Reset Instructions',
      text: `Hi ${user.name},\n\nTo reset your password, please follow the link below:\n\nhttp://yourfrontend.com/reset-password?token=${resetToken}\n\nBest,\nYour App Name`,
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).json({ message: 'Error sending email' });
      }
      res.status(200).json({ message: 'Password reset instructions sent' });
    });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
});

const paymentRoutes = require('./routes/paymentsRoutes');
app.use('/api/payments', paymentRoutes);

const adminRoutes = require('./routes/admin');
const managerRoutes = require('./routes/manager');
const userRoutes = require('./routes/user');

app.use('/api/admin', adminRoutes);
app.use('/api/manager', managerRoutes);
app.use('/api/user', userRoutes);

app.use((req, res, next) => {
  res.status(404).json({ message: 'Not Found' });
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Internal Server Error' });
});

const turfRoutes = require('./routes/turf');
app.use('/api/turf', turfRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}`);
});
