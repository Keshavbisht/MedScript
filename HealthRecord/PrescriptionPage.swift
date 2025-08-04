import SwiftUI

struct PrescriptionPage: View {
    @State private var name = ""
    @State private var pnumber = ""
    @State private var birthDate = Date()
    @State private var age: Int = 0
    @State private var weight = ""
    @State private var gender = ""
    @State private var symptoms = ""
    @State private var tests = ""
    @State private var addedSymptoms: Set<String> = []
    @State private var temperature=""
    @State private var bp = ""
    @State private var oxy = ""
    @State private var medicine = ""
    @State private var medications: [Medication] = [Medication()]
    @State private var instructions = ""
    
    @State private var addedTests: Set<String> = []
    let commonTests = ["CBC", "Thyroid"]
    let commonSymptoms = ["Fever", "Cough", "Headache", "Cold", "Fatigue", "Vomiting"]
    let genders = ["Male", "Female", "Other"]
    
    
    var body: some View {
        ZStack {
//            Color.teal.opacity(0.2).ignoresSafeArea()
//            Color.gray.opacity(0.1).ignoresSafeArea()
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.teal.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 10) {
                    
                    
                    Text("DOCTOR'S PRESCRIPTION")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    
                    // Patient Info
                    //                    Text("Box1")
                    
                    patientInfoBox
                    
                   
                    
                    //---------------------- Text("Box2") 2
                    
                    vitalsBox
                    
                    
                    
                    
                    // ----------------------Text("Box3")
                    
                    symptomsBox
                    
                    
                    
                    // --------------------------Text("BOX 4")
                    medicationSection
                    
                    
                    
                    testBox
                    //------------
                    instruction
                    
                    // Voice NOte feature
                    
                    HStack{
                        Button(action: {print("Submit Button Pressed")},
                               label: {
                            ZStack{
                                
                                Rectangle()
                                    .fill(Color.teal.opacity(0.4)).frame(width:100, height:50)
                                Text("Submit").bold()
                                    .foregroundColor(.black)
                            }
                        })
                    }
//                    
//                    .padding()
//                    .background(Color.white)
                    .cornerRadius(8)
                    .padding(.horizontal)

                    
                    
                    
                    
                }
            }
        }
    }
    
    var patientInfoBox: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: "👤 Patient Info")
                .foregroundColor(.blue)
            
            TextField("Name", text: $name)
                .padding(.horizontal)
                .frame(height: 40)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
            TextField("Mobile Number", text: $pnumber)
                .padding(.horizontal)
                .frame(height: 40)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
            
            DatePicker("Date of Birth", selection: $birthDate, displayedComponents: .date)
                .datePickerStyle(.compact)
                .padding(.horizontal)
                .onChange(of: birthDate) {
                    let calendar = Calendar.current
                    let now = Date()
                    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
                    age = ageComponents.year ?? 0
                }
            
            Text("Age: \(age) years")
                .padding(.horizontal)
                .foregroundColor(.black)
                .font(.subheadline)
            
            HStack {
                TextField("Weight", text: $weight)
                    .frame(width: 54, height: 10)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
                
                Text("Kg")
                
                Spacer()
                Text("Gender").foregroundColor(.gray)
                
                Picker("Gender", selection: $gender) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.6), lineWidth: 1))
            }
        }
        
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    var vitalsBox: some View {
        //oxymeter
        VStack {
            HStack(spacing:5) {
                TextField("temperature", text: $temperature)
                    .frame( height: 10)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
                
                TextField("Oxygen", text: $oxy)
                    .frame(height: 10)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
                
                TextField("BloodPressure", text: $bp)
                    .frame( height: 10)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
                
            }
        }
        .padding()
        
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        
    }
    var symptomsBox: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: "Symptoms")
                .foregroundColor(.blue)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(commonSymptoms.filter { !addedSymptoms.contains($0) }, id: \.self) { symptom in
                        Button(action: {
                            if !symptoms.contains(symptom) {
                                if !symptoms.isEmpty && !symptoms.hasSuffix(", ") {
                                    symptoms += ", "
                                }
                                symptoms += symptom
                            }
                            addedSymptoms.insert(symptom)
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                Text(symptom)
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
            }
            
            StyledTextEditor(text: $symptoms, placeholder: "Describe symptoms...")
                .frame(minHeight: 100)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    //MEDICATIONS
    var medicationSection: some View {
        VStack(alignment: .leading, spacing: 15) {
            SectionHeader(title: "Medications").foregroundColor(.blue)
            
            ForEach($medications) { $medication in
                VStack(alignment: .leading, spacing: 8) {
                    
                    // Medicine Name Field
                    TextField("Medicine Name", text: $medication.name)
                        .padding(.horizontal)
                        .frame(height: 40)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black.opacity(0.3), lineWidth: 0.5))
                    
                    // Dropdown Frequency Selector
                    DisclosureGroup("Select Frequency") {
                        VStack(alignment: .leading, spacing: 10) {
                            frequencyPill("Before Breakfast", isOn: $medication.beforeBreakfast)
                            frequencyPill("After Breakfast", isOn: $medication.afterBreakfast)
                            frequencyPill("After Lunch", isOn: $medication.afterLunch)
                            frequencyPill("Dinner", isOn: $medication.afterdinner)
                        }
                        .padding(.top, 5)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    
                    // Remove Button
                    if medications.count > 1 {
                        Button(action: {
                            if let index = medications.firstIndex(where: { $0.id == medication.id }) {
                                medications.remove(at: index)
                            }
                        }) {
                            Label("Remove Medication", systemImage: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
            }
            
            // Add Button
            Button(action: {
                medications.append(Medication())
            }) {
                Label("Add Medication", systemImage: "plus.circle.fill")
                    .foregroundColor(.blue)
            }
            .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    struct Medication: Identifiable {
        let id = UUID()
        var name: String = ""
        var beforeBreakfast: Bool = false
        var afterBreakfast: Bool = false
        var afterLunch: Bool = false
        var afterdinner: Bool = false
    }
    
    
    func frequencyPill(_ title: String, isOn: Binding<Bool>) -> some View {
        Button(action: { isOn.wrappedValue.toggle() }) {
            Text(title)
                .font(.subheadline)
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(isOn.wrappedValue ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isOn.wrappedValue ? .white : .black)
                .cornerRadius(20)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var testBox: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeader(title: "Tests")
                .foregroundColor(.blue)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // Loop through all available tests except the ones already added
                    ForEach(commonTests.filter { !addedTests.contains($0) }, id: \.self) { test in
                        Button(action: {
                            if !tests.contains(test) { // Check if this test is already in the text string
                                if !tests.isEmpty && !tests.hasSuffix(", ") {
                                    tests += ", "
                                }
                                tests += test
                            }
                            addedTests.insert(test) // Mark as added
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.blue)
                                Text(test) // Show the test name, not the tests string
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                    }
                }
            }
            
            // Multi-line input for test notes
            StyledTextEditor(text: $tests, placeholder: "Describe tests...")
                .frame(minHeight: 100)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    var instruction: some View{
        VStack{
            SectionHeader(title:"INSTRUCTIONS").foregroundColor(.blue)
            StyledTextEditor(text: $instructions, placeholder: "Describe instructions...")
                .frame(minHeight: 100)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
    }

    }
    


    // MARK: - Dummy Section Header
struct SectionHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.bottom, 5)
    }
}
        struct StyledTextEditor: View {
            @Binding var text: String
            var placeholder: String
            
            @State private var isEditing = false
            
            var body: some View {
                ZStack(alignment: .topLeading) {
                    if text.isEmpty && !isEditing {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 8)
                    }
                    TextEditor(text: $text)
                        .padding(4)
                        .background(Color.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            isEditing = true
                        }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
        }

    



#Preview{
    PrescriptionPage()
}
