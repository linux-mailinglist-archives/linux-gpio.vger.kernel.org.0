Return-Path: <linux-gpio+bounces-15755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B7EA30C54
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 14:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CCAC1889163
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED0F2206AD;
	Tue, 11 Feb 2025 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qCHBMgKp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51E21E0BA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278798; cv=none; b=YPNj5pJdK6FCtSQQeCTo9yHbyLa50GDi4ZJBxfWk35/+01tbTB0XGfZcQRmY3i6OLWxbS43VqwgXjsUIihrbWjJCSHJVPlgGdkcAUwacOtH8jmK9vJNnXJGmaosmMOzEacINp9EJamwhl0iSif4+atFaR8F/+USlSPfg/v39nBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278798; c=relaxed/simple;
	bh=pZcR0PzqmqVwp/+EGp/cSk8P1KY7qKy2EamThKb/SIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeF8pW/53YlTkWM30hpVqCr2rk3eGZ1g3fs6tT5ig+YaRnG8FRewtXJefnwoi9On/nKTgOiVn36+zD58qvWngHLKiJAfZcr4Momh2hXGu9WmgF9RCp0Aglq/bFATag0CuklIjpW9PIlLkeAK7T3eHC+ZgKX0jwJg0ZsMl4LB+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qCHBMgKp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso55628095e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278795; x=1739883595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vVZCU+yHAjmiNaJEaScySLgV9S9u7F+Ea2dbInUSdc=;
        b=qCHBMgKpaUdEyzJ7H9K9HI7M5Vsco2563Z3DOh2eo1hn+OwMaJ/Nv9NjEA2HWOTcNB
         18pWbf1RRXW+extqr/aXnrDC4PmjedBVG0TaxKgdTgMWqVhxuGnHNtZw8hE0/S5f0Ypz
         dLb+SivhmGXyQNvpB1AVyar5v330XqIwTPRTl8VSSFD9Q1IrfYNLO59Up5K0M4eIxcQA
         nVHRde/xWFGkIOFPXFIP4oT0ETPbAOpJvtPaubXGf2k1FKATDxP5KT+ppizGg1II0p7K
         2F5iY1FLyyGRd0G8QEULzB5EQ1Bu7pxndQUuwursX6TR7DmybzunvbUc8Q4IOM9+7RBi
         f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278795; x=1739883595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vVZCU+yHAjmiNaJEaScySLgV9S9u7F+Ea2dbInUSdc=;
        b=J2MW8+xV2P6zXDqFz5WJ/BJO5ShvzwLd2eDZbIjyP0rFaxQS0GP0nnCVtiMXirrE2y
         MYwyskgs7qslw5aIPlY6cEXAr+LNEqN/EQ32wcamj8c5Dgfa39VEkmvgaFcJogP6pCIm
         eErmmjaxE0LwAR9HfI275Pibq5CYiHN6nuJHgqW+DCYehPbJZ6SfYwS8qx2Kp90uiwNo
         LvzSdOWZip+cdb4fDgXW98lCOgVBY0YzzKz/vvbpMnr64qkdL0rooWwsaJXqGl/yrkBg
         bKO0lSPxvxlUqqIMmiEEY8S6hB+6XVkw6mQ8YObZn9lxZRm8kqKsUFU/EY4nPGaA5yy6
         P/1g==
X-Forwarded-Encrypted: i=1; AJvYcCV9kLmgXrU0nOnCfv2/kVPJyOJ2GZFpHmlt7IGdgLUmMB4nlHi4bM5hmTv16zg274vwINm2xvMjj5yk@vger.kernel.org
X-Gm-Message-State: AOJu0YxW1Q0gCDQ8OTFbaHvPRnKAwPpGS025radp+VSQ75EmnRAWG+Rg
	Rzt1dRqrOo9uxB70U2DoLlozWcvfOwczY7JQ4a6yEJHfqzZ54SSz8ncQGCh7Sbs=
X-Gm-Gg: ASbGncuEGLsIiD396p/N7+v2AWpSuM3Epm4jFUqN6wPkuR/PlShjs6M9Tft6bhasOy5
	ooPofuwIdVXh39juFQxqo2yPBiJjmcL25p0C/1u1nGx+I+T1GUFuZba+PhMEj2ejWqfs85FjOnr
	smPhzNxirvDuo5Lp+g5QbJZ0lAMfb4VcOoIDHdLUcs+BxT6DGhy+C7ooYQGglytTRuADKdB9dh9
	tlDnqicwwX/j8Mta4CaKVS1zU9ULSsISF5npwwriYsYN7Jo4Ak05ciY90y+O9dj9nh/TXMNzPsW
	/Z5To8Q=
