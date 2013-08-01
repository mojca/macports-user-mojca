# -*- coding: utf-8; mode: tcl; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- vim:fenc=utf-8:ft=tcl:et:sw=4:ts=4:sts=4
# $Id: $

options     wxWidgets.confpath
options     wxWidgets.confscript

options     wxWidgets.use_version
option_proc wxWidgets.use_version wxWidgets._set_version

proc wxWidgets._set_version {option action args} {
    if {"set" != ${action}} {
        return
    }

    if {${args} == "2.8"} {
        wxWidgets.confpath   {${prefix}/libexec/wxWidgets/2.8}
    } elseif {${args} == "3.0"} {
        wxWidgets.confpath   {${prefix}/libexec/wxWidgets/2.9}
    } else {
        # throw an error
    }
    wxWidgets.confscript {${wxWidgets.confpath}/wx-config}
}
