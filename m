Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A42645640
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 10:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbiLGJQD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 04:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLGJPj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 04:15:39 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F327131EC9
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 01:14:17 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so589129wmb.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvnZcmK1vi8Hmvv8dqBxPvVPaolLFr5KBap5SJt/OJE=;
        b=CIwGRLYdIfF6hA0YT1PKEDo15OHta3gXMDSJGj7R7lA/KWYAzL1fpuE8hP2tKGWg49
         JWmastfY1jACKNMPU0HSKSHBX4Bc25jRPLitfddnyGicKXm+Mz3ADDGaGPaBjqHlvnDy
         3yL2gIJ3Y1k4icHdpcQ0syvzKsuO4sFWqYq4EGJzum7ZlTpZ0aItlO/ixm1PxJIyB+pS
         BaMM7+4wSltSj2pupljnxrcSs28+D9AgaUCcxr1oHAy61Ud/rDdeEXiw26hXnxf+F95O
         3YD0IBPtjZMhfOufZauPwACPjqFJ9qtqGlJxV5VFUW8C5gA+sl18UBCYvp9FEwKrNyeG
         sH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvnZcmK1vi8Hmvv8dqBxPvVPaolLFr5KBap5SJt/OJE=;
        b=rragbbFyI3r6eG4PB33+wfKG1ftg0jiqqVfTMl1VfXf8joUDDks1wyRf268zAFI1Em
         3IEkg+xUOYLC4eTtzZyYtoz2ApkF/sGzQAtJ8fgSwHMuNUZ4vkLIt39h8ihTvDcUc4lH
         CLBJCvp+bLDzzrgDc05uKlKb73Zo09b3kZuhsi7ZPrde7+EraFa0+wsRSD+zCeFv2cNl
         SE7L3kK/5HljTIK+Ize0vo0JAOywFqu/206bWmx/KlxyUUdX8H2pTUlt1Gbzp4vM5kX0
         wGHtyqLFbI+cFS9QOLxPB5/xIZMUEjb2fxRPxWBM6gD8ED7ERQXGcrRHcEPZVeR5d0cU
         rZ5w==
X-Gm-Message-State: ANoB5plbfXoXIeNpBsJlI3Nq2aUFSLJBk+04lMCicXEkMZ+lRwb3Wr9O
        mx3d+lYIV0A4nCIsodhE2bgEiA==
X-Google-Smtp-Source: AA0mqf4cV65bWMwJf109W6fWxURWQsHv7c4PPWkyV41V77TPBjVU4mM64u+WMzEvPMVcUIucPjFnWQ==
X-Received: by 2002:a05:600c:358a:b0:3d0:8722:a143 with SMTP id p10-20020a05600c358a00b003d08722a143mr541398wmq.27.1670404456449;
        Wed, 07 Dec 2022 01:14:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6baf:a66c:194c:fe07])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600c47ca00b003c6b70a4d69sm944388wmo.42.2022.12.07.01.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:14:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] bindings: python: tests: set the process name
Date:   Wed,  7 Dec 2022 10:14:13 +0100
Message-Id: <20221207091413.61616-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221207091413.61616-1-brgl@bgdev.pl>
References: <20221207091413.61616-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

When we run the test suite by calling the __main__ function of the module,
the name of the process as visible in the system becomes "python". Let's
set it to "python-gpiod" before running the tests. This way gpiosim will
name its configfs attributes appropriately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/setup.py                   |  8 +++++
 bindings/python/tests/Makefile.am          |  2 +-
 bindings/python/tests/__main__.py          |  4 +++
 bindings/python/tests/procname/Makefile.am |  6 ++++
 bindings/python/tests/procname/__init__.py |  4 +++
 bindings/python/tests/procname/ext.c       | 42 ++++++++++++++++++++++
 configure.ac                               |  1 +
 7 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 bindings/python/tests/procname/Makefile.am
 create mode 100644 bindings/python/tests/procname/__init__.py
 create mode 100644 bindings/python/tests/procname/ext.c

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 7ad5de3..a951069 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -27,9 +27,17 @@ gpiosim_ext = Extension(
     extra_compile_args=["-Wall", "-Wextra"],
 )
 
+procname_ext = Extension(
+    "tests.procname._ext",
+    sources=["tests/procname/ext.c"],
+    define_macros=[("_GNU_SOURCE", "1")],
+    extra_compile_args=["-Wall", "-Wextra"],
+)
+
 extensions = [gpiod_ext]
 if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
     extensions.append(gpiosim_ext)
+    extensions.append(procname_ext)
 
 with open("gpiod/version.py", "r") as fd:
     exec(fd.read())
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index 7dcdebb..c89241e 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = gpiosim
+SUBDIRS = gpiosim procname
 
 EXTRA_DIST = \
 	helpers.py \
diff --git a/bindings/python/tests/__main__.py b/bindings/python/tests/__main__.py
index b5d7f0a..cc39c29 100644
--- a/bindings/python/tests/__main__.py
+++ b/bindings/python/tests/__main__.py
@@ -13,4 +13,8 @@ from .tests_line_settings import *
 from .tests_module import *
 from .tests_line_request import *
 
+from . import procname
+
+procname.set_process_name("python-gpiod")
+
 unittest.main()
diff --git a/bindings/python/tests/procname/Makefile.am b/bindings/python/tests/procname/Makefile.am
new file mode 100644
index 0000000..c4a8fd5
--- /dev/null
+++ b/bindings/python/tests/procname/Makefile.am
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+EXTRA_DIST = \
+	ext.c \
+	__init__.py
diff --git a/bindings/python/tests/procname/__init__.py b/bindings/python/tests/procname/__init__.py
new file mode 100644
index 0000000..af6abdd
--- /dev/null
+++ b/bindings/python/tests/procname/__init__.py
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+from ._ext import set_process_name
diff --git a/bindings/python/tests/procname/ext.c b/bindings/python/tests/procname/ext.c
new file mode 100644
index 0000000..bf7d2fe
--- /dev/null
+++ b/bindings/python/tests/procname/ext.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+// SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+
+#include <Python.h>
+#include <sys/prctl.h>
+
+static PyObject *
+module_set_process_name(PyObject *Py_UNUSED(self), PyObject *args)
+{
+	const char *name;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "s", &name);
+	if (!ret)
+		return NULL;
+
+	ret = prctl(PR_SET_NAME, name);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	Py_RETURN_NONE;
+}
+
+static PyMethodDef module_methods[] = {
+	{
+		.ml_name = "set_process_name",
+		.ml_meth = (PyCFunction)module_set_process_name,
+		.ml_flags = METH_VARARGS,
+	},
+	{ }
+};
+
+static PyModuleDef module_def = {
+	PyModuleDef_HEAD_INIT,
+	.m_name = "procname._ext",
+	.m_methods = module_methods,
+};
+
+PyMODINIT_FUNC PyInit__ext(void)
+{
+	return PyModule_Create(&module_def);
+}
diff --git a/configure.ac b/configure.ac
index 07706f0..1c8f192 100644
--- a/configure.ac
+++ b/configure.ac
@@ -268,6 +268,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
 		 bindings/python/tests/gpiosim/Makefile
+		 bindings/python/tests/procname/Makefile
 		 bindings/rust/libgpiod-sys/src/Makefile
 		 bindings/rust/libgpiod-sys/Makefile
 		 bindings/rust/libgpiod/src/Makefile
-- 
2.37.2

