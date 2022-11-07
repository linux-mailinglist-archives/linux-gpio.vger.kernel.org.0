Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B023061EFC4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Nov 2022 10:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiKGJ6L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Nov 2022 04:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiKGJ6H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2022 04:58:07 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7691581E
        for <linux-gpio@vger.kernel.org>; Mon,  7 Nov 2022 01:58:06 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id q71so9989151pgq.8
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2022 01:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibQIYKNHrvV99f8U/JaozemK8LCdkqYO52B0gI5m82c=;
        b=BMHG5+KCGkaCdE6pc9EZ61pvrv9TkGZCK2B8KMKBneys3M0RiS7ijHIJ3epbj1SCQz
         cGXsF4uurJjxiaveV+ZZ1V9onX3eax2eKGLaambtj7q6yF9eVdnYiAAEBZZ5kPHC3gFW
         nikrlkPwHVi4a1bP7rAhNoz19+hDrrxu711NG4qG5ZKXCtafcOtiDXQvMnCc7VsfdO7a
         tX64NjrPmiVOx64szdoZhEJwoyiSEYSHIjnSVjUa69I7ek7QAaaylNEKGlbu+g3Dz/zO
         gel8XxqU+WcgSIKfHoVlUDJ6ZAGv6V4m9SmShB26vIVao/xU83SxycT7dWrHJ7Z+4b58
         j74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibQIYKNHrvV99f8U/JaozemK8LCdkqYO52B0gI5m82c=;
        b=BqFQ1FgvgSKPsuHrMQef8GxDvL/KswVBSBC/Ms5Kp6VlfVX1qZhTgAUN8umjcHv78u
         6tah7MXuRmwmZis7mP5qq1gWFWu7KLFLOd0fUoXx5YLjXTX7Kh9nQwZKAstB9uxfna6F
         YGR5KaAzT7GGdFr7F8MsMjvWnokj4sygCyHjFQlUdvuH6nElPKQCMs+4smhk+5SKkt+r
         LB9TUL3/qGgb/muVWQmWYUwMsBEvTL6nid0PDwHOg1oJWkK5kwbkrd2RkEsnXcvKB8si
         U4Rxv8fc+I6k+MOImm71lHSV8H4AAy/aYVnfdqDQPKmjWUT8Y8HWgxvOBatKM7enwpas
         zo+Q==
X-Gm-Message-State: ACrzQf1hyZblNrI9DGT4OLP5CbTa19UnxRDv00loK+DW8YIEZizCGxLi
        tmq7Zbi31qIjv+yTF7jZPiuvmA==
X-Google-Smtp-Source: AMsMyM5knZXFVWdzGCNLcHuJQVLhohpQur4ND0qZfjlkmTQhEkIcDyLbj5I0nXhyiGj1LFOfWuV8rQ==
X-Received: by 2002:a63:1c52:0:b0:470:a4a:66b3 with SMTP id c18-20020a631c52000000b004700a4a66b3mr23537462pgm.573.1667815086260;
        Mon, 07 Nov 2022 01:58:06 -0800 (PST)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id a20-20020a1709027d9400b0018862b7f8besm4607785plm.160.2022.11.07.01.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:58:05 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod][PATCH V9 8/8] bindings: rust: Integrate building of bindings with make
Date:   Mon,  7 Nov 2022 15:27:34 +0530
Message-Id: <d914ccd91e1abb856779ace7a43d15bc510545ad.1667815011.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667815011.git.viresh.kumar@linaro.org>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 048b2ac7af8f..4a2cdb68b8b0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -212,6 +212,21 @@ then
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
@@ -249,6 +264,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
 		 bindings/python/tests/gpiosim/Makefile
+		 bindings/rust/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.31.1.272.g89b43f80a514

