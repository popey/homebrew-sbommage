class Sbommage < Formula
  desc "Interactive terminal frontend for viewing Software Bill of Materials (SBOM) files"
  homepage "https://github.com/popey/sbommage"
  url "https://github.com/popey/sbommage/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "b2637dd17dda70b0b3405056ee40a697029a315e0217bd2a57d503a9d5b02bf5"
  license "MIT"

  depends_on "python@3.11"

  include Language::Python::Virtualenv

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-5.3.0.tar.gz"
    sha256 "1b6128b339adef2e298cc23ab4777180443240ece5c232f29b22960efd658d4d"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57baf48d5ea3184f21d9a2befa098"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/source/t/typing-extensions/typing_extensions-4.14.1.tar.gz"
    sha256 "38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36"
  end
  
  def install
    python3 = "python3.11"
    venv = virtualenv_create(libexec, python3)

    resources.each do |r|
      venv.pip_install r
    end

    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"sbommage", "--help"
  end
end
