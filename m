Return-Path: <linux-gpio+bounces-15751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA6A30C55
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81E61669E7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D16F21D5A9;
	Tue, 11 Feb 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="n6YoOPWY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2430A215799
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278795; cv=none; b=S2UGLTTHpUBpYuCwi6jIzJGxYMhkz5wuZt6iItO8xg/2I/auL/6z+n/fUYVJRJlcRaaSByu1LQSyYY2+AC224Q9/lg71PVrbauWytfbRgelNl0N9EcDSz6g5NMnT/xewYfMp7PpSE830Rpznl0Gh0pRDHcUgPpRLdyVGQhblQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278795; c=relaxed/simple;
	bh=xtY16JuTPGy0f0AsElIlHsFkNo85eg7KSmoHacYE07Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LDQUFiEk8GfidVANPEcgpJI3V6dXkyzFARLW8TX8IT789V108tewIQYNuNrg2sFrssFwpr94B1AWrWNgcph4yM65Sts2m1RYm98onYiYc6m3iqpKX2bkBrVklfNQNxUaO2hw6NVEi9AciFBrTEsyHsvuST6vbC2amYWnBhtwwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=n6YoOPWY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43618283dedso55382625e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278792; x=1739883592; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPH+Pxwqlyrx1DSr8zde+bZJyhr4eJxNgQrIhm0XUcw=;
        b=n6YoOPWYk4H21/OcZX9AHpSZj40FhscfqFDEb69S8zRvrDkOElpJHzVrIMYeGQxs8b
         U9S4z8snGMzJDe8+xEdBqADO23s1tbODQPmxS/NbpAvAl5y9HOurogHNV/mGeshl/ItX
         ppSBxhSzRBL0XfUVDAiJpAPD1gzk6w5yVA6a/BhVoEcPNoE3Il9iortLcJHyRYJhlmyf
         tNPwdglDo/3ZlrpZIErYvwYN/NmSdtNoeOwieYZp/5/w04EsPtTvGshtL9VTt0XMPWWV
         a+J5Kivc27IetM5/hKUpIlQtufGKgPc3dlHFZ8qyAwcHNCGQBypz4VHRWFrEs9/n/xrT
         NVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278792; x=1739883592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPH+Pxwqlyrx1DSr8zde+bZJyhr4eJxNgQrIhm0XUcw=;
        b=cQ2oADK9CWi19YIYCiNC4VeLq387aMXVOd2vyQfAelEClkW+ScWrSjV5sPCiXGzith
         MYBngWwZ+H9Dp71kvyC0pD+u8UGci/5fuKlqC+fGQ24dnrVB//28ZOyk47y9VDWBJtyJ
         RZKhDg+pDvTEh66mf3QJKCyAf+RQvgqri6bfdOy1B9pHeL3HNMo4bo474BroVmNPNTTD
         qTSElYnnVOIiAawW4CqVIX6pQgV19Y2rLEXYTtLybkY5J11Z6F8muH734iEexO6UwlsQ
         rdvPqVcIUrVP0hlERmxQ5o6R7p691IoFEQHyPTiXvpuvykMW8yybXXUTneNEr+ntoheO
         kp5w==
X-Forwarded-Encrypted: i=1; AJvYcCVBvTZj8Df/8vZt12RzBsMzNUFtZVqBYIFKr8U6miP0EwltUVSZGkbKlDTUZI85K1Tp6rTbsyYyz7Yy@vger.kernel.org
X-Gm-Message-State: AOJu0YwihtTxQ+guuwfv5uW0BR/w7OcijiK1YJ4bVJ/Kp+8K1+cA3Ztg
	6HArQTiN3x4VOlwKKW4Nxkql/AfLOWN9b5AbBGAZs8WaVz7tcUv7Rhb2eX/R7qHUJkPPeGNaPkW
	FswE=
X-Gm-Gg: ASbGnctBJurZRiYh+5uHARYv2UdTOMSJ8NtjmfvLFdz0HdChLJluS3fa4z6OrWfSiZ9
	9AxXD8CcskKQ0U5V1gAw+aqxNnjlQea5j8/2+oootx8LzAGngYdRi3k7C72p8Ymnd2GVaOBA22C
	ActhgrNVy5d3Num8IMqvYuXf3XrBXlMXbQxA/eoycipID/DFe7IM1qaz1+OnFXsajmFd52uJeJX
	Or4WYAVufLfBGMDa0jZpXmATZRhdqCXL4itglmR1d/NG3/9Yw9qbHIDXzg6zRn+KzFsLE+gOToU
	T1blDPs=
X-Google-Smtp-Source: AGHT+IGVukhVj+2UDHcUjYTJ8XrXssPEQf3cnzaLKeDWU+q7Zt74VcW7bQ6FzmFsVsUHe+eLjVV80A==
X-Received: by 2002:a05:600c:44c9:b0:439:34d3:63da with SMTP id 5b1f17b1804b1-43934d36692mr107533195e9.10.1739278792384;
        Tue, 11 Feb 2025 04:59:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:35 +0100
