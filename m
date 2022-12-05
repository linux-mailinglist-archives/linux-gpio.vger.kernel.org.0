Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD06642942
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbiLENWg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbiLENWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:22:30 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369041C908
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:22:24 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9E7055C00F3
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 08:22:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 05 Dec 2022 08:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1670246543; x=1670332943; bh=6g
        IrBqclFp/Gu1v6WAdxwGy1zHj5XQmGwyOz1w2GyVk=; b=UCg7rVMUbOrcMfTEIY
        6nbPjVbKx2/Vmf7ibbF9VnAvALAbiEhqyE3zxAbJ4Sv3UGz521SK6VbXn5a2W36I
        ZYFq9QR28ANuI2wYdpArrpgivN6SjEXApPZbcCLMtbrHh4noIbxwCyqAx6uPVSec
        7XK+faA8udjNw5e9XDnml7tkW7YpWdeubSuGl+eG1bBCTt7c40t9GrZqkZ7iuMOg
        F3ttjK3erCa9QNxLb2pC821aanV4qJjNT0FjLj1C4ww+iQiw8ZB7GBMG3ZEOmU5J
        j3rmPhT9LsJTp3RpyTkC1QsxN71178cFS+u5CKF9qptPo1BpjpMEsSHBFkpAW6by
        2JnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1670246543; x=1670332943; bh=6gIrBqclFp/Gu
        1v6WAdxwGy1zHj5XQmGwyOz1w2GyVk=; b=nlGPEm32GuJRjv4pb90RpxS7TZZ/9
        vP887uuVClcA+cMzI/sZ7Sdx+a4Q/5J4NFjkvMh3l4ruhGmpaBw4sKmV9//hH7ZF
        j6UOeOpPbL64RX8Veril9W5EtUYtx9HVw8HldXA7c0opKV8XLGxuo/Kk5RjnDlVy
        EclQurgmEKYll3UMKvmSTchWS+3MrXsBuT28c1rrqBrNwvBr2kamhBXKkvFTnNSP
        DnKLYGHCus0iMhGOAL00WGMPpBJOvTHQv+1OBtUNeaynzBhXRP/cCbbzcqZ5qUu/
        zwMAj/25NpqAKrkyiFEkttO3mBZNO9osTstPlRsOb6j14+1ofZ5e2PW7g==
X-ME-Sender: <xms:j_CNYzbXjKBUDzfKU2QMnTlu8j-h1UzSE_kRAdBNMGWiaDdTp4QYLQ>
    <xme:j_CNYyZCEGcT4FA3h2sjMWjsU_HLXlhAZ_IGXSPaDY1tB-XLUTF1XlxQyJle_r1KH
    l6fXwxjAleboFex9A>
X-ME-Received: <xmr:j_CNY1-mwmOyzoGBc-qQHOHmX3Z7y5XdhcE3-Tj4fsWt764R4L8Ky4sv1Iy7J-8bb9jaL2POjm0FEB5J2mqGn1WxkegUqgxUkOC1ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
    rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
    ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:j_CNY5qc0WETibV36-NkuAkQ2IRuSyLj2o-rMcUqYhemL4cM1tSAcQ>
    <xmx:j_CNY-rNLR9aW6wPVnVyU14IcWE3xfRZDbPQPmJ825ZAXu94cTSL0Q>
    <xmx:j_CNY_SEH668rWL5Mf11UYK7wX7A3U6ZMMzGyp2r-V4GjeW_o8UHXw>
    <xmx:j_CNY8FTcPshWWuX5oylL4Z76LMKaD3_P2Z4_Ep5YHdqOjpRgqeOKA>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-gpio@vger.kernel.org>; Mon, 5 Dec 2022 08:22:22 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod][WIP PATCH 2/2] Remove autotools in favour of meson
