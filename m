Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12DF40C7A4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 16:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237921AbhIOOoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Sep 2021 10:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233745AbhIOOox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Sep 2021 10:44:53 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53610C061574
        for <linux-gpio@vger.kernel.org>; Wed, 15 Sep 2021 07:43:34 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id b10so6568293ejg.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Sep 2021 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=fv+sBoKpS5HP6lh7vMpNB/6o8jReMLcYib8KLUmy090=;
        b=cSHu/eitss/Tz8pkLnPn4q2/SzkvWdt/k4ebjCCXe+md+gZsxgnTHM1hZ0wTaE6UsY
         9sndLzjVv/F0AO1CsalT4zW9Zjiuik/+Gc9oQ7kR64/ILtwmg+HpV3qBlEPZNEqCVaim
         t9ARNorn5YcIc2SLWZuYR0DyumKQ2TQtgm9gK1tmBZC4by6Abg5b+IEt53Hbj2PgP7X0
         wWSU69K25EKxs1uuCtCDpDYLxmju7hNAdEoEmYJ44jQXeh2NkOpRGPBJ2x2o/LgzAKid
         A/hmmZThJhWKF2ueQwKfSXq5vB30EAX43O8/TnLCvXQiz9Nb+MpUcdJx9+cyVftEEuGI
         RrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=fv+sBoKpS5HP6lh7vMpNB/6o8jReMLcYib8KLUmy090=;
        b=cNju8nbSrfkLhXZH7hHSyTIs1Uo+AyaURoUp6yJdm7aaAvJZWIa62a38Ezv4hgEwt2
         Pn+qolWsn5YcIEGp8IBgK1y/lOR4ewdKACzdURbUbNd2vj9Fl+MFVbQfsLEbdY6bssYN
         N/3FoNpDiRZiUXH51H6EjJ27JLXbnpQHZFMBo68kGHkmAe2xQGLubVy825UgrGfa246j
         H0Ljexvf2jpIS/Jk+SdVQGtmgGuJfq4Yiji9FDnSBYGIB1esETSeYvFKWOKVzWDvuj4F
         gmS338vA7N+0wa7u3kVy0/gtz8u+HGzRBCGoD/86C/lDIQ2giaMsO0/EAmQWlJ0S94+1
         317Q==
X-Gm-Message-State: AOAM533txEmEoONxkxnGY01wfp3l4KXF0+HRnrLfm4YMnq1rh8iFo0Uh
        odLO7S/oP4CoNrURZtnZgfvNPGYv54ynmGJJcRVpv6AGJ70=
X-Google-Smtp-Source: ABdhPJz2hjoxQWuQh5CTpTESaN3zVtJQGTDXbBxbQcWCFoG4TNjhZzIUVNbZIKkA+R1N2GFto8QcA1bpbNdyFyx9S4Q=
X-Received: by 2002:a17:906:7792:: with SMTP id s18mr349147ejm.492.1631717011760;
 Wed, 15 Sep 2021 07:43:31 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Pokorny <andreas.pokorny@gmail.com>
Date:   Wed, 15 Sep 2021 16:43:20 +0200
Message-ID: <CAFKLa4KGvnjR7r6bapP1izfdsSMAst_dy4A6uQuzRfVMNh0ohA@mail.gmail.com>
Subject: [libgpiod PATCH v2] Add cmake support
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a wip cmake support for libgpiod. It allows to integrate
libgpiod as part of a bigger cmake project built via the new package
management feature of cmake called FetchContent or as git submodule.
This work is motivated by the fact that not all distributions offer
proper development packages with bindings enabled and for the different
kernel api versions of gpio. This change can be provided/used as an
external build script, or conveniently shipped with libgpiod if desired.
Both ways I felt the urge to share it with upstream and potential users.

It does offer various build options to control, whether tests, C++
bindings, tools, python bindings or examples are built. Furthermore
you can control if the libraries are built as archives or shared
libraries. Basic install support is available.

The options are:
 * GPIOD_TOOLS_ENABLED (OFF)
 * GPIOD_TESTS_ENABLED (OFF)
 * GPIOD_CXX_BINDINGS_ENABLED (ON)
 * GPIOD_PYTHON_BINDINGS_ENABLED (ON)
 * GPIOD_EXAMPLES_ENABLED (OFF)

This change is still wip, not everything works well enough:
 * examples are not built
 * tests are built but not integrated properly
 * install location of the python module is still incorrect
 * man page generation is missing
