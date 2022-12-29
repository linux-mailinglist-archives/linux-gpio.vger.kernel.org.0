Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEFE658842
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiL2BJX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbiL2BJV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:09:21 -0500
X-Greylist: delayed 1069 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 28 Dec 2022 17:09:19 PST
Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC5113E10
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=faschingbauer.co.at; s=dkim11; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XK7fEfzmRS3x5wLkV3lMT4c3zLP/dbQn7JlYjP1WEoM=; b=NxL9GVxUJRI8j8QSWzgoMO1nD2
        M/RFrLeox4KIMaIA6bW00N3CdLiNKsG7S9NaHpy1brHV2skfK3inPZk7mDpTuGG1HvczH7jU7Av1w
        HeC+EZtSkCHccrVCf5+OCb07AFLgi/C5u0dUuSCchEF85R2zTjqEby19KdjhmRos0+8E=;
Received: from [89.144.193.89] (helo=fedora..)
        by mx08lb.world4you.com with esmtpa (Exim 4.94.2)
        (envelope-from <jf@faschingbauer.co.at>)
        id 1pAh8o-0005iW-NS; Thu, 29 Dec 2022 01:51:26 +0100
From:   Joerg Faschingbauer <jf@faschingbauer.co.at>
To:     linux-gpio@vger.kernel.org
Cc:     Joerg Faschingbauer <jf@faschingbauer.co.at>
Subject: [PATCH] bindings: python: fix out-of-source build
Date:   Thu, 29 Dec 2022 01:50:27 +0100
Message-Id: <20221229005027.505261-1-jf@faschingbauer.co.at>
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
 bindings/python/Makefile.am |  6 ++++--
 bindings/python/setup.py    | 23 ++++++++++++++---------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 3212a8f..6c2f99b 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -12,13 +12,15 @@ endif
 all-local:
 	GPIOD_VERSION_STRING=$(VERSION_STR) \
 	GPIOD_WITH_TESTS=$(BUILD_TESTS) \
-	$(PYTHON) setup.py build_ext --inplace \
+	GPIOD_SRCDIR=$(srcdir) \
+	$(PYTHON) $(srcdir)/setup.py build_ext --inplace \
 		--include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
 		--library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
 
 install-exec-local:
 	GPIOD_WITH_TESTS= \
-	$(PYTHON) setup.py install --prefix=$(prefix)
+	GPIOD_SRCDIR=$(srcdir) \
+	$(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
 
 SUBDIRS = gpiod
 
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index a951069..3ab01e1 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -2,17 +2,22 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from os import environ
+import os.path
 from setuptools import setup, Extension, find_packages
 
+srcdir = environ.get('GPIOD_SRCDIR', '.')
+def src(path):
+    return os.path.join(srcdir, path)
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
@@ -21,7 +26,7 @@ gpiod_ext = Extension(
 
 gpiosim_ext = Extension(
     "tests.gpiosim._ext",
-    sources=["tests/gpiosim/ext.c"],
+    sources=[src("tests/gpiosim/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     libraries=["gpiosim"],
     extra_compile_args=["-Wall", "-Wextra"],
@@ -29,7 +34,7 @@ gpiosim_ext = Extension(
 
 procname_ext = Extension(
     "tests.procname._ext",
-    sources=["tests/procname/ext.c"],
+    sources=[src("tests/procname/ext.c")],
     define_macros=[("_GNU_SOURCE", "1")],
     extra_compile_args=["-Wall", "-Wextra"],
 )
@@ -39,7 +44,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
     extensions.append(procname_ext)
 
-with open("gpiod/version.py", "r") as fd:
+with open(src("gpiod/version.py"), "r") as fd:
     exec(fd.read())
 
 setup(
-- 
2.37.3

