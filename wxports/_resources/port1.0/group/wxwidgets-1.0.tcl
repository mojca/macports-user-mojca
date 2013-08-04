# -*- coding: utf-8; mode: tcl; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=tcl:et:sw=4:ts=4:sts=4
# $Id$

options     wxWidgets.confpath
options     wxWidgets.confscript

# Poedit also needs
# build.env-append  GETTEXT_PREFIX=${prefix} WX_ROOT=${prefix}

options     wxWidgets.supported_versions
option_proc wxWidgets.supported_versions wxWidgets._set_supported_versions

options     wxWidgets.use_version
option_proc wxWidgets.use_version wxWidgets._set_version

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

proc wxWidgets._set_version {option action args} {
    global prefix
    if {"set" != ${action}} {
        return
    }

    if {${args} == "2.8"} {
        wxWidgets.confpath   ${prefix}/libexec/wxWidgets/2.8
        # wxWidgets is not universal and is 32-bit only
        universal_variant    no
        supported_archs      i386 ppc
        # TODO
        # - doesn't build on 10.8 (darwin 12) or later
        # - probably doesn't built on 10.7 (darwin 11) with Xcode 4.4 or later
        # - needs to use 10.6 SDK on 10.7 with earlier versions of Xcode
        #   wxWidgets itself uses
        #       --with-macosx-version-min=10.6
        #       --with-macosx-sdk=${developer_dir}/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk
        #       --with-macosx-sdk=${developer_dir}/SDKs/MacOSX10.6.sdk
        #   some ports use
        #       configure.cxxflags-append -isysroot ${developer_dir}/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk
        #       configure.cxxflags-append -isysroot ${developer_dir}/SDKs/MacOSX10.6.sdk
        # example from a port (needs a review/patch):
        #
        # platform darwin 11 {
        #     if {[vercmp $xcodeversion 4.4] >= 0} {
        #         # doesn't work!!!
        #     } elseif {[vercmp $xcodeversion 4.3] >= 0} {
        #         configure.cxxflags-append -isysroot ${developer_dir}/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.6.sdk
        #     } else {
        #         configure.cxxflags-append -isysroot ${developer_dir}/SDKs/MacOSX10.6.sdk
        #     }
        # }
    } elseif {${args} == "3.0"} {
        wxWidgets.confpath   ${prefix}/libexec/wxWidgets/2.9
    } else {
        # throw an error
    }
    wxWidgets.confscript {${wxWidgets.confpath}/wx-config}
}

# default that can be overridden
wxWidgets.use_version   3.0