---
 CMakeLists.txt    | 214 ++++++++++++++++++++++++++++++++++++++++++++++
 cmake_config.h.in |   6 ++
 2 files changed, 220 insertions(+)
 create mode 100644 CMakeLists.txt
 create mode 100644 cmake_config.h.in

diff --git a/CMakeLists.txt b/CMakeLists.txt
new file mode 100644
index 0000000..3b8acf4
--- /dev/null
+++ b/CMakeLists.txt
@@ -0,0 +1,214 @@
+ # Support Version in project
+cmake_policy(SET CMP0048 NEW)
+# All integrating projects to control the optiom values
+cmake_policy(SET CMP0077 NEW)
+# 3.11 for FetchContent, 3.13 for CMP0077 or FetchContent updates
+cmake_minimum_required(VERSION 3.14)
+
+project(gpiod VERSION 2.2.1 LANGUAGES C CXX)
+set(GPIOD_EXTRA_VERSION "devel")
+set(GPIOD_MOCK_SOVERSION 0)
+set(GPIOD_CXX_BINDING_SOVERSION 1)
+
+include(FetchContent)
+include(CheckSymbolExists)
+include(CheckIncludeFile)
+include(GNUInstallDirs)
+
+FetchContent_Declare(
+  Catch2
+  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
+  GIT_TAG v2.13.7
+  )
+
+# libgpiod c library dependencies:
+check_symbol_exists(ioctl "sys/ioctl.h" HAVE_IOCTL)
+# Enable _GNU_SOURCE in symbol exists checks - this is
+# a setting handled by the check_symbol_exists macro
+set(CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)
+check_symbol_exists(asprintf "stdio.h" HAVE_ASPRINTF)
+check_symbol_exists(scandir "dirent.h" HAVE_SCANDIR)
+check_symbol_exists(alphasort "dirent.h" HAVE_ALPHASORT)
+check_symbol_exists(ppoll "signal.h;poll.h"  HAVE_PPOLL)
+check_symbol_exists(realpath "limits.h;stdlib.h"  HAVE_REALPATH)
+check_include_file(getopt.h HAVE_GETOPT_H)
+check_include_file(sys/sysmacros.h  HAVE_SYS_MACROS_H)
+check_include_file(linux/version.h  HAVE_LINUX_VERSION_H)
+check_include_file(linux/const.h  HAVE_LINUX_CONST_H)
+check_include_file(linux/ioctl.h  HAVE_LINUX_IOCTL_H)
+check_include_file(linux/types.h  HAVE_LINUX_TYPES_H)
+if(HAVE_IOCTL AND HAVE_ASPRINTF AND HAVE_SCANDIR AND HAVE_ALPHASORT
AND HAVE_PPOLL AND HAVE_REALPATH AND HAVE_GETOPT_H
+  AND HAVE_LINUX_CONST_H AND HAVE_LINUX_IOCTL_H AND HAVE_LINUX_TYPES_H)
+  message(STATUS "Header and function check successfull")
+else()
+  message(SEND_ERROR "Missing headers or symbols - libgpiod will not compile")
+endif()
+
+option(GPIOD_TOOLS_ENABLED "enable libgpiod tools" OFF)
+option(GPIOD_TESTS_ENABLED "enable libgpiod tests" OFF)
+option(GPIOD_CXX_BINDINGS_ENABLED "enable libgpiod C++ bindings" ON)
+option(GPIOD_PYTHON_BINDINGS_ENABLED "enable libgpiod C++ bindings" ON)
+option(GPIOD_EXAMPLES_ENABLED "enable libgpiod examples" OFF)
+
+if(GPIOD_TESTS_ENABLED)
+  find_package(PkgConfig)
+  find_package(Threads)
+  pkg_check_modules(KMOD REQUIRED IMPORTED_TARGET libkmod>=18)
+  pkg_check_modules(UDEV REQUIRED IMPORTED_TARGET libudev>=215)
+  pkg_check_modules(GLIB REQUIRED IMPORTED_TARGET glib-2.0>=2.50)
+  check_symbol_exists(qsort "stdlib.h" HAVE_QSORT)
+
+  add_library(gpiomockup
+        tests/mockup/gpio-mockup.c
+        tests/mockup/gpio-mockup.h)
+  set_target_properties(gpiomockup PROPERTIES
+    VERSION 0.0.1
+    SOVERSION ${GPIOD_MOCK_SOVERSION}
+    PUBLIC_HEADER tests/mockup/gpio-mockup.h
+    )
+  target_compile_options(gpiomockup PRIVATE -Wall -Wextra
-fvisibility=hidden -include ${CMAKE_BINARY_DIR}/config.h)
+  target_link_libraries(gpiomockup PRIVATE PkgConfig::KMOD
PkgConfig::UDEV Threads::Threads)
+  target_include_directories(gpiomockup PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/tests/mockup/>)
+
+  enable_testing()
+  add_executable(gpiod_tests
+        tests/gpiod-test.c
+        tests/gpiod-test.h
+        tests/tests-chip.c
+        tests/tests-event.c
+        tests/tests-line.c
+        tests/tests-misc.c)
+  target_compile_options(gpiod_tests PRIVATE -Wall -Wextra -include
${CMAKE_BINARY_DIR}/config.h)
+  target_compile_definitions(gpiod_tests PRIVATE G_LOG_DOMAIN="gpiod-test")
+  target_link_libraries(gpiod_tests PRIVATE gpiod PkgConfig::GLIB
Threads::Threads gpiomockup)
+
+  find_program(BATS bats)
+     #REQUIRED)
+  if(BATS_FOUND)
+    # TODO
+  endif()
+endif()
+
+set(GPIOD_VERSION_STR "${PROJECT_VERSION}-${GPIOD_EXTRA_VERSION}")
+configure_file(cmake_config.h.in config.h)
+add_library(gpiod lib/core.c lib/helpers.c lib/internal.h lib/misc.c
lib/uapi/gpio.h)
+target_compile_options(gpiod PRIVATE -Wall -Wextra
-fvisibility=hidden -include ${CMAKE_BINARY_DIR}/config.h)
+add_library(gpiod::gpiod ALIAS gpiod)
+set_target_properties(gpiod PROPERTIES
+  VERSION ${PROJECT_VERSION}
+  SOVERSION ${PROJECT_VERSION_MAJOR}
+  PUBLIC_HEADER include/gpiod.h
+  )
+target_include_directories(gpiod PUBLIC
$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/>)
+install(TARGETS gpiod
+  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+  LIBRARY DESTINATION lib
+  ARCHIVE DESTINATION lib)
+
+if(GPIOD_TOOLS_ENABLED)
+  check_symbol_exists(basename "libgen.h" HAVE_BASENAME)
+  check_symbol_exists(daemon "unistd.h" HAVE_DAEMON)
+  check_symbol_exists(signalfd "sys/signalfd.h" HAVE_SIGNALFD)
+  check_symbol_exists(setlinebuf "stdio.h"   HAVE_SETLINEBUF)
+  if(HAVE_BASENAME AND HAVE_DAEMON AND HAVE_SIGNALFD AND HAVE_SETLINEBUF)
+    message(STATUS "Header and function check for tools successfull")
+  else()
+    message(SEND_ERROR "Missing headers or symbols - libgpiod tools
will not compile")
+  endif()
+
+  # common library is static
+  add_library(tools-common STATIC tools/tools-common.c tools/tools-common.h)
+  target_compile_options(tools-common PUBLIC -include
${CMAKE_BINARY_DIR}/config.h)
+  target_link_libraries(tools-common PUBLIC gpiod)
+  add_executable(gpiodetect tools/gpiodetect.c)
+  add_executable(gpioinfo tools/gpioinfo.c)
+  add_executable(gpioget tools/gpioget.c)
+  add_executable(gpioset tools/gpioset.c)
+  add_executable(gpiomon tools/gpiomon.c)
+  add_executable(gpiofind tools/gpiofind.c)
+  target_link_libraries(gpiodetect tools-common)
+  target_link_libraries(gpioinfo tools-common)
+  target_link_libraries(gpioget tools-common)
+  target_link_libraries(gpioset tools-common)
+  target_link_libraries(gpiomon tools-common)
+  target_link_libraries(gpiofind tools-common)
+endif()
+
+if(GPIOD_CXX_BINDINGS_ENABLED)
+  add_library(gpiodcxx
+    bindings/cxx/gpiod.hpp
+    bindings/cxx/chip.cpp
+    bindings/cxx/internal.hpp
+    bindings/cxx/iter.cpp
+    bindings/cxx/line.cpp
+    bindings/cxx/line_bulk.cpp
+    )
+  add_library(gpiod::gpiodcxx ALIAS gpiodcxx)
+  target_compile_options(gpiodcxx PRIVATE -Wall -Wextra -fvisibility=hidden)
+  target_include_directories(gpiodcxx PUBLIC
$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/bindings/cxx>)
+  target_link_libraries(gpiodcxx PUBLIC gpiod)
+  set_target_properties(gpiodcxx PROPERTIES
+    VERSION 1.1.1
+    SOVERSION ${GPIOD_CXX_BINDING_SOVERSION}
+    PUBLIC_HEADER bindings/cxx/gpiod.hpp
+    )
+
+  install(TARGETS gpiodcxx
+    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+    LIBRARY DESTINATION lib
+    ARCHIVE DESTINATION lib)
+
+  target_compile_features(gpiodcxx PUBLIC cxx_std_11)
+  if(GPIOD_TESTS_ENABLED)
+    FetchContent_MakeAvailable(Catch2)
+    add_executable(gpiod_cxx_test
+      bindings/cxx/tests/gpio-mockup.cpp
+      bindings/cxx/tests/gpio-mockup.hpp
+      bindings/cxx/tests/gpiod-cxx-test-main.cpp
+      bindings/cxx/tests/gpiod-cxx-test.cpp
+      bindings/cxx/tests/tests-chip.cpp
+      bindings/cxx/tests/tests-event.cpp
+      bindings/cxx/tests/tests-iter.cpp
+      bindings/cxx/tests/tests-line.cpp
+      )
+    target_link_libraries(gpiod_cxx_test PUBLIC Threads::Threads
gpiomockup gpiodcxx Catch2::Catch2)
+  endif()
+  if(GPIOD_EXAMPLES_ENABLED)
+    # TODO add c++ examples
+    # target_compile_features(libgpiodcxx-examples PUBLIC cxx_std_17)
+  endif()
+endif()
+
+if(GPIOD_PYTHON_BINDINGS_ENABLED)
+  find_program(PYTHON_CONFIG python3-config REQUIRED)
+  execute_process(COMMAND ${PYTHON_CONFIG} --includes OUTPUT_VARIABLE
PYTHON_CPPFLAGS)
+  execute_process(COMMAND ${PYTHON_CONFIG} --libs OUTPUT_VARIABLE PYTHON_LIBS)
+  string(STRIP ${PYTHON_CPPFLAGS} PYTHON_CPPFLAGS)
+  string(REGEX REPLACE " " ";" PYTHON_CPPFLAGS ${PYTHON_CPPFLAGS})
+  string(STRIP ${PYTHON_LIBS} PYTHON_LIBS)
+  string(REGEX REPLACE " " ";" PYTHON_LIBS ${PYTHON_LIBS})
+  add_library(gpiod_module MODULE
+    bindings/python/gpiodmodule.c
+    )
+  add_library(gpiod::gpiod_module ALIAS gpiod_module)
+  target_link_libraries(gpiod_module gpiod ${PYTHON_LIBS})
+  target_compile_options(gpiod_module PRIVATE -Wall -Wextra ${PYTHON_CPPFLAGS})
+  set_target_properties(gpiod_module PROPERTIES OUTPUT_NAME gpiod PREFIX "")
+  install(TARGETS gpiod_module
+    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+    RUNTIME DESTINATION bin
+    LIBRARY DESTINATION lib
+    ARCHIVE DESTINATION lib)
+endif()
+find_package(Doxygen)
+if(DOXYGEN_FOUND)
+  doxygen_add_docs(doxygen include/gpiod.h bindings/cxx/gpiod.hpp)
+endif()
+
+if(NOT CMAKE_CROSSCOMPILING)
+  find_program(HELP2MAN help2man)
+endif()
+
+if(NOT HELP2MAN_FOUND)
+  message(STATUS "help2man not found - man pages annot be generated
automatically")
+endif()
diff --git a/cmake_config.h.in b/cmake_config.h.in
new file mode 100644
index 0000000..484e62f
--- /dev/null
+++ b/cmake_config.h.in
@@ -0,0 +1,6 @@
+/* config.h.  Generated from cmake_config.h.in by cmake.  */
+
+
+#cmakedefine GPIOD_VERSION_STR "@GPIOD_VERSION_STR@"
+
+#define _GNU_SOURCE 1
-- 
2.30.2
