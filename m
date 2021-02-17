Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A8F31D9F2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhBQND0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhBQNDX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 08:03:23 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBC0C061788
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:42 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id 7so17389357wrz.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31fWdQi1GozkNMQzBBlHlT26JuHQ55SFGVVKFOVleMo=;
        b=SxFyz4cBe3wDOL8lDBisTYSHQF/dAWcBl9SaWLu/G57RLeFPXzpCthNbTLdBR3HHXg
         Cui99kPtXU1eOxLk6Wx8vemAhrVTqsokNh6hM/BVbO+eXqP2vbHGyWSiRAj1EDnG32cZ
         Vs8Eon7pA4ES7ksH71PF+/QbPGcfUn0ERXzbiVsqlVO0L2ZP6TTlya2IyEbkAzAhL7XP
         m6Clq/awaigP5NGlruLImR5P+tBnlg6P3ezjdTuSz8t2b9DkN7O1kJHiNZz1hPF2QGDg
         PkU718rVIldvUgbeJjC2fDb23xqA61xXEWWHCHAXDJsZq9/aP8gzLKpDwiLA/yRwE9rf
         iJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31fWdQi1GozkNMQzBBlHlT26JuHQ55SFGVVKFOVleMo=;
        b=MMrmFrYB2UIkzFzN2/CvEz7CzWU3VV6FayoHBY/WA4Uu/66BN9Fny57JQ9RM3rrWNx
         5kfYgdPQUI9heOEsQJOQB2i+z5Bdi3lSowRY9U1sXuntBbDvxJdhavVbVipLqqD1qPXJ
         7E0sqOs3vvkys1dHFaTWz5jMYKMl00gISykvtBA8qnoBNyFrl64N0gnu8hYgRqmUBv0b
         3wW5Z6KJzYibi6dQWFJK+5k9eoDFq7PTrHA8ekNcTkx20hhXz4JmH0W9V29mbPBlL/BW
         x0O6OHMENHvIYvWwacthFpjMS1GVE0Pu7ZGmbscz+foKrPl2lYEKETclnhUBO6FYWsow
         MQlA==
X-Gm-Message-State: AOAM53337S3lFo5NjwLZvJfsZxdoWiSvJOAlKPND8ln6KCjXqArq8xt4
        zwmd1njU62EwnKXcBW0vUfQVcw==
X-Google-Smtp-Source: ABdhPJzSNrnSlcCjbOuN9U7rhl8Lk5Lq8foebvtpDiVv6zqQ/Dx+gYKzZZMZUarwQ1QZUUY+prNLtA==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr29867526wrv.242.1613566959002;
        Wed, 17 Feb 2021 05:02:39 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id w8sm3910789wrm.21.2021.02.17.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 05:02:38 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 2/3] licensing: relicense non-library code under GPL-2.0-or-later
Date:   Wed, 17 Feb 2021 14:02:24 +0100
Message-Id: <20210217130225.6378-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210217130225.6378-1-brgl@bgdev.pl>
References: <20210217130225.6378-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

LGPL-2.1 is a license meant for shared libraries. Because I didn't know
any better I used it for all files in the repository, including programs
linking against libgpiod. The standard approach for many similar projects
is to use LGPL for library code and GPL for programs (and also Makefiles
and other files containing code or configuration).

