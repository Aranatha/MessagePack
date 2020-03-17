
/// Used as the underlying error inside a `DecodingError`.
enum MessagePackError: Error {
	/// Reached the end while decoding.
	case prematureEndOfData
}
