import SwiftUI

struct LoginPage: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.teal.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // App Icon / Logo
                Image(systemName: "cross.case.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.teal)
                    .padding(.top, 60)
                
                Text("Doctor's Prescription")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.teal)
                
                Spacer()
                
                // Username Field
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.15), radius: 5, x: 0, y: 3)
                    .padding(.horizontal)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.15), radius: 5, x: 0, y: 3)
                    .padding(.horizontal)
                
                
                Button(action: {
                    print("Login Pressed")
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // Forgot / New User Links
                HStack {
                    Button("Forgot Password?") {
                        print("Forgot pressed")
                    }
                    .foregroundColor(.gray)
                    Spacer()
                    Button("New User?") {
                        print("New user pressed")
                    }
                    .foregroundColor(.teal)
                }
                .padding(.horizontal)
                .font(.footnote)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginPage()
}
