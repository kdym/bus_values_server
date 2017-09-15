module VersionHelper
  MAJOR_VERSION = 1
  MINOR_VERSION = 0
  DIST_VERSION = 0
  BETA = true

  def get_version_info
    if BETA then
      sprintf '%s.%s.%s-beta', MAJOR_VERSION, MINOR_VERSION, DIST_VERSION
    else
      sprintf '%s.%s.%s', MAJOR_VERSION, MINOR_VERSION, DIST_VERSION
    end
  end
end
