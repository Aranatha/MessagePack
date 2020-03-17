
/// Used as the underlying error inside a `DecodingError`.
public enum MessagePackError: Error {
	/// Reached the end while decoding.
	case prematureEndOfData
}
