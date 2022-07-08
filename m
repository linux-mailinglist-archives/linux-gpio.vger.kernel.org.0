Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F86D56B899
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 13:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbiGHLf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 07:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237731AbiGHLf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 07:35:26 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4585F88F26
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 04:35:26 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d10so9529112pfd.9
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 04:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vqIR+uSXHOhVHHUZbf27VLh2KEaBPzoLiCQTSRtyybk=;
        b=aiYFrymodhm5n+hXkpdhYbA2btJ7X8ZQUnfFiVOWZAU8vnTr2cxkQCMSVJaLxLwfZr
         S6pqcE7OuUp+9xjF1pozU/os+O/BVBLMX6jsvKyKNAObpr3t+z9wXk4VkaZq0ItA9Ibv
         nOL6XaHOp+v2MVsD1rKf99HC4CgLgEzgbaxDSDrg3Gvi8Tid5lsLZV60R+HLwDYRDxDj
         B1sN82aK9RKQxvoAxcpF4+HW7dLCJ3zuxEhgXBaE6dvOf9MHWRRC4G/i3I9DtIhmLdC6
         8ETfW3nvTPfkS205i/feCa/9xhZmUPzOFMkTl4v+OZVaXSb0uK21UrjYL4czFCyR/ba3
         rXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqIR+uSXHOhVHHUZbf27VLh2KEaBPzoLiCQTSRtyybk=;
        b=uR/rAQt0iGpqh5sJ5yK6CjSrOx5VJFHGZofzq1tE3iNdejMl2YcNV9UUVgpKLyQ4Kt
         V6S13r4POwMmi5C1dqMClVdTXPf8BpEGgBZgkEWczxRBRtpdkqAS/XeT2+/M1IM2Bwv1
         +UA0QRaoLvQWQuvgvhyXNMQaDG3kNfyPifg1+2fUk0zLIELKZpumie4nmYY73IcX7o9O
         3xTzcdYU9kwvp+nBeERiKVO8xrZC6xNuuEelF2U/cKlgCSrHwhcoQxFgN0ye9cu1B4iH
         PtUssojTgZTtELRHB8krlAmMSv+vB16oGJT9ybgx2zlncw474c+wI4UDxxFJu95UQRl1
         cZOg==
X-Gm-Message-State: AJIora+w9cYjIoUhRscAXEPeV0BtJE53bU4tOQqmUi4WkNZMZuKD4+n+
        btygRq2syFpWoJN6GudnawEgpA==
X-Google-Smtp-Source: AGRyM1sE068N0U8uzbQrICPesY45Z7SQRbHSvJq/S7RpJrWzX2qJLlNMTBHoNmqgbWXYES6JGBiuDg==
X-Received: by 2002:a63:a1d:0:b0:412:9d39:3af with SMTP id 29-20020a630a1d000000b004129d3903afmr2820593pgk.45.1657280125800;
        Fri, 08 Jul 2022 04:35:25 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id g62-20020a625241000000b00528e84c3093sm2253663pfb.143.2022.07.08.04.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:35:25 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings with make
Date:   Fri,  8 Jul 2022 17:05:01 +0530
Message-Id: <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657279685.git.viresh.kumar@linaro.org>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Lets make build rust bindings as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 README                    |  8 +++++---
 TODO                      |  8 --------
 bindings/Makefile.am      |  6 ++++++
 bindings/rust/Makefile.am | 18 ++++++++++++++++++
 configure.ac              | 16 ++++++++++++++++
 5 files changed, 45 insertions(+), 11 deletions(-)
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
index 000000000000..79a52bc691ae
--- /dev/null
+++ b/bindings/rust/Makefile.am
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
+
+command = cargo build --release --lib
+
+if WITH_TESTS
+command += --tests
+endif
+
+if WITH_EXAMPLES
+command += --examples
+endif
+
+all:
+	$(command)
+
+clean:
+	cargo clean
diff --git a/configure.ac b/configure.ac
index ab03673589e9..8458f734a606 100644
--- a/configure.ac
+++ b/configure.ac
@@ -211,6 +211,21 @@ then
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
@@ -245,6 +260,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
+		 bindings/rust/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.31.1.272.g89b43f80a514