Date:   Mon,  5 Dec 2022 23:52:07 +1030
Message-Id: <20221205132207.94775-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221205132207.94775-1-andrew@aj.id.au>
References: <20221205132207.94775-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Makefile.am                               |  43 ----
 autogen.sh                                |  17 --
 bindings/Makefile.am                      |  22 --
 bindings/cxx/Makefile.am                  |  48 ----
 bindings/cxx/examples/Makefile.am         |  26 ---
 bindings/cxx/gpiodcxx/Makefile.am         |  20 --
 bindings/cxx/tests/Makefile.am            |  32 ---
 bindings/python/Makefile.am               |  35 ---
 bindings/python/examples/Makefile.am      |  10 -
 bindings/python/gpiod/Makefile.am         |  17 --
 bindings/python/gpiod/ext/Makefile.am     |  11 -
 bindings/python/setup.py                  |  47 ----
 bindings/python/tests/Makefile.am         |  17 --
 bindings/python/tests/gpiosim/Makefile.am |   7 -
 bindings/rust/Makefile.am                 |  19 --
 bindings/rust/meson.build                 |   3 +
 configure.ac                              | 272 ----------------------
 include/Makefile.am                       |   4 -
 lib/Makefile.am                           |  27 ---
 man/Makefile.am                           |  16 --
 tests/Makefile.am                         |  34 ---
 tests/gpiosim/Makefile.am                 |  16 --
 tools/Makefile.am                         |  39 ----
 23 files changed, 3 insertions(+), 779 deletions(-)
 delete mode 100644 Makefile.am
 delete mode 100755 autogen.sh
 delete mode 100644 bindings/Makefile.am
 delete mode 100644 bindings/cxx/Makefile.am
 delete mode 100644 bindings/cxx/examples/Makefile.am
 delete mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 delete mode 100644 bindings/cxx/tests/Makefile.am
 delete mode 100644 bindings/python/Makefile.am
 delete mode 100644 bindings/python/examples/Makefile.am
 delete mode 100644 bindings/python/gpiod/Makefile.am
 delete mode 100644 bindings/python/gpiod/ext/Makefile.am
 delete mode 100644 bindings/python/setup.py
 delete mode 100644 bindings/python/tests/Makefile.am
 delete mode 100644 bindings/python/tests/gpiosim/Makefile.am
 delete mode 100644 bindings/rust/Makefile.am
 delete mode 100644 configure.ac
 delete mode 100644 include/Makefile.am
 delete mode 100644 lib/Makefile.am
 delete mode 100644 man/Makefile.am
 delete mode 100644 tests/Makefile.am
 delete mode 100644 tests/gpiosim/Makefile.am
 delete mode 100644 tools/Makefile.am

