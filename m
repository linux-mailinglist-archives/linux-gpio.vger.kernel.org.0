Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09A7A6134E1
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Oct 2022 12:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbiJaLr6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Oct 2022 07:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiJaLrz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Oct 2022 07:47:55 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7822FEE14
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:53 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u6so10480601plq.12
        for <linux-gpio@vger.kernel.org>; Mon, 31 Oct 2022 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibQIYKNHrvV99f8U/JaozemK8LCdkqYO52B0gI5m82c=;
        b=CvPzxJ38CUPkVYVAssYdZNkY/+dJfoZPwufMsKM5FhVghmfCScRybqr3noA65WLB4L
         ZtcUM1fA7OeeRedLhE7GDJ13YvqTE1s6whgMCPSNtlxGy8eLwSJaphOmziys6GgJLvo5
         e//HLr7iUB1nxB7JBR4V6R6/bw2dWmd+whf51ZBEJApZCFVa+Uedp8tcAupP0LStjlP5
         U9CaTdnwR4Jn+8mYWnWJhB30p+0A7cNX1+rkI2maQL7UrN14nsfT1ExvaSNz+Hwko84w
         eUxJcVBmKGRgs8TxgCXngKAo3yoHKSCRRQwuNd64XTOto7zRgA+DPV9WFUcoUGB79xMI
         o/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibQIYKNHrvV99f8U/JaozemK8LCdkqYO52B0gI5m82c=;
        b=OGohpCzhHje2v81ozkuQpgKKTHvjAYaaQ7gYM5NRzRm4AwgQRx/LxMUNsSXuSmdcaE
         9+XNH6MRfIzF2kC9L3KWHwg8pVRZ3NIkRVjUs2yRqHVUlSk9mThrnEFo8EeRB4mVvbHd
         GQdwW1P4MGgJwjDx/QNSj/nxPGRr3CqUxAj1NsUQWwbUMzRfbgprFnUYXeMN0VkZ/r79
         20RaGQynic/onMzdu6rD5DLd44d6TbN7HVK2TAlnjd7oHPB1CpfS2p+q/OnfR/iGH4Bl
         HimlBoBDKd+FU1ByInaqpMIqZpVhdLQ11CY4h8LIRrz62udPNCdjPG4fExbcdFkkmtTk
         OPhw==
X-Gm-Message-State: ACrzQf1DA2OfUzt56h3sM1oEYTpvLKFcvRnX12bajOrbCS31NKpBbhXu
        CUzs2Eqqh/899ZfMe9jfAJikMw==
X-Google-Smtp-Source: AMsMyM7m5RlZpHVSLgEZ2pLoDbj43yh3fZNhx2bFhm3kogjwQ9cNtgDbkmmjeILLGdFQnF0Hk96uxA==
X-Received: by 2002:a17:90a:b904:b0:213:f5ec:3915 with SMTP id p4-20020a17090ab90400b00213f5ec3915mr1886227pjr.33.1667216872922;
        Mon, 31 Oct 2022 04:47:52 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902ec8500b00187022627d8sm4311699plg.62.2022.10.31.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 04:47:52 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: [libgpiod v2][PATCH V8 8/9] bindings: rust: Integrate building of bindings with make
Date:   Mon, 31 Oct 2022 17:17:16 +0530
Message-Id: <97c5f431327191c4a222c7fc0f667c8be4004622.1667215380.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1667215380.git.viresh.kumar@linaro.org>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
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

