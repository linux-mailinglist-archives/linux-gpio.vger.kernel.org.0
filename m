Return-Path: <linux-gpio+bounces-13160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D485E9D3C76
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 14:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F0CB229EB
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 13:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B101A4F1B;
	Wed, 20 Nov 2024 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dKWTQBtC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BB1A0AE1
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732108724; cv=none; b=H2gKWDbJ52UbdFxzCoPpcoPAQ1UFHhVaQYpYnmOELiLfFqAY3Wh8wEuHXV2bHVqTry9IRHOG7+9x49RG0oD3+6h3KReo6azvvmlJGFaDuYgNpZbMK81uDN6FGo7jIOQqPXQMYoOO3f+c7GvxR2g0bOVBLr+tFMtpV9Spr+cYXUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732108724; c=relaxed/simple;
	bh=3cxx+Wru9EG8SIvx74WC75dbc3xijjQmwhYe5O+ee0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1EqoBN2DaRwQ0+b/uC34KPdGcg19buPl4EeuZTssXDYWI93Be3a0Ma0UuJ/wlFw5PHHTPMa0DAZ6h2mWBUpSvf5oAARAGC4POnCa2bxsHfg6hTJKNN4vEcx31OdquUTtbhECPu5fp0tUS1hQR/g4vvQFCZ0Ulxljga8FtUJHkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dKWTQBtC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38241435528so2685018f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732108721; x=1732713521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D54gqweBguAPuyzvfVpbw7QBvwFgz+QA1eIuUgV45y0=;
        b=dKWTQBtCqspmBi+bftTj4PSFznuHZVACJRxCD95HhziAnTf2xDirM9IOL2Fn7LLp+x
         IrTkysyM/xoswqpgIeyTmeww6P520kgks26kCBBCpkNjhPcVkvZi9qSFLRcvv6wfzioJ
         PKDJ1AhDoO87BbHLo4DbxhQ2kJffpVDq8Bj6VfEBCcEbCBFtIc/2XOUlyOMV52o7Goto
         fDh3CiC2d4+hO+du6R9VCeHf7JwoOXYYg48oQIGCrcJbmvl4nfmg4HMZt/pS9A1RXcuC
         75tDLD6g7h/I+4jwPr5ct6erlJGAAXSqnCYOwr3C+ofVyGyB+o9giARLMhOMsD+tm24Q
         +6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732108721; x=1732713521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D54gqweBguAPuyzvfVpbw7QBvwFgz+QA1eIuUgV45y0=;
        b=BEeJynlzOhM4qeaZqOa6hIAKcUormR69ZovNgH4aJvfKxQgJB6bxcdGhpgP0Of0vXe
         V7FyyEFsN6q41jBxpUAlErchq3G/byWF0EQYjJbpOkgiFTuNjaHs3fPzt0SCAlTZ95bP
         iR37xUVhoQ2dRPlK1/jP3kRn/8mZLBdIAuZl8UY8Pv5yJs5gdhk2m4x1UEoRiFhkOtCu
         nAkwHdqqHJt/VBbjNDfUBdqVB2cZxxcdPWh0sx1aQupsM0TdnKTLU44lRJH97nFRXp++
         ypINdcNCxorw3vtyNSpQUybmvjgXUKnleMCVgCuxxJgpN0S9UIE206JZYGfV7+6YUgP3
         /JMA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvWE/P7KyU8QBLjbdezHm7hVrLqn0sWwCFPtC/EdFtY55H+Z40K1S583sonyjZ64SgPXxJTEMKt6s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/l9Lsjc7PRoPhJQ1VmioWV/nZpD7INHaHGcJdkJmoHh+2smP/
	VqzgPwvtU8HbV/CEaEnsxV9dWty4xUf/8Wtfl+EBm5CFTYTBgMbvtSEAsoeISC4=
