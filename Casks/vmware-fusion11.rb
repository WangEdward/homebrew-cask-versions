cask "vmware-fusion11" do
  version "11.5.7-17130923"
  sha256 "c7d58ca44510de6c1ddffe86129ed19982114e742d71e7d81e4a5882036e06e3"

  url "https://download3.vmware.com/software/fusion/file/VMware-Fusion-#{version}.dmg"
  name "VMware Fusion"
  desc "App to run other operating systems without rebooting"
  homepage "https://www.vmware.com/products/fusion.html"

  auto_updates true
  conflicts_with cask: %w[
    vmware-fusion
    vmware-fusion7
    vmware-fusion8
    vmware-fusion10
    vmware-fusion12
    vmware-fusion-tech-preview
  ]
  depends_on macos: ">= :mojave"

  app "VMware Fusion.app"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vkd/bin/vctl"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-bridge"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cfgcli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-cli"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-dhcpd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-natd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-netifup"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmnet-sniffer"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrest"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmrun"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmss2core"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-aewp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-authd"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-cloneBootCamp"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-id"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-ntfs"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskAuthTool"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-rawdiskCreator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-remotemks"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-usbarbitrator"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vdiskmanager"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmdkserver"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-debug"
  binary "#{appdir}/VMware Fusion.app/Contents/Library/vmware-vmx-stats"

  postflight do
    system_command "#{appdir}/VMware Fusion.app/Contents/Library/Initialize VMware Fusion.tool",
                   args: ["set"],
                   sudo: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/VMware Fusion.app"
  end

  uninstall delete: "/etc/paths.d/com.vmware.fusion.public"

  zap trash: [
    "/Library/Application Support/VMware",
    "/Library/Logs/VMware Fusion Services.log",
    "/Library/Logs/VMware USB Arbitrator Service.log",
    "/Library/Logs/VMware",
    "/Library/Preferences/VMware Fusion",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.vmware.fusion.sfl*",
    "~/Library/Application Support/VMware Fusion",
    "~/Library/Caches/com.vmware.fusion",
    "~/Library/Logs/VMware Fusion",
    "~/Library/Logs/VMware Graphics Service.log",
    "~/Library/Logs/VMware",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist",
    "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusion.plist",
    "~/Library/Preferences/com.vmware.fusion.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist",
    "~/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist",
    "~/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile",
    "~/Library/Preferences/VMware Fusion",
    "~/Library/Saved Application State/com.vmware.fusion.savedState",
    "~/Library/WebKit/com.vmware.fusion",
  ]

  caveats do
    discontinued
    kext
  end
end
