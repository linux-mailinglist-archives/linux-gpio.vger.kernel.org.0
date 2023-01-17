Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A83F66E0E1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 15:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjAQOgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 09:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbjAQOgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 09:36:49 -0500
Received: from mx14lb.world4you.com (mx14lb.world4you.com [81.19.149.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D89125B0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 06:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=faschingbauer.co.at; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tBNceCHKF8svQDW5WioOkOISxn6VpgdVJGhf5Zc20Qs=; b=j+FQwN0GS+zYNJhL9ng/kePC75
        e8Wi94l6PeeQ1z98oYCyHg09VAUIVdEUvp8PdeOFI2sXq8cxgJTfMNugpzEREFTbmEUkJ3wnCSQw2
        MaB5BBaA2W5vGG3CtRP3iePswrcuSYg5HbsmIus6EPG3S/sALOg0Sj0t7Uk5G2IOgaNE=;
Received: from [213.225.9.96] (helo=fedora..)
        by mx14lb.world4you.com with esmtpa (Exim 4.94.2)
        (envelope-from <jf@faschingbauer.co.at>)
        id 1pHn4v-00057Y-2L; Tue, 17 Jan 2023 15:36:45 +0100
From:   jf@faschingbauer.co.at
To:     bartosz.golaszewski@linaro.org
Cc:     linux-gpio@vger.kernel.org,
        Joerg Faschingbauer <jf@faschingbauer.co.at>
Subject: [PATCH v2 1/1] bindings: python: fix out-of-source build
Date:   Tue, 17 Jan 2023 15:36:39 +0100
Message-Id: <20230117143639.217018-1-jf@faschingbauer.co.at>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joerg Faschingbauer <jf@faschingbauer.co.at>

Makefile.am delegates the build of the python extension to its
setup.py file, which references the extension .c files relative to the
source dir. This makes it impossible to build in a directory that is
different from the source directory (for example, for PC and ARM but
from the same source).

* Modify Makefile.am to pass automake's $(srcdir) into setup.py via
  GPIOD_SRCDIR environment variable.
* Modify setup.py to pick up .c files relative from that directory.

Signed-off-by: Joerg Faschingbauer <jf@faschingbauer.co.at>
---
 bindings/python/Makefile.am |  4 ++--
 bindings/python/setup.py    | 23 +++++++++++++----------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 3212a8f..9fb2e95 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -12,13 +12,13 @@ endif
 all-local:
 	GPIOD_VERSION_STRING=$(VERSION_STR) \
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) setup.py build_ext --inplace \
+	$(PYTHON) $(srcdir)/setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-	$(PYTHON) setup.py install --prefix=$(prefix)
+	$(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
 
 SUBDIRS = gpiod
 
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index a951069..e748295 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,18 +1,21 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from os import environ
+from os import environ, path
 from setuptools import setup, Extension, find_packages
 
+def src(filename):
+    return path.join(path.dirname(__file__), filename)
+
 gpiod_ext = Extension(
     "gpiod._ext",
     sources=[
-        "gpiod/ext/chip.c",
-        "gpiod/ext/common.c",
-        "gpiod/ext/line-config.c",
-        "gpiod/ext/line-settings.c",
-        "gpiod/ext/module.c",
-        "gpiod/ext/request.c",
+        src("gpiod/ext/chip.c"),
+        src("gpiod/ext/common.c"),
+        src("gpiod/ext/line-config.c"),
+        src("gpiod/ext/line-settings.c"),
+        src("gpiod/ext/module.c"),
+        src("gpiod/ext/request.c"),
     ],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiod"],
@@ -21,7 +24,7 @@ gpiod_ext = Extension(
 
 gpiosim_ext = Extension(
     "tests.gpiosim._ext",
-    sources=["tests/gpiosim/ext.c"],
+    sources=[src("tests/gpiosim/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiosim"],
     extra_compile_args=["-Wall", "-Wextra"],
@@ -29,7 +32,7 @@ gpiosim_ext = Extension(
 
 procname_ext = Extension(
     "tests.procname._ext",
-    sources=["tests/procname/ext.c"],
+    sources=[src("tests/procname/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     extra_compile_args=["-Wall", "-Wextra"],
 )
@@ -39,7 +42,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
+with open(src("gpiod/version.py"), "r") as fd:
     exec(fd.read())
 
 setup(
-- 
2.38.1