X-Google-Smtp-Source: AGHT+IFd9Iey+TrXktzkRgh2SpKzh8WbuKb6qsKF92O2fFh2BOzxBLnQfobdOWetFdmkGiLNKQujmQ==
X-Received: by 2002:a05:600c:4f8b:b0:439:40c1:1338 with SMTP id 5b1f17b1804b1-43940c11470mr101560955e9.11.1739278794527;
        Tue, 11 Feb 2025 04:59:54 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:37 +0100
Subject: [PATCH libgpiod v4 16/17] doc: add documentation for D-Bus API,
 daemon and command-line client
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-16-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5329;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GJVRfzZrXSyYmVo4vfibVn9csqUua3+DjonZU5isJ2E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m4q8eNE+Mie7AVQMvjwCxdcO7uX8hQ2qkBz
 qQr7/yefH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJuAAKCRARpy6gFHHX
 cm9HEAC6Lop2TQwWjSLZBDIulGrzUdeUVhBFOtWqKgrY9t2q0QTXiFNVhUmUERlkR6RBXsikW44
 ke3jPNM9IaQ5PTvrgAxIkiSWYvXPFSKzUJJRliX9Nb0Bpuw8yupyswaqzPIFAMldJXJrwIcvD0u
 nLKkKBgZEXLSlqLdyATPhB/sTse0pTkK1kU4e7yMVEtTBpF88GN0xrvoU5ii0e3Zyv5Zte4tst1
 ZRWFI5QAVwkfOZ4Gt9wz9nMvKZ10b8cr5YCfnXuwtuqWvwyu5DVqK/UtUYWM6RN8CC3VB+32Ej8
 t+3IkDSDxv+8dxIYbiBZ+CgcKxaFzS3eGmrHHgOwyboR0fKnxXmJr/OPjoG+8fV1Gz+T5CjkvfS
 7s37+pDDuCVTMBj4do7CTbieAxCzzEVGlucS6pkuPE4/vxbi7VR3NqdxfbQNw2YshdHTRmHe6tJ
 0kVyK6NR6JwUUqEO2iD2HeCEvXTKTbBfY1ERT3DKX6I0+NlxTa2H4Memq7+Equ+aryWaBDfSuPi
 JbmOvB4nFCY8zY3yJQ5iocuYKpSyzDpdKxLLCHKRAKlwW3SK2r2f0xdxxEJyjF/FuN6LiKZw1HJ
 P2AU3RTcOmcJ4DH11eiFvqK6yBBRh2uNsJRUkLsd37DNdv3wvLiieG1uob/4O9G/65LXg34dNQu
 hzDUY+z3on4ofLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the man pages for gpio-manager and gpiocli + some manual labor to
provide sphinx docs for the libgpiod D-Bus API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .readthedocs.yaml    |  2 ++
 docs/.gitignore      |  6 ++++++
 docs/Makefile.am     |  3 +++
 docs/conf.py         | 17 +++++++++++++++++
 docs/dbus.rst        | 24 ++++++++++++++++++++++++
 docs/dbus_api.rst    | 23 +++++++++++++++++++++++
 docs/gpiocli_top.rst | 29 +++++++++++++++++++++++++++++
 docs/index.rst       |  1 +
 8 files changed, 105 insertions(+)

diff --git a/.readthedocs.yaml b/.readthedocs.yaml
index c2b0a7f..5f4f5ac 100644
--- a/.readthedocs.yaml
+++ b/.readthedocs.yaml
@@ -24,6 +24,8 @@ build:
       - gir1.2-glib-2.0-dev
       - gobject-introspection
       - graphviz
+      - libglib2.0-dev-bin
+      - libgudev-1.0-dev
       - libtool
       - pandoc
       - pkg-config
diff --git a/docs/.gitignore b/docs/.gitignore
index c9ffb90..61dac9a 100644
--- a/docs/.gitignore
+++ b/docs/.gitignore
@@ -11,3 +11,9 @@ gpioget.rst
 gpioset.rst
 gpiomon.rst
 gpionotify.rst
