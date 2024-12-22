Return-Path: <linux-gpio+bounces-14142-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D19FA7E5
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E27211660FE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1951194A45;
	Sun, 22 Dec 2024 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q4I7UaDz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2D191F98
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898108; cv=none; b=JjDZxeQs701pJwg/U2GjDNP9D+BFsCkFDEPNUwu8nu2av04T0+cGpgPXVe9CyPIaVv8a41aw2FfdPvvBFx1+8TciI+VxSOr4qiTY/00JTUN0so/OhVjqW9BWoU3fiojFrbO1ULTnAwz04JoatETH4o57b/DhT9Vvklm+gkKPO6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898108; c=relaxed/simple;
	bh=okrZomR+HnBe/n0Q/3H8HmcZOFruD1bCBRkO+rK9YqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFveCk7BwoIMN92IK+gVGvNeAd+mBZSLv1W8mRflYBmqrlmYAOZs/SbYOHkDn0Hss6jb0YJWYPvPCCuKdKY2BUQEfMa94E3OPNTCQwUTI559B544la0n4KRnYmzZu41h+L6aJiutoghNYhw7DsroAWE2tAPRZoQCFNzxD/SNwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q4I7UaDz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2653034f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898103; x=1735502903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+lnsSVCSxJXIbhiRhlkB+ifVjCogn7UKJ23gEmWNj4=;
        b=Q4I7UaDzsnIsCLRVgnoPeEHw2HWHjwpTDAPp1SDGDTnQNPurLuWryPmNKjopPd1Mf/
         XbZa4VLIZXxF9cRGV4WiduR80tpkg2PSMXbqv4nKfX6BwVkNV0NP1NOD7dBZReYSPxqi
         B5bM/KYFnmeMXuvXNh0A3nafNmKT16VDoV5no4v1UvI08ZEiSNzGbLubJlJP2rI9iosM
         Asr5xI9oLzxW7q9uX7OFqEOcOFe2Up7NKgZIb2MXqxI6wi4ogNpaMnmuC+tai1+6p5A+
         sS7urVh23nHpF+dUX/1KlOaXqkg/TQ2UJfp1WWffHJqjc5uUhIY1BfdOV7a8COv7gYn1
         r3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898103; x=1735502903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+lnsSVCSxJXIbhiRhlkB+ifVjCogn7UKJ23gEmWNj4=;
        b=tz91PB2MZIO8kZkpxVulPmqBUDFFgeGU3foO90Ci6ryd9n+Y2HNVaVNzA93vS460lL
         BEqNA8/TbLiWJ9KzdvLIagMaJU71My/0JWDaq40Ni30rkwbSm1gjsCUad/e0qKnqKeVM
         aYuGKB8qJU8gfaKjmkhX3mxaZMsdfAMEEFYQXOgxyy+tq4HaipgwbgqFqHHiYiIv0wbd
         H8RcbShKmEe9lw8aVO+koOPKsk6dSGI5V4xQE+hHj9FnSvOpdg/p3A/1ygLzi6co/3or
         RNFakrU+z1SJtbtEdqSI1iGufoSBonj+5QTe+aCtv/YCMRXzqHrWhs2NHK43s67zWdCr
         mBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVqTlQd0gqRvxL9uPfP238fl3SjEB5yxnUTdQTEF2JuQL86lcqGDPwG3BbAsgUIxnAGQkCeUKhqOtgS@vger.kernel.org
X-Gm-Message-State: AOJu0YzxsOgKpWUxrxDxm2MNJ/CwLIszCYX+KZCN7eY/9ZZPaWv1XlSH
	2JSy8J8/DSY8lP0EDCkbm1jFN5EOMISo02f5hWzFfL6Eh/9UdZofFB4uqG/83LE=
X-Gm-Gg: ASbGncuV2m/yDGDi99r9VJqZtl2Y9NNbWFQ487CEhyutGJRZ6MEoAgGJdXHd6gLUKVN
	ztu11ebk+0TxKFZ27kBYGgdfkjLl24vg/BC7BhPuvttb0YuaB5lv+DIB+VBB1iDez2p+reiSuBd
	TYY0VYsroK1HngvCuA5Bva6Ubvv63yon1vObycJe/x18Z1hBRVaa8jcuHe415jeVj8I4453uavU
	QM91CO4iYY5jPNT7Oe7HGQotbaBTZoolTZhJ6a05ALVu+b8
