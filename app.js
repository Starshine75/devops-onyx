const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

// MongoDB configuration
const mongoDBURI = 'mongodb://admin:adminpassword@localhost:27017/your-database-name';

// Connect to MongoDB
mongoose.connect(mongoDBURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => console.log('Connected to MongoDB'))
  .catch((err) => console.error('MongoDB connection error:', err));

// Define a simple schema and model for demo purposes
const Schema = mongoose.Schema;
const demoSchema = new Schema({
  name: String,
  email: String,
});

const DemoModel = mongoose.model('Demo', demoSchema);

// Create and save a new document in the MongoDB
const demoData = {
  name: 'John Doe',
  email: 'john.doe@example.com',
};

const demoInstance = new DemoModel(demoData);

demoInstance.save()
  .then(() => console.log('Demo data saved successfully'))
  .catch((err) => console.error('Error saving demo data:', err));

// Route to fetch the demo data from MongoDB
app.get('/demo', (req, res) => {
  DemoModel.find({}, (err, demos) => {
    if (err) {
      console.error('Error fetching demo data:', err);
      return res.status(500).send('Internal Server Error');
    }
    return res.json(demos);
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
