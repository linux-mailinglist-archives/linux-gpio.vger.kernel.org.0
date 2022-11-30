Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A118D63D5D2
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbiK3MnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235045AbiK3Mmu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:50 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E55E1DF38
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:43 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id o5so17881565wrm.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoA96d790qRsQ89rnEEt4R8/o1xErl2dRBGy7ZRzhJc=;
        b=5WX8VPDMPPIw+EZo0+Ah82fYUjm44LTKSIaJli/U68TT1TXMvb36rLfD2s6PGJMi/8
         pZeQNd0gGZaRyKB/huKbl5FJdhm96XRBDv0vwvOUm/ToQVOq71DggyejkMfM3nkZxweK
         IlFe/BYtiqGP5dT+LCSRd7E2/jqMlf7e5UPPuspBiWD0xWilP/QcaToLZpLDggYYQ6sd
         84wdRxJRw1hv05gauX41xouS1ExwOhODXx9IEyZWi8Zd6uEAo3w1hECjI2c9duGXvi4K
         93Cq54Lx9s1lqq0TcFHmMrWaNRhl7yPIjUcf8Ja+hPYfiYTw0Bc6oBe3CnQ2XR7ZF1uh
         9akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoA96d790qRsQ89rnEEt4R8/o1xErl2dRBGy7ZRzhJc=;
        b=LcCutciVLqSgESTQlcWWzI7Z3lTk7lspeGMFXKUCgUwkxG1A2UlvCp/3EYnsJJoort
         sRXkWPpxgRgtC7F9kqPJhn0IUWKwUa/Y+HDIsRbcmX9Y5BGBc+d4NLzl7xfviJ4/xJXq
         JozSx8a7a2c3RJ2Bqh7ANYA29gbwJi+yszDjy5DFb/3dcaz085AamUg7kOOgfFaynDGL
         3bGk+zBs8OblHjojFpMqsyK5c+C0A68C5qeSBHaWhY7co0JEu08GAk+XnjstaKYIJKpJ
         OpuYN6bjBYpTwGJ/hEhd3PUelHeJXv/8jykJ2kklyqOLwP6kaf+AvHaNpTl1dFDE6W8m
         SF6g==
X-Gm-Message-State: ANoB5pm4JE8/NzMDayzU4q4cSR83BvZyFdEH73nASPj1tC7p1Zti5fV5
        yYfk3EuXa6Hk1983w98SFFbFMA==
X-Google-Smtp-Source: AA0mqf5KnGyE/Fo8S6kSnpHk3I0bI1SioE0Fid7URYDX8By2onou5wd1YLHVkAhIf4izRRQpQddDNg==
X-Received: by 2002:a5d:65c9:0:b0:241:bd29:6a73 with SMTP id e9-20020a5d65c9000000b00241bd296a73mr36070074wrw.499.1669812162130;
        Wed, 30 Nov 2022 04:42:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 08/11] bindings: rust: include rust sources in the release tarballs
Date:   Wed, 30 Nov 2022 13:42:28 +0100
Message-Id: <20221130124231.1054001-9-brgl@bgdev.pl>
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

Rust sources and Cargo files are not added to EXTRA_DIST. Add them so that
they end up in the release tarballs generated by autotools.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/Makefile.am                       |  4 ++++
 bindings/rust/gpiosim-sys/Makefile.am           |  6 ++++++
 bindings/rust/gpiosim-sys/src/Makefile.am       |  5 +++++
 bindings/rust/libgpiod-sys/Makefile.am          |  6 ++++++
 bindings/rust/libgpiod-sys/src/Makefile.am      |  5 +++++
 bindings/rust/libgpiod/Makefile.am              |  6 ++++++
 bindings/rust/libgpiod/examples/Makefile.am     | 14 ++++++++++++++
 bindings/rust/libgpiod/src/Makefile.am          | 15 +++++++++++++++
 bindings/rust/libgpiod/tests/Makefile.am        | 15 +++++++++++++++
 bindings/rust/libgpiod/tests/common/Makefile.am |  5 +++++
 configure.ac                                    |  9 +++++++++
 11 files changed, 90 insertions(+)
 create mode 100644 bindings/rust/gpiosim-sys/Makefile.am
 create mode 100644 bindings/rust/gpiosim-sys/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod-sys/Makefile.am
 create mode 100644 bindings/rust/libgpiod-sys/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod/Makefile.am
 create mode 100644 bindings/rust/libgpiod/examples/Makefile.am
 create mode 100644 bindings/rust/libgpiod/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod/tests/Makefile.am
 create mode 100644 bindings/rust/libgpiod/tests/common/Makefile.am

diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
index a0d0772..1e01024 100644
--- a/bindings/rust/Makefile.am
+++ b/bindings/rust/Makefile.am
@@ -17,3 +17,7 @@ all:
 
 clean:
 	cargo clean
+
+EXTRA_DIST = Cargo.toml
+
+SUBDIRS = gpiosim-sys libgpiod libgpiod-sys
diff --git a/bindings/rust/gpiosim-sys/Makefile.am b/bindings/rust/gpiosim-sys/Makefile.am
new file mode 100644
index 0000000..9471b0e
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/Makefile.am
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = build.rs Cargo.toml README.md
+SUBDIRS = src
diff --git a/bindings/rust/gpiosim-sys/src/Makefile.am b/bindings/rust/gpiosim-sys/src/Makefile.am
new file mode 100644
index 0000000..af104d0
--- /dev/null
+++ b/bindings/rust/gpiosim-sys/src/Makefile.am
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = lib.rs sim.rs
diff --git a/bindings/rust/libgpiod-sys/Makefile.am b/bindings/rust/libgpiod-sys/Makefile.am
new file mode 100644
index 0000000..9471b0e
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/Makefile.am
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = build.rs Cargo.toml README.md
+SUBDIRS = src
diff --git a/bindings/rust/libgpiod-sys/src/Makefile.am b/bindings/rust/libgpiod-sys/src/Makefile.am
new file mode 100644
index 0000000..36361e7
--- /dev/null
+++ b/bindings/rust/libgpiod-sys/src/Makefile.am
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = lib.rs
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
new file mode 100644
index 0000000..6b55d0d
--- /dev/null
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = Cargo.toml
+SUBDIRS = examples src tests
diff --git a/bindings/rust/libgpiod/examples/Makefile.am b/bindings/rust/libgpiod/examples/Makefile.am
new file mode 100644
index 0000000..6028fff
--- /dev/null
+++ b/bindings/rust/libgpiod/examples/Makefile.am
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = \
+	gpiodetect.rs \
+	gpio_events.rs \
+	gpiofind.rs \
+	gpioget.rs \
+	gpioinfo.rs \
+	gpiomon.rs \
+	gpioset.rs \
+	gpio_threaded_info_events.rs \
+	gpiowatch.rs
diff --git a/bindings/rust/libgpiod/src/Makefile.am b/bindings/rust/libgpiod/src/Makefile.am
new file mode 100644
index 0000000..df63c72
--- /dev/null
+++ b/bindings/rust/libgpiod/src/Makefile.am
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = \
+	chip.rs \
+	edge_event.rs \
+	event_buffer.rs \
+	info_event.rs \
+	lib.rs \
+	line_config.rs \
+	line_info.rs \
+	line_request.rs \
+	line_settings.rs \
+	request_config.rs
diff --git a/bindings/rust/libgpiod/tests/Makefile.am b/bindings/rust/libgpiod/tests/Makefile.am
new file mode 100644
index 0000000..198f4e4
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/Makefile.am
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = \
+	chip.rs \
+	edge_event.rs \
+	info_event.rs \
+	line_config.rs \
+	line_info.rs \
+	line_request.rs \
+	line_settings.rs \
+	request_config.rs
+
+SUBDIRS = common
diff --git a/bindings/rust/libgpiod/tests/common/Makefile.am b/bindings/rust/libgpiod/tests/common/Makefile.am
new file mode 100644
index 0000000..4cfc355
--- /dev/null
+++ b/bindings/rust/libgpiod/tests/common/Makefile.am
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+EXTRA_DIST = config.rs mod.rs
diff --git a/configure.ac b/configure.ac
index ccbb88a..dc945ef 100644
--- a/configure.ac
+++ b/configure.ac
@@ -266,7 +266,16 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
 		 bindings/python/tests/gpiosim/Makefile
+		 bindings/rust/libgpiod-sys/src/Makefile
+		 bindings/rust/libgpiod-sys/Makefile
+		 bindings/rust/libgpiod/src/Makefile
+		 bindings/rust/libgpiod/tests/common/Makefile
+		 bindings/rust/libgpiod/tests/Makefile
+		 bindings/rust/libgpiod/Makefile
+		 bindings/rust/libgpiod/examples/Makefile
 		 bindings/rust/Makefile
+		 bindings/rust/gpiosim-sys/src/Makefile
+		 bindings/rust/gpiosim-sys/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.37.2