X-Google-Smtp-Source: AGHT+IHeRlRVRznQrGcxIiEUfCvnRZd2hJWMnkUmSVFHiLUm4D93WJvyi7qX+HS8tM9E8vvaYhYrEQ==
X-Received: by 2002:a5d:5e09:0:b0:37c:d23f:e464 with SMTP id ffacd0b85a97d-38a223f75bdmr9896969f8f.38.1734898102615;
        Sun, 22 Dec 2024 12:08:22 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 Dec 2024 21:08:10 +0100
Subject: [PATCH libgpiod v2 5/5] doc: use sphinx in conjunction with
 doxygen
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-improve-docs-v2-5-9067aa775099@linaro.org>
References: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
In-Reply-To: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=41610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HtxpZUVghrMaoS5bv8bk71h/y4oV3Xq1Rk7uVs0VwA0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGww/y02qDU70W0l/AL4i8MYjB6nlICVpqNX
 NWSYKljZK2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxsAAKCRARpy6gFHHX
 crvfEADRflxVbD6gbOIzD3nVUVfwsYea/dkWSsruK6HWzDEcHo/Sd38A5GEK6Irj5JxCsrOGfWS
 9WKbmBSAtmYT8XVrGObV0tt3ISVMFsqtyUSPHa4+RpTDaiy5UsvVGPt68T1bgO/byDHvgX+fmJP
 3Yn/jax1Aa8ZfyDA0jeXBj+guDtLSIeBm805ijD3QGNQY9LwpS9Aoc0lwPZ2XpOhoBwbijvuFRW
 bgG0fFbK16NjLqZgAXrWaOo+VZQMKR07o3EjHtQnatLXL9uW11E4ncOLuwiimzgyF8s3D452Tp2
 aLeQxZjQGPx6MDDIqP3UcXc8WM5EXVwmq+Y2FtC/al1YOSGxn0NOYT/C6yRmy7N97MjDKczGKQK
 rEnYxlkig5i3Cfa7RJBgkkteN/FsOS3uppEDffFXOUEPBFdSie9GF6vslQc8vuCUl2AXaWPlt2L
 Qcblwwbxt9OgS81w3oCSkjO6/4+7o8KTWknM1uuVCHUgZ+Pn7I2dhK+U2zFIjy2UQCYNFXWjAie
 rYGoMZVeO4x+AJvPoKfuIjh6kosm821mvvOfcox4lSc+B8+GgnBo6Qm/UkL654Zhzc1emdYd/EH
 cAB8pUHbj6+2mZXW7/CrsifJqjTaJMlUiIzD0eeQ4RgTIUqEmPkcx9DWQVdiZdkzQ5dSanUd4J9
 udgGwMiAPjIpedQ==
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
 .gitignore                     |   2 -
 .readthedocs.yaml              |  17 ++++---
 Doxyfile.in                    | 105 -----------------------------------------
 Makefile.am                    |  57 +++++++++++++++++++---
 README                         |  12 ++---
 configure.ac                   |   8 +++-
 docs/.gitignore                |   5 ++
 docs/Doxyfile                  |  12 +++++
 docs/conf.py                   |  63 +++++++++++++++++++++++++
 docs/core_api.rst              |  58 +++++++++++++++++++++++
 docs/core_chip_info.rst        |  11 +++++
 docs/core_chips.rst            |  11 +++++
 docs/core_edge_event.rst       |  11 +++++
 docs/core_line_config.rst      |  11 +++++
 docs/core_line_defs.rst        |  11 +++++
 docs/core_line_info.rst        |  11 +++++
 docs/core_line_request.rst     |  11 +++++
 docs/core_line_settings.rst    |  11 +++++
 docs/core_line_watch.rst       |  11 +++++
 docs/core_misc.rst             |  11 +++++
 docs/core_request_config.rst   |  11 +++++
 docs/cpp_api.rst               |  33 +++++++++++++
 docs/cpp_chip.rst              |  12 +++++
 docs/cpp_chip_info.rst         |  12 +++++
 docs/cpp_edge_event.rst        |  12 +++++
 docs/cpp_edge_event_buffer.rst |  12 +++++
 docs/cpp_exceptions.rst        |  18 +++++++
 docs/cpp_info_event.rst        |  12 +++++
 docs/cpp_line.rst              |  24 ++++++++++
 docs/cpp_line_config.rst       |  12 +++++
 docs/cpp_line_info.rst         |  12 +++++
 docs/cpp_line_request.rst      |  15 ++++++
 docs/cpp_line_settings.rst     |  12 +++++
 docs/cpp_misc.rst              |  16 +++++++
 docs/cpp_request_config.rst    |  12 +++++
 docs/index.rst                 |  28 +++++++++++
 docs/python_api.rst            |  31 ++++++++++++
 docs/python_chip.rst           |  12 +++++
 docs/python_chip_info.rst      |  12 +++++
 docs/python_edge_event.rst     |  12 +++++
 docs/python_exceptions.rst     |  17 +++++++
 docs/python_info_event.rst     |  12 +++++
 docs/python_line.rst           |  27 +++++++++++
 docs/python_line_info.rst      |  12 +++++
 docs/python_line_request.rst   |  12 +++++
 docs/python_line_settings.rst  |  12 +++++
 docs/python_misc.rst           |  13 +++++
 docs/requirements.txt          |   5 ++
 include/gpiod.h                |  36 --------------
 sphinx/conf.py                 |  68 --------------------------
 sphinx/contents.rst            |  24 ----------
 51 files changed, 748 insertions(+), 259 deletions(-)

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
diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index f40e95f..1243f11 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 #
 # This file is part of libgpiod.