Subject: [PATCH libgpiod v4 14/17] doc: add documentation for GLib bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-14-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4189;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=en4nI9CttlbGrQfJ+gSjxV0dUmu73WEAI1tpbSKo/VQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m3ZqWwQkl/QUHNexSH96NxoU9+DquCFB/u9
 0mK9icIC1KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtwAKCRARpy6gFHHX
 cvQ3EAC1aKFcA6wjSWUwLVR2YIN9rY4aZli7vj8tOSCeapM7Fgvv/KV4BzaViD5WBsz6vou133y
 o9GlRXizMXMhBQQcZrTIgcwFhak2ezc/tmGUzOOx0xduO0l0ExveKzjq8+x64g7lpQl0eTZdpOl
 e7300mrxt6KGV3G5A03sstlfLQaMK8kjLriClU67BqYXNupP6cdyExHNsUzpHRWDtzaALxHEBgq
 1UxpFZnCHnB9TXCZ/fCdixedEWlHR1EXtrwk08tPhDuIbNRB7JocplJyy60wBCXAD/2cIoGWPbn
 WT+zId5mSEY2c60RijYEMFwuWTJ+1zGMUZ/LZ1mC2djMjlY90uxVI7g1gkG/84OVK6UeZM+0uES
 ND0RcQGCuQ0Ixkvgk/jQCrFCWzVUwcApkqsuxI9khoCEii/D2UFNWSGdpfqlPCrUM9Lh2cwEY0A
 OHS/8bDbFrbaWr9Y/GCbQRKWjHytzyAgT1KSA8EjI/sQzI7DyTqU6ZYR5jpwUzaxdqF68/oCXeh
 g/n1aWlPMbOBXOlqbNyQBhE6RvCirwQ0GoRFSdvIf4DrnLf9FDxb4Owp1fJywvdlaRHn0YIU0cJ
 ARa62sbfdh1iArJFRwAFNYDadSnq/dokr7PdEsylKAlg8bQZcqZFOhDm91T4ezBps2wBWor/+DJ
 OZxBjMhTZcS5B2g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GObject docs are generated with gi-docgen and there doesn't seem to
be an easy way of converting them to sphinx. Let's put the GLib docs
statically into the sphinx output and reference them from the bindings
chapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml |  9 ++++++++-
 docs/Makefile.am  |  1 +
 docs/bindings.rst |  1 +
 docs/conf.py      | 41 +++++++++++++++++++++++++++++++++++++++++
 docs/glib_api.rst | 23 +++++++++++++++++++++++
 5 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index 510b5c1..97086fa 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -11,13 +11,20 @@
 version: 2
 
 build:
-  os: ubuntu-22.04
+  os: ubuntu-24.04
   tools:
     python: "3.12"
   apt_packages:
+      - autoconf
+      - autoconf-archive
       # doxygen is available by default, but just in case.
       - doxygen
+      - gi-docgen
+      - gir1.2-glib-2.0-dev
+      - gobject-introspection
       - graphviz
+      - libtool
+      - pkg-config
 
 sphinx:
    configuration: docs/conf.py
diff --git a/docs/Makefile.am b/docs/Makefile.am
index 0cfa4d5..3d5c1e4 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -32,6 +32,7 @@ DOCS_DEPS = \
 	cpp_request_config.rst \
 	Doxyfile \
 	index.rst \
+	glib_api.rst \
 	python_api.rst \
 	python_chip_info.rst \
 	python_chip.rst \
diff --git a/docs/bindings.rst b/docs/bindings.rst
index ed7ec69..73f1262 100644
--- a/docs/bindings.rst
+++ b/docs/bindings.rst
@@ -19,3 +19,4 @@ C library.
 
    cpp_api
    python_api
+   glib_api
diff --git a/docs/conf.py b/docs/conf.py
index cbe1691..9d80bde 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,4 +54,45 @@ except ImportError:
 
 html_theme = "sphinx_rtd_theme" if sphinx_rtd_theme else "default"
 
+# We need to know where to put docs generated by gi-docgen but app.outdir is
+# only set once the builder is initialized. Let's delay running gi-docgen
+# until we're notified.
+def make_glib_docs(app):
+    # For some reason on RTD we're in the docs/ directory while during a local
+    # build, we're still in the top source directory.
+    prefix = "../" if os.getenv("READTHEDOCS") == "True" else ""
+
+    subprocess.run(
+        [
+            "gi-docgen",
+            "generate",
+            "--config",
+            f"{prefix}bindings/glib/gi-docgen.toml",
+            f"{prefix}bindings/glib/Gpiodglib-1.0.gir",
+            "--output-dir",
+            f"{app.outdir}",
+        ],
+        check=True,
+    )
+
+
+def setup(app):
+    app.connect("builder-inited", make_glib_docs)
+
+
 subprocess.run(["doxygen", "Doxyfile"])
+
+cwd = os.getcwd()
+os.chdir("..")
+subprocess.run(["autoreconf", "-ifv"], check=True)
+subprocess.run(
+    [
+        "./configure",
+        "--enable-tools",
+        "--enable-bindings-glib",
+        "--enable-introspection",
+    ],
+    check=True,
+)
+subprocess.run(["make", "-j"], check=True)
+os.chdir(cwd)
diff --git a/docs/glib_api.rst b/docs/glib_api.rst
new file mode 100644
index 0000000..307f5f7
--- /dev/null
+++ b/docs/glib_api.rst
@@ -0,0 +1,23 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2024-2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   libgpiod GObject API documentation
+
+libgpiod GObject bindings API
+=============================
+
+**GObject bindings** for libgpiod provide a high-level, object-oriented
+interface to interact with GPIO (General Purpose Input/Output) lines on Linux
+systems. These bindings leverage the **GObject framework**, commonly used in
+GNOME and GTK+ applications, to wrap the lower-level C API of libgpiod.
+
+.. warning::
+   The documentation for GObject bindings is generated using gi-docgen and
+   cannot be easily integrated with sphinx documentation. Please navigate to
+   a separate section dedicated exclusively to the GLib part of the API.
+
+`Navigate to GObject bindings documentation <Gpiodglib-1.0/index.html>`_

-- 
2.45.2