diff --git a/Makefile.am b/Makefile.am
deleted file mode 100644
index dfc6c95b76cd..000000000000
--- a/Makefile.am
+++ /dev/null
@@ -1,43 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-ACLOCAL_AMFLAGS = -I m4
-AUTOMAKE_OPTIONS = foreign
-SUBDIRS = include lib
-
-EXTRA_DIST = \
-	LICENSES/CC-BY-SA-4.0.txt \
-	LICENSES/GPL-2.0-only.txt \
-	LICENSES/GPL-2.0-or-later.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
-	LICENSES/LGPL-3.0-or-later.txt \
-	LICENSES/Linux-syscall-note.txt
-
-if WITH_TOOLS
-
-SUBDIRS += tools man
-
-endif
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-# Build bindings after core tests. When building tests for bindings, we need
-# libgpiomockup to be already present.
-SUBDIRS += bindings
-
-if HAS_DOXYGEN
-
-doc: Doxyfile
-	@doxygen Doxyfile
-.PHONY: doc
-
-clean-local:
-	rm -rf doc
-
-EXTRA_DIST += Doxyfile
-
-endif
diff --git a/autogen.sh b/autogen.sh
deleted file mode 100755
index 420b821b7837..000000000000
--- a/autogen.sh
+++ /dev/null
@@ -1,17 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-# SPDX-FileCopyrightText: 2017 Thierry Reding <treding@nvidia.com>
-
-srcdir=`dirname $0`
-test -z "$srcdir" && srcdir=.
-
-ORIGDIR=`pwd`
-cd "$srcdir"
-
-autoreconf --force --install --verbose || exit 1
-cd $ORIGDIR || exit $?
-
-if test -z "$NOCONFIGURE"; then
-	exec "$srcdir"/configure "$@"
-fi
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
deleted file mode 100644
index 004ae23dbc58..000000000000
--- a/bindings/Makefile.am
+++ /dev/null
@@ -1,22 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-SUBDIRS = .
-
-if WITH_BINDINGS_CXX
-
-SUBDIRS += cxx
-
-endif
-
-if WITH_BINDINGS_PYTHON
-
-SUBDIRS += python
-
-endif
-
-if WITH_BINDINGS_RUST
-
-SUBDIRS += rust
-
-endif
diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
deleted file mode 100644
index f719072bb30e..000000000000
--- a/bindings/cxx/Makefile.am
+++ /dev/null
@@ -1,48 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-lib_LTLIBRARIES = libgpiodcxx.la
-libgpiodcxx_la_SOURCES =	\
-	chip.cpp		\
-	chip-info.cpp		\
-	edge-event-buffer.cpp	\
-	edge-event.cpp		\
-	exception.cpp		\
-	info-event.cpp		\
-	internal.cpp		\
-	internal.hpp		\
-	line.cpp		\
-	line-config.cpp		\
-	line-info.cpp		\
-	line-request.cpp	\
-	line-settings.cpp	\
-	misc.cpp		\
-	request-builder.cpp	\
-	request-config.cpp
-
-libgpiodcxx_la_CXXFLAGS = -Wall -Wextra -g -std=gnu++17
-libgpiodcxx_la_CXXFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
-libgpiodcxx_la_CXXFLAGS += $(PROFILING_CFLAGS)
-libgpiodcxx_la_CXXFLAGS += -DGPIOD_CXX_BUILD
-libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
-libgpiodcxx_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
-libgpiodcxx_la_LDFLAGS += $(PROFILING_LDFLAGS)
-
-include_HEADERS = gpiod.hpp
-
-pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = libgpiodcxx.pc
-
-SUBDIRS = gpiodcxx .
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
deleted file mode 100644
index c7ec3cfa8349..000000000000
--- a/bindings/cxx/examples/Makefile.am
+++ /dev/null
@@ -1,26 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17
-AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
-
-noinst_PROGRAMS = \
-		gpiodetectcxx \
-		gpiofindcxx \
-		gpiogetcxx \
-		gpioinfocxx \
-		gpiomoncxx \
-		gpiosetcxx
-
-gpiodetectcxx_SOURCES = gpiodetectcxx.cpp
-
-gpiofindcxx_SOURCES = gpiofindcxx.cpp
-
-gpiogetcxx_SOURCES = gpiogetcxx.cpp
-
-gpioinfocxx_SOURCES = gpioinfocxx.cpp
-
-gpiomoncxx_SOURCES = gpiomoncxx.cpp
-
-gpiosetcxx_SOURCES = gpiosetcxx.cpp
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
deleted file mode 100644
index e3a3b9b38e61..000000000000
--- a/bindings/cxx/gpiodcxx/Makefile.am
+++ /dev/null
@@ -1,20 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
-
-otherincludedir = $(includedir)/gpiodcxx
-otherinclude_HEADERS = \
-	chip.hpp \
-	chip-info.hpp \
-	edge-event-buffer.hpp \
-	edge-event.hpp \
-	exception.hpp \
-	info-event.hpp \
-	line.hpp \
-	line-config.hpp \
-	line-info.hpp \
-	line-request.hpp \
-	line-settings.hpp \
-	misc.hpp \
-	request-builder.hpp \
-	request-config.hpp \
-	timestamp.hpp
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
deleted file mode 100644
index 4971dd469290..000000000000
--- a/bindings/cxx/tests/Makefile.am
+++ /dev/null
@@ -1,32 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
-AM_CXXFLAGS += -I$(top_srcdir)/tests/gpiosim/
-AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
-AM_CXXFLAGS += $(PROFILING_CFLAGS)
-AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
-AM_LDFLAGS += -lgpiosim -L$(top_builddir)/tests/gpiosim/
-AM_LDFLAGS += $(PROFILING_LDFLAGS)
-AM_LDFLAGS += -pthread
-
-bin_PROGRAMS = gpiod-cxx-test
-
-gpiod_cxx_test_SOURCES =			\
-		check-kernel.cpp		\
-		gpiod-cxx-test-main.cpp		\
-		gpiosim.cpp			\
-		gpiosim.hpp			\
-		helpers.cpp			\
-		helpers.hpp			\
-		tests-chip.cpp			\
-		tests-chip-info.cpp		\
-		tests-edge-event.cpp		\
-		tests-info-event.cpp		\
-		tests-line.cpp			\
-		tests-line-config.cpp		\
-		tests-line-info.cpp		\
-		tests-line-request.cpp		\
-		tests-line-settings.cpp		\
-		tests-misc.cpp			\
-		tests-request-config.cpp
\ No newline at end of file
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
deleted file mode 100644
index 3212a8fcec3c..000000000000
--- a/bindings/python/Makefile.am
+++ /dev/null
@@ -1,35 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = setup.py
-
-if WITH_TESTS
-
-BUILD_TESTS = 1
-
-endif
-
-all-local:
-	GPIOD_VERSION_STRING=$(VERSION_STR) \
-	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) setup.py build_ext --inplace \
-		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
-		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
-
-install-exec-local:
-	GPIOD_WITH_TESTS= \
-	$(PYTHON) setup.py install --prefix=$(prefix)
-
-SUBDIRS = gpiod
-
-if WITH_TESTS
-
-SUBDIRS += tests
-
-endif
-
-if WITH_EXAMPLES
-
-SUBDIRS += examples
-
-endif
diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
deleted file mode 100644
index f42b80e900a8..000000000000
--- a/bindings/python/examples/Makefile.am
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	gpiodetect.py \
-	gpiofind.py \
-	gpioget.py \
-	gpioinfo.py \
-	gpiomon.py \
-	gpioset.py
diff --git a/bindings/python/gpiod/Makefile.am b/bindings/python/gpiod/Makefile.am
deleted file mode 100644
index 278f823972d8..000000000000
--- a/bindings/python/gpiod/Makefile.am
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = ext
-
-EXTRA_DIST = \
-	chip_info.py \
-	chip.py \
-	edge_event.py \
-	exception.py \
-	info_event.py \
-	__init__.py \
-	internal.py \
-	line_info.py \
-	line.py \
-	line_request.py \
-	line_settings.py
diff --git a/bindings/python/gpiod/ext/Makefile.am b/bindings/python/gpiod/ext/Makefile.am
deleted file mode 100644
index 9c81b1790bc4..000000000000
--- a/bindings/python/gpiod/ext/Makefile.am
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	chip.c \
-	common.c \
-	internal.h \
-	line-config.c \
-	line-settings.c \
-	module.c \
-	request.c
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
deleted file mode 100644
index ec8f99d4013d..000000000000
--- a/bindings/python/setup.py
+++ /dev/null
@@ -1,47 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-from os import environ
-from setuptools import setup, Extension, find_packages
-
-gpiod_ext = Extension(
-    "gpiod._ext",
-    sources=[
-        "gpiod/ext/chip.c",
-        "gpiod/ext/common.c",
-        "gpiod/ext/line-config.c",
-        "gpiod/ext/line-settings.c",
-        "gpiod/ext/module.c",
-        "gpiod/ext/request.c",
-    ],
-    define_macros=[("_GNU_SOURCE", "1")],
-    libraries=["gpiod"],
-    extra_compile_args=["-Wall", "-Wextra"],
-)
-
-gpiosim_ext = Extension(
-    "tests.gpiosim._ext",
-    sources=["tests/gpiosim/ext.c"],
-    define_macros=[("_GNU_SOURCE", "1")],
-    libraries=["gpiosim"],
-    extra_compile_args=["-Wall", "-Wextra"],
-)
-
-extensions = [gpiod_ext]
-with_tests = bool(environ["GPIOD_WITH_TESTS"])
-if with_tests:
-    extensions.append(gpiosim_ext)
-
-# FIXME Find a better way to get the version
-version = None
-try:
-    version = environ["GPIOD_VERSION_STR"]
-except KeyError:
-    pass
-
-setup(
-    name="gpiod",
-    packages=find_packages(include=["gpiod"]),
-    ext_modules=extensions,
-    version=version,
-)
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
deleted file mode 100644
index 7dcdebb28d09..000000000000
--- a/bindings/python/tests/Makefile.am
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = gpiosim
-
-EXTRA_DIST = \
-	helpers.py \
-	__init__.py \
-	__main__.py \
-	tests_chip_info.py \
-	tests_chip.py \
-	tests_edge_event.py \
-	tests_info_event.py \
-	tests_line_info.py \
-	tests_line_request.py \
-	tests_line_settings.py \
-	tests_module.py
diff --git a/bindings/python/tests/gpiosim/Makefile.am b/bindings/python/tests/gpiosim/Makefile.am
deleted file mode 100644
index 7004f3af7568..000000000000
--- a/bindings/python/tests/gpiosim/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-EXTRA_DIST = \
-	chip.py \
-	ext.c \
-	__init__.py
diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
deleted file mode 100644
index a0d0772b01cb..000000000000
--- a/bindings/rust/Makefile.am
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2022 Linaro Ltd.
-# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
-
-command = cargo build --release --lib
-
-if WITH_TESTS
-command += --tests
-endif
-
-if WITH_EXAMPLES
-command += --examples
-endif
-
-all:
-	$(command)
-
-clean:
-	cargo clean
diff --git a/bindings/rust/meson.build b/bindings/rust/meson.build
index 68f27f473282..07831b31c3cd 100644
--- a/bindings/rust/meson.build
+++ b/bindings/rust/meson.build
@@ -1,3 +1,6 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# Copyright 2022 IBM Corp.
+
 cargo = find_program('cargo')
 cargo_manifest = files('Cargo.toml')
 cargo_build_dir = meson.project_build_root() / 'cargo-build'
