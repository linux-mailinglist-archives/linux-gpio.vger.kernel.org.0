Return-Path: <linux-gpio+bounces-13161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DF9D3C77
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 14:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71C78B22D42
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 13:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2F41A4F20;
	Wed, 20 Nov 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U/XpkS6E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6752AD00
	for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732108725; cv=none; b=oN7mD8ec1cUjF9wVrcHdXFmiwY/IhUGxzSln5WR6OJI4b5Q/l56znYEUn0xHU9Aprhb2ZgfI2hNGJnBuDM6WCussxL6Wh5TNVyMpV5Za2h4+2w0H4o0qp4n1EF9/wuI6x9/ZYBkiiYVT5xkTxb0YDyPuuygHZWzFFnMgGlIDrac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732108725; c=relaxed/simple;
	bh=62YQGSyI89J7vC2iJB9r9HU/zhCbSQ/RnJOg54pUxJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ApBNf0+M4EchdpFZLXrtOsYusDXrX2dbNauYT+N+ST+7he+uKWwiTbrC1lAJ8m+w+fO5qHk3PT7vAyz6jN/mRJ6S/gl/Xm4nvX8ydZT7qVEtqrUDDr2lK75FKNE8XYD+WhI8aQId7IBXArsMrsTUsfGDgsV42uCPK+U3xNuSwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=U/XpkS6E; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3824aef833bso2270298f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2024 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732108722; x=1732713522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/JBQicLHaOhD1kC5E6qUZNFZFyAgxZrSTsNJDYxERw=;
        b=U/XpkS6EEUT8/nJCSQcemDolNu2o029a1k4LAn12Yelaw40JwPYqzA5CM301MLm4L1
         bgRWA0YFcpi7HyBUl4b9kXPd1spNT6+C0NtvBgDfyvH9Sobi6kTo9e2m/Fz7TOwcjp+S
         OYgSAfkFQFOVcFZUPbjbh2fvZoVp1Dk07Qvt5qEs9ZnQjORFW1R9TzNuWc6PmYmJdl65
         GbIPM5aAQ/lzF1imctgq5aKuZA0Gzcl5Yw9EuAbaOGw7FJfRZJyJ8IsH2RpwBgdOYS5Q
         Nf69ZahrMnTK5r2KFpnRTc9o0RoFYln6brLFzQAvol0EqBB/kNyFT6ql6pHhyzdYdnhs
         uV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732108722; x=1732713522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/JBQicLHaOhD1kC5E6qUZNFZFyAgxZrSTsNJDYxERw=;
        b=NRPngUP2xQNn7AbJbCk2N1lfz/qDlwoqs0jPEd3qxCibPKdzugknNn1VrYdOsS5Ucz
         pz88Jodqgae6+YUA9Ej8UgGfjRx8gxt2UYVbnOnJ3Ru5vdssSGM1PBJrvTgblatXIcVf
         RQFRTW6idvqqb9sleTNkYv0ZF8L673YIKZLC/FmEDEhnS/4NksqzyfKcZsg+tJVHq8EY
         JyVeOETDGBCLHZXzOj6CVp4UMwkBf+sj3MLZCzLpHqUL85zp9ZTaNqMRHLppY1q+LGlt
         W9ba3DAJyesM2A3NcrUaBUMXOecdv3/n7nLSPImnKKuhyrm9eVfUNP03QWc12Z6NVJBf
         DL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPHFcbbuE/W8t2r2ajaDuga8EeAVfqc2jSD6GM55XuoXvQ/Ve4NdVWHHSj4svIrz1tcjvJlkSunP6Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsEia6a6kZj8JpyQ/Fhj5BsQ3G1M+sLTBYEXZjatnOJ5O5XEs
	voNbs8zjbLegPrUJXuEBpCjzjHG5WDIJRCIyCyzMgCuAZ0rIon5CUk1DyvdNPM+8Ywbu72itsuw
	m