@@ -12,16 +13,14 @@ version: 2
 build:
   os: ubuntu-22.04
   tools:
-    python: "3.11"
-  # doxygen is available by default, but just in case.
-  # others are definitely missing.
+    python: "3.12"
+  #  doxygen is available by default, but just in case.
   apt_packages:
-      - autoconf
-      - autoconf-archive
-      - libtool
-      - m4
       - doxygen
-      - graphviz
 
 sphinx:
-   configuration: sphinx/conf.py
+   configuration: docs/conf.py
+
+python:
+  install:
+    - requirements: docs/requirements.txt
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
index c824dc4..7807a0e 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -44,15 +44,60 @@ SUBDIRS += dbus
 
 endif
 
-if HAS_DOXYGEN
+if WITH_DOCS
 
-doc: Doxyfile
-	$(AM_V_GEN)doxygen Doxyfile
-.PHONY: doc
+DOCS_DEPS = \
+	docs/conf.py \
+	docs/core_api.rst \
+	docs/core_chip_info.rst \
+	docs/core_chips.rst \
+	docs/core_edge_event.rst \
+	docs/core_line_config.rst \
+	docs/core_line_defs.rst \
+	docs/core_line_info.rst \
+	docs/core_line_request.rst \
+	docs/core_line_settings.rst \
+	docs/core_line_watch.rst \
+	docs/core_misc.rst \
+	docs/core_request_config.rst \
+	docs/cpp_api.rst \
+	docs/cpp_chip_info.rst \
+	docs/cpp_chip.rst \
+	docs/cpp_edge_event_buffer.rst \
+	docs/cpp_edge_event.rst \
+	docs/cpp_exceptions.rst \
+	docs/cpp_info_event.rst \
+	docs/cpp_line_config.rst \
+	docs/cpp_line_info.rst \
+	docs/cpp_line_request.rst \
+	docs/cpp_line.rst \
+	docs/cpp_line_settings.rst \
+	docs/cpp_misc.rst \
+	docs/cpp_request_config.rst \
+	docs/Doxyfile \
+	docs/index.rst \
+	docs/python_api.rst \
+	docs/python_chip_info.rst \
+	docs/python_chip.rst \
+	docs/python_edge_event.rst \
+	docs/python_exceptions.rst \
+	docs/python_info_event.rst \
+	docs/python_line_info.rst \
+	docs/python_line_request.rst \
+	docs/python_line.rst \
+	docs/python_line_settings.rst \
+	docs/python_misc.rst \
+	docs/requirements.txt
+
+docs: $(DOCS_DEPS)
+	sphinx-build docs/ docs/sphinx-output
+
+.PHONY: docs
 
 clean-local:
-	rm -rf doc
+	rm -rf docs/sphinx-output
+	rm -rf docs/doxygen-output
 
-EXTRA_DIST += Doxyfile
+EXTRA_DIST += $(DOCS_DEPS)
 
 endif