diff --git a/configure.ac b/configure.ac
deleted file mode 100644
index ccbb88a511cb..000000000000
--- a/configure.ac
+++ /dev/null
@@ -1,272 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-AC_PREREQ([2.69])
-
-AC_INIT([libgpiod], [2.0])
-AC_SUBST(EXTRA_VERSION, [-devel])
-
-AC_DEFINE_UNQUOTED([GPIOD_VERSION_STR],
-			["$PACKAGE_VERSION$EXTRA_VERSION"],
-			[Full library version string.])
-AC_SUBST(VERSION_STR, [$PACKAGE_VERSION$EXTRA_VERSION])
-
-# From the libtool manual:
-#
-# (...)
-# 3. If the library source code has changed at all since the last update, then
-#    increment revision ('c:r:a' becomes 'c:r+1:a').
-# 4. If any interfaces have been added, removed, or changed since the last
-#    update, increment current, and set revision to 0.
-# 5. If any interfaces have been added since the last public release, then
-#    increment age.
-# 6. If any interfaces have been removed or changed since the last public
-#    release, then set age to 0.
-#
-# Define the libtool version as (C.R.A):
-# NOTE: this version only applies to the core C library.
-AC_SUBST(ABI_VERSION, [4.1.2])
-# Have a separate ABI version for C++ bindings:
-AC_SUBST(ABI_CXX_VERSION, [2.1.1])
-# ABI version for libgpiosim (we need this since it can be installed if we
-# enable install-tests).
-AC_SUBST(ABI_GPIOSIM_VERSION, [0.1.0])
-
-AC_CONFIG_AUX_DIR([autostuff])
-AC_CONFIG_MACRO_DIRS([m4])
-AM_INIT_AUTOMAKE([foreign subdir-objects])
-
-m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-m4_pattern_forbid([^AX_],
-	[Unexpanded AX_ macro found. Please install GNU autoconf-archive.])
-
-AC_ARG_VAR([PYTHON_CPPFLAGS],
-	[Compiler flags to find Python headers [default: auto-detect]])
-AC_ARG_VAR([PYTHON_LIBS],
-	[Libraries to link into Python extensions [default: auto-detect]])
-
-AC_CONFIG_SRCDIR([lib])
-AC_CONFIG_HEADERS([config.h])
-
-AC_DEFINE([_GNU_SOURCE], [], [We want GNU extensions])
-
-# Silence warning: ar: 'u' modifier ignored since 'D' is the default
-AC_SUBST(AR_FLAGS, [cr])
-
-AM_PROG_AR
-AC_PROG_CC
-AC_PROG_CXX
-AC_PROG_INSTALL
-AC_PROG_EGREP
-
-LT_INIT
-
-AC_DEFUN([ERR_NOT_FOUND],
-	[AC_MSG_ERROR([$1 not found (needed to build $2)], [1])])
-
-AC_DEFUN([FUNC_NOT_FOUND_LIB],
-	[ERR_NOT_FOUND([$1()], [the library])])
-
-AC_DEFUN([HEADER_NOT_FOUND_LIB],
-	[ERR_NOT_FOUND([$1 header], [the library])])
-
-AC_DEFUN([HEADER_NOT_FOUND_TESTS],
-	[ERR_NOT_FOUND([$1 header], [the test suite])])
-
-AC_DEFUN([HEADER_NOT_FOUND_CXX],
-	[ERR_NOT_FOUND([$1 header], [C++ bindings])])
-
-# This is always checked (library needs this)
-AC_HEADER_STDC
-AC_FUNC_MALLOC
-AC_CHECK_FUNC([ioctl], [], [FUNC_NOT_FOUND_LIB([ioctl])])
-AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
-AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
-AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_LIB([alphasort])])
-AC_CHECK_FUNC([ppoll], [], [FUNC_NOT_FOUND_LIB([ppoll])])
-AC_CHECK_FUNC([realpath], [], [FUNC_NOT_FOUND_LIB([realpath])])
-AC_CHECK_HEADERS([getopt.h], [], [HEADER_NOT_FOUND_LIB([getopt.h])])
-AC_CHECK_HEADERS([dirent.h], [], [HEADER_NOT_FOUND_LIB([dirent.h])])
-AC_CHECK_HEADERS([sys/poll.h], [], [HEADER_NOT_FOUND_LIB([sys/poll.h])])
-AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])])
-AC_CHECK_HEADERS([linux/version.h], [], [HEADER_NOT_FOUND_LIB([linux/version.h])])
-AC_CHECK_HEADERS([linux/const.h], [], [HEADER_NOT_FOUND_LIB([linux/const.h])])
-AC_CHECK_HEADERS([linux/ioctl.h], [], [HEADER_NOT_FOUND_LIB([linux/ioctl.h])])
-AC_CHECK_HEADERS([linux/types.h], [], [HEADER_NOT_FOUND_LIB([linux/types.h])])
-
-AC_ARG_ENABLE([tools],
-	[AS_HELP_STRING([--enable-tools],[enable libgpiod command-line tools [default=no]])],
-	[if test "x$enableval" = xyes; then with_tools=true; fi],
-	[with_tools=false])
-AM_CONDITIONAL([WITH_TOOLS], [test "x$with_tools" = xtrue])
-
-AC_DEFUN([FUNC_NOT_FOUND_TOOLS],
-	[ERR_NOT_FOUND([$1()], [tools])])
-
-AC_ARG_ENABLE([gpioset-interactive],
-	[AS_HELP_STRING([--enable-gpioset-interactive],
-		[enable gpioset interactive mode [default=no]])],
-	[if test "x$enableval" = xyes; then with_gpioset_interactive=true; fi],
-	[with_gpioset_interactive=false])
-AM_CONDITIONAL([WITH_GPIOSET_INTERACTIVE],
-	[test "x$with_gpioset_interactive" = xtrue])
-
-AS_IF([test "x$with_tools" = xtrue],
-	[# These are only needed to build tools
-	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
-	AS_IF([test "x$with_gpioset_interactive" = xtrue],
-		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
-	])
-
-AC_ARG_ENABLE([tests],
-	[AS_HELP_STRING([--enable-tests],[enable libgpiod tests [default=no]])],
-	[if test "x$enableval" = xyes; then with_tests=true; fi],
-	[with_tests=false])
-AM_CONDITIONAL([WITH_TESTS], [test "x$with_tests" = xtrue])
-
-AC_ARG_ENABLE([profiling],
-	[AS_HELP_STRING([--enable-profiling],
-		[enable gcov profiling on the core library and tests [default=no]])],
-	[if test "x$enableval" = xyes; then with_profiling=true; fi],
-	[with_profiling=false])
-if test "x$with_profiling" = xtrue
-then
-	AC_SUBST(PROFILING_CFLAGS, ["-fprofile-arcs -ftest-coverage"])
-	AC_SUBST(PROFILING_LDFLAGS, ["-lgcov"])
-fi
-
-AC_DEFUN([FUNC_NOT_FOUND_TESTS],
-	[ERR_NOT_FOUND([$1()], [tests])])
-
-if test "x$with_tests" = xtrue
-then
-	# For libgpiosim
-	AC_CHECK_FUNC([qsort], [], [FUNC_NOT_FOUND_TESTS([qsort])])
-	PKG_CHECK_MODULES([KMOD], [libkmod >= 18])
-	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
-
-	# For core library tests
-	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
-	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.50])
-
-	if test "x$with_tools" = xtrue
-	then
-		AC_CHECK_PROG([has_bats], [bats], [true], [false])
-		if test "x$has_bats" = "xfalse"
-		then
-			AC_MSG_NOTICE([bats not found - gpio-tools tests cannot be run])
-		fi
-	fi
-fi
-
-AC_ARG_ENABLE([examples],
-	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
-	[if test "x$enableval" = xyes; then with_examples=true; fi],
-	[with_examples=false])
-AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
-
-AC_ARG_ENABLE([bindings-cxx],
-	[AS_HELP_STRING([--enable-bindings-cxx],[enable C++ bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_cxx=true; fi],
-	[with_bindings_cxx=false])
-AM_CONDITIONAL([WITH_BINDINGS_CXX], [test "x$with_bindings_cxx" = xtrue])
-
-if test "x$with_bindings_cxx" = xtrue
-then
-	LT_LANG([C++])
-	# This needs autoconf-archive
-	AX_CXX_COMPILE_STDCXX_11([ext], [mandatory])
-
-	if test "x$with_tests" = xtrue
-	then
-		PKG_CHECK_MODULES([CATCH2], [catch2],, [
-			AC_LANG_PUSH([C++])
-			AC_CHECK_HEADERS([catch2/catch.hpp], [], [HEADER_NOT_FOUND_CXX([catch2/catch.hpp])])
-			AC_LANG_POP([C++])
-		])
-	fi
-
-	if test "x$with_examples" = xtrue
-	then
-		# Examples use C++17 features
-		AX_CXX_COMPILE_STDCXX([17], [ext], [mandatory])
-	fi
-fi
-
-AC_ARG_ENABLE([bindings-python],
-	[AS_HELP_STRING([--enable-bindings-python],[enable python3 bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_python=true; fi],
-	[with_bindings_python=false])
-AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
-
-if test "x$with_bindings_python" = xtrue
-then
-	AM_PATH_PYTHON([3.0], [],
-		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
-	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
-	if test "x$has_python_config" = xfalse
-	then
-		AC_MSG_ERROR([python3-config not found - needed for python bindings])
-	fi
-	AS_IF([test -z "$PYTHON_CPPFLAGS"],
-		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
-	AS_IF([test -z "$PYTHON_LIBS"],
-		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
-fi
-
-AC_ARG_ENABLE([bindings-rust],
-	[AS_HELP_STRING([--enable-bindings-rust],[enable rust bindings [default=no]])],
-	[if test "x$enableval" = xyes; then with_bindings_rust=true; fi],
-	[with_bindings_rust=false])
-AM_CONDITIONAL([WITH_BINDINGS_RUST], [test "x$with_bindings_rust" = xtrue])
-
-if test "x$with_bindings_rust" = xtrue
-then
-	AC_CHECK_PROG([has_cargo], [cargo], [true], [false])
-	if test "x$has_cargo" = xfalse
-	then
-		AC_MSG_ERROR([cargo not found - needed for rust bindings])
-	fi
-fi
-
-AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
-if test "x$has_doxygen" = xfalse
-then
-	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
-fi
-AM_COND_IF([HAS_DOXYGEN], [AC_CONFIG_FILES([Doxyfile])])
-
-if test "x$cross_compiling" = xno
-then
-	AC_CHECK_PROG([has_help2man], [help2man], [true], [false])
-fi
-AM_CONDITIONAL([WITH_MANPAGES], [test "x$has_help2man" = xtrue])
-if test "x$has_help2man" = xfalse
-then
-	AC_MSG_NOTICE([help2man not found - man pages cannot be generated automatically])
-fi
-
-AC_CONFIG_FILES([Makefile
-		 include/Makefile
-		 lib/Makefile
-		 lib/libgpiod.pc
-		 tools/Makefile
-		 tests/Makefile
-		 tests/gpiosim/Makefile
-		 bindings/cxx/libgpiodcxx.pc
-		 bindings/Makefile
-		 bindings/cxx/Makefile
-		 bindings/cxx/gpiodcxx/Makefile
-		 bindings/cxx/examples/Makefile
-		 bindings/cxx/tests/Makefile
-		 bindings/python/Makefile
-		 bindings/python/gpiod/Makefile
-		 bindings/python/gpiod/ext/Makefile
-		 bindings/python/examples/Makefile
-		 bindings/python/tests/Makefile
-		 bindings/python/tests/gpiosim/Makefile
-		 bindings/rust/Makefile
-		 man/Makefile])
-
-AC_OUTPUT
diff --git a/include/Makefile.am b/include/Makefile.am
deleted file mode 100644
index 7f986ec61169..000000000000
--- a/include/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-include_HEADERS = gpiod.h
diff --git a/lib/Makefile.am b/lib/Makefile.am
deleted file mode 100644
index dd90abd130b1..000000000000
--- a/lib/Makefile.am
+++ /dev/null
@@ -1,27 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-lib_LTLIBRARIES = libgpiod.la
-libgpiod_la_SOURCES =	chip.c \
-			chip-info.c \
-			edge-event.c \
-			info-event.c \
-			internal.h \
-			internal.c \
-			line-config.c \
-			line-info.c \
-			line-request.c \
-			line-settings.c \
-			misc.c \
-			request-config.c \
-			uapi/gpio.h
-
-libgpiod_la_CFLAGS = -Wall -Wextra -g -std=gnu89
-libgpiod_la_CFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
-libgpiod_la_CFLAGS += -include $(top_builddir)/config.h
-libgpiod_la_CFLAGS += $(PROFILING_CFLAGS)
-libgpiod_la_LDFLAGS = -version-info $(subst .,:,$(ABI_VERSION))
-libgpiod_la_LDFLAGS+= $(PROFILING_LDFLAGS)
-
-pkgconfigdir = $(libdir)/pkgconfig
-pkgconfig_DATA = libgpiod.pc
diff --git a/man/Makefile.am b/man/Makefile.am
deleted file mode 100644
index 201a52b5bfd8..000000000000
--- a/man/Makefile.am
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-if WITH_MANPAGES
-
-dist_man1_MANS = gpiodetect.man gpioinfo.man gpioget.man gpioset.man gpiomon.man gpionotify.man
-
-%.man: $(top_builddir)/tools/$(*F)
-	help2man $(top_builddir)/tools/$(*F) --include=$(srcdir)/template --output=$(builddir)/$@ --no-info
-
-clean-local:
-	rm -f $(dist_man1_MANS)
-
-endif
-
-EXTRA_DIST = template
diff --git a/tests/Makefile.am b/tests/Makefile.am
deleted file mode 100644
index 392f03c641cf..000000000000
--- a/tests/Makefile.am
+++ /dev/null
@@ -1,34 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-SUBDIRS = gpiosim
-
-AM_CFLAGS = -I$(top_srcdir)/include/ -I$(top_srcdir)/tests/gpiosim/
-AM_CFLAGS += -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89 $(GLIB_CFLAGS) $(GOBJECT_CFLAGS)
-AM_CFLAGS += -DG_LOG_DOMAIN=\"gpiod-test\"
-AM_CFLAGS += $(PROFILING_CFLAGS)
-AM_LDFLAGS = -pthread
-LDADD = $(top_builddir)/lib/libgpiod.la
-LDADD += $(top_builddir)/tests/gpiosim/libgpiosim.la
-LDADD += $(GLIB_LIBS) $(GOBJECT_LIBS)
-
-bin_PROGRAMS = gpiod-test
-
-gpiod_test_SOURCES =			\
-		gpiod-test.c		\
-		gpiod-test.h		\
-		gpiod-test-helpers.c	\
-		gpiod-test-helpers.h	\
-		gpiod-test-sim.c	\
-		gpiod-test-sim.h	\
-		tests-chip.c		\
-		tests-chip-info.c	\
-		tests-edge-event.c	\
-		tests-info-event.c	\
-		tests-line-config.c	\
-		tests-line-info.c	\
-		tests-line-request.c	\
-		tests-line-settings.c	\
-		tests-misc.c		\
-		tests-request-config.c
\ No newline at end of file
diff --git a/tests/gpiosim/Makefile.am b/tests/gpiosim/Makefile.am
deleted file mode 100644
index 05dce7919477..000000000000
--- a/tests/gpiosim/Makefile.am
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl>
-
-lib_LTLIBRARIES = libgpiosim.la
-noinst_PROGRAMS = gpiosim-selftest
-
-AM_CFLAGS = -Wall -Wextra -g -fvisibility=hidden -std=gnu89
-AM_CFLAGS += -include $(top_builddir)/config.h
-
-libgpiosim_la_SOURCES = gpiosim.c gpiosim.h
-libgpiosim_la_CFLAGS = $(AM_CFLAGS) $(KMOD_CFLAGS) $(MOUNT_CFLAGS)
-libgpiosim_la_LDFLAGS = -version-info $(subst .,:,$(ABI_GPIOSIM_VERSION))
-libgpiosim_la_LDFLAGS += $(KMOD_LIBS) $(MOUNT_LIBS) -pthread
-
-gpiosim_selftest_SOURCES = gpiosim-selftest.c
-gpiosim_selftest_LDADD = libgpiosim.la
diff --git a/tools/Makefile.am b/tools/Makefile.am
deleted file mode 100644
index defe1b025201..000000000000
--- a/tools/Makefile.am
+++ /dev/null
@@ -1,39 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
-AM_CFLAGS += -Wall -Wextra -g -std=gnu89
-
-noinst_LTLIBRARIES = libtools-common.la
-libtools_common_la_SOURCES = tools-common.c tools-common.h
-
-LDADD = libtools-common.la $(top_builddir)/lib/libgpiod.la
-
-if WITH_GPIOSET_INTERACTIVE
-
-AM_CFLAGS += -DGPIOSET_INTERACTIVE
-LDADD += $(LIBEDIT_LIBS)
-
-endif
-
-bin_PROGRAMS = gpiodetect gpioinfo gpioget gpioset gpiomon gpionotify
-
-gpiodetect_SOURCES = gpiodetect.c
-
-gpioinfo_SOURCES = gpioinfo.c
-
-gpioget_SOURCES = gpioget.c
-
-gpioset_SOURCES = gpioset.c
-
-gpiomon_SOURCES = gpiomon.c
-
-gpionotify_SOURCES = gpionotify.c
-
-EXTRA_DIST = gpio-tools-test gpio-tools-test.bats
-
-if WITH_TESTS
-
-bin_SCRIPTS = gpio-tools-test gpio-tools-test.bats
-
-endif
-- 
2.37.2