X-Google-Smtp-Source: AGHT+IFlGSBeRjLddn4vwOJwbeCWj+eaUD+qmSpFGrVk2IvCONywi4ga60jJ9yQSHBQPq1MoW7oepA==
X-Received: by 2002:a05:6000:154e:b0:382:22f4:7773 with SMTP id ffacd0b85a97d-38254a83f8fmr2488761f8f.0.1732108720776;
        Wed, 20 Nov 2024 05:18:40 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e93c:902f:82f5:7ce8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee48sm2040188f8f.98.2024.11.20.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:18:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 14:18:19 +0100
Subject: [PATCH 2/3] bindings: python: tests: rename procname to system
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-drop-distutils-v1-2-7498e8b3babe@linaro.org>
References: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
In-Reply-To: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Phil Howard <phil@gadgetoid.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5074;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UIBtCIoU20n9ZDZQpvZ1ig2G4R5kAS2Kg3Q8Dkp3GW0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnPeGtJwaMukwt2nmSQbXd4zArTeJSkHKQitJj0
 SK5WHGR29+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZz3hrQAKCRARpy6gFHHX
 cuVhD/4kzDtvbYzowCZCe87ouEJisqOpuoUKjx/NhajOhaP6Xfy2w+uR6NIHlgG+R42eFiW5Bt3
 19k87VHkvjm1/85rF3bqWPnCD8GX3SnYvWqY1+xNA8CdmfoZUyAu10XPU7YwG8TWCcLj+Nkl5l4
 bgj/GyIbwkOzHoMij1sk0e216AyP6DE2gPGAIUfiB3uDolVfJq3sMY8Khc9o6+5/0lc2ydfjZe+
 n83OSWOTBNGtJrBBeO5aVoNN25+HmEB/4Fu/EWXRU1zGZVciFTdhXcu0GmaEI5fS5FJ7ZIdqaFh
 nGHt0igIlM6bYwrwl0GnxEBtzy1coPeLb5Xjjyto70lwRZDkgF3BxrdvbOJPuq4eO2HTRQ8F/JD
 ugmwXjWIqcOd/OZEIsxMiqvOwtc5DUYtSPjL8+G93VlhAmbWpYhN/X9lOgH7MlU9dSQMKjCxQNP
 YMPPsAg4Xapw3Rhc85jWcHS/Tv4T1KWUr4ovrmwe9FjtqwYA9HpwbybdMuF3H37Dg8c0QWL87C/
 ryFLZcnaTxD6wXjurgWltX3PZjxMcKxJfODFnc1wCNHDTdjiYgU2lOAghYNXTKmH/l/AEtVUCYC
 /htKHJNKfmjAO6qS+Lbi5a++yXSFQGz10F/a+XEeWF3wI0n7k+GGe0MqZgTPVWqH8Rj7hCN3lRf
 8l2HVAqItZHHicA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We'll be extending the functionality of that C extension with other
OS-level helpers so change its name to 'system'.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/MANIFEST.in                            |  2 +-
 bindings/python/build_tests.py                         | 10 +++++-----
 bindings/python/tests/Makefile.am                      |  2 +-
 bindings/python/tests/__main__.py                      |  4 ++--
 bindings/python/tests/{procname => system}/Makefile.am |  0
 bindings/python/tests/{procname => system}/__init__.py |  0
 bindings/python/tests/{procname => system}/_ext.pyi    |  0
 bindings/python/tests/{procname => system}/ext.c       |  2 +-
 configure.ac                                           |  2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index f3a1ee8..dc7daee 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -13,7 +13,7 @@ recursive-include gpiod/ext *.c
 recursive-include gpiod/ext *.h
 
 recursive-include tests/gpiosim *.c
-recursive-include tests/procname *.c
+recursive-include tests/system *.c
 
 recursive-include lib *.c
 recursive-include lib *.h
diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
index 1760257..84cedfc 100644
--- a/bindings/python/build_tests.py
+++ b/bindings/python/build_tests.py
@@ -11,7 +11,7 @@ polluted with artefacts in build/
 Builds:
 
     tests/gpiosim/_ext.<target>.so
