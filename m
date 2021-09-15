Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A9240C487
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Sep 2021 13:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbhIOLri (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Sep 2021 07:47:38 -0400
Received: from mail.thorsis.com ([92.198.35.195]:52376 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232586AbhIOLrh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Sep 2021 07:47:37 -0400
X-Greylist: delayed 391 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Sep 2021 07:47:36 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id 05AB51B34
        for <linux-gpio@vger.kernel.org>; Wed, 15 Sep 2021 13:39:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zCMRDfcGKExE for <linux-gpio@vger.kernel.org>;
        Wed, 15 Sep 2021 13:39:42 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id ED5C0F5E; Wed, 15 Sep 2021 13:39:39 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.2
X-Spam-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
        *      [score: 0.0000]
        * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
        *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: doxyfile.in]
        * -0.0 NO_RECEIVED Informational: message has no Received headers
Date:   Wed, 15 Sep 2021 13:39:27 +0200
From:   Alexander Dahl <ada@thorsis.com>
To:     Andreas Pokorny <andreas.pokorny@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod PATCH] Add cmake support
Message-ID: <YUHbb1awZcmih5PC@ada.ifak-system.com>
Mail-Followup-To: Andreas Pokorny <andreas.pokorny@gmail.com>,
        linux-gpio@vger.kernel.org
References: <CAFKLa4LqPdXutqRdWp+MoHTuYkN4Qp=gUM5Gi_ZArDN0Lsn8eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFKLa4LqPdXutqRdWp+MoHTuYkN4Qp=gUM5Gi_ZArDN0Lsn8eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Andreas,

just a quick glance over it, but some things catched my eye even
without proper review. See below.

Am Wed, Sep 15, 2021 at 12:59:58PM +0200 schrieb Andreas Pokorny:
> This is a wip cmake support for libgpiod. It allows to integrate
> libgpiod as part of a bigger cmake project built via the new package
> management feature of cmake called FetchContent or as git submodule.
> This work is motivated by the fact that not all distributions offer
> proper development packages with bindings enabled and for the different
> kernel api versions of gpio. This change can be provided/used as an
> external build script, or conveniently shipped with libgpiod if desired.
> Both ways I felt the urge to share it with upstream and potential users.
> 
> It does offer various build options to control whether tests, C++
> bindings, tools, python bindings or examples are built. Furthermore
> you can control if the libraries are built as archives or shared
> libraries. Basic install support is available.
> 
> The options are:
>  * ENABLE_LIBGPIOD_TOOLS (OFF)
>  * ENABLE_LIBGPIOD_TESTS (OFF)
>  * ENABLE_LIBGPIOD_SHARED (OFF)
>  * ENABLE_LIBGPIOD_CXX_BINDINGS (ON)
>  * ENABLE_LIBGPIOD_PYTHON_BINDINGS (ON)
>  * ENABLE_LIBGPIOD_EXAMPLES (OFF)
> 
> This change is still wip, not everything works well enough:
>  * examples are not built
>  * tests are built but not integrated properly
>  * the library versioning does currently not match the libtool generated
>    library names (input on how to achieve that is highly welcome)
>  * install location of the python module is still incorrect
>  * man page generation is missing
>  * doxygen generation is missing
> ---
>  CMakeLists.txt    | 215 ++++++++++++++++++++++++++++++++++++++++++++++
>  cmake_config.h.in |   6 ++
>  2 files changed, 221 insertions(+)
>  create mode 100644 CMakeLists.txt
>  create mode 100644 cmake_config.h.in
> 
> diff --git a/CMakeLists.txt b/CMakeLists.txt
> new file mode 100644
> index 0000000..386b239
> --- /dev/null
> +++ b/CMakeLists.txt
> @@ -0,0 +1,215 @@
> +cmake_policy(SET CMP0057 NEW)
> +cmake_policy(SET CMP0048 NEW)
> +cmake_policy(SET CMP0077 NEW)

Why are these policies set? Comments to explain why those are needed
would be nice.

> +cmake_minimum_required(VERSION 3.14)

What's the actual CMake feature you are using requiring 3.14, or is it
the version you happened to have?

> +project(libgpiod VERSION 2.0.0 LANGUAGES C CXX)

You can probably just use 'gpiod' as project name. For the actual
binary file CMake knows it should add 'lib' as a prefix.

> +set(EXTRA_VERSION "devel")

Polluting global namespace.

> +set(GPIOD_SOVERSION 4.1.2)
> +set(GPIOD_MOCK_SOVERSION 0.1.0)
> +set(GPIOD_CXX_BINDING_SOVERSION 2.1.1)
> +
> +include(FetchContent)
> +include(CheckSymbolExists)
> +include(CheckIncludeFile)
> +include(GNUInstallDirs)
> +FetchContent_Declare(
> +  Catch2
> +  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
> +  GIT_TAG v2.13.7
> +  )
> +check_symbol_exists(ioctl "sys/ioctl.h" HAVE_IOCTL)
> +set(CMAKE_REQUIRED_DEFINITIONS -D_GNU_SOURCE)

