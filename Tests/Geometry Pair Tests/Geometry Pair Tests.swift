import Geometry
import Geometry_Pair
import Pair
import Testing

@Suite
struct `Geometry Pair Tests` {

    @Test
    func `curvature value retains discriminator and payload`() {
        let value = Curvature.Value(.convex, "outward")

        #expect(value.first == .convex)
        #expect(value.second == "outward")
    }
}
