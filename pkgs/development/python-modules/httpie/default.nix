{ stdenv
, buildPythonPackage
, fetchPypi
, requests
, pygments
}:

buildPythonPackage rec {
  pname = "httpie";
  version = "1.0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "d746cfb014b9de6ac5cdd1fa06d85f411dd9506102c8b094906460b4a1710681";
  };

  propagatedBuildInputs = [ requests pygments ];

  # No tests
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = https://github.com/jakubroztocil/httpie;
    description = "Modern command line HTTP client";
    license = licenses.bsd3;
  };
}
