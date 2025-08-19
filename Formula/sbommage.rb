class Sbommage < Formula
  desc "Interactive terminal frontend for viewing Software Bill of Materials (SBOM) files"
  homepage "https://github.com/popey/sbommage"
  url "https://github.com/popey/sbommage/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "d7efdcbb4a7dd19e1f0006cd1760f407c8b4dab2971c97420111443cc7f2a151"
  license "MIT"

  depends_on "python@3.11"

  include Language::Python::Virtualenv

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-0.85.2.tar.gz"
    sha256 "2a416995c49d5381a81d0a6fd23925cb0e3f14b4f239ed05f35fa3c981bb1df2"
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
