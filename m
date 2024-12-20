Return-Path: <linux-gpio+bounces-14093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C59F96D1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2660E16AD5A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0E521A45E;
	Fri, 20 Dec 2024 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jer9FHdu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FF2594A8
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713200; cv=none; b=Q2e25M3Pzrei2zjdy3ErPRlZwGoxj8xUhx1lWa5KxNP6Npd6rQRd/9W1Y8lIsK8kZv3iwCFmgdIfzlDT1D0xFr8MZ4WVIiwgnV8KHavZvIfdCkKqpRKu7ntTTFVnnMhHkAh53kOl5lThr3357AmIzAon6e4/o9eg6WYf68FDT4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713200; c=relaxed/simple;
	bh=I41JQcMb+R1FBV5LRFoIAn/aVoN1voyQekS5Kezdgd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmwVaaEhRBEFaRQ6UQj2TFrAVgdC/znt3UCFiMr+yBTe64gGaOZ0iPVdYCM32WhsOFpQEndzhkOPsdfmnCcXVjyyX7C688rADIyc/IQphY/FMqARNbu0WJwqtKb4sr/2fM9UNuw0xsYpeDwMxOZvbxHktqGH3InjDrbSy0WWwS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jer9FHdu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4362f61757fso20556225e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713196; x=1735317996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hczV+y0apO5rH6zN+J0Xq8pg0NDz4iw3+Lclol6wTtw=;
        b=Jer9FHduGu4DV7RrVR1CCwg/m0MUF5ia3Z1rKN1hw42lUGc9tsLq+H302gLnwy6NYI
         y2C+vPsTrceF730C3m6k99LnOBKbbfi1447wFGWz6gp59seqUQURUn68JnaXHlcvCm8Q
         mPwNkZbsRV+aHZK9Alcam3PZQgNB26Xqt3sZCQ9iGezayJrTLYRhParEwlART5UvXqX/
         DI3Tg4zU5DBVg6BguXC4IRTfJi4Tb5pwb/zx+2+/7HiUO8QE3orTr/YJzIjNpEure3gV
         Ay4zppvCsPLj98O205MYyO+ebjH3BLuHlpAa+hhsKyPbfTeWdhHPuDSKCVkZBVg17oe/
         MW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713196; x=1735317996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hczV+y0apO5rH6zN+J0Xq8pg0NDz4iw3+Lclol6wTtw=;
        b=lvqh7FZJXV/3NHf/eRB+18WDkDN9QGhkuLUAnZy6+1Yete0bwNNhkpQBnLEIkoSElR
         /x5Mwed7C0LHiK9S9t5jLPR8600bQgj1MjTPEkWcjkTI0WYYfvboywjfIY5PcgnXe3qw
         KvtEg5LMqWiFAoPenNN8e+eonGXdGUxboC+OzAJ0KwrDL1hkBlhq0sya+v8ZxBcbhkKG
         UgiZccNYnfApSt8kmW6hk/lJ5gXz1iGMsoz0H0/5+tb0hQRgo4lhTxefIXXuyK2oe8Zs
         6fVZ/K222mIqvrQUxMaTzeyiszSAhpX4ifNqsZAACL8TVzeayD9erUI7D0ZCtVSvhdaA
         kbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUroJKQYpOTGSdOqehmvmYFwvbHw/yMCS+WNalrNyqy3OWgXia6mjYxXXggaM7MbeoorXfOZjjXwJ0@vger.kernel.org
X-Gm-Message-State: AOJu0YyqumKA/esNrAR1p9WtDfuG+b9LRbdcYt9gwxLDUpj8F9ryJzBb
	ciVU4fV4+Lc9wl8MyW1ZdagCKg4aQcR1AiAZ6RASolKi54NcgVaOeLTSRO/RQnA=
X-Gm-Gg: ASbGncvV5GIor7svwcu4k/sag/qp7p86v+Y1u6ygW8UXKVEMDSRY7hKE4MFBz0c9/tH
	OV40D+oii4X8IFDqc6EUOkT/gKrBEbTXpPrq6x8oeUgqlb8mq6/61iGaXIdmT/xhYmhvnGVoNqJ
	A34O/lNq7+Fcn+xJIpX+WQErTBY9L48rKV4LsqTAZWn/z+wneBB76KE9Ef51rsflAgbV4J9zdel
	Y6KVVl2t/XcKE4mGYQeEEeuupOzKVgtOnHbPj7kEFrMEm0h9w==
X-Google-Smtp-Source: AGHT+IGK7N2czbp2sblaKJRr0nyAKfbI1NdJQ+2+VBcc1bWS9NcWQtOS8LM4gqterdqcHQtaDawMJA==
X-Received: by 2002:a05:600c:4511:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-43668642d71mr31579885e9.13.1734713195538;
        Fri, 20 Dec 2024 08:46:35 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:34 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:46:26 +0100