-    tests/procname/_ext.<target>.so
+    tests/system/_ext.<target>.so
 
 """
 
@@ -61,9 +61,9 @@ gpiosim_ext = Extension(
     ],
 )
 
-procname_ext = Extension(
-    "tests.procname._ext",
-    sources=["tests/procname/ext.c"],
+system_ext = Extension(
+    "tests.system._ext",
+    sources=["tests/system/ext.c"],
     define_macros=[("_GNU_SOURCE", "1")],
     extra_compile_args=["-Wall", "-Wextra"],
 )
@@ -71,7 +71,7 @@ procname_ext = Extension(
 dist = Distribution(
     {
         "name": "gpiod",
-        "ext_modules": [gpiosim_ext, procname_ext, gpiod_ext],
+        "ext_modules": [gpiosim_ext, system_ext, gpiod_ext],
         "version": __version__,
         "platforms": ["linux"],
     }
diff --git a/bindings/python/tests/Makefile.am b/bindings/python/tests/Makefile.am
index 3118d5f..d6e3ea3 100644
--- a/bindings/python/tests/Makefile.am
+++ b/bindings/python/tests/Makefile.am
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-SUBDIRS = gpiosim procname
+SUBDIRS = gpiosim system
 
 EXTRA_DIST = \
 	helpers.py \
diff --git a/bindings/python/tests/__main__.py b/bindings/python/tests/__main__.py
index 8b4260d..318e0df 100644
--- a/bindings/python/tests/__main__.py
+++ b/bindings/python/tests/__main__.py
@@ -4,7 +4,7 @@
 
 import unittest
 
-from . import procname
+from .system import set_process_name
 from .tests_chip import *
 from .tests_chip_info import *
 from .tests_edge_event import *
@@ -15,6 +15,6 @@ from .tests_line_request import *
 from .tests_line_settings import *
 from .tests_module import *
 
-procname.set_process_name("python-gpiod")
+set_process_name("python-gpiod")
 
 unittest.main()
diff --git a/bindings/python/tests/procname/Makefile.am b/bindings/python/tests/system/Makefile.am
similarity index 100%
rename from bindings/python/tests/procname/Makefile.am
rename to bindings/python/tests/system/Makefile.am
diff --git a/bindings/python/tests/procname/__init__.py b/bindings/python/tests/system/__init__.py
similarity index 100%
rename from bindings/python/tests/procname/__init__.py
rename to bindings/python/tests/system/__init__.py
diff --git a/bindings/python/tests/procname/_ext.pyi b/bindings/python/tests/system/_ext.pyi
similarity index 100%
rename from bindings/python/tests/procname/_ext.pyi
rename to bindings/python/tests/system/_ext.pyi
diff --git a/bindings/python/tests/procname/ext.c b/bindings/python/tests/system/ext.c
similarity index 96%
rename from bindings/python/tests/procname/ext.c
rename to bindings/python/tests/system/ext.c
index bf7d2fe..e7c1cc4 100644
--- a/bindings/python/tests/procname/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -32,7 +32,7 @@ static PyMethodDef module_methods[] = {
 
 static PyModuleDef module_def = {
 	PyModuleDef_HEAD_INIT,
-	.m_name = "procname._ext",
+	.m_name = "system._ext",
 	.m_methods = module_methods,
 };
 
diff --git a/configure.ac b/configure.ac
index 97fc83f..78a6670 100644
--- a/configure.ac
+++ b/configure.ac
@@ -371,7 +371,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
 		 bindings/python/tests/gpiosim/Makefile
-		 bindings/python/tests/procname/Makefile
+		 bindings/python/tests/system/Makefile
 		 bindings/rust/libgpiod-sys/src/Makefile
 		 bindings/rust/libgpiod-sys/Makefile
 		 bindings/rust/libgpiod/src/Makefile

-- 
2.45.2