Relicense all programs, tests, makefiles and autotools files under
GPL-2.0 or later.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Makefile.am                                | 3 ++-
 autogen.sh                                 | 2 +-
 bindings/Makefile.am                       | 2 +-
 bindings/cxx/Makefile.am                   | 2 +-
 bindings/cxx/examples/Makefile.am          | 2 +-
 bindings/cxx/examples/gpiodetectcxx.cpp    | 2 +-
 bindings/cxx/examples/gpiofindcxx.cpp      | 2 +-
 bindings/cxx/examples/gpiogetcxx.cpp       | 2 +-
 bindings/cxx/examples/gpioinfocxx.cpp      | 2 +-
 bindings/cxx/examples/gpiomoncxx.cpp       | 2 +-
 bindings/cxx/examples/gpiosetcxx.cpp       | 2 +-
 bindings/cxx/tests/Makefile.am             | 2 +-
 bindings/cxx/tests/gpiod-cxx-test-main.cpp | 2 +-
 bindings/cxx/tests/gpiod-cxx-test.cpp      | 2 +-
 bindings/cxx/tests/tests-chip.cpp          | 2 +-
 bindings/cxx/tests/tests-event.cpp         | 2 +-
 bindings/cxx/tests/tests-iter.cpp          | 2 +-
 bindings/cxx/tests/tests-line.cpp          | 2 +-
 bindings/python/Makefile.am                | 2 +-
 bindings/python/examples/Makefile.am       | 2 +-
 bindings/python/examples/gpiodetect.py     | 2 +-
 bindings/python/examples/gpiofind.py       | 2 +-
 bindings/python/examples/gpioget.py        | 2 +-
 bindings/python/examples/gpioinfo.py       | 2 +-
 bindings/python/examples/gpiomon.py        | 2 +-
 bindings/python/examples/gpioset.py        | 2 +-
 bindings/python/tests/Makefile.am          | 2 +-
 bindings/python/tests/gpiod_py_test.py     | 2 +-
 configure.ac                               | 2 +-
 include/Makefile.am                        | 2 +-
 lib/Makefile.am                            | 2 +-
 man/Makefile.am                            | 2 +-
 tests/Makefile.am                          | 2 +-
 tests/gpiod-test.c                         | 2 +-
 tests/gpiod-test.h                         | 2 +-
 tests/mockup/Makefile.am                   | 2 +-
 tests/tests-bulk.c                         | 2 +-
 tests/tests-chip.c                         | 2 +-
 tests/tests-event.c                        | 2 +-
 tests/tests-line.c                         | 2 +-
 tests/tests-misc.c                         | 2 +-
 tools/Makefile.am                          | 2 +-
 tools/gpio-tools-test                      | 2 +-
 tools/gpio-tools-test.bats                 | 2 +-
 tools/gpiodetect.c                         | 2 +-
 tools/gpiofind.c                           | 2 +-
 tools/gpioget.c                            | 2 +-
 tools/gpioinfo.c                           | 2 +-
 tools/gpiomon.c                            | 2 +-
 tools/gpioset.c                            | 2 +-
 tools/tools-common.c                       | 2 +-
 tools/tools-common.h                       | 2 +-
 52 files changed, 53 insertions(+), 52 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 203c291..0e44305 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 ACLOCAL_AMFLAGS = -I m4
@@ -8,6 +8,7 @@ SUBDIRS = include lib
 EXTRA_DIST = \
 	LICENSES/CC-BY-SA-4.0.txt \
 	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
 	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/Linux-syscall-note.txt
 
