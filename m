Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1F947A875
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Dec 2021 12:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbhLTLRT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Dec 2021 06:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhLTLRT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Dec 2021 06:17:19 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB7AC061574
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:19 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id o14so7825714plg.5
        for <linux-gpio@vger.kernel.org>; Mon, 20 Dec 2021 03:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QMVe28OO0OCZDw3TcthevdePGi3h09b4OI/egNb3mqw=;
        b=Sp3kx5lZi9lCfpWhLPFSAR5rlzGqha74FZkn4tVLP/dp+r/kSSCe8goVD0Ii3dfT4y
         zhv2BmDmAmLrlRkKaNYtnZ7I/B/SXa6jwtdBTXWSaGMMMngEPQMkW8Zq9Qlp7ins+Q6K
         OCuSr3QVgNRInXjDPPXU2eKTgmWFAFh/es8bRzI9o7TluM4z3RsQdxT1p92MqBaxrB5I
         qJtJ27uet1N0qaUsWa1vvP1cn25oG1kMfALkIR7RbdMhWYr244CCDHDuAEUQxic4OFGl
         xbMuqYMscnqTpzi2Bxe3dHkXzMdEkKD5kL5tWwAPk69hybkttsryT05/0vBHOofkNROe
         jK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QMVe28OO0OCZDw3TcthevdePGi3h09b4OI/egNb3mqw=;
        b=ISFs5G5bTuehjf/89BktcPpVhrMsmVnDH14508Eo/j/lqtJ1MphL93/eC8PPtaUpmb
         df7+N+d+we0nJMDTjia9fnErAvLq/PMi/Xi2s1/NmQj7oEqxKSCzB1sWzaYLqjZC+2UX
         6fmtpRFylzPMXFW/cFOgg57/a/Do4e99gLz1/sa4PA1zaqFw/teQLn0XuwEM0CYp3RHF
         BTG51rLUNniFeCMYZjTAwOw8qVAGQc2LLuSeY+dzK5dygF8rt/04qE5bkF6rBJbW7wBa
         xo0OeTV/R+W4enKva8H6NVtgmPmdX209vr0WyTXw6FE79RoxjVwY0VTVltV5Qoa6OVRT
         5l1A==
X-Gm-Message-State: AOAM5325WY2ZZ26aQKO1pv286GrGoaoiS1+k24I50WHrB/xP4YBo08ms
        KvKboKMdLFikJh1gRpcSkE6FkQ==
X-Google-Smtp-Source: ABdhPJyiXw23mEPeZk+HiporFRnPz3GIKZI/nSTvJH+3q67w8RTcn68vJSAFV8Y5r2X242D8/s6Ypw==
X-Received: by 2002:a17:90a:a083:: with SMTP id r3mr27162124pjp.55.1639999037818;
        Mon, 20 Dec 2021 03:17:17 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id l22sm12065153pfc.167.2021.12.20.03.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:17:17 -0800 (PST)
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
Subject: [PATCH V3 4/4] libgpiod: Integrate building of rust bindings with make
Date:   Mon, 20 Dec 2021 16:41:38 +0530
Message-Id: <b32cabbd8c1b8ab51bc1984e6a84409f20b0958a.1639997241.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1639997241.git.viresh.kumar@linaro.org>
References: <cover.1639997241.git.viresh.kumar@linaro.org>
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
 bindings/rust/Makefile.am | 27 +++++++++++++++++++++++++++
 configure.ac              | 16 ++++++++++++++++
 5 files changed, 54 insertions(+), 11 deletions(-)
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
index 000000000000..9799f0036e2f
--- /dev/null
+++ b/bindings/rust/Makefile.am
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Viresh Kumar <viresh.kumar@linaro.org>
+
+LIBGPIOD_SRC =					\
+	Cargo.toml				\
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

