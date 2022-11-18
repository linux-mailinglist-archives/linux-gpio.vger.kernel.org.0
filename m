Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EBA62F2E5
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 11:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241823AbiKRKqU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 05:46:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241824AbiKRKpz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 05:45:55 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D398E99E9E
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:23 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h14so4160677pjv.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 02:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYyhyDTZ+sdQanb+yJ4JxMcLpNW/0DRdVUu9jG+nxBk=;
        b=t0TYq00xg56phpMLhZ/azivhTuFhBYiELP9JdD5GWczKcLuk7weZszAbjZktYfQV6W
         J33cGDz4YauN/QLuWIuwiyevb9e0SJWf4M01JV8er7oTm6fRAYBpjuP69gouziy8wndO
         yG34vYCZwpMgrtm197um2UoIgmHNm6W3xTRwttQE6S4uvHwsPO5C1g1OtCZbkZ08VMPb
         ldZDX3NbuubHk/CTHF1fiOBMp8T/589sD/yyYyIucLZUusuYpcTXA4IapoHJ3Yvx5fh0
         VZ6X+ZX4l1At2xvH/Xtd/K1b69icnyC731A/IaCT4sSttiPgJd5g0jINL+anQ/mLXDLZ
         Jl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYyhyDTZ+sdQanb+yJ4JxMcLpNW/0DRdVUu9jG+nxBk=;
        b=NoN/thnLUehvgdXRXajWHh52s/nCTUujCIHwjNkGRoRIuHBG/2gS5MCwU79D5mFMdy
         Y6dfiwA5zBRa9QyT7QJvG7nNxi93ANqS0flvkwyhnkSa4gsONAg/DKu4jUHND0eLjPb5
         IzYDtWreA8DtgQEIMpkJpIBxynt13Q/zTRyKDtdblQKcWeC69ijItJTnhsjm7bKvaBXD
         bGTGPD2gF/DsL9WZ42cGq+7bEwSmcf+/PtBxHFWCrWJhDDzB+02WaG8dFXWrTw9S/xoE
         XO8KaOHE9gn8xloe6aFINfWXzUdbXchHBGqznYFiz3E/vJYGbjbzXbxjpYh5pjPbIcom
         hZAQ==
X-Gm-Message-State: ANoB5plxXtQh+ZJLN/nWmTjYqtmmmUoUxwrytUXo4H05Wpaq9pq5iuE8
        11CuI7VX0quNrYjYizq9UoIHgg==
X-Google-Smtp-Source: AA0mqf4OZELvaDlhd0k6pFREwq9R7kleD85+tdXc81hSkObZPuVsahdpzlNySk4/ANeoZccNjBZ5/A==
X-Received: by 2002:a17:903:182:b0:188:a40b:47c9 with SMTP id z2-20020a170903018200b00188a40b47c9mr7057568plg.75.1668768323344;
        Fri, 18 Nov 2022 02:45:23 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id e7-20020aa798c7000000b0056d98e31439sm2927731pfm.140.2022.11.18.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 02:45:22 -0800 (PST)
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
Subject: [libgpiod][PATCH V10 6/6] bindings: rust: Integrate building of bindings with make
Date:   Fri, 18 Nov 2022 16:14:42 +0530
Message-Id: <e2ca9ec7737d42e10fa389c8549efd19a61856bf.1668768040.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1668768040.git.viresh.kumar@linaro.org>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
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

Reviewed-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 README                    |  8 +++++---
 TODO                      |  8 --------
 bindings/Makefile.am      |  6 ++++++
 bindings/rust/Makefile.am | 19 +++++++++++++++++++
 configure.ac              | 16 ++++++++++++++++
 5 files changed, 46 insertions(+), 11 deletions(-)
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
index 000000000000..a0d0772b01cb
--- /dev/null
+++ b/bindings/rust/Makefile.am
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Linaro Ltd.
+# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
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