diff --git a/autogen.sh b/autogen.sh
index 7d21070..420b821 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 # SPDX-FileCopyrightText: 2017 Thierry Reding <treding@nvidia.com>
 
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
index c5301f9..8f8c762 100644
--- a/bindings/Makefile.am
+++ b/bindings/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 SUBDIRS = .
diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 23c03f4..655d1cd 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiodcxx.la
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index bdd951d..748b581 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
diff --git a/bindings/cxx/examples/gpiodetectcxx.cpp b/bindings/cxx/examples/gpiodetectcxx.cpp
index 84dff9d..872cd96 100644
--- a/bindings/cxx/examples/gpiodetectcxx.cpp
+++ b/bindings/cxx/examples/gpiodetectcxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* C++ reimplementation of the gpiodetect tool. */
diff --git a/bindings/cxx/examples/gpiofindcxx.cpp b/bindings/cxx/examples/gpiofindcxx.cpp
index cafcbb1..0bccd94 100644
--- a/bindings/cxx/examples/gpiofindcxx.cpp
+++ b/bindings/cxx/examples/gpiofindcxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* C++ reimplementation of the gpiofind tool. */
diff --git a/bindings/cxx/examples/gpiogetcxx.cpp b/bindings/cxx/examples/gpiogetcxx.cpp
index 486ff57..94b3dac 100644
--- a/bindings/cxx/examples/gpiogetcxx.cpp
+++ b/bindings/cxx/examples/gpiogetcxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioget tool. */
diff --git a/bindings/cxx/examples/gpioinfocxx.cpp b/bindings/cxx/examples/gpioinfocxx.cpp
index 76b7bc1..2175adc 100644
--- a/bindings/cxx/examples/gpioinfocxx.cpp
+++ b/bindings/cxx/examples/gpioinfocxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioinfo tool. */
diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
index 6b199c4..4d6ac6e 100644
--- a/bindings/cxx/examples/gpiomoncxx.cpp
+++ b/bindings/cxx/examples/gpiomoncxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpiomon tool. */
diff --git a/bindings/cxx/examples/gpiosetcxx.cpp b/bindings/cxx/examples/gpiosetcxx.cpp
index fb093cb..71b27a9 100644
--- a/bindings/cxx/examples/gpiosetcxx.cpp
+++ b/bindings/cxx/examples/gpiosetcxx.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Simplified C++ reimplementation of the gpioset tool. */
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index 3599c02..cbdecdc 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CPPFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
diff --git a/bindings/cxx/tests/gpiod-cxx-test-main.cpp b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
index 7343c1a..11bf8e5 100644
--- a/bindings/cxx/tests/gpiod-cxx-test-main.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test-main.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #define CATCH_CONFIG_MAIN
diff --git a/bindings/cxx/tests/gpiod-cxx-test.cpp b/bindings/cxx/tests/gpiod-cxx-test.cpp
index 1f1f20f..834f372 100644
--- a/bindings/cxx/tests/gpiod-cxx-test.cpp
+++ b/bindings/cxx/tests/gpiod-cxx-test.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <linux/version.h>
diff --git a/bindings/cxx/tests/tests-chip.cpp b/bindings/cxx/tests/tests-chip.cpp
index bf4db0d..a84b150 100644
--- a/bindings/cxx/tests/tests-chip.cpp
+++ b/bindings/cxx/tests/tests-chip.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/tests-event.cpp b/bindings/cxx/tests/tests-event.cpp
index 25cccde..aeb50dd 100644
--- a/bindings/cxx/tests/tests-event.cpp
+++ b/bindings/cxx/tests/tests-event.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/tests-iter.cpp b/bindings/cxx/tests/tests-iter.cpp
index 11243c9..848889b 100644
--- a/bindings/cxx/tests/tests-iter.cpp
+++ b/bindings/cxx/tests/tests-iter.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
diff --git a/bindings/cxx/tests/tests-line.cpp b/bindings/cxx/tests/tests-line.cpp
index 01f785d..c1ad8d2 100644
--- a/bindings/cxx/tests/tests-line.cpp
+++ b/bindings/cxx/tests/tests-line.cpp
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <catch2/catch.hpp>
diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index fd4092d..4405d8f 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 pyexec_LTLIBRARIES = gpiod.la
diff --git a/bindings/python/examples/Makefile.am b/bindings/python/examples/Makefile.am
index c9bee28..4169469 100644
--- a/bindings/python/examples/Makefile.am
+++ b/bindings/python/examples/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 EXTRA_DIST =				\
diff --git a/bindings/python/examples/gpiodetect.py b/bindings/python/examples/gpiodetect.py
index 665f07a..da6ee9a 100755
--- a/bindings/python/examples/gpiodetect.py
+++ b/bindings/python/examples/gpiodetect.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Reimplementation of the gpiodetect tool in Python.'''
diff --git a/bindings/python/examples/gpiofind.py b/bindings/python/examples/gpiofind.py
index 74aff8e..117d583 100755
--- a/bindings/python/examples/gpiofind.py
+++ b/bindings/python/examples/gpiofind.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Reimplementation of the gpiofind tool in Python.'''
diff --git a/bindings/python/examples/gpioget.py b/bindings/python/examples/gpioget.py
index 6cff18b..26a2ced 100755
--- a/bindings/python/examples/gpioget.py
+++ b/bindings/python/examples/gpioget.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioget tool in Python.'''
diff --git a/bindings/python/examples/gpioinfo.py b/bindings/python/examples/gpioinfo.py
index 238e04c..84188f1 100755
--- a/bindings/python/examples/gpioinfo.py
+++ b/bindings/python/examples/gpioinfo.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioinfo tool in Python.'''
diff --git a/bindings/python/examples/gpiomon.py b/bindings/python/examples/gpiomon.py
index 891760e..b29f3ce 100755
--- a/bindings/python/examples/gpiomon.py
+++ b/bindings/python/examples/gpiomon.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpiomon tool in Python.'''
diff --git a/bindings/python/examples/gpioset.py b/bindings/python/examples/gpioset.py
index 947e916..63e08dc 100755
--- a/bindings/python/examples/gpioset.py
+++ b/bindings/python/examples/gpioset.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 '''Simplified reimplementation of the gpioset tool in Python.'''
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index 7c8bb5e..972b669 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 dist_bin_SCRIPTS = gpiod_py_test.py
diff --git a/bindings/python/tests/gpiod_py_test.py b/bindings/python/tests/gpiod_py_test.py
index a1e22e8..f264db3 100755
--- a/bindings/python/tests/gpiod_py_test.py
+++ b/bindings/python/tests/gpiod_py_test.py
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 import errno
diff --git a/configure.ac b/configure.ac
index 32b50a8..70896ce 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AC_PREREQ([2.69])
diff --git a/include/Makefile.am b/include/Makefile.am
index dcbfde0..7f986ec 100644
--- a/include/Makefile.am
+++ b/include/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 include_HEADERS = gpiod.h
diff --git a/lib/Makefile.am b/lib/Makefile.am
index 1bc86e0..d8b19f0 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiod.la
diff --git a/man/Makefile.am b/man/Makefile.am
index c6d589f..4d2c29b 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 if WITH_MANPAGES
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 04fa3b2..49aa215 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 SUBDIRS = mockup
diff --git a/tests/gpiod-test.c b/tests/gpiod-test.c
index 46249a7..2681278 100644
--- a/tests/gpiod-test.c
+++ b/tests/gpiod-test.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tests/gpiod-test.h b/tests/gpiod-test.h
index 9b9e4ba..2688d3c 100644
--- a/tests/gpiod-test.h
+++ b/tests/gpiod-test.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 /*
diff --git a/tests/mockup/Makefile.am b/tests/mockup/Makefile.am
index af29a95..36cd397 100644
--- a/tests/mockup/Makefile.am
+++ b/tests/mockup/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 lib_LTLIBRARIES = libgpiomockup.la
diff --git a/tests/tests-bulk.c b/tests/tests-bulk.c
index d079003..ad08f2d 100644
--- a/tests/tests-bulk.c
+++ b/tests/tests-bulk.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tests/tests-chip.c b/tests/tests-chip.c
index 6713565..928dc49 100644
--- a/tests/tests-chip.c
+++ b/tests/tests-chip.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tests/tests-event.c b/tests/tests-event.c
index a213bf0..53d3e8c 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tests/tests-line.c b/tests/tests-line.c
index 8de1e6a..3985990 100644
--- a/tests/tests-line.c
+++ b/tests/tests-line.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tests/tests-misc.c b/tests/tests-misc.c
index a98329f..051ab81 100644
--- a/tests/tests-misc.c
+++ b/tests/tests-misc.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <string.h>
diff --git a/tools/Makefile.am b/tools/Makefile.am
index bbfcab6..4a13266 100644
--- a/tools/Makefile.am
+++ b/tools/Makefile.am
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 AM_CFLAGS = -I$(top_srcdir)/include/ -include $(top_builddir)/config.h
diff --git a/tools/gpio-tools-test b/tools/gpio-tools-test
index 7d42374..b3d19f5 100755
--- a/tools/gpio-tools-test
+++ b/tools/gpio-tools-test
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 MIN_KERNEL_VERSION="5.5.0"
diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
index ba0a904..b35a36e 100755
--- a/tools/gpio-tools-test.bats
+++ b/tools/gpio-tools-test.bats
@@ -1,5 +1,5 @@
 #!/usr/bin/env bats
-# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 # Simple test harness for the gpio-tools.
diff --git a/tools/gpiodetect.c b/tools/gpiodetect.c
index 1780f40..7a2015e 100644
--- a/tools/gpiodetect.c
+++ b/tools/gpiodetect.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
diff --git a/tools/gpiofind.c b/tools/gpiofind.c
index 45033d9..4936c4f 100644
--- a/tools/gpiofind.c
+++ b/tools/gpiofind.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
diff --git a/tools/gpioget.c b/tools/gpioget.c
index 0d8e286..527dc22 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <getopt.h>
diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index aba5bde..84588bc 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <dirent.h>
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index e9f2055..8bf2c70 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tools/gpioset.c b/tools/gpioset.c
index b34efea..7e9d88f 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 #include <errno.h>
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 98a4b9d..80087ee 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-License-Identifier: GPL-2.0-or-later
 // SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
 
 /* Common code for GPIO tools. */
diff --git a/tools/tools-common.h b/tools/tools-common.h
index 779dde5..5d5b505 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /* SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com> */
 
 #ifndef __GPIOD_TOOLS_COMMON_H__
-- 
2.29.1