This is no CMake variable, you should not use that prefix for your own
variables.

> +check_symbol_exists(asprintf "stdio.h" HAVE_ASPRINTF)
> +check_symbol_exists(scandir "dirent.h" HAVE_SCANDIR)
> +check_symbol_exists(alphasort "dirent.h" HAVE_ALPHASORT)
> +check_symbol_exists(ppoll "signal.h;poll.h"  HAVE_PPOLL)
> +check_symbol_exists(realpath "limits.h;stdlib.h"  HAVE_REALPATH)
> +check_include_file(getopt.h HAVE_GETOPT_H)
> +check_include_file(sys/sysmacros.h  HAVE_SYS_MACROS_H)
> +check_include_file(linux/version.h  HAVE_LINUX_VERSION_H)
> +check_include_file(linux/const.h  HAVE_LINUX_CONST_H)
> +check_include_file(linux/ioctl.h  HAVE_LINUX_IOCTL_H)
> +check_include_file(linux/types.h  HAVE_LINUX_TYPES_H)
> +if(HAVE_IOCTL AND HAVE_ASPRINTF AND HAVE_SCANDIR AND HAVE_ALPHASORT
> AND HAVE_PPOLL AND HAVE_REALPATH AND HAVE_GETOPT_H
> +  AND HAVE_LINUX_CONST_H AND HAVE_LINUX_IOCTL_H AND HAVE_LINUX_TYPES_H)
> +  message(STATUS "Header and function check successfull")
> +else()
> +  message(SEND_ERROR "Missing headers or symbols - libgpiod will not compile")
> +endif()
> +
> +option(ENABLE_LIBGPIOD_TOOLS OFF "enable libgpiod tools")
> +option(ENABLE_LIBGPIOD_TESTS OFF "enable libgpiod tests")
> +option(ENABLE_LIBGPIOD_SHARED OFF "enable shared libgpiod libraries")
> +option(ENABLE_LIBGPIOD_CXX_BINDINGS ON "enable libgpiod C++ bindings")
> +option(ENABLE_LIBGPIOD_PYTHON_BINDINGS ON "enable libgpiod C++ bindings")
> +option(ENABLE_LIBGPIOD_EXAMPLES OFF "enable libgpiod examples")

Proper variable name prefixing? See above.

Especially for variables set with the 'option' command this is nice,
because it can be grouped in CMake Qt GUI.

> +set(LIB_TYPE STATIC)
> +if(ENABLE_LIBGPIOD_SHARED)
> +  set(LIB_TYPE SHARED)
> +endif()

Nope. Use BUILD_SHARED_LIBS, which is set from outside, if someone
building this thing wants to change it. You might use the option
command to preset BUILD_SHARED_LIBS with a project specific value.

> +if(ENABLE_LIBGPIOD_TESTS)
> +  find_package(PkgConfig)
> +  find_package(Threads)
> +  pkg_check_modules(KMOD REQUIRED libkmod>=18)
> +  pkg_check_modules(UDEV REQUIRED libudev>=215)
> +  pkg_check_modules(GLIB REQUIRED glib-2.0>=2.50)
> +  check_symbol_exists(qsort "stdlib.h" HAVE_QSORT)
> +
> +  add_library(gpiomockup SHARED

Remove that 'SHARED', this should be controlled through
BUILD_SHARED_LIBS.

> +        tests/mockup/gpio-mockup.c
> +        tests/mockup/gpio-mockup.h)
> +  set_target_properties(gpiomockup PROPERTIES
> +    VERSION ${PROJECT_VERSION}
> +    SOVERSION ${GPIOD_MOCK_SOVERSION}

You should use only the major version part for SOVERSION property.

If you want to use VERSION from the 'project' command CMake prepares
the following variables for you: PROJECT_VERSION_MAJOR,
PROJECT_VERSION_MINOR, … see cmake docs. If you track the SOVERSION
separately, you might have to fiddle the parts by yourself. But this
is the gpiomockup lib, so there's probably a different soversion than
for the "real" lib anyways.

> +    PUBLIC_HEADER tests/mockup/gpio-mockup.h
> +    )
> +  target_compile_options(gpiomockup PRIVATE -Wall -Wextra
> -fvisibility=hidden -include ${CMAKE_BINARY_DIR}/config.h)

This is compiler specific and might conflict with what the user
wanting to build this thing wants.

> +  target_link_libraries(gpiomockup PRIVATE ${KMOD_LDFLAGS}
> ${UDEV_LDFLAGS} Threads::Threads)