+
+gpio-manager.rst
+
+dbus-io.gpiod1.*.rst
+gpiocli.rst
+gpiocli-*.rst
diff --git a/docs/Makefile.am b/docs/Makefile.am
index 1b5a46c..e03ca22 100644
--- a/docs/Makefile.am
+++ b/docs/Makefile.am
@@ -30,10 +30,13 @@ DOCS_DEPS = \
 	cpp_line_settings.rst \
 	cpp_misc.rst \
 	cpp_request_config.rst \
+	dbus.rst \
+	dbus_api.rst \
 	Doxyfile \
 	index.rst \
 	glib_api.rst \
 	gpio_tools.rst \
+	gpiocli_top.rst \
 	python_api.rst \
 	python_chip_info.rst \
 	python_chip.rst \
diff --git a/docs/conf.py b/docs/conf.py
index 06fe932..6fb399d 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -92,6 +92,7 @@ subprocess.run(
         "--enable-bindings-glib",
         "--enable-introspection",
         "--enable-tools",
+        "--enable-dbus",
     ],
     check=True,
 )
@@ -105,6 +106,20 @@ for page in [
     "gpioset",
     "gpiomon",
     "gpionotify",
+    "gpio-manager",
+    "gpiocli",
+    "gpiocli-detect",
+    "gpiocli-find",
+    "gpiocli-info",
+    "gpiocli-get",
+    "gpiocli-monitor",
+    "gpiocli-notify",
+    "gpiocli-reconfigure",
+    "gpiocli-release",
+    "gpiocli-request",
+    "gpiocli-requests",
+    "gpiocli-set",
+    "gpiocli-wait",
 ]:
     subprocess.run(
         [
@@ -118,3 +133,5 @@ for page in [
         ],
         check=True,
     )
+
+subprocess.run(["gdbus-codegen", "--generate-rst", "dbus", "../dbus/lib/io.gpiod1.xml"])
diff --git a/docs/dbus.rst b/docs/dbus.rst
new file mode 100644
index 0000000..0dcbb81
--- /dev/null
+++ b/docs/dbus.rst
@@ -0,0 +1,24 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   GPIO D-Bus API, daemon and command-line client documentation
+
+D-Bus interface
+===============
+
+The **libgpiod D-Bus API** provides an abstraction for interacting with GPIO
+chips on Linux systems via the D-Bus messaging system. It enables relatively
+efficient, asynchronous control of GPIO lines, offering methods for
+configuring, monitoring, and manipulating GPIOs.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Contents
+
+   dbus_api
+   gpio-manager<gpio-manager>
+   gpiocli_top
diff --git a/docs/dbus_api.rst b/docs/dbus_api.rst
new file mode 100644
index 0000000..6192949
--- /dev/null
+++ b/docs/dbus_api.rst
@@ -0,0 +1,23 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   GPIO D-Bus API documentation
+
+D-Bus API
+=========
+
+The following set of strictly defined interfaces allow users to use any
+**D-Bus** library in order to interact with the **gpio-manager** as well as
+reimplement the manager itself if required.
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Interfaces
+
+   dbus-io.gpiod1.Chip
+   dbus-io.gpiod1.Line
+   dbus-io.gpiod1.Request
diff --git a/docs/gpiocli_top.rst b/docs/gpiocli_top.rst
new file mode 100644
index 0000000..52e3295
--- /dev/null
+++ b/docs/gpiocli_top.rst
@@ -0,0 +1,29 @@
+..
+   SPDX-License-Identifier: CC-BY-SA-4.0
+   SPDX-FileCopyrightText: 2025 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+..
+   This file is part of libgpiod.
+
+   GPIO D-Bus command-line client documentation
+
+Command-line client
+===================
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Manual entries
+
+   gpiocli<gpiocli>
+   gpiocli-detect<gpiocli-detect>
+   gpiocli-find<gpiocli-find>
+   gpiocli-info<gpiocli-info>
+   gpiocli-get<gpiocli-get>
+   gpiocli-monitor<gpiocli-monitor>
+   gpiocli-notify<gpiocli-notify>
+   gpiocli-reconfigure<gpiocli-reconfigure>
+   gpiocli-release<gpiocli-release>
+   gpiocli-request<gpiocli-request>
+   gpiocli-requests<gpiocli-requests>
+   gpiocli-set<gpiocli-set>
+   gpiocli-wait<gpiocli-wait>
diff --git a/docs/index.rst b/docs/index.rst
index a52cc3a..3101e14 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -27,3 +27,4 @@ this interface.
    core_api
    bindings
    gpio_tools
+   dbus

-- 
2.45.2