Subject: [PATCH libgpiod 5/5] doc: use sphinx in conjunction with doxygen
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-improve-docs-v1-5-799b86991dec@linaro.org>
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=39984;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AnHHHUDck+ANrCMtz2j7ucbtcaTzh8UoX82ZEc0WciU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9lP4p36el5PqH7GYVm49EtdwA4M8UDEJK2/
 hjScpYlwb6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZQAKCRARpy6gFHHX
 clxcEAC5PrmntywUNH1C6B7/TjwU9TMjoDbw4Im1spxVndgy2wfVBjo5RVNWfRRKF2fPTcEq1Ix
 kKZe3UPr+grnkw3KT3Ka+aJxM5q5MimQWF983B3A9iExWiSzmb4x85C0oryVIDYTPS6UROKC8hC
 fHk9rueYEhVgpToRVyWZ5nggPgV5/yDPqKEQ97wDqQ7MuEYk3gw3BTah3GHJRik6NDYsD2PIGyV
 f4OWRbNSqhL5lhx+reqKZyI7CJf5A+k86hOs9POJoNX9EfIwEeAjocNCiSGJGARTQ2DLhXMHT6a
 YQN6fKY5mnl4zk/Jzops+w3EfSfjUekq3Cv/MUzo8NOHESRKuIqLYb43KSAA/6OcmBYdb3VFP/Y
 NOxR/UUuS0KJ7Y2yctMOdcbzsB7cm8sV6XklXBDb94gWtoAlDS/iL2xZRpWxE3qMznMdqliCHA4
 hGKtWYgifIv/7oC8MZxkWu1ac/zw5OkpMKQIj0Km4QLaN/cayOdzv9cze2bIcsufvL48bGJ2HmL
 SDmTnZfx1hpiYw77sK2HxJU2KnYGjqTtSveH2mYNBqNPhsvXRDZgX0TmXe1/bBxA7EJ9hsY2Oli
 qTOJgLMqd0YXac3HcZ+0HWDvbhWT15HnJk5HTjAjzgTEdnlUkhOk5mxnol3/sjpFyaVr7uqDCW6
 EZ8QLODH1C2u+nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Integrate the API documentation generated with doxygen for the core C
API and C++ bindings into sphinx using breathe. Integrate python docs
with sphinx using autodoc and the import mock feature which allows us to
avoid having to build the C extension.

Update configure.ac to check for sphinx-build in addition to doxygen and
make the main Makefile trigger a sphinx build on `make doc` (although
the docs can also be generated without starting the build system by
running: `sphinx-build ./doc/ doc/sphinx-output`).

Create a tree of .rst documents with branches for libgpiod, libgpiodcxx
and python APIs.

Move the introduction text from the main header into the relevant .rst
file.

Remove obsolete Doxyfile.in and create a static Doxygen under doc/ where
all the documentation now lives.

Update .gitignore where needed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                    |   2 -
 Doxyfile.in                   | 105 ------------------------------------------
 Makefile.am                   |  54 ++++++++++++++++++++--
 README                        |  12 ++---
 configure.ac                  |   8 +++-
 doc/.gitignore                |   5 ++
 doc/Doxyfile                  |  12 +++++
 doc/conf.py                   |  63 +++++++++++++++++++++++++
 doc/core_api.rst              |  58 +++++++++++++++++++++++
 doc/core_chip_info.rst        |  11 +++++
 doc/core_chips.rst            |  11 +++++
 doc/core_edge_event.rst       |  11 +++++
 doc/core_line_config.rst      |  11 +++++
 doc/core_line_defs.rst        |  11 +++++
 doc/core_line_info.rst        |  11 +++++
 doc/core_line_request.rst     |  11 +++++
 doc/core_line_settings.rst    |  11 +++++
 doc/core_line_watch.rst       |  11 +++++
 doc/core_misc.rst             |  11 +++++
 doc/core_request_config.rst   |  11 +++++
 doc/cpp_api.rst               |  33 +++++++++++++
 doc/cpp_chip.rst              |  12 +++++
 doc/cpp_chip_info.rst         |  12 +++++
 doc/cpp_edge_event.rst        |  12 +++++
 doc/cpp_edge_event_buffer.rst |  12 +++++
 doc/cpp_exceptions.rst        |  18 ++++++++
 doc/cpp_info_event.rst        |  12 +++++
 doc/cpp_line.rst              |  24 ++++++++++
 doc/cpp_line_config.rst       |  12 +++++
 doc/cpp_line_info.rst         |  12 +++++
 doc/cpp_line_request.rst      |  15 ++++++
 doc/cpp_line_settings.rst     |  12 +++++
 doc/cpp_misc.rst              |  16 +++++++
 doc/cpp_request_config.rst    |  12 +++++
 doc/index.rst                 |  28 +++++++++++
 doc/python_api.rst            |  31 +++++++++++++
 doc/python_chip.rst           |  12 +++++
 doc/python_chip_info.rst      |  12 +++++
 doc/python_edge_event.rst     |  12 +++++
 doc/python_exceptions.rst     |  17 +++++++
 doc/python_info_event.rst     |  12 +++++
 doc/python_line.rst           |  27 +++++++++++
 doc/python_line_info.rst      |  12 +++++
 doc/python_line_request.rst   |  12 +++++
 doc/python_line_settings.rst  |  12 +++++
 doc/python_misc.rst           |  13 ++++++
 include/gpiod.h               |  36 ---------------
 sphinx/conf.py                |  68 ---------------------------
 sphinx/contents.rst           |  24 ----------
 49 files changed, 733 insertions(+), 249 deletions(-)

diff --git a/.gitignore b/.gitignore
index c3a29d8..7b5fa15 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,7 +6,6 @@
 *.la
 generated-*.c
 generated-*.h