If you're using PkgConfig and recent CMake anyways, please use the
IMPORTED_TARGET option of pkg_check_modules and use that for
target_link_libraries.

> +  target_include_directories(gpiomockup PUBLIC
> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/tests/mockup/>)
> +
> +  enable_testing()
> +  add_executable(gpiod_tests
> +        tests/gpiod-test.c
> +        tests/gpiod-test.h
> +        tests/tests-chip.c
> +        tests/tests-event.c
> +        tests/tests-line.c
> +        tests/tests-misc.c)
> +  target_compile_options(gpiod_tests PRIVATE ${GLIB_CFLAGS} -Wall
> -Wextra -include ${CMAKE_BINARY_DIR}/config.h)

Those glib cflags should come with pkgconfig imported target, for GCC
options see above. 

Is there any reason to include that config.h header like this over
adding $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}> to
target_include_directories?

> +  target_compile_definitions(gpiod_tests PRIVATE G_LOG_DOMAIN="gpiod-test")
> +  target_link_libraries(gpiod_tests PRIVATE gpiod ${GLIB_LDFLAGS}
> Threads::Threads gpiomockup)
> +
> +  find_program(BATS bats)
> +     #REQUIRED)
> +  if(BATS_FOUND)
> +    # TODO
> +  endif()
> +endif()
> +
> +set(GPIOD_VERSION_STR "${PROJECT_VERSION}-${EXTRA_VERSION}")
> +configure_file(cmake_config.h.in config.h)
> +add_library(gpiod ${LIB_TYPE} lib/core.c lib/helpers.c lib/internal.h

Remove ${LIB_TYPE}, use BUILD_SHARED_LIBS, see above. Same goes for
all other invocations of add_library() except those for ALIAS.

> lib/misc.c lib/uapi/gpio.h)
> +target_compile_options(gpiod PRIVATE -Wall -Wextra
> -fvisibility=hidden -include ${CMAKE_BINARY_DIR}/config.h)
> +add_library(gpiod::gpiod ALIAS gpiod)
> +set_target_properties(gpiod PROPERTIES
> +  VERSION ${PROJECT_VERSION}
> +  SOVERSION ${GPIOD_SOVERSION}
> +  PUBLIC_HEADER include/gpiod.h
> +  )
> +target_include_directories(gpiod PUBLIC
> $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include/>)
> +install(TARGETS gpiod
> +  PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
> +  LIBRARY DESTINATION lib
> +  ARCHIVE DESTINATION lib/static)
> +
> +if(ENABLE_LIBGPIOD_TOOLS)
> +  check_symbol_exists(basename "libgen.h" HAVE_BASENAME)
> +  check_symbol_exists(daemon "unistd.h" HAVE_DAEMON)
> +  check_symbol_exists(signalfd "sys/signalfd.h" HAVE_SIGNALFD)
> +  check_symbol_exists(setlinebuf "stdio.h"   HAVE_SETLINEBUF)
> +  if(HAVE_BASENAME AND HAVE_DAEMON AND HAVE_SIGNALFD AND HAVE_SETLINEBUF)
> +    message(STATUS "Header and function check for tools successfull")
> +  else()
> +    message(SEND_ERROR "Missing headers or symbols - libgpiod tools
> will not compile")
> +  endif()
> +
> +  add_library(tools-common STATIC tools/tools-common.c tools/tools-common.h)
> +  target_compile_options(tools-common PRIVATE -include
> ${CMAKE_BINARY_DIR}/config.h)
> +  target_link_libraries(tools-common PUBLIC gpiod)
> +  add_executable(gpiodetect tools/gpiodetect.c)
> +  add_executable(gpioinfo tools/gpioinfo.c)
> +  add_executable(gpioget tools/gpioget.c)
> +  add_executable(gpioset tools/gpioset.c)
> +  add_executable(gpiomon tools/gpiomon.c)
> +  add_executable(gpiofind tools/gpiofind.c)
> +  target_link_libraries(gpiodetect tools-common)
> +  target_link_libraries(gpioinfo tools-common)
> +  target_link_libraries(gpioget tools-common)
> +  target_link_libraries(gpioset tools-common)
> +  target_link_libraries(gpiomon tools-common)
> +  target_link_libraries(gpiofind tools-common)
> +endif()
> +
> +if(ENABLE_LIBGPIOD_CXX_BINDINGS)
> +  add_library(gpiodcxx ${LIB_TYPE}
> +    bindings/cxx/gpiod.hpp
> +    bindings/cxx/chip.cpp
> +    bindings/cxx/internal.hpp
> +    bindings/cxx/iter.cpp
> +    bindings/cxx/line.cpp
> +    bindings/cxx/line_bulk.cpp
> +    )
> +  add_library(gpiod::gpiodcxx ALIAS gpiodcxx)
> +  target_compile_options(gpiodcxx PRIVATE -Wall -Wextra -fvisibility=hidden)
> +  target_include_directories(gpiodcxx PUBLIC
> $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/bindings/cxx>)
> +  target_link_libraries(gpiodcxx PUBLIC gpiod)
> +  set_target_properties(gpiodcxx PROPERTIES
> +    VERSION ${PROJECT_VERSION}
> +    SOVERSION ${GPIOD_CXX_BINDING_SOVERSION}
> +    PUBLIC_HEADER bindings/cxx/gpiod.hpp
> +    )
> +
> +  install(TARGETS gpiodcxx
> +    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
> +    LIBRARY DESTINATION lib
> +    ARCHIVE DESTINATION lib)

This is different from lib/static above.

> +
> +  target_compile_features(gpiodcxx PUBLIC cxx_std_11)
> +  if(ENABLE_LIBGPIOD_TESTS)
> +    FetchContent_MakeAvailable(Catch2)
> +    add_executable(gpiod_cxx_test
> +      bindings/cxx/tests/gpio-mockup.cpp
> +      bindings/cxx/tests/gpio-mockup.hpp
> +      bindings/cxx/tests/gpiod-cxx-test-main.cpp
> +      bindings/cxx/tests/gpiod-cxx-test.cpp
> +      bindings/cxx/tests/tests-chip.cpp
> +      bindings/cxx/tests/tests-event.cpp
> +      bindings/cxx/tests/tests-iter.cpp
> +      bindings/cxx/tests/tests-line.cpp
> +      )
> +    target_link_libraries(gpiod_cxx_test PUBLIC Threads::Threads
> gpiomockup gpiodcxx Catch2::Catch2)
> +  endif()
> +  if(ENABLE_LIBGPIOD_EXAMPLES)
> +    # target_compile_features(libgpiodcxx-examples PUBLIC cxx_std_17)
> +  endif()
> +endif()
> +
> +if(ENABLE_LIBGPIOD_PYTHON_BINDINGS)
> +  find_program(PYTHON_CONFIG python3-config REQUIRED)
> +  execute_process(COMMAND ${PYTHON_CONFIG} --includes OUTPUT_VARIABLE
> PYTHON_CPPFLAGS)
> +  execute_process(COMMAND ${PYTHON_CONFIG} --libs OUTPUT_VARIABLE PYTHON_LIBS)
> +  string(STRIP ${PYTHON_CPPFLAGS} PYTHON_CPPFLAGS)
> +  string(REGEX REPLACE " " ";" PYTHON_CPPFLAGS ${PYTHON_CPPFLAGS})
> +  string(STRIP ${PYTHON_LIBS} PYTHON_LIBS)
> +  string(REGEX REPLACE " " ";" PYTHON_LIBS ${PYTHON_LIBS})
> +  add_library(gpiod_module MODULE
> +    bindings/python/gpiodmodule.c
> +    )
> +  add_library(gpiod::gpiod_module ALIAS gpiod_module)
> +  target_link_libraries(gpiod_module gpiod ${PYTHON_LIBS})
> +  target_compile_options(gpiod_module PRIVATE -Wall -Wextra ${PYTHON_CPPFLAGS})
> +  set_target_properties(gpiod_module PROPERTIES OUTPUT_NAME gpiod PREFIX "")
> +  install(TARGETS gpiod_module
> +    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
> +    RUNTIME DESTINATION bin
> +    LIBRARY DESTINATION lib
> +    ARCHIVE DESTINATION lib)
> +endif()
> +
> +find_program(DOXYGEN doxygen)
> +if(DOXYGEN_FOUND)
> +  configure_file(DoxyFile.in DoxyFile)
> +  set(VERSION_STR ${PROJECT_VERSION})
> +  set(top_srcdir ${PROJECT_SOURCE_DIR})
> +endif()

Newer CMake versions from 3.9 onwards have doxygen_add_docs(), see
CMake documentation on how to use that to actually generate docs. You
can probably throw away DoxyFile.in then.

> +
> +if(NOT CMAKE_CROSSCOMPILING)
> +  find_program(HELP2MAN help2man)
> +endif()
> +
> +if(NOT HELP2MAN_FOUND)
> +  message(STATUS "help2man not found - man pages annot be generated
> automatically")
> +endif()
> diff --git a/cmake_config.h.in b/cmake_config.h.in
> new file mode 100644
> index 0000000..484e62f
> --- /dev/null
> +++ b/cmake_config.h.in
> @@ -0,0 +1,6 @@
> +/* config.h.  Generated from cmake_config.h.in by cmake.  */
> +
> +
> +#cmakedefine GPIOD_VERSION_STR "@GPIOD_VERSION_STR@"
> +
> +#define _GNU_SOURCE 1

HTH & Greets
Alex

