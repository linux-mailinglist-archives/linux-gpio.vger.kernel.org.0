Return-Path: <linux-gpio+bounces-15459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A72A2A869
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3621C16207C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E7C22DF89;
	Thu,  6 Feb 2025 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="i2jOTORx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5822D4D5
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844554; cv=none; b=dB3F/YeY0sEY76ZfFdU+CE6sh3SD3vy7vhPZE3+Yftw4Q8IaM0w8RHack+Yag/RmE47Epz878KRq2j4FO6WYQHGkGM/5jV63mJXexHMDosbJTFy6aKwPRdrIzIOcJc1aRnCTWfCzo4isvcpIloVFXXHYBUw+FW8CnEPWyKkx5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844554; c=relaxed/simple;
	bh=yu9EyuGUFX68C0r1xD2DDUmoSUYLDCYgGt2P11sKENM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgrHQoNEuOViMq5kpXE/UAmoIqf2Szpymizzn/hbImlHpa2ek9bGuWSg2wCBDDKUZ4FWemgZJl+ZTu6alYz+2uRP3guWhVqYXRd4AcJ9qt4Y2GNW04v85xj2GhF1aQYcAgR5qezCq7334erjWI8scTjk7Vvn+0dK3KKx1aKQFl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=i2jOTORx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso414401f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844551; x=1739449351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJi6mVJW5bYLmVVwvwCPxn8lprON+2nI2ecuhLfiO44=;
        b=i2jOTORx2kBhneXklKgyLVXzX7qsiwNNh8mVVV+knEGuq+MjPZigaD4aNaaU9ymOyB
         PhxcVmyWNMB7/Z1P5YhesNI8amTHvdxXpDX4z6BRatV89aoV2JnF3FR1hy45Ya1W1wy6
         4PffgEyHeIM2+pakTrqbw41KdR+LArNUJQUc94YwamffeYDDmSigvM7QCbYo+/TCFWuy
         tKfpi9PSe9fQCxXLQorqjsEVPUhNmdq0pRHoEHN5R63d1PL1uwK0+PoayrnA8LJX62Gf
         fQCZtbWiUo9WhHmnuOOoY0R5qCgCFfzl9svKSzj8Y1VHpekKsWsGvlagSyO3V2ymi6IK
         LmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844551; x=1739449351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJi6mVJW5bYLmVVwvwCPxn8lprON+2nI2ecuhLfiO44=;
        b=l0FWBSNpFel6Yw9aGYJ6iCqK+uFQ2W78o8JbYW9nm+v9fO7dS+f20f9VcvqhkBSNG3
         W6nvjcM4kCNZBEMaDNHtg6R/yt1hlxRPtr49cfQqTgiUyC8DYcilRBIhmZSqT/qu87wF
         vT4TS2C33BIhLsueOmCaFUgDou3Q0KG3yLsj/9Exv3GeQUYqA7w6rNkUhE2EErDX//vm
         VmYJdYQ5wkHIt2KDYhfjoJstr8XaOSgoKBvX1i+X24Dp/pBh5CrpdwmiaVMh8qwCex0M
         w7bovpex7nj3vNiM6p/EhF0OZYWN4WhL790hSaN0A++HE8llwdL++nm2iT/W8J7Ae/rL
         LUdw==
X-Forwarded-Encrypted: i=1; AJvYcCWJQ2iiIKb+NzPQTGlO3DAZ/gPOQehN3RCTB6Fa45AZPpaWtfYx8dfrV1csOIMzXi9SCslKT8yMds/P@vger.kernel.org
X-Gm-Message-State: AOJu0YwATQH0AhKDO738pvRxOLJJxRpoM3VJbQY+m4i4bjSfgEFpjrjk
	e9rYczgVGzuEosCNSIcMo88hzUNTHWfFXN5VJEIPPXs1Gd/ItgZIbjMA763J+dLH+BGTGXFzivO
	DaiQ=
X-Gm-Gg: ASbGnctAeyrp4oM7+JR+HSV9/X40PQp8TNGA0K/M3wpQBRdc4wNtXN8BcABK+6wJ19+
	XFAsujotFxKKguRwMPdqa8zAwmcgdUSP1E10qs2dlp2ISw8VMa127G8dqFkkdA85npwLiEc3MiC
	zAudcmGemE3jeDNXDvqCqLoWaZsYUPHeiffkJFqQSy8Q4W7tMY3wKJsySOFseYvBsc8YJ2GAxGA
	HkDlTtQcrXOowVjG4B6396Rn/k42NP9+S3tPIj9q8NclLCxBUmZLVY/IrpQie2wBd1g02zfl433
	bGgG4Q==
X-Google-Smtp-Source: AGHT+IHWnAvJLq1tQ+NTGtKHT2UdTVSBLJPly0DGu4reY8z1cO7qE3uvdGDUM9SeF46kOmouCkfB4Q==
X-Received: by 2002:a05:6000:1a8a:b0:38a:8d32:274e with SMTP id ffacd0b85a97d-38db48a4351mr4629100f8f.5.1738844551184;
        Thu, 06 Feb 2025 04:22:31 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:22:12 +0100
Subject: [PATCH libgpiod v3 15/16] doc: add documentation for D-Bus API,
 daemon and command-line client
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-15-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5331;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pCQXmeN8sbMalEHkT3s1mWAni7Uk/wWpD2P7KmYnXd0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKl0C2wF2YkBNpPIIniDXaZm4DUWpj2XdKMbT
 b2RTdx0D5iJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpdAAKCRARpy6gFHHX
 cuRGEACRZZD75WhK7l6IMy3pq4A38jTLWOvUhSO4XQvofnocAt8pi4QSIaZX8gYgNB0HYRLFEVs
 A5W1vYlxivE0JCwbQOemooyxN3t/xKAIrXaVRcJv7VLYsV53nFKNE2GuMfIX4/0VWO40/56e+m8
 ywXHkMY0pAKiTZpPpJLNg/xMNdDeHvlwxlWvHZt8kgfrU6FrtmM+Fmhl/cZcj09tyo2lfZ2RSKD
 T9gU6rhgpIraMvXuoxGFgIYlh76uAk2qhB0zgMvX6GZ+KwpkxVMaz7vVB9JGLJgsk/jOsWv7SKj
 +mxD/IICNsipIC+jo6Y5zWZ+lft6vbyImTZe3r+zjRHzTxY80afA1CoZxQNUHe+XLnzWY3a+frw
 Qjliw3arw6YL+22xI6C/wKcdb7LCkMeoxWvCgNt/iTuojkqLWR5Psq95b4MuLGcDspcuOp0m/o/
 ZrFnOWc0dEyj1T3yHo+CKcPoDjqvAs+ajpIiVyLmTkCZOkEku73qvkOvYOSi9u+WN+TCEya6a1j
 BVAibzS9t9l3DOLPafdujxXD4xyWC0J9q3agor6uvYyl+ghUCE8OPWJ65EqawtyeanckILWePnp
 U2MV4RAfosX7PyJ0ibzoSgGWPRrazHDRY9oH1VB3vuykJimj6a/suTmMqhY9fuP8dkgTPd6/ZNE
 mwpcqm5xTCWbf2Q==
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
index 269dd7e..096095d 100644
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
index 5e20c17..bf4028d 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -101,6 +101,7 @@ subprocess.run(
         "--enable-bindings-glib",
         "--enable-introspection",
         "--enable-tools",
+        "--enable-dbus",
     ],
     check=True,
 )
@@ -114,6 +115,20 @@ for page in [
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
@@ -127,3 +142,5 @@ for page in [
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