-doc
 *.pc
 *.tar.gz
 *.patch
@@ -16,7 +15,6 @@ tags
 # autotools stuff
 .deps/
 .libs/
-Doxyfile
 Makefile
 Makefile.in
 aclocal.m4
diff --git a/Doxyfile.in b/Doxyfile.in
deleted file mode 100644
index 9c85e21..0000000
--- a/Doxyfile.in
+++ /dev/null
@@ -1,105 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
-
-# libgpiod doxygen configuration
-
-# General configuration
-PROJECT_NAME           = libgpiod
-PROJECT_NUMBER         = @VERSION_STR@
-OUTPUT_DIRECTORY       = doc
-OUTPUT_LANGUAGE        = English
-EXTRACT_ALL            = NO
-EXTRACT_PRIVATE        = NO
-EXTRACT_STATIC         = YES
-HIDE_UNDOC_MEMBERS     = NO
-HIDE_UNDOC_CLASSES     = NO
-BRIEF_MEMBER_DESC      = YES
-REPEAT_BRIEF           = YES
-ALWAYS_DETAILED_SEC    = NO
-FULL_PATH_NAMES        = NO
-STRIP_FROM_PATH        = @top_srcdir@
-INTERNAL_DOCS          = NO
-STRIP_CODE_COMMENTS    = YES
-CASE_SENSE_NAMES       = YES
-SHORT_NAMES            = NO
-HIDE_SCOPE_NAMES       = NO
-VERBATIM_HEADERS       = YES
-SHOW_INCLUDE_FILES     = YES
-JAVADOC_AUTOBRIEF      = YES
-INHERIT_DOCS           = YES
-INLINE_INFO            = YES
-SORT_MEMBER_DOCS       = YES
-DISTRIBUTE_GROUP_DOC   = NO
-TAB_SIZE               = 8
-GENERATE_TODOLIST      = YES
-GENERATE_TESTLIST      = YES
-GENERATE_BUGLIST       = YES
-ALIASES                =
-ENABLED_SECTIONS       =
-MAX_INITIALIZER_LINES  = 30
-OPTIMIZE_OUTPUT_FOR_C  = YES
-SHOW_USED_FILES        = YES
-QUIET                  = YES
-WARNINGS               = YES
-WARN_IF_UNDOCUMENTED   = YES
-WARN_FORMAT            =
-WARN_LOGFILE           =
-INPUT                  = @top_srcdir@/include/gpiod.h \
-                         @top_srcdir@/bindings/cxx/gpiod.hpp \
-                         @top_srcdir@/bindings/cxx/gpiodcxx/
-SOURCE_BROWSER         = YES
-INLINE_SOURCES         = NO
-REFERENCED_BY_RELATION = YES
-REFERENCES_RELATION    = YES
-ALPHABETICAL_INDEX     = NO
-IGNORE_PREFIX          =
-SEARCHENGINE           = NO
-ENABLE_PREPROCESSING   = YES
-
-# HTML output
-GENERATE_HTML          = YES
-HTML_OUTPUT            =
-HTML_HEADER            =
-HTML_FOOTER            =
-HTML_STYLESHEET        =
-GENERATE_HTMLHELP      = NO
-GENERATE_CHI           = NO
-BINARY_TOC             = NO
-TOC_EXPAND             = NO
-DISABLE_INDEX          = NO
-ENUM_VALUES_PER_LINE   = 4
-GENERATE_TREEVIEW      = NO
-TREEVIEW_WIDTH         = 250
-
-# LaTeX output
-GENERATE_LATEX         = NO
-LATEX_OUTPUT           =
-COMPACT_LATEX          = NO
-PAPER_TYPE             = a4
-EXTRA_PACKAGES         =
-LATEX_HEADER           =
-PDF_HYPERLINKS         = NO
-USE_PDFLATEX           = NO
-LATEX_BATCHMODE        = NO
-
-# RTF output
-GENERATE_RTF           = NO
-RTF_OUTPUT             =
-COMPACT_RTF            = NO
-RTF_HYPERLINKS         = NO
-RTF_STYLESHEET_FILE    =
-RTF_EXTENSIONS_FILE    =
-
-# Man page output
-GENERATE_MAN           = YES
-MAN_OUTPUT             = man
-MAN_EXTENSION          = .3
-MAN_LINKS              = YES
-
-# XML output
-GENERATE_XML           = YES
-
-# External references
-TAGFILES               =
-GENERATE_TAGFILE       =
-ALLEXTERNALS           = NO
diff --git a/Makefile.am b/Makefile.am
index c824dc4..7ec7dea 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -44,15 +44,59 @@ SUBDIRS += dbus
 
 endif
 
