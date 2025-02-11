Return-Path: <linux-gpio+bounces-15752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B005BA30C52
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A820C1889163
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42659215799;
	Tue, 11 Feb 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TaD+Blq0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040AA221D9C
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278796; cv=none; b=Iac7/KGM/OfovxM7CF8dk8JF4yp0GQA5mdekGY+M3jcP5fheMgtqVwmnXX6PCunk3FZSfvfvVnjg+LkYBv0Oie3KEjqwgPTMF4CGXlMuub5rfOLsPezdsSWxYIu2gqEzCdyWpzDYqILiXc8/BMdxXTnn51pGFNMoP0p0FEszHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278796; c=relaxed/simple;
	bh=Fbuw8kVL0vwogyLyeklarf4oeXGKTsGmJXfwmNJg5Es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbU0bF/vFIZ3kiUcdmUQELRtfTFqYeKTRJf8GWaZtZXC87qrV4o3YW1udagpBvxCeLkvWpSeMXNuDOa7cJGpDJZrL8rplWGMHTY3cijLqBO+id6Sb6RgoksMUnW1TVgbQo41Nt0LPHmSkn+hL/WZHfjAXxinOMHJfdi9FXZj7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TaD+Blq0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43946b5920cso13181225e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278791; x=1739883591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyzLaP6BpnPLKkpaJZ4tl51k+ZRZ2BVWdPz3ztHG8+I=;
        b=TaD+Blq09jZIYxEGbb1DDf3DKQYVQb0b4tNeWt2frEIshXgdPw2p3cyjCpX85qTllx
         r1snAXH1YS9VTKExDZyh6VHRL9FX6AiF2fzSQFkA3iTlnv3/tHawPjzBg5zhU6AFo4/D
         CgcpuxtxyJaGmKpKfBIAAa3MMWBBeB6ryCfUBlQqhq/WG6lxrx557i1AYdrvR5pi9Yah
         zEz3RjrVAJnisvhOtAbF1WFs0WJvX2rxtBzKdLCSAqTcYM6sqBa6YlPApdzdA5OnQYKj
         z5YBCCT67iHVRWKziwzVZD0Rfi5c55ink0sV6yAN4dK3bYopCWLPNZO//5eKT5RvqeUW
         DvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278791; x=1739883591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyzLaP6BpnPLKkpaJZ4tl51k+ZRZ2BVWdPz3ztHG8+I=;
        b=XOEeLdww1cVV3irhsw6BE8EL1xqvk60gfpsmDLAxe+CtmzrNZhcLRBng8z7u6yS8Bf
         TUsaVsAUHIiLVPNpzYgynzbPlRYYKAuhew130Ur2ePvY7ivuIbg/YajLtXlIO991M0/x
         UHH7/6+75JZ4XW59Vs98DwbMxS4MrQxNvdiqOTtxFaznfAcQwJiohBKh6eb7m2t71+xj
         /BGGEW3fSokZoSXNeDb3JvRDImefoUeMY4DqaFC4+C58rLP4JvPx2gG/I1HsfyHlHqxx
         J55MCMq4jLt5TokjG9wLRTNxQKKagiAZfkYlTzHl4Nv6bchZ2ItMiLzcoo5qQ2jbOY94
         7KcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKFX6LGZ6X+2/pWoVnIboonHado5TKBv+FcPsqCJzRaP+YCZgmGbVWKfU/KtlvSr2BCdN3vuA8+eCB@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbwapD+0p/O6rWUhhdBUglSZxq7vS5vIUnMqa4U+CjlMfMOtb
	yGy1t+WqkI4RQ22crmJZQFxXRVP5+JMDUGTHjLfVO6Sb3EqqSvkgeflfxIx1Pag=
X-Gm-Gg: ASbGnctJ3hQMSKoQbhpGiKxNlvjhvYyPLiljd5yKoK/VLMe45VwrdNIA4o9T0ujAaz0
	/H3NnyjpTVXqxlCVf//BD1KOqQJ+l05lpWr9FVoEgs4ypQauPu8i7xUU/Jumam74cY8Uid63DHD
	5WY7Akhx5GXh5CojyDbDy8VJ5WtGDxPufLoKhKGWZWq3RyCcRDG41yZkCnfPn6PMG3J76XS6td4
	NRRzC5EKwFdo3MPUsAJgndncVnL8T7bsNMXTqBMG1URFyWL6Eat5zjyp5AfP8HT+wzVJJg65CWx
	6kgesMA=
