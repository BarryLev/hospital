Patient.create({name: Faker::Name.name, password: "password", phone: "0969296929"})
Admin.create({name: Faker::Name.name, password: "password", phone: "0969296927"})

Category.create(name: Faker::ProgrammingLanguage.name)
Doctor.create({name: Faker::Name.name, password: "password", phone: "0969296928", category: Category.first})

Appointment.create(active: true, patient: Patient.last, doctor: Doctor.last)