-if HAS_DOXYGEN
+if WITH_DOCS
+
+DOC_DEPS = \
+	doc/conf.py \
+	doc/core_api.rst \
+	doc/core_chip_info.rst \
+	doc/core_chips.rst \
+	doc/core_edge_event.rst \
+	doc/core_line_config.rst \
+	doc/core_line_defs.rst \
+	doc/core_line_info.rst \
+	doc/core_line_request.rst \
+	doc/core_line_settings.rst \
+	doc/core_line_watch.rst \
+	doc/core_misc.rst \
+	doc/core_request_config.rst \
+	doc/cpp_api.rst \
+	doc/cpp_chip_info.rst \
+	doc/cpp_chip.rst \
+	doc/cpp_edge_event_buffer.rst \
+	doc/cpp_edge_event.rst \
+	doc/cpp_exceptions.rst \
+	doc/cpp_info_event.rst \
+	doc/cpp_line_config.rst \
+	doc/cpp_line_info.rst \
+	doc/cpp_line_request.rst \
+	doc/cpp_line.rst \
+	doc/cpp_line_settings.rst \
+	doc/cpp_misc.rst \
+	doc/cpp_request_config.rst \
+	doc/Doxyfile \
+	doc/index.rst \
+	doc/python_api.rst \
+	doc/python_chip_info.rst \
+	doc/python_chip.rst \
+	doc/python_edge_event.rst \
+	doc/python_exceptions.rst \
+	doc/python_info_event.rst \
+	doc/python_line_info.rst \
+	doc/python_line_request.rst \
+	doc/python_line.rst \
+	doc/python_line_settings.rst \
+	doc/python_misc.rst
+
+doc: $(DOC_DEPS)
+	sphinx-build doc/ doc/sphinx-output
 
-doc: Doxyfile
-	$(AM_V_GEN)doxygen Doxyfile
 .PHONY: doc
 
 clean-local:
-	rm -rf doc
+	rm -rf doc/sphinx-output
+	rm -rf doc/doxygen-output
 
-EXTRA_DIST += Doxyfile
+EXTRA_DIST += $(DOC_DEPS)
 
 endif
diff --git a/README b/README
index 80ad939..8d8fe79 100644
--- a/README
+++ b/README
@@ -333,14 +333,12 @@ bindings use the standard tests module layout and the #[test] attribute.
 DOCUMENTATION
 -------------
 
-All API symbols exposed by the core C API and C++ bindings are documented with
-doxygen markup blocks. Doxygen documentation can be generated by executing
-'make doc' given that the doxygen executable is available in the system.
+The project uses sphinx to automatically generate the documentation. The system
+needs to provide doxygen and sphinx-build programs. With those in place, the
+build can be invoked with 'make doc'. This generates documentation for the core
+C API as well as C++ and python bindings.
 
-Python bindings contain help strings that can be accessed with the help
-builtin.
-
-Rust bindings use rustdoc.
+Rust bindings use rustdoc, GLib bindings use gi-docgen.
 
 Man pages for command-line programs are generated automatically if gpio-tools
 were selected and help2man is available in the system.
diff --git a/configure.ac b/configure.ac
index 78a6670..88ee367 100644
--- a/configure.ac
+++ b/configure.ac
@@ -326,12 +326,16 @@ then
 fi
 
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
-AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
+AC_CHECK_PROG([has_sphinx], [sphinx-build], [true], [false])
+AM_CONDITIONAL([WITH_DOCS], [test "x$has_doxygen" = xtrue && test "x$has_sphinx" = xtrue])
 if test "x$has_doxygen" = xfalse
 then
 	AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
 fi
-AM_COND_IF([HAS_DOXYGEN], [AC_CONFIG_FILES([Doxyfile])])
+if test "x$has_sphinx" = xfalse
+then
+	AC_MSG_NOTICE([sphinx-build not found - documentation cannot be generated])
+fi
 
 if test "x$cross_compiling" = xno
 then
