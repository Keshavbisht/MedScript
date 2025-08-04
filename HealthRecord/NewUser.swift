import SwiftUI

struct DoctorRegisterPage: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var state = ""
    @State private var country = ""
    @State private var clinicName = ""
    @State private var LicenseNumber = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.teal.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // App Icon / Title
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.teal)
                        .padding(.top, 40)
                    
                    Text("Doctor Registration")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.teal)
                    
                    Spacer()
                    
                    // Fields
                    HStack {
                        inputField("First Name", text: $firstName)
                        inputField("Last Name", text: $lastName)
                    }
                    
                    HStack {
                        inputField("State", text: $state)
                        inputField("Country", text: $country)
                    }
                    fullWidthField("License Number", text: $LicenseNumber)
                    fullWidthField("Clinic Name", text: $clinicName)
                    fullWidthField("Email", text: $email)
                    
                    secureField("Password", text: $password)
                    secureField("Confirm Password", text: $confirmPassword)
                    
                    // Error Message
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, -5)
                    }
                    
                    // Register Button
                    Button(action: registerDoctor) {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 10)
                    
                    // Login Link
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        Button("Login") {
                            print("Navigate to login")
                        }
                        .foregroundColor(.teal)
                    }
                    .font(.footnote)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
    
    // MARK: - Register Function
    private func registerDoctor() {
        if firstName.isEmpty || lastName.isEmpty || state.isEmpty || country.isEmpty || clinicName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "All fields are required."
            return
        }
        
        if password != confirmPassword {
            errorMessage = "Passwords do not match."
            return
        }
        
        print("Doctor Registered: \(firstName) \(lastName)")
        errorMessage = ""
    }
    
    // MARK: - Styled Fields
    func inputField(_ placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.15), radius: 5, x: 0, y: 3)
    }
    
    func fullWidthField(_ placeholder: String, text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.15), radius: 5, x: 0, y: 3)
    }
    
    func secureField(_ placeholder: String, text: Binding<String>) -> some View {
        SecureField(placeholder, text: text)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.15), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    DoctorRegisterPage()
}
