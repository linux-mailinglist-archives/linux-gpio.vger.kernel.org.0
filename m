Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC24466240
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 12:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357311AbhLBL0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 06:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357305AbhLBL0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 06:26:30 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9171FC06174A
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 03:23:07 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id p18-20020a17090ad31200b001a78bb52876so2165896pju.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m/WWv+GZ4vy7gi28NjwSRpkRBlqN9cl3ZsG6gPUii7I=;
        b=jZu1XRuhVy7YbraxecJKEnasevD8yCwbeFylKQOAu7K6tbdwy0AvLc66jKYF2hpkBS
         M9Z0F4LK7O5Dm6H02DiRaZoZGuBxobCHNw6wX0tlBwsJul1JqHMipltcx8lMJ2TZjpoQ
         yaFeRMPEbjQJcTUzf5E5ZmQ1TRY42E6RL7Dpiy9gwRPq/uEWUMXrByIwWAnYwdfkj/la
         MMJYEjO3gQTCVpiB7aPL8Ycuhn1m+qcYIqn6l4+9lWHz3elySmDFho1EM4MYVgWzZKUp
         QX2O+sgi8k84XPz/7MeRU7B+wkib26hL1eNmGQdCLhHLwIaiL58piiD0CjACUK1QUSzU
         BUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m/WWv+GZ4vy7gi28NjwSRpkRBlqN9cl3ZsG6gPUii7I=;
        b=E34VjRSkw2i5wb79V81Ajq9DZtNu1a/yMmBQcRa1glfYr0AwwK818mq6lHZgIjnVqY
         wHSWJSXY0MINv9EleZvvwf1LIkLzzJaBCxSD8peDFQEqOhUkg11x24xS6xMhfIYoShFi
         xh1HLRguYS9YefHruBxL+go6YvJPWOBDgBzfxoSLwzaHSwV9ii04gcnpAU1WMBwlHist
         eLEDQCHaDiFSLy7Y48F0aQOONxzgeqhUh2Z/dj7qoQJ5E+REix2KUarRiesT5TKudr5e
         a8t8uK5TVDeCBM2O3N/XOom04dnBj15SVXbW6ynTsY5PowH6aKTu8wAhfoRFA7IFxYGR
         ELIQ==
X-Gm-Message-State: AOAM532kxW3Voe3Dcz/vCoNEtfGSn99qzoVm8y00LmT4fiuqwXOpypyi
        fil3xh32hRsojLuEKIQa988WiA==
X-Google-Smtp-Source: ABdhPJzvoV9Fkvmhx0QqArqj41+mwA23ijGncWEoiepGSWHiDEuFPreuSUgZxgk41WRkYWGJpnKgAg==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr5322894pjb.190.1638444187070;
        Thu, 02 Dec 2021 03:23:07 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id g22sm3369250pfj.29.2021.12.02.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:23:06 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: [PATCH V2 4/4] rust: Integrate building of rust bindings with make
Date:   Thu,  2 Dec 2021 16:52:49 +0530
Message-Id: <6e377761e6af72d928146d64aa592b61fc8c0418.1638443930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1638443930.git.viresh.kumar@linaro.org>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Let make build rust bindings as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 README                    |  8 +++++---
 TODO                      |  8 --------
 bindings/Makefile.am      |  6 ++++++
 bindings/rust/Makefile.am | 29 +++++++++++++++++++++++++++++
 configure.ac              | 16 ++++++++++++++++
 5 files changed, 56 insertions(+), 11 deletions(-)
 create mode 100644 bindings/rust/Makefile.am

diff --git a/README b/README
index 814a0f161fd2..68b5d69f9b66 100644
--- a/README
+++ b/README
@@ -119,9 +119,9 @@ TOOLS
 BINDINGS
 --------
 
-High-level, object-oriented bindings for C++ and python3 are provided. They
-can be enabled by passing --enable-bindings-cxx and --enable-bindings-python
-arguments respectively to configure.
+High-level, object-oriented bindings for C++, python3 and Rust are provided.
+They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
+and --enable-bindings-rust arguments respectively to configure.
 
 C++ bindings require C++11 support and autoconf-archive collection if building
 from git.
@@ -132,6 +132,8 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in order to point the build
 system to the correct locations. During native builds, the configure script
 can auto-detect the location of the development files.
 
+Rust bindings require cargo support.
+
 TESTING
 -------
 
diff --git a/TODO b/TODO
index 8bb4d8f3ad56..cf4fd7b4a962 100644
--- a/TODO
+++ b/TODO
@@ -28,14 +28,6 @@ and is partially functional.
 
 ----------
 
-* implement rust bindings
-
-With Rust gaining popularity as a low-level system's language and the
-possibility of it making its way into the linux kernel, it's probably time to
-provide Rust bindings to libgpiod as part of the project.
-
-----------
-
 * implement a simple daemon for controlling GPIOs in C together with a client
   program
 
diff --git a/bindings/Makefile.am b/bindings/Makefile.am
index 8f8c762f254f..004ae23dbc58 100644
--- a/bindings/Makefile.am
+++ b/bindings/Makefile.am
@@ -14,3 +14,9 @@ if WITH_BINDINGS_PYTHON
 SUBDIRS += python
 
 endif
+
+if WITH_BINDINGS_RUST
+
+SUBDIRS += rust
+
+endif
diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
new file mode 100644
index 000000000000..ac05692b966d
--- /dev/null
+++ b/bindings/rust/Makefile.am
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Viresh Kumar <viresh.kumar@linaro.org>
+
+LIBGPIOD_SRC =					\
+	Cargo.toml				\
+	build.rs				\
+	src/bindings.rs				\
+	src/chip.rs				\
+	src/edge_event.rs			\
+	src/event_buffer.rs			\
+	src/info_event.rs			\
+	src/lib.rs				\
+	src/line_config.rs			\
+	src/line_info.rs			\
+	src/line_request.rs			\
+	src/request_config.rs			\
+	examples/gpiodetect.rs			\
+	examples/gpiofind.rs			\
+	examples/gpioget.rs			\
+	examples/gpioinfo.rs			\
+	examples/gpiomon.rs			\
+	examples/gpioset.rs
+
+
+all: $(LIBGPIOD_SRC)
+	cargo build --lib --examples
+
+clean:
+	cargo clean
diff --git a/configure.ac b/configure.ac
index ce6de99c1edd..e83eca2a5e14 100644
--- a/configure.ac
+++ b/configure.ac
@@ -199,6 +199,21 @@ then
 		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
 fi
 
+AC_ARG_ENABLE([bindings-rust],
+	[AS_HELP_STRING([--enable-bindings-rust],[enable rust bindings [default=no]])],
+	[if test "x$enableval" = xyes; then with_bindings_rust=true; fi],
+	[with_bindings_rust=false])
+AM_CONDITIONAL([WITH_BINDINGS_RUST], [test "x$with_bindings_rust" = xtrue])
+
+if test "x$with_bindings_rust" = xtrue
+then
+	AC_CHECK_PROG([has_cargo], [cargo], [true], [false])
+	if test "x$has_cargo" = xfalse
+	then
+		AC_MSG_ERROR([cargo not found - needed for rust bindings])
+	fi
+fi
+
 AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
 AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
 if test "x$has_doxygen" = xfalse
@@ -232,6 +247,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
+		 bindings/rust/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.31.1.272.g89b43f80a514

