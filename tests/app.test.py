import unittest
import requests

class TestApp(unittest.TestCase):
  def setUp(self):
    pass

  def test_api_ip(self):
    output1 = requests.get("http://localhost:8080/api/ip")
    output2 = requests.get("http://localhost:8080/api/ip")
    self.assertNotEqual(output1.json(), output2.json())

if __name__ == '__main__':
  unittest.main()