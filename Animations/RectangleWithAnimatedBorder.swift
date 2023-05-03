struct RectangleWithAnimatedBorder: View
{
	@State private var trim1: CGFloat = 0.0
	@State private var trim2: CGFloat = 0.0

	var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 5)
				.fill(LinearGradient(colors: [Color(.controlAccentColor)], startPoint: .top, endPoint: .bottom))
				RoundedRectangle(cornerRadius: 5)
					.trim(from: trim1-0.2, to: trim1)
					.stroke(.white, lineWidth: 4)
					.mask({
						RoundedRectangle(cornerRadius: 5)
					})
				
				RoundedRectangle(cornerRadius: 5)
					.trim(from: trim2-0.2, to: trim2)
					.stroke(.white, lineWidth: 4)
					.rotationEffect(Angle(degrees: 180))
					.mask({
						RoundedRectangle(cornerRadius: 5)
					})
			
		}
		.onAppear() {
			trim1 = 0.0
			trim2 = 0.5
			withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) { trim1 = 1.0}
			withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) { trim2 = 1.5}
		}

	}
}

struct RectangleWithAnimatedBorder_Previews: PreviewProvider {
	static var previews: some View {
		VStack
		{
			RectangleWithAnimatedBorder()
		}
		.frame(width: 300, height: 50)
		.padding(20)
	}
}
