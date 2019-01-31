# Useful-Extensions
Collection of useful extensions for Swift iOS development

UIColor:
- Convert hexString to UIColor:
convenience init(hexString: String, alpha: CGFloat = 1.0) 
E.g. let turquoise = UIColor(hexString: "#40E0D0", alpha: 0.8)

UIImageView: 
- Cache image:
func setImage(urlString: String, defaultImage: UIImage? = nil)
set image to UIImageView with a url link, optionally inserting a default image if it fails to get an image from the link
E.g. let imageView = UIImageView()
imageView.setImage(urlString: "urllinktoyourimage.com", defaultImage: UIImage(named: "yourimage"))
