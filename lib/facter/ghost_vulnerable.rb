# This fact tests whether or not a given glibc is vulernable via GHOST.
# See http://www.cyberciti.biz/files/scripts/GHOST-test.sh.txt

Facter.add('ghost_vulnerable') do
  setcode do

    # glibc-2.12-1.132.el6.x86_64
    glibc_rpm = Facter::Core::Execution.exec(%q[rpm -q --qf '%{name}-%{version}-%{release}.%{arch}\\n' glibc])

    if glibc_rpm.include?('not installed') == false and glibc_rpm.empty? == false
      # there may be more than one package name espeically if the 64bit and 32bit version are
      # installed. We need to fix this here.
      glibc_rpm = glibc_rpm.split("\n")[0]

      ver = glibc_rpm.split("-")[1]
      (maj, min) = ver.split(".").map { |s| s.to_i }

      if maj > 2 or (maj == 2 and min >= 18)
        # fixed upstream
        'false'
      else
        # all RHEL updates include CVE in rpm %changelog
        chg_log = Facter::Core::Execution.exec("rpm -q --changelog #{glibc_rpm} | grep 'CVE-2015-0235'")

        chg_log.empty?
      end
    else
      # if we get here, then glibc must not be installed repot unknown
      'unknown'
    end
  end
end