diff --git a/README b/README
index 80ad939..28a3dfd 100644
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
+build can be invoked with 'make docs'. This generates documentation for the
+core C API as well as C++ and python bindings.
 
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
diff --git a/docs/.gitignore b/docs/.gitignore
new file mode 100644
index 0000000..3793d27
--- /dev/null
+++ b/docs/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+doxygen-output
+sphinx-output
diff --git a/docs/Doxyfile b/docs/Doxyfile
new file mode 100644
index 0000000..e4e55f9
--- /dev/null
+++ b/docs/Doxyfile
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
diff --git a/docs/conf.py b/docs/conf.py
new file mode 100644
index 0000000..fae849e
--- /dev/null
+++ b/docs/conf.py
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
diff --git a/docs/core_api.rst b/docs/core_api.rst
new file mode 100644
index 0000000..58b9012
--- /dev/null
+++ b/docs/core_api.rst
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
diff --git a/docs/core_chip_info.rst b/docs/core_chip_info.rst
new file mode 100644
index 0000000..40a5ca6
--- /dev/null
+++ b/docs/core_chip_info.rst
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
diff --git a/docs/core_chips.rst b/docs/core_chips.rst
new file mode 100644
index 0000000..758f365
--- /dev/null
+++ b/docs/core_chips.rst
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
diff --git a/docs/core_edge_event.rst b/docs/core_edge_event.rst
new file mode 100644
index 0000000..65ea53c
--- /dev/null
+++ b/docs/core_edge_event.rst
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
diff --git a/docs/core_line_config.rst b/docs/core_line_config.rst
new file mode 100644
index 0000000..5dc8bcb
--- /dev/null
+++ b/docs/core_line_config.rst
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
diff --git a/docs/core_line_defs.rst b/docs/core_line_defs.rst
new file mode 100644
index 0000000..08ec6fc
--- /dev/null
+++ b/docs/core_line_defs.rst
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
diff --git a/docs/core_line_info.rst b/docs/core_line_info.rst
new file mode 100644
index 0000000..e90059a
--- /dev/null
+++ b/docs/core_line_info.rst
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
diff --git a/docs/core_line_request.rst b/docs/core_line_request.rst
new file mode 100644
index 0000000..39b87ad
--- /dev/null
+++ b/docs/core_line_request.rst
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
diff --git a/docs/core_line_settings.rst b/docs/core_line_settings.rst
new file mode 100644
index 0000000..cc84345
--- /dev/null
+++ b/docs/core_line_settings.rst
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
diff --git a/docs/core_line_watch.rst b/docs/core_line_watch.rst
new file mode 100644
index 0000000..61fc007
--- /dev/null
+++ b/docs/core_line_watch.rst
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
diff --git a/docs/core_misc.rst b/docs/core_misc.rst
new file mode 100644
index 0000000..414a97a
--- /dev/null
+++ b/docs/core_misc.rst
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
diff --git a/docs/core_request_config.rst b/docs/core_request_config.rst
new file mode 100644
index 0000000..9433406
--- /dev/null
+++ b/docs/core_request_config.rst
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
diff --git a/docs/cpp_api.rst b/docs/cpp_api.rst
new file mode 100644
index 0000000..8e6df40
--- /dev/null
+++ b/docs/cpp_api.rst
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
diff --git a/docs/cpp_chip.rst b/docs/cpp_chip.rst
new file mode 100644
index 0000000..694a21c
--- /dev/null
+++ b/docs/cpp_chip.rst
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
diff --git a/docs/cpp_chip_info.rst b/docs/cpp_chip_info.rst
new file mode 100644
index 0000000..ce9d07b
--- /dev/null
+++ b/docs/cpp_chip_info.rst
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
diff --git a/docs/cpp_edge_event.rst b/docs/cpp_edge_event.rst
new file mode 100644
index 0000000..0be8fdd
--- /dev/null
+++ b/docs/cpp_edge_event.rst
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
diff --git a/docs/cpp_edge_event_buffer.rst b/docs/cpp_edge_event_buffer.rst
new file mode 100644
index 0000000..2e044d0
--- /dev/null
+++ b/docs/cpp_edge_event_buffer.rst
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
diff --git a/docs/cpp_exceptions.rst b/docs/cpp_exceptions.rst
new file mode 100644
index 0000000..2357a87
--- /dev/null
+++ b/docs/cpp_exceptions.rst
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
diff --git a/docs/cpp_info_event.rst b/docs/cpp_info_event.rst
new file mode 100644
index 0000000..b389d6f
--- /dev/null
+++ b/docs/cpp_info_event.rst
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
diff --git a/docs/cpp_line.rst b/docs/cpp_line.rst
new file mode 100644
index 0000000..adf23ad
--- /dev/null
+++ b/docs/cpp_line.rst
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
diff --git a/docs/cpp_line_config.rst b/docs/cpp_line_config.rst
new file mode 100644
index 0000000..a3fc714
--- /dev/null
+++ b/docs/cpp_line_config.rst
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
diff --git a/docs/cpp_line_info.rst b/docs/cpp_line_info.rst
new file mode 100644
index 0000000..d2e8eeb
--- /dev/null
+++ b/docs/cpp_line_info.rst
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
diff --git a/docs/cpp_line_request.rst b/docs/cpp_line_request.rst
new file mode 100644
index 0000000..f2ae4f8
--- /dev/null
+++ b/docs/cpp_line_request.rst
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
diff --git a/docs/cpp_line_settings.rst b/docs/cpp_line_settings.rst
new file mode 100644
index 0000000..e9bc067
--- /dev/null
+++ b/docs/cpp_line_settings.rst
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
diff --git a/docs/cpp_misc.rst b/docs/cpp_misc.rst
new file mode 100644
index 0000000..ce6ba4c
--- /dev/null
+++ b/docs/cpp_misc.rst
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
diff --git a/docs/cpp_request_config.rst b/docs/cpp_request_config.rst
new file mode 100644
index 0000000..476cfa6
--- /dev/null
+++ b/docs/cpp_request_config.rst
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
diff --git a/docs/index.rst b/docs/index.rst
new file mode 100644
index 0000000..b7cb6ef
--- /dev/null
+++ b/docs/index.rst
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
diff --git a/docs/python_api.rst b/docs/python_api.rst
new file mode 100644
index 0000000..a90afe6
--- /dev/null
+++ b/docs/python_api.rst
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
diff --git a/docs/python_chip.rst b/docs/python_chip.rst
new file mode 100644
index 0000000..83d34bd
--- /dev/null
+++ b/docs/python_chip.rst
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
diff --git a/docs/python_chip_info.rst b/docs/python_chip_info.rst
new file mode 100644
index 0000000..8116ef7
--- /dev/null
+++ b/docs/python_chip_info.rst
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
diff --git a/docs/python_edge_event.rst b/docs/python_edge_event.rst
new file mode 100644
index 0000000..6c77a38
--- /dev/null
+++ b/docs/python_edge_event.rst
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
diff --git a/docs/python_exceptions.rst b/docs/python_exceptions.rst
new file mode 100644
index 0000000..c247321
--- /dev/null
+++ b/docs/python_exceptions.rst
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
diff --git a/docs/python_info_event.rst b/docs/python_info_event.rst
new file mode 100644
index 0000000..6d32368
--- /dev/null
+++ b/docs/python_info_event.rst
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
diff --git a/docs/python_line.rst b/docs/python_line.rst
new file mode 100644
index 0000000..3a63ae5
--- /dev/null
+++ b/docs/python_line.rst
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
diff --git a/docs/python_line_info.rst b/docs/python_line_info.rst
new file mode 100644
index 0000000..2e0faeb
--- /dev/null
+++ b/docs/python_line_info.rst
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
diff --git a/docs/python_line_request.rst b/docs/python_line_request.rst
new file mode 100644
index 0000000..47fa734
--- /dev/null
+++ b/docs/python_line_request.rst
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
diff --git a/docs/python_line_settings.rst b/docs/python_line_settings.rst
new file mode 100644
index 0000000..b15ba26
--- /dev/null
+++ b/docs/python_line_settings.rst
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
diff --git a/docs/python_misc.rst b/docs/python_misc.rst
new file mode 100644
index 0000000..ea3f43c
--- /dev/null
+++ b/docs/python_misc.rst
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
diff --git a/docs/requirements.txt b/docs/requirements.txt
new file mode 100644
index 0000000..535321c
--- /dev/null
+++ b/docs/requirements.txt
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+breathe==4.35.0
+sphinx-rtd-theme==3.0.2
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