X-Google-Smtp-Source: AGHT+IHibnAAxmEUnohymQfPjeIMUuf690kAUFBypPIh9MUANto6qsLFzh074hnBiTnLt3Nff2tcLg==
X-Received: by 2002:a05:6000:1541:b0:382:5177:3a4f with SMTP id ffacd0b85a97d-38254b21313mr2163684f8f.49.1732108721694;
        Wed, 20 Nov 2024 05:18:41 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e93c:902f:82f5:7ce8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ee48sm2040188f8f.98.2024.11.20.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:18:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Nov 2024 14:18:20 +0100
Subject: [PATCH 3/3] bindings: python: tests: provide and use
 system.check_kernel_version()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-drop-distutils-v1-3-7498e8b3babe@linaro.org>
References: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
In-Reply-To: <20241120-drop-distutils-v1-0-7498e8b3babe@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Phil Howard <phil@gadgetoid.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4754;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kO26J6grBHQ7Skc0uLR5oJOBXkTROWyWPkuR+0//ilg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnPeGum5owo1EshfxUlyJ/Rp4MDoBA9+GPFcSqZ
 yMI2YuVzACJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZz3hrgAKCRARpy6gFHHX
 ciruD/4kfwvjdQlGvAjdc4rV4DHsrUnXhoE/4ve7X313wPJwjsqKw+/kwGhJsnkj09dlqjreQdh
 FZX9tQ77H9OvSkjOjb0/qSaRr3Jesnj89A/Rhh0JaYe/I1pRmVzgG32AcZGHm8DEEmKe+aTiQhg
 3zJfG2Y+FrtTNhY7v+7pE1ov1Y9nqsnVgDScknHGinKrrw9/KM/IramJm9OawV2UTnCZ9ZPl1Qj
 ocUPzGG7/565OJEqhAZOHtA3Oj048B7Xyw8zGaCsbSfPpRDn8qdI9AlhZeyzJs51ux+2UjVPIVC
 ETbUvhergSTrUN3LPKty/Wx4VGze7PlXtM6bSPM+NXoyGWWUlaTbjMI4WHk1hXHyQvAPWYaBd7y
 d0wsY+mq9YWRoRCHNxs1rvT2FsQnQumqAe/zC4Y4ZeIOpix/S1C6agojhjPCP5ArLxgPf/VfZfo
 /hA9pyyzqzOsfE/5ckvvuRBqsaGd99NMdDJz4Z2rkBreC+sDXedjiitGr7q3C1rGkW1V1STrWcs
 8qk+phA+43NbvJrwFnBDygE4fuZV9mXrRKDji5g6gDQZd2FiWZ3yC1jWqfOOYIUjSzOw/+ZXjPc
 7FETHWNBbl6Et+eBC4aNOPG/rF0PjbDpue7x9dgJnfo2XykUQroi0AAOWYU6XW3d6YhsJJ8pe+Y
 MFtcO2dPDgqvf7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We claim that libgpiod python bindings have no dependencies other than
the python standard library but this is not true - the tests do depend
on deprecated distutils for kernel version parsing.

As distutils is deprecated, the recommended improvement is to use the
Version class from packaging.version but this would too entail pulling
in an external module.

Let's instead implement the kernel version check in C using uname() and
put it into the tests.system extension. This allows us to entirely drop
the distutils import.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/__init__.py        | 11 +++++-----
 bindings/python/tests/system/__init__.py |  4 ++--
 bindings/python/tests/system/_ext.pyi    |  1 +
 bindings/python/tests/system/ext.c       | 37 ++++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/bindings/python/tests/__init__.py b/bindings/python/tests/__init__.py
index a0f22ae..3eb13f7 100644
--- a/bindings/python/tests/__init__.py
+++ b/bindings/python/tests/__init__.py
@@ -1,13 +1,12 @@
 # SPDX-License-Identifier: LGPL-2.1-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+# SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
