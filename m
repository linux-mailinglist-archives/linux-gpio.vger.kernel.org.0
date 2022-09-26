Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8AFB5EA623
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 14:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236174AbiIZMbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 08:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236979AbiIZMas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 08:30:48 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAC01BE81
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:52 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id b23so6320608pfp.9
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5qGaiEFLaBnpGGmWZydBFvA7FCLNISeMhhUxsl1cBpk=;
        b=I1FjBjEsV1Lu8JdClQcu+GMN52BCiarmdgojz6/bBEIWZt7bR0VN/TiNBRn1DH4y3f
         Jj790ZQAbv0q5wfk7ax+VMEElHIkICxmDE+gSBef+vO7FV8z/GL4IXfK225LAPGrxcHX
         G35N4+97yBot1hsToOJZlhA09tNAOGn0O5APnLn7IXDXSbal+jIts5Mh07wkF2pIxjhg
         e5XZKs0693DK57KRHMvshXgV+eGze5Mp3bCw20+HxBmcw+wV1qPHB72NsUWXttTOMHdI
         wWJnqZHpYNz2pqxVNLDtoGB+MNkgXKKJbYCELJyXZ1Oxr6Jyt53ouHj/HbgRj4URixrf
         7GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5qGaiEFLaBnpGGmWZydBFvA7FCLNISeMhhUxsl1cBpk=;
        b=pgWwL3+nFwPAExMGUm3B/huAZgeMnmLSEqSIEdLmc/dZI7caVWqbd5FkTEvnGs5XyV
         1oxW0IbEGlaQWJSztLUiekVLXgs17OgWDhC1Oao3U6PQW3D7ujdzjO3Sw5YyaNb60Uch
         cf6E3xwSFHYpB8jij6Nn2VXCRfR2wEVUjNOyN4VUUrl2w7gd/vyBhU9icYxbCAQLZVrG
         f3O6Aqam5nq51BvHAPKEO6DFP3csr9Y+moQkEa7s1AgWbV7raHssDYjH7R+cmQm2VNnv
         6Os3VrwIL/NiHeV5cvQqLAMRGa1RePl1vkU0SzqgWOsvhOdo5KHVkcsjnIcC5mwQ7DwN
         V19A==
X-Gm-Message-State: ACrzQf2kER4DD4vBz6mkBIoFtUXzsXW2ax+xSFsH3buvgqETcYDJ6O4a
        tr2fzkR5bsYhVxMIenmAlGxMsQ==
X-Google-Smtp-Source: AMsMyM7hI3l2aPMTGOYpYs5CKvpyMVChYYt504+cqr0QGaDUak9nnE3AiE9tv6pkPrLobk2NUcgq8g==
X-Received: by 2002:a05:6a00:3287:b0:542:33ca:8bce with SMTP id ck7-20020a056a00328700b0054233ca8bcemr23007774pfb.20.1664190530713;
        Mon, 26 Sep 2022 04:08:50 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001709b9d292esm10750471plb.268.2022.09.26.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 04:08:50 -0700 (PDT)
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
Subject: [PATCH V6 8/8] libgpiod: Integrate building of rust bindings with make
Date:   Mon, 26 Sep 2022 16:38:20 +0530
Message-Id: <4beb7106a7fec40f4aa9541a2c04f7a652ba31ad.1664189248.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1664189248.git.viresh.kumar@linaro.org>
References: <cover.1664189248.git.viresh.kumar@linaro.org>
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
index 6ac1d8ed8a40..37cfdb3644f7 100644
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
@@ -246,6 +261,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/python/Makefile
 		 bindings/python/examples/Makefile
 		 bindings/python/tests/Makefile
+		 bindings/rust/Makefile
 		 man/Makefile])
 
 AC_OUTPUT
-- 
2.31.1.272.g89b43f80a514