X-Google-Smtp-Source: AGHT+IGe+Svwbv99aOm0SSzjxXO+9ArK71NgETiTbjuwbyd+74JR7nY8Cis/SkZXtC7P6aS8t69tTQ==
X-Received: by 2002:a05:6000:4023:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-38de4203c6fmr3619625f8f.39.1739278790753;
        Tue, 11 Feb 2025 04:59:50 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:33 +0100
Subject: [PATCH libgpiod v4 12/17] doc: provide sphinx docs for the core C
 API and C++ bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-12-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=35877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9rUXVn/mp8astJLkdG70TrnQDDgRzJR1RRI7yGCqTcw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m3KgnxyTKp9BRaf1Ec6J+G2s4XFY0fNhvgh
 weqCC53q26JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtwAKCRARpy6gFHHX
 crZbEAC3+E8/ToKhNDglpwhN4+ONU5fgi9gN6o3/lsFZ0N2vt/xVCImvOMwiNzYWArxNTrKSJL1
 MoCNA5/TOeKxEi7NHDOryzLEgkJsPjzKYWDt2WH+wiB+QcU3j60mqcKDR+RIf/MVzNRqW2uw3S+
 TsbSieXClNasV5kq6VxYQrYze8Vf/MvlE+rrC/YgP+3JhhL9RcKIVsG8el6MUDT0RQwdcfaQpgd
 p6wBhPl9txiqjfvDADaiXMVvCR+nsi9sdQ51V9KTxV2mnPAclTUpUD+orsz7omuKi9uHxPJR0oO
 ASBaHYZzYRLnLGsOuO785sFsWICxQY9J6qQ6OTX/C4MYyBlpFPhT+mfWn/HP0kLInJ1ntXci+rL
 b2x9i1Rocrff//AwzJ8eOW9XRzs5K7mUEOari8MyXNCmlU9PJnsy0Ru9jG9PVtG8W/itQKEyL2c
 ifzdgauYV5rNwTVEsI7fMMlzC96TnjBsB6KMtZDvDqaIAXWozGupjknPpeX3qbAuxMEhCkkuyRj
 oLG/i1yquA+ZQKA5Li6U1nVObxEtfQzDtpQzMBKn6rmGA3CJjKtqO0typtwQ8fJz02PUOtxWMDK
 j8aEfIVhvbH5IWEvYwFKMoyieWxmmLm/KAW8fkP1Oq32alCLGSE4/uyyTNmZ9bw7F02MG8Jt/q1
 +6iraphmYQvZBtw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Current sphinx/ contents are mostly WiP. Let's beat them into shape for
publishing on ReadTheDocs.

Integrate the API documentation generated with doxygen for the core C
API and C++ bindings into sphinx using breathe.

Update configure.ac to check for sphinx-build in addition to doxygen and
make the main Makefile trigger a sphinx build on `make doc` (although
the docs can also be generated without starting the build system by
running: `sphinx-build ./docs/ docs/sphinx-output`).

Move the introduction text from the main header into the relevant .rst
file.

Remove obsolete Doxyfile.in and create a static Doxygen under doc/ where
all the documentation now lives.

Update .gitignore where needed.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .gitignore                     |   2 -
 .readthedocs.yaml              |  16 +++----
 Doxyfile.in                    | 105 -----------------------------------------
 Makefile.am                    |  12 ++---
 README                         |  12 ++---
 configure.ac                   |   9 +++-
 docs/.gitignore                |   5 ++
 docs/Doxyfile                  |  12 +++++
 docs/Makefile.am               |  45 ++++++++++++++++++
 docs/bindings.rst              |  20 ++++++++
 docs/conf.py                   |  53 +++++++++++++++++++++
 docs/core_api.rst              |  62 ++++++++++++++++++++++++
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
 docs/cpp_api.rst               |  34 +++++++++++++
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
 docs/requirements.txt          |   5 ++
 include/gpiod.h                |  36 --------------
 sphinx/conf.py                 |  68 --------------------------
 sphinx/contents.rst            |  24 ----------
 42 files changed, 591 insertions(+), 259 deletions(-)

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
index f40e95f..510b5c1 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Kent Gibson <warthog618@gmail.com>
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 #
 # This file is part of libgpiod.
@@ -12,16 +13,15 @@ version: 2
 build:
   os: ubuntu-22.04
   tools:
-    python: "3.11"
-  # doxygen is available by default, but just in case.
-  # others are definitely missing.
+    python: "3.12"
   apt_packages:
