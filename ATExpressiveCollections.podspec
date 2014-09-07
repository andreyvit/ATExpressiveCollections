Pod::Spec.new do |s|

  s.name         = "ATExpressiveCollections"
  s.version      = "1.0.0"
  s.summary      = "NSArray and NSDictionary categories that help you write more expressive code."
  s.description  = <<-DESC
    Rationale, in 3 simple claims:

    1. There are 3 types of code:

        * Algorithmic / data structure-heavy code (e.g. “create an empty array with the given capacity, iterate over the input collection, perform a test on each element, add the elements passing the test to the output array”)

        * API-heavy code (e.g. “get a file manager, ask for the properties of the given resources, check for errors”)

        * Domain logic (e.g. “ignore missing files”)

    2. It's a bad idea to mix these types of code in a single method.

    3. So when you find yourself writing multiple lines of collection fiddling code and multiple lines of API interaction/domain logic code in the same method, you should extract the algorithmic parts into a separate helper method.

    ATExpressiveCollections is a bunch of algorithmic helpers extracted from my apps over a long period of time.
  DESC

  s.homepage     = 'https://github.com/andreyvit/ATExpressiveCollections'
  s.source       = { :git => 'https://github.com/andreyvit/ATExpressiveCollections.git', :tag => 'v1.0.0' }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Andrey Tarantsov' => 'andrey@tarantsov.com' }
  s.social_media_url = 'http://twitter.com/andreyvit'

  s.source_files = 'ATExpressiveCollections'

  s.requires_arc = true

end
