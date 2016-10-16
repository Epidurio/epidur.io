# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

interventions = Intervention.create([{ name: 'Epidural' }, { name: 'Epidural Top Up' }, { name: 'Spinal' }, { name: 'CSE' }, { name: 'Intrathecal Catheter' }, { name: 'PCA' }, { name: 'GA' }])

checklists = Checklist.create([{ question: 'nausea' }, { question: 'itching' }, { question: 'headache' }, { question: 'leg weakness' }, { question: 'Leg numbness' }, { question: 'back pain' }, { question: 'urinary retention' }])