-import os
-from distutils.version import LooseVersion
+from .system import check_kernel_version
 
-required_kernel_version = LooseVersion("5.19.0")
-current_version = LooseVersion(os.uname().release.split("-")[0])
+_required_kernel_version = (5, 19, 0)
 
-if current_version < required_kernel_version:
+if not check_kernel_version(*_required_kernel_version):
     raise NotImplementedError(
-        f"linux kernel version must be at least {required_kernel_version} - got {current_version}"
+        f"linux kernel version must be at least v{'.'.join([str(i) for i in _required_kernel_version])}"
     )
diff --git a/bindings/python/tests/system/__init__.py b/bindings/python/tests/system/__init__.py
index 436ff40..cba9b92 100644
--- a/bindings/python/tests/system/__init__.py
+++ b/bindings/python/tests/system/__init__.py
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
-from ._ext import set_process_name
+from ._ext import check_kernel_version, set_process_name
 
-__all__ = ["set_process_name"]
+__all__ = ["check_kernel_version", "set_process_name"]
diff --git a/bindings/python/tests/system/_ext.pyi b/bindings/python/tests/system/_ext.pyi
index df8bb15..0a19d6c 100644
--- a/bindings/python/tests/system/_ext.pyi
+++ b/bindings/python/tests/system/_ext.pyi
@@ -2,3 +2,4 @@
 # SPDX-FileCopyrightText: 2024 Vincent Fazio <vfazio@gmail.com>
 
 def set_process_name(name: str) -> None: ...
+def check_kernel_version(major: int, minor: int, release: int) -> bool: ...
diff --git a/bindings/python/tests/system/ext.c b/bindings/python/tests/system/ext.c
index e7c1cc4..c982fa6 100644
--- a/bindings/python/tests/system/ext.c
+++ b/bindings/python/tests/system/ext.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: LGPL-2.1-or-later
 // SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
+// SPDX-FileCopyrightText: 2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
 #include <Python.h>
+#include <linux/version.h>
 #include <sys/prctl.h>
+#include <sys/utsname.h>
 
 static PyObject *
 module_set_process_name(PyObject *Py_UNUSED(self), PyObject *args)
@@ -21,12 +24,46 @@ module_set_process_name(PyObject *Py_UNUSED(self), PyObject *args)
 	Py_RETURN_NONE;
 }
 
+static PyObject *
+module_check_kernel_version(PyObject *Py_UNUSED(self), PyObject *args)
+{
+	unsigned int req_maj, req_min, req_rel, curr_maj, curr_min, curr_rel;
+	struct utsname un;
+	int ret;
+
+	ret = PyArg_ParseTuple(args, "III", &req_maj, &req_min, &req_rel);
+	if (!ret)
+		return NULL;
+
+	ret = uname(&un);
+	if (ret)
+		return PyErr_SetFromErrno(PyExc_OSError);
+
+	ret = sscanf(un.release, "%u.%u.%u", &curr_maj, &curr_min, &curr_rel);
+	if (ret != 3) {
+		PyErr_SetString(PyExc_RuntimeError,
+				"invalid linux version read from the kernel");
+		return NULL;
+	}
+
+	if (KERNEL_VERSION(curr_maj, curr_min, curr_rel) <
+	    KERNEL_VERSION(req_maj, req_min, req_rel))
+		Py_RETURN_FALSE;
+
+	Py_RETURN_TRUE;
+}
+
 static PyMethodDef module_methods[] = {
 	{
 		.ml_name = "set_process_name",
 		.ml_meth = (PyCFunction)module_set_process_name,
 		.ml_flags = METH_VARARGS,
 	},
+	{
+		.ml_name = "check_kernel_version",
+		.ml_meth = (PyCFunction)module_check_kernel_version,
+		.ml_flags = METH_VARARGS,
+	},
 	{ }
 };
 

-- 
2.45.2


