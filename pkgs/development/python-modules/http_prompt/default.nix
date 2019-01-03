{ stdenv
, buildPythonPackage
, fetchPypi
, click
, httpie
, parsimonious
, prompt_toolkit
, pygments
, six
}:

buildPythonPackage rec {
  pname = "http-prompt";
  version = "1.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "41c24349cb0ca279ddfbb9db97fb26c43d7ab448ab30fd485ba17c74c20606ad";
  };

  propagatedBuildInputs = [ click httpie parsimonious prompt_toolkit pygments six ];

  # No tests
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "http://http-prompt.com";
    description = "HTTPie + prompt_toolkit = an interactive command-line HTTP client featuring autocomplete and syntax highlighting";
    license = licenses.mit;
  };
}
