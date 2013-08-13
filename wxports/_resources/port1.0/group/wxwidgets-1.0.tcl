# -*- coding: utf-8; mode: tcl; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=tcl:et:sw=4:ts=4:sts=4
# $Id$

options     wxWidgets.name
options     wxWidgets.trueversion
options     wxWidgets.prefix

options     wxWidgets.wxdir
options     wxWidgets.wxconfig
options     wxWidgets.wxrc

options     wxWidgets.sdk
options     wxWidgets.macosx_version_min

wxWidgets.name               ""
wxWidgets.trueversion        ""
wxWidgets.prefix             ""
wxWidgets.wxdir              ""
wxWidgets.wxconfig           ""
wxWidgets.wxrc               ""
wxWidgets.sdk                ""
wxWidgets.macosx_version_min ""

# Poedit also needs
# build.env-append  GETTEXT_PREFIX=${prefix} WX_ROOT=${prefix}

options     wxWidgets.supported_versions
option_proc wxWidgets.supported_versions wxWidgets._set_supported_versions

options     wxWidgets.use
option_proc wxWidgets.use wxWidgets._set

# options     wxWidgets.use_version
# option_proc wxWidgets.use_version wxWidgets._set_version

# TODO
# - parameters can be "2.8", "3.0" or "2.8 3.0"
#
# This parameter should be set for every port and could be useful on Tiger
# to switch to 2.8 automatically even when 3.0 is the default elsewhere
# or to provent using 3.0 for ports that don't support this
#
# With proper implementation wxWidgets.use_version should only be needed in Portfile
# in special cases (when a specific port wants to support multiple wxWidgets versions)
# or in the PortGroup itself (but then we might need another name)
proc wxWidgets._set_supported_versions {option action args} {
}

# parameters: "wxWidgets-2.8" "wxGTK-2.8" "wxWidgets-3.0" "wxPython-3.0"
proc wxWidgets._set {option action args} {
    global prefix frameworks_dir os.major
    global wxWidgets.name wxWidgets.trueversion wxWidgets.prefix wxWidgets.wxdir
    if {"set" != ${action}} {
        return
    }

    if {${args} == "wxWidgets-2.8"} {
        wxWidgets.name          "wxWidgets"
        wxWidgets.trueversion   "2.8"

        # wxWidgets is not universal and is 32-bit only
        universal_variant       no
        supported_archs         i386 ppc
        compiler.blacklist      clang

        puts "wxWidgets-2.8"
        pre-fetch {
            # 10.8 (or later) -or- 10.7 with Xcode 4.4 (or later)
            if {${os.major} >= 12 || [vercmp $xcodeversion 4.4] >= 0} {
                ui_error "wxWidgets-2.8 cannot be built on Moc OS X >= 10.7 with Xcode >= 4.4, please use port wxWidgets-3.0 or wxgtk-2.8 instead"
                return -code return "wxWidgets-2.8 cannot be built on Moc OS X >= 10.7 with Xcode >= 4.4, please use port wxWidgets-3.0 or wxgtk-2.8 instead"
            } else {
                # 10.7
                if {${os.major} == 11} {
                    if {[vercmp $xcodeversion 4.3] < 0} {
                        set sdks_dir "${developer_dir}/SDKs"
                    } else {
                        set sdks_dir "${developer_dir}/Platforms/MacOSX.platform/Developer/SDKs"
                    }
                    wxWidgets.sdk "${sdks_dir}/MacOSX10.6.sdk"
                    wxWidgets.macosx_version_min "10.6"
                }
            }
        }
    } elseif {${args} == "wxGTK-2.8"} {
        wxWidgets.name          "wxGTK"
        wxWidgets.trueversion   "2.8"
    } elseif {${args} == "wxWidgets-3.0"} {
        wxWidgets.name          "wxWidgets"
        wxWidgets.trueversion   "2.9"
        if {${os.major} < 9} {
            pre-fetch {
                ui_error "wxWidgets-3.0 requires Mac OS X 10.5 or later."
                return -code error "incompatible Mac OS X version"
            }
        }
    } elseif {${args} == "wxPython-3.0"} {
        wxWidgets.name          "wxPython"
        wxWidgets.trueversion   "2.9"
        if {${os.major} < 9} {
            pre-fetch {
                ui_error "wxPython-3.0 requires Mac OS X 10.5 or later."
                return -code error "incompatible Mac OS X version"
            }
        }
    } else {
        # throw an error
        ui_error "invalid parameter for wxWidgets.use; use one of: wxWidgets-2.8/wxGTK-2.8/wxWidgets-3.0/wxPython-3.0"
        return -code return "invalid parameter for wxWidgets.use"
    }
    wxWidgets.prefix    ${frameworks_dir}/wxWidgets.framework/Versions/${wxWidgets.name}/${wxWidgets.trueversion}

    wxWidgets.wxdir     ${wxWidgets.prefix}/bin
    wxWidgets.wxconfig  ${wxWidgets.wxdir}/wx-config
    wxWidgets.wxrc      ${wxWidgets.wxdir}/wxrc
}