-      - autoconf
-      - autoconf-archive
-      - libtool
-      - m4
+      # doxygen is available by default, but just in case.
       - doxygen
       - graphviz
 
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
index d310e17..6cbae6d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -50,15 +50,13 @@ SUBDIRS += man
 
 endif
 
-if HAS_DOXYGEN
+if WITH_DOCS
 
-doc: Doxyfile
-	$(AM_V_GEN)doxygen Doxyfile
-.PHONY: doc
+SUBDIRS += docs
 
-clean-local:
-	rm -rf doc
+docs:
+	$(MAKE) -C docs docs
 
-EXTRA_DIST += Doxyfile
+.PHONY: docs
 
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
index 5a7e01c..8eec855 100644
--- a/configure.ac
+++ b/configure.ac
@@ -328,12 +328,16 @@ then
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
@@ -350,6 +354,7 @@ AC_CONFIG_FILES([Makefile
 		 lib/Makefile
 		 lib/libgpiod.pc
 		 contrib/Makefile
+		 docs/Makefile
 		 examples/Makefile
 		 tools/Makefile
 		 tests/Makefile
diff --git a/docs/.gitignore b/docs/.gitignore
new file mode 100644
index 0000000..86f8cfd
--- /dev/null
+++ b/docs/.gitignore
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+doxygen-output
+sphinx-output
diff --git a/docs/Doxyfile b/docs/Doxyfile
new file mode 100644
index 0000000..8c5b5df
--- /dev/null
+++ b/docs/Doxyfile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: CC-BY-SA-4.0
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
diff --git a/docs/Makefile.am b/docs/Makefile.am
new file mode 100644
index 0000000..0b0618b
--- /dev/null
+++ b/docs/Makefile.am
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+DOCS_DEPS = \
+	bindings.rst \
+	conf.py \
+	core_api.rst \
+	core_chip_info.rst \
+	core_chips.rst \
+	core_edge_event.rst \
+	core_line_config.rst \
+	core_line_defs.rst \
+	core_line_info.rst \
+	core_line_request.rst \
+	core_line_settings.rst \
+	core_line_watch.rst \
+	core_misc.rst \
+	core_request_config.rst \
+	cpp_api.rst \
+	cpp_chip_info.rst \
+	cpp_chip.rst \
+	cpp_edge_event_buffer.rst \
+	cpp_edge_event.rst \
+	cpp_exceptions.rst \
+	cpp_info_event.rst \
+	cpp_line_config.rst \
+	cpp_line_info.rst \
+	cpp_line_request.rst \
+	cpp_line.rst \
+	cpp_line_settings.rst \
+	cpp_misc.rst \
+	cpp_request_config.rst \
+	Doxyfile \
+	index.rst
+
+docs: $(DOCS_DEPS)
+	pushd ..; sphinx-build ./docs/ ./docs/sphinx-output; popd
+
+.PHONY: docs
+
+clean-local:
+	rm -rf sphinx-output
+	rm -rf doxygen-output
+
+EXTRA_DIST = $(DOCS_DEPS) requirements.txt
diff --git a/docs/bindings.rst b/docs/bindings.rst
new file mode 100644
index 0000000..069fc8f
--- /dev/null
+++ b/docs/bindings.rst
@@ -0,0 +1,20 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod high-level language bindings
+
+High-level language bindings to libgpiod
+========================================
+
+The bindings provide a more straightforward interface to the base, low-level
+C library.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Contents
+
+   cpp_api
diff --git a/docs/conf.py b/docs/conf.py
new file mode 100644
index 0000000..04c8c3b
--- /dev/null
+++ b/docs/conf.py
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+# This file is part of libgpiod.
+#
+# Configuration file for the Sphinx documentation builder.
+
+import os
+import re
+import subprocess
+import sys
+
+project = "libgpiod"
+copyright = "2017-2025, Bartosz Golaszewski"
+author = "Bartosz Golaszewski"
+
+master_doc = "index"
+source_suffix = ".rst"
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
+extensions = ["breathe"]
+
+breathe_projects = {"libgpiod": "./doxygen-output/xml"}
+breathe_default_project = "libgpiod"
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
+
+subprocess.run(["doxygen", "Doxyfile"])
diff --git a/docs/core_api.rst b/docs/core_api.rst
new file mode 100644
index 0000000..9424fcd
--- /dev/null
+++ b/docs/core_api.rst
@@ -0,0 +1,62 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
+**libgpiod**.
+
+The API is logically split into several sections. For each opaque data class,
+there's a set of functions for manipulating it. Together they can be thought
+of as objects and their methods in OOP parlance.
+
+.. note::
+   General note on error handling: all functions exported by libgpiod that can
+   fail, set errno to one of the error values defined in errno.h upon failure.
+   The way of notifying the caller that an error occurred varies between
+   functions, but in general a function that returns an ``int``, returns ``-1``
+   on error, while a function returning a pointer indicates an error condition
+   by returning a **NULL pointer**. It's not practical to list all possible
+   error codes for every function as they propagate errors from the underlying
+   libc functions.
+
+In general libgpiod functions are **NULL-aware**. For functions that are
+logically methods of data classes - ones that take a pointer to the object of
+that class as the first argument - passing a NULL-pointer will result in the
+program aborting the execution. For non-methods, init functions and methods
+that take a pointer as any of the subsequent arguments, the handling of a
+NULL-pointer depends on the implementation and may range from gracefully
+handling it, ignoring it or returning an error.
+
+**libgpiod** is **thread-aware** but does not provide any further thread-safety
+guarantees. This requires the user to ensure that at most one thread may work
+with an object at any time. Sharing objects across threads is allowed if
+a suitable synchronization mechanism serializes the access. Different,
+standalone objects can safely be used concurrently.
+
+.. note::
+   Most libgpiod objects are standalone. Exceptions - such as events allocated
+   in buffers - exist and are noted in the documentation.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Contents
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
index 0000000..00d06ca
--- /dev/null
+++ b/docs/core_chip_info.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..cd6eaac
--- /dev/null
+++ b/docs/core_chips.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..2ec05b8
--- /dev/null
+++ b/docs/core_edge_event.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..b217ee1
--- /dev/null
+++ b/docs/core_line_config.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..898f2a9
--- /dev/null
+++ b/docs/core_line_defs.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..403c3bb
--- /dev/null
+++ b/docs/core_line_info.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..74e477d
--- /dev/null
+++ b/docs/core_line_request.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..e557f19
--- /dev/null
+++ b/docs/core_line_settings.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..8f078cb
--- /dev/null
+++ b/docs/core_line_watch.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..34c327f
--- /dev/null
+++ b/docs/core_misc.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..328063c
--- /dev/null
+++ b/docs/core_request_config.rst
@@ -0,0 +1,11 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..83a6aa4
--- /dev/null
+++ b/docs/cpp_api.rst
@@ -0,0 +1,34 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiodcxx API documentation
+
+libgpiod C++ bindings API
+=========================
+
+The **C++ bindings** for **libgpiod** provide a modern C++ wrapper around the
+core C API. These bindings make it easier to work with GPIO lines in C++ by
+offering an **object-oriented** approach and **RAII** (Resource Acquisition
+Is Initialization) principles for managing resources.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Contents
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
index 0000000..c74ed66
--- /dev/null
+++ b/docs/cpp_chip.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..e81c0d7
--- /dev/null
+++ b/docs/cpp_chip_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..c01e01d
--- /dev/null
+++ b/docs/cpp_edge_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..c792776
--- /dev/null
+++ b/docs/cpp_edge_event_buffer.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..96eb815
--- /dev/null
+++ b/docs/cpp_exceptions.rst
@@ -0,0 +1,18 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..cb8256c
--- /dev/null
+++ b/docs/cpp_info_event.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..f7a483b
--- /dev/null
+++ b/docs/cpp_line.rst
@@ -0,0 +1,24 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..51b5374
--- /dev/null
+++ b/docs/cpp_line_config.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..7c9c59b
--- /dev/null
+++ b/docs/cpp_line_info.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..0e356f5
--- /dev/null
+++ b/docs/cpp_line_request.rst
@@ -0,0 +1,15 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..1892d59
--- /dev/null
+++ b/docs/cpp_line_settings.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..ed57fbc
--- /dev/null
+++ b/docs/cpp_misc.rst
@@ -0,0 +1,16 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..26f4388
--- /dev/null
+++ b/docs/cpp_request_config.rst
@@ -0,0 +1,12 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
index 0000000..8dcea20
--- /dev/null
+++ b/docs/index.rst
@@ -0,0 +1,28 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod documentation master file.
+
+Welcome to libgpiod's documentation!
+====================================
+
+The **libgpiod** project provides a low-level C library, bindings to high-level
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
+   :maxdepth: 1
+   :caption: Contents
+
+   core_api
+   bindings
diff --git a/docs/requirements.txt b/docs/requirements.txt
new file mode 100644
index 0000000..9866547
--- /dev/null
+++ b/docs/requirements.txt
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: CC0-1.0
+# SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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


