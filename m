Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B097963D5D1
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbiK3MnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbiK3Mmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:50 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4BD192B7
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:43 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bx10so14815377wrb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS1RSMcjxNIROgEYTabnYK4HYZJEn+yX7vqXXoCxOzw=;
        b=Mas3JZLdNro7YFPk5ri+dPtvTR7/cVaiOX6nmhJrjB09gQ0C7taNJ0gv4rZmUgEs8V
         Zceks3Hxp15YlYuZJC5GW8wtWttiYS5HVvkFV2O6elgfG8UixmraCYteNYKJc8fefpw4
         ANznqbnuz/CglXPpXubFzOYDDSJcsr5pgTkPkT6W1jfXwYLGQI7IndiGfdHYiaujkCHx
         4f00mdPVrw8WkTp1HzHzymrghg0jxpCNHj3ERiL2lwlVUAct52Tad1vCYTf6PVffp92v
         plzPTKD3ITF6FDD6uVsRWdY0g6A2YdmXGWCqrH0tpFe0NRgX3iTNCcUSRaZGAT0PFzRX
         xRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PS1RSMcjxNIROgEYTabnYK4HYZJEn+yX7vqXXoCxOzw=;
        b=tcQ3MaBd+UO2VjDX8ELXJqEr77pcVwP8VzziGv+681cIIWe8UFuYXVD351tlKrH7cp
         Wk+FKzAnGyWdiEHHhRKFfY4/1aFJ2+KEFfzVtjEu2YYnSJ7fGXzolMlK9rzPAQvu+bYI
         0tUMl/u6Xb3J7BTzZGPsHIWIRO1cIN7N9JSJjpnBB3QESKeB7t7mdCRdWox60M80vQD2
         s3Py7yo4x6yMeHZ62Ua3JBR/VqWONhZ3pQdKngr7eZBpbjMPqvUX9jk8j/O65lqeDlZq
         ovhQU7BLExWwgg/hcyj/9wyrJT20aYIiLEQCHp4bINtmf0KOIqChBkazp4UNft0bhirk
         0doQ==
X-Gm-Message-State: ANoB5pn9dRLxsVK9ThSUSlG51hzbulYCDu6S8K4XbNRWSQaCuPgi9pra
        Tsjyuo/0LwIS2/3NAevX9vSXzQ==
X-Google-Smtp-Source: AA0mqf7JuyTkydRYZ56STp0hlJZYrVclFsNR6uCl0bshRlPG2EKnVL4UL7kjURZ+RBolR+IGuuxw3Q==
X-Received: by 2002:a5d:5955:0:b0:241:553e:5040 with SMTP id e21-20020a5d5955000000b00241553e5040mr31736137wri.578.1669812162971;
        Wed, 30 Nov 2022 04:42:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 09/11] bindings: python: decouple the version of the bindings from libgpiod API version
Date:   Wed, 30 Nov 2022 13:42:29 +0100
Message-Id: <20221130124231.1054001-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221130124231.1054001-1-brgl@bgdev.pl>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
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

Python bindings now have their own setup.py script and can be built
separately from the rest of the code-base. Let's decouple the python
package version from libgpiod API (but let's keep a module attribute
containing the API version) by introducing a version.py submodule that
can be executed by the setup.py script. This way we have a single
canonical place defining the version number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/gpiod/__init__.py     |  3 ++-
 bindings/python/gpiod/ext/module.c    |  2 +-
 bindings/python/gpiod/version.py      |  5 +++++
 bindings/python/setup.py              | 10 +++-------
 bindings/python/tests/tests_module.py | 15 ++++++++-------
 5 files changed, 19 insertions(+), 16 deletions(-)
 create mode 100644 bindings/python/gpiod/version.py

diff --git a/bindings/python/gpiod/__init__.py b/bindings/python/gpiod/__init__.py
index 7854cfd..9cbb8df 100644
--- a/bindings/python/gpiod/__init__.py
+++ b/bindings/python/gpiod/__init__.py
@@ -16,8 +16,9 @@ from .exception import ChipClosedError, RequestReleasedError
 from .info_event import InfoEvent
 from .line_request import LineRequest
 from .line_settings import LineSettings
+from .version import __version__
 
-__version__ = _ext.__version__
+api_version = _ext.api_version
 
 
 def is_gpiochip_device(path: str) -> bool:
diff --git a/bindings/python/gpiod/ext/module.c b/bindings/python/gpiod/ext/module.c
index 12fb92c..8b5a032 100644
--- a/bindings/python/gpiod/ext/module.c
+++ b/bindings/python/gpiod/ext/module.c
@@ -165,7 +165,7 @@ PyMODINIT_FUNC PyInit__ext(void)
 	if (!module)
 		return NULL;
 
-	ret = PyModule_AddStringConstant(module, "__version__",
+	ret = PyModule_AddStringConstant(module, "api_version",
 					 gpiod_version_string());
 	if (ret) {
 		Py_DECREF(module);
diff --git a/bindings/python/gpiod/version.py b/bindings/python/gpiod/version.py
new file mode 100644
index 0000000..c650969
--- /dev/null
+++ b/bindings/python/gpiod/version.py
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: LGPL-2.1-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+__version__ = "2.0.0"
diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index ec8f99d..2a8481c 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -32,16 +32,12 @@ with_tests = bool(environ["GPIOD_WITH_TESTS"])
 if with_tests:
     extensions.append(gpiosim_ext)
 
-# FIXME Find a better way to get the version
-version = None
-try:
-    version = environ["GPIOD_VERSION_STR"]
-except KeyError:
-    pass
+with open("gpiod/version.py", "r") as fd:
+    exec(fd.read())
 
 setup(
     name="gpiod",
     packages=find_packages(include=["gpiod"]),
     ext_modules=extensions,
-    version=version,
+    version=__version__,
 )
diff --git a/bindings/python/tests/tests_module.py b/bindings/python/tests/tests_module.py
index 4eeae76..de56356 100644
--- a/bindings/python/tests/tests_module.py
+++ b/bindings/python/tests/tests_module.py
@@ -3,7 +3,6 @@
 
 import gpiod
 import os
-import re
 import unittest
 
 from . import gpiosim
@@ -51,9 +50,11 @@ class IsGPIOChip(TestCase):
 
 
 class VersionString(TestCase):
-    def test_version_string(self):
-        self.assertTrue(
-            re.match(
-                "^[0-9][1-9]?\\.[0-9][1-9]?([\\.0-9]?|\\-devel)$", gpiod.__version__
-            )
-        )
+
+    VERSION_PATTERN = "^[0-9][1-9]?\\.[0-9][1-9]?(\\.[0-9]?|\\-devel)$"
+
+    def test_api_version_string(self):
+        self.assertRegex(gpiod.api_version, VersionString.VERSION_PATTERN)
+
+    def test_module_version(self):
+        self.assertRegex(gpiod.__version__, VersionString.VERSION_PATTERN)
-- 
2.37.2