diff --git a/doc/.gitignore b/doc/.gitignore
new file mode 100644
index 0000000..3793d27
--- /dev/null
+++ b/doc/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+doxygen-output
+sphinx-output
diff --git a/doc/Doxyfile b/doc/Doxyfile
new file mode 100644
index 0000000..e4e55f9
--- /dev/null
+++ b/doc/Doxyfile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+PROJECT_NAME		= libgpiod
+OUTPUT_DIRECTORY	= doxygen-output
+INPUT			= ../include/gpiod.h \
+			  ../bindings/cxx/gpiod.hpp \
+			  ../bindings/cxx/gpiodcxx/
+GENERATE_XML		= YES
+WARN_IF_UNDOCUMENTED	= YES
+QUIET			= YES
+EXTRACT_ALL		= YES
diff --git a/doc/conf.py b/doc/conf.py
new file mode 100644
index 0000000..fae849e
--- /dev/null
+++ b/doc/conf.py
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+# This file is part of libgpiod.
+#
+# Configuration file for the Sphinx documentation builder.
+#
+# This file only contains a selection of the most common options. For a full
+# list see the documentation:
+# https://www.sphinx-doc.org/en/master/usage/configuration.html
+
+import os
+import re
+import subprocess
+import sys
+from pathlib import Path
+
+sys.path.insert(0, str(Path("../bindings/python").resolve()))
+
+project = "libgpiod"
+copyright = "2017-2024, Bartosz Golaszewski"
+author = "Bartosz Golaszewski"
+
+# Extract the full version from configure.ac (including -devel, -rc and other
+# tags).
+with open("../configure.ac", "r") as fd:
+    version = ""
+    extra = ""
+    for line in fd.readlines():
+        match = re.search(r"AC_INIT\(\[libgpiod\], \[(.*?)\]\)", line)
+        if match:
+            version = match.group(1)
+            continue
+
+        match = re.search(r"AC_SUBST\(EXTRA_VERSION, \[(.*?)\]\)", line)
+        if match:
+            extra = match.group(1)
+
+        release = f"{version}{extra}"
+
+subprocess.run(["doxygen", "Doxyfile"])
+
+master_doc = "index"
+source_suffix = ".rst"
+
+extensions = ["breathe", "sphinx.ext.autodoc"]
+
+breathe_projects = {"libgpiod": "./doxygen-output/xml"}
+breathe_default_project = "libgpiod"
+
+autodoc_mock_imports = ["gpiod._ext"]
+
+# Use the RTD theme if available
+sphinx_rtd_theme = None
+try:
+    import sphinx_rtd_theme
+
+    extensions.append("sphinx_rtd_theme")
+except ImportError:
+    pass
+
+html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
diff --git a/doc/core_api.rst b/doc/core_api.rst
new file mode 100644
index 0000000..58b9012
--- /dev/null
+++ b/doc/core_api.rst
@@ -0,0 +1,58 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod core API documentation
+
+libgpiod core API
+=================
+
+This is the complete documentation of the public API made available to users of
+libgpiod.
+
+The API is logically split into several sections. For each opaque data class,
+there's a set of functions for manipulating it. Together they can be thought
+of as objects and their methods in OOP parlance.
+
+General note on error handling: all functions exported by libgpiod that can
+fail, set errno to one of the error values defined in errno.h upon failure.
+The way of notifying the caller that an error occurred varies between
+functions, but in general a function that returns an int, returns -1 on error,
+while a function returning a pointer indicates an error condition by
+returning a NULL pointer. It's not practical to list all possible error codes
+for every function as they propagate errors from the underlying libc functions.
+
+In general libgpiod functions are NULL-aware. For functions that are logically
+methods of data classes - ones that take a pointer to the object of that class
+as the first argument - passing a NULL pointer will result in the program
+aborting the execution. For non-methods, init functions and methods that take
+a pointer as any of the subsequent arguments, the handling of a NULL-pointer
+depends on the implementation and may range from gracefully handling it,
+ignoring it or returning an error.
+
+libgpiod is thread-aware but does not provide any further thread-safety
+guarantees. This requires the user to ensure that at most one thread may work
+with an object at any time. Sharing objects across threads is allowed if
+a suitable synchronization mechanism serializes the access. Different,
+standalone objects can safely be used concurrently. Most libgpiod objects are
+standalone. Exceptions - such as events allocated in buffers - exist and are
+noted in the documentation.
+
+
+.. toctree::
+   :maxdepth: 1
+
+   core_chips
+   core_chip_info
+   core_line_defs
+   core_line_info
+   core_line_watch
+   core_line_settings
+   core_line_config
+   core_request_config
+   core_line_request
+   core_edge_event
+   core_misc
diff --git a/doc/core_chip_info.rst b/doc/core_chip_info.rst
new file mode 100644
index 0000000..40a5ca6
--- /dev/null
+++ b/doc/core_chip_info.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip info
+==============
+
+.. doxygengroup:: chip_info
diff --git a/doc/core_chips.rst b/doc/core_chips.rst
new file mode 100644
index 0000000..758f365
--- /dev/null
+++ b/doc/core_chips.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip
+=========
+
+.. doxygengroup:: chips
diff --git a/doc/core_edge_event.rst b/doc/core_edge_event.rst
new file mode 100644
index 0000000..65ea53c
--- /dev/null
+++ b/doc/core_edge_event.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO edge event
+===============
+
+.. doxygengroup:: edge_event
diff --git a/doc/core_line_config.rst b/doc/core_line_config.rst
new file mode 100644
index 0000000..5dc8bcb
--- /dev/null
+++ b/doc/core_line_config.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line configuration
+=======================
+
+.. doxygengroup:: line_config
diff --git a/doc/core_line_defs.rst b/doc/core_line_defs.rst
new file mode 100644
index 0000000..08ec6fc
--- /dev/null
+++ b/doc/core_line_defs.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line definitions
+=====================
+
+.. doxygengroup:: line_defs
diff --git a/doc/core_line_info.rst b/doc/core_line_info.rst
new file mode 100644
index 0000000..e90059a
--- /dev/null
+++ b/doc/core_line_info.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line information
+=====================
+
+.. doxygengroup:: line_info
diff --git a/doc/core_line_request.rst b/doc/core_line_request.rst
new file mode 100644
index 0000000..39b87ad
--- /dev/null
+++ b/doc/core_line_request.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line request
+==================
+
+.. doxygengroup:: line_request
diff --git a/doc/core_line_settings.rst b/doc/core_line_settings.rst
new file mode 100644
index 0000000..cc84345
--- /dev/null
+++ b/doc/core_line_settings.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line settings
+==================
+
+.. doxygengroup:: line_settings
diff --git a/doc/core_line_watch.rst b/doc/core_line_watch.rst
new file mode 100644
index 0000000..61fc007
--- /dev/null
+++ b/doc/core_line_watch.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line watch
+===============
+
+.. doxygengroup:: line_watch
diff --git a/doc/core_misc.rst b/doc/core_misc.rst
new file mode 100644
index 0000000..414a97a
--- /dev/null
+++ b/doc/core_misc.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod misc interfaces
+========================
+
+.. doxygengroup:: misc
diff --git a/doc/core_request_config.rst b/doc/core_request_config.rst
new file mode 100644
index 0000000..9433406
--- /dev/null
+++ b/doc/core_request_config.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO request configuration
+==========================
+
+.. doxygengroup:: request_config
diff --git a/doc/cpp_api.rst b/doc/cpp_api.rst
new file mode 100644
index 0000000..8e6df40
--- /dev/null
+++ b/doc/cpp_api.rst
@@ -0,0 +1,33 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiodcxx API documentation
+
+libgpiod C++ bindings API
+=========================
+
+The C++ bindings for libgpiod provide a modern C++ wrapper around the core C
+API. These bindings make it easier to work with GPIO lines in C++ by offering
+an object-oriented approach and RAII (Resource Acquisition Is Initialization)
+principles for managing resources.
+
+.. toctree::
+   :maxdepth: 1
+
+   cpp_chip
+   cpp_chip_info
+   cpp_edge_event
+   cpp_edge_event_buffer
+   cpp_exceptions
+   cpp_info_event
+   cpp_line
+   cpp_line_info
+   cpp_line_config
+   cpp_line_settings
+   cpp_request_config
+   cpp_line_request
+   cpp_misc
diff --git a/doc/cpp_chip.rst b/doc/cpp_chip.rst
new file mode 100644
index 0000000..694a21c
--- /dev/null
+++ b/doc/cpp_chip.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip
+=========
+
+.. doxygenclass:: gpiod::chip
+   :members:
diff --git a/doc/cpp_chip_info.rst b/doc/cpp_chip_info.rst
new file mode 100644
index 0000000..ce9d07b
--- /dev/null
+++ b/doc/cpp_chip_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip info
+==============
+
+.. doxygenclass:: gpiod::chip_info
+   :members:
diff --git a/doc/cpp_edge_event.rst b/doc/cpp_edge_event.rst
new file mode 100644
index 0000000..0be8fdd
--- /dev/null
+++ b/doc/cpp_edge_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO edge event
+===============
+
+.. doxygenclass:: gpiod::edge_event
+   :members:
diff --git a/doc/cpp_edge_event_buffer.rst b/doc/cpp_edge_event_buffer.rst
new file mode 100644
index 0000000..2e044d0
--- /dev/null
+++ b/doc/cpp_edge_event_buffer.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO edge event buffer
+======================
+
+.. doxygenclass:: gpiod::edge_event_buffer
+   :members:
diff --git a/doc/cpp_exceptions.rst b/doc/cpp_exceptions.rst
new file mode 100644
index 0000000..2357a87
--- /dev/null
+++ b/doc/cpp_exceptions.rst
@@ -0,0 +1,18 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod exceptions
+===================
+
+.. doxygenclass:: gpiod::chip_closed
+   :members:
+
+.. doxygenclass:: gpiod::request_released
+   :members:
+
+.. doxygenclass:: gpiod::bad_mapping
+   :members:
diff --git a/doc/cpp_info_event.rst b/doc/cpp_info_event.rst
new file mode 100644
index 0000000..b389d6f
--- /dev/null
+++ b/doc/cpp_info_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO info event
+===============
+
+.. doxygenclass:: gpiod::info_event
+   :members:
diff --git a/doc/cpp_line.rst b/doc/cpp_line.rst
new file mode 100644
index 0000000..adf23ad
--- /dev/null
+++ b/doc/cpp_line.rst
@@ -0,0 +1,24 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiodcxx line definitions
+============================
+
+.. doxygenclass:: gpiod::line::offset
+   :members:
+
+.. doxygenenum:: gpiod::line::value
+
+.. doxygenenum:: gpiod::line::direction
+
+.. doxygenenum:: gpiod::line::edge
+
+.. doxygenenum:: gpiod::line::bias
+
+.. doxygenenum:: gpiod::line::drive
+
+.. doxygenenum:: gpiod::line::clock
diff --git a/doc/cpp_line_config.rst b/doc/cpp_line_config.rst
new file mode 100644
index 0000000..a3fc714
--- /dev/null
+++ b/doc/cpp_line_config.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line configuration
+=======================
+
+.. doxygenclass:: gpiod::line_config
+   :members:
diff --git a/doc/cpp_line_info.rst b/doc/cpp_line_info.rst
new file mode 100644
index 0000000..d2e8eeb
--- /dev/null
+++ b/doc/cpp_line_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line info
+==============
+
+.. doxygenclass:: gpiod::line_info
+   :members:
diff --git a/doc/cpp_line_request.rst b/doc/cpp_line_request.rst
new file mode 100644
index 0000000..f2ae4f8
--- /dev/null
+++ b/doc/cpp_line_request.rst
@@ -0,0 +1,15 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line request
+=================
+
+.. doxygenclass:: gpiod::request_builder
+   :members:
+
+.. doxygenclass:: gpiod::line_request
+   :members:
diff --git a/doc/cpp_line_settings.rst b/doc/cpp_line_settings.rst
new file mode 100644
index 0000000..e9bc067
--- /dev/null
+++ b/doc/cpp_line_settings.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line settings
+==================
+
+.. doxygenclass:: gpiod::line_settings
+   :members:
diff --git a/doc/cpp_misc.rst b/doc/cpp_misc.rst
new file mode 100644
index 0000000..ce6ba4c
--- /dev/null
+++ b/doc/cpp_misc.rst
@@ -0,0 +1,16 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiodcxx misc interfaces
+===========================
+
+.. doxygenclass:: gpiod::timestamp
+   :members:
+
+.. doxygenfunction:: gpiod::is_gpiochip_device
+
+.. doxygenfunction:: gpiod::api_version
diff --git a/doc/cpp_request_config.rst b/doc/cpp_request_config.rst
new file mode 100644
index 0000000..476cfa6
--- /dev/null
+++ b/doc/cpp_request_config.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO request configuration
+==========================
+
+.. doxygenclass:: gpiod::request_config
+   :members:
diff --git a/doc/index.rst b/doc/index.rst
new file mode 100644
index 0000000..b7cb6ef
--- /dev/null
+++ b/doc/index.rst
@@ -0,0 +1,28 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod documentation master file.
+
+Welcome to libgpiod's documentation!
+====================================
+
+The libgpiod project provides a low-level C library, bindings to high-level
+languages and tools for interacting with the GPIO (General Purpose Input/Output)
+lines on Linux systems.
+
+It replaces the older, legacy GPIO sysfs interface, which has been deprecated
+in the Linux kernel. The newer GPIO character device interface (introduced in
+Linux kernel version 4.8) provides a more flexible and efficient way to
+interact with GPIO lines, and libgpiod is the primary tool for working with
+this interface.
+
+.. toctree::
+   :maxdepth: 2
+
+   core_api
+   cpp_api
+   python_api
diff --git a/doc/python_api.rst b/doc/python_api.rst
new file mode 100644
index 0000000..a90afe6
--- /dev/null
+++ b/doc/python_api.rst
@@ -0,0 +1,31 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod python bindings documentation
+
+libgpiod python bindings API
+============================
+
+The libgpiod Python bindings provide an interface to control and interact with
+GPIO (General-Purpose Input/Output) lines on Linux systems using the libgpiod
+library. The Python bindings allow developers to manage GPIO pins easily
+through Python scripts, enabling tasks such as reading input values, setting
+outputs, monitoring events, and configuring more fine-grained pin options
+
+.. toctree::
+   :maxdepth: 1
+
+   python_chip
+   python_chip_info
+   python_exceptions
+   python_line
+   python_line_info
+   python_info_event
+   python_edge_event
+   python_line_settings
+   python_line_request
+   python_misc
diff --git a/doc/python_chip.rst b/doc/python_chip.rst
new file mode 100644
index 0000000..83d34bd
--- /dev/null
+++ b/doc/python_chip.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip
+=========
+
+.. autoclass:: gpiod.Chip
+   :members:
diff --git a/doc/python_chip_info.rst b/doc/python_chip_info.rst
new file mode 100644
index 0000000..8116ef7
--- /dev/null
+++ b/doc/python_chip_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO chip info
+==============
+
+.. autoclass:: gpiod.ChipInfo
+   :members:
diff --git a/doc/python_edge_event.rst b/doc/python_edge_event.rst
new file mode 100644
index 0000000..6c77a38
--- /dev/null
+++ b/doc/python_edge_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO edge event
+===============
+
+.. autoclass:: gpiod.EdgeEvent
+   :members:
diff --git a/doc/python_exceptions.rst b/doc/python_exceptions.rst
new file mode 100644
index 0000000..c247321
--- /dev/null
+++ b/doc/python_exceptions.rst
@@ -0,0 +1,17 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod python errors
+======================
+
+.. autoclass:: gpiod.ChipClosedError
+   :members:
+   :show-inheritance:
+
+.. autoclass:: gpiod.RequestReleasedError
+   :members:
+   :show-inheritance:
diff --git a/doc/python_info_event.rst b/doc/python_info_event.rst
new file mode 100644
index 0000000..6d32368
--- /dev/null
+++ b/doc/python_info_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO info event
+===============
+
+.. autoclass:: gpiod.InfoEvent
+   :members:
diff --git a/doc/python_line.rst b/doc/python_line.rst
new file mode 100644
index 0000000..3a63ae5
--- /dev/null
+++ b/doc/python_line.rst
@@ -0,0 +1,27 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line definitions
+=====================
+
+.. autoclass:: gpiod.line.Value
+   :members:
+
+.. autoclass:: gpiod.line.Direction
+   :members:
+
+.. autoclass:: gpiod.line.Bias
+   :members:
+
+.. autoclass:: gpiod.line.Drive
+   :members:
+
+.. autoclass:: gpiod.line.Edge
+   :members:
+
+.. autoclass:: gpiod.line.Clock
+   :members:
diff --git a/doc/python_line_info.rst b/doc/python_line_info.rst
new file mode 100644
index 0000000..2e0faeb
--- /dev/null
+++ b/doc/python_line_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line info
+==============
+
+.. autoclass:: gpiod.LineInfo
+   :members:
diff --git a/doc/python_line_request.rst b/doc/python_line_request.rst
new file mode 100644
index 0000000..47fa734
--- /dev/null
+++ b/doc/python_line_request.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line request
+=================
+
+.. autoclass:: gpiod.LineRequest
+   :members:
diff --git a/doc/python_line_settings.rst b/doc/python_line_settings.rst
new file mode 100644
index 0000000..b15ba26
--- /dev/null
+++ b/doc/python_line_settings.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+GPIO line settings
+==================
+
+.. autoclass:: gpiod.LineSettings
+   :members:
diff --git a/doc/python_misc.rst b/doc/python_misc.rst
new file mode 100644
index 0000000..ea3f43c
--- /dev/null
+++ b/doc/python_misc.rst
@@ -0,0 +1,13 @@
+..
+   SPDX-License-Identifier: CC0-1.0
+   SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+libgpiod python bindings misc
+=============================
+
+.. autofunction:: gpiod.is_gpiochip_device
+
+.. autofunction:: gpiod.request_lines
diff --git a/include/gpiod.h b/include/gpiod.h
index 75c55d9..6d40275 100644
--- a/include/gpiod.h
+++ b/include/gpiod.h
@@ -16,42 +16,6 @@
 extern "C" {
 #endif
 
-/**
- * @mainpage libgpiod public API
- *
- * This is the complete documentation of the public API made available to
- * users of libgpiod.
- *
- * The API is logically split into several sections. For each opaque data
- * class, there's a set of functions for manipulating it. Together they can be
- * thought of as objects and their methods in OOP parlance.
- *
- * General note on error handling: all functions exported by libgpiod that
- * can fail, set errno to one of the error values defined in errno.h upon
- * failure. The way of notifying the caller that an error occurred varies
- * between functions, but in general a function that returns an int, returns -1
- * on error, while a function returning a pointer indicates an error condition
- * by returning a NULL pointer. It's not practical to list all possible error
- * codes for every function as they propagate errors from the underlying libc
- * functions.
- *
- * In general libgpiod functions are NULL-aware. For functions that are
- * logically methods of data classes - ones that take a pointer to the object
- * of that class as the first argument - passing a NULL pointer will result in
- * the program aborting the execution. For non-methods, init functions and
- * methods that take a pointer as any of the subsequent arguments, the handling
- * of a NULL-pointer depends on the implementation and may range from gracefully
- * handling it, ignoring it or returning an error.
- *
- * libgpiod is thread-aware but does not provide any further thread-safety
- * guarantees. This requires the user to ensure that at most one thread may
- * work with an object at any time. Sharing objects across threads is allowed
- * if a suitable synchronization mechanism serializes the access. Different,
- * standalone objects can safely be used concurrently. Most libgpiod objects
- * are standalone. Exceptions - such as events allocated in buffers - exist and
- * are noted in the documentation.
- */
-
 /**
  * @struct gpiod_chip
  * @{
diff --git a/sphinx/conf.py b/sphinx/conf.py
deleted file mode 100644
index 790c884..0000000
--- a/sphinx/conf.py
+++ /dev/null
@@ -1,68 +0,0 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
-# SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
-
-# This file is part of libgpiod.
-#
-# Configuration file for the Sphinx documentation builder.
-#
-# This file only contains a selection of the most common options. For a full
-# list see the documentation:
-# https://www.sphinx-doc.org/en/master/usage/configuration.html
-
-import subprocess
-
-subprocess.run("cd .. ; ./autogen.sh ; make doc", shell=True)
-
-# -- Path setup --------------------------------------------------------------
-
-# If extensions (or modules to document with autodoc) are in another directory,
-# add these directories to sys.path here. If the directory is relative to the
-# documentation root, use os.path.abspath to make it absolute, like shown here.
-#
-# import os
-# import sys
-# sys.path.insert(0, os.path.abspath('.'))
-
-# -- Project information -----------------------------------------------------
-
-project = "libgpiod"
-copyright = "2022, Bartosz Golaszewski"
-author = "Bartosz Golaszewski"
-
-# The full version, including alpha/beta/rc tags
-release = (
-    subprocess.run(["git", "describe", "--dirty"], capture_output=True)
-    .stdout.decode()
-    .strip()
-)
-
-# -- General configuration ---------------------------------------------------
-
-# Add any Sphinx extension module names here, as strings. They can be
-# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
-# ones.
-extensions = []
-
-# Add any paths that contain templates here, relative to this directory.
-templates_path = []
-
-# List of patterns, relative to source directory, that match files and
-# directories to ignore when looking for source files.
-# This pattern also affects html_static_path and html_extra_path.
-exclude_patterns = []
-
-# -- Options for HTML output -------------------------------------------------
-
-root_doc = "contents"
-
-# The theme to use for HTML and HTML Help pages.  See the documentation for
-# a list of builtin themes.
-#
-html_theme = "alabaster"
-
-# Add any paths that contain custom static files (such as style sheets) here,
-# relative to this directory. They are copied after the builtin static files,
-# so a file named "default.css" will overwrite the builtin "default.css".
-html_static_path = []
-
-html_extra_path = ["../doc/html"]
diff --git a/sphinx/contents.rst b/sphinx/contents.rst
deleted file mode 100644
index c26d068..0000000
--- a/sphinx/contents.rst
+++ /dev/null
@@ -1,24 +0,0 @@
-..
-   SPDX-License-Identifier: LGPL-2.1-or-later
-   SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
-
-..
-   This file is part of libgpiod.
-
-   libgpiod documentation master file.
-
-Welcome to libgpiod's documentation!
-====================================
-
-.. toctree::
-   :maxdepth: 2
-   :caption: Contents:
-
-
-
-Indices and tables
-==================
-
-* :ref:`genindex`
-* :ref:`modindex`
-* :ref:`search`

-- 
2.45.2


