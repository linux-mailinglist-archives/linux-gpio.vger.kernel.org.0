Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647B266A55C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjAMVwV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjAMVwU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:20 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884E289BCD
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:18 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g10so16106786wmo.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf3VCHX9G7NEnm6DH5J+oX0WrIsiqfcIHSHFq9HHsok=;
        b=f57bzUxHI4FdG1+93JOTETjh1Y4o5qnb/fezZ0isN2oaroqx3crVWElxcEqNsirdmL
         qnmUVaOIncyIx5cZz6OUczgkmiPPrrkzsph1P5tw+3okDbSYg+gP56n2Dw5v6IGeXvET
         bnGuqTnIP97BEdn2a8E8KedrSZC6RJmCxv2Bh3Q5IA/4+HdelMGYXBr1IhC4km7KarL6
         6gUcuPlkgcdlPjLUUAZZXsr+Qh2ymnhY+ghAtxldZBWktKskt2nyyiRbq130Ud0MXFwy
         Fbs/ouLXdb98HjWmkMA/3Vy61T3fMWAUsWsAhW4kT4QXrU4Bc5+2KpANl2WnRXt+iKbn
         Jd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf3VCHX9G7NEnm6DH5J+oX0WrIsiqfcIHSHFq9HHsok=;
        b=i0/iasTOfFF3IiNLETC7YajThx8gXaC8QJU1RU8M8iPr6Pw3ckIMVTrImZJBkYRDXE
         EXY0HWRsKygfrc+DQ+9rgkM+Jb5y4udlf6N+wqtugJVZXvmmH+LSC1YhkbKzY0KVXudO
         twZqYLYK0aghth4A8YONNm6ZLs/sJmcpS73c+nSnxTw/XjIDGhZBKVxZesXICS1FCTqJ
         tuKzVPjWbtdZyjSncqPGvSqsJ7UCp2NilsgHSt+tp2Zb71C7DFpgYmYEH9QK0SoQ4/K1
         HO+5bxFJuFBEUidb/wth+D+fSheD653mCbdrsLWjYYW8xU7HUwBMzb01gNy07J09z6hR
         2fcA==
X-Gm-Message-State: AFqh2kr1AcWBssKJijoSeXcMszLvjyuYtGK1PCjDSeW7fpPVhT8IeZj8
        gbCZ/MQc0lXExBrSVlWFUHq4sw==
X-Google-Smtp-Source: AMrXdXug5/egwuoRcgMsnfpEIZLuuH6i1LGlVjKN6ajpkMDlYRI27MvRYGe0J0PTla0y0KTvbNKNHg==
X-Received: by 2002:a05:600c:348b:b0:3d1:fcb4:4074 with SMTP id a11-20020a05600c348b00b003d1fcb44074mr70800254wmq.22.1673646737083;
        Fri, 13 Jan 2023 13:52:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 01/16] README: update for libgpiod v2
Date:   Fri, 13 Jan 2023 22:51:55 +0100
Message-Id: <20230113215210.616812-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230113215210.616812-1-brgl@bgdev.pl>
References: <20230113215210.616812-1-brgl@bgdev.pl>
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

Certain parts of the README file still refer to concepts removed from
libgpiod v2. Update whatever needs updating.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/README b/README
index d51d701..894fc5d 100644
--- a/README
+++ b/README
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: CC-BY-SA-4.0
-# SPDX-FileCopyrightText: 2017-2021 Bartosz Golaszewski <bartekgola@gmail.com>
+# SPDX-FileCopyrightText: 2017-2023 Bartosz Golaszewski <brgl@bgdev.pl>
 
 libgpiod
 ========
@@ -30,14 +30,10 @@ allow an easy conversion of user scripts to using the character device.
 BUILDING
 --------
 
-This is a pretty standard autotools project. It does not depend on any
-libraries other than the standard C library with GNU extensions.
+This is a pretty standard autotools project. The core C library does not have
+any external dependencies other than the standard C library with GNU extensions.
 
-The autoconf version needed to compile the project is 2.61.
-
-Recent kernel headers are also required for the GPIO user API definitions. For
-the exact version of kernel headers required, please refer to the configure.ac
-contents.
+The command-line tools optionally depend on libedit for the interactive feature.
 
 To build the project (including command-line utilities) run:
 
@@ -51,6 +47,8 @@ arguments to it.
 If building from release tarballs, the configure script is already provided and
 there's no need to invoke autogen.sh.
 
+For all configure features, see: ./configure --help.
+
 TOOLS
 -----
 
@@ -231,10 +229,10 @@ interface.
 
 The minimum kernel version required to run the tests can be checked in the
 tests/gpiod-test.c source file (it's subject to change if new features are
-added to the kernel). The tests work together with the gpio-mockup kernel
-module which must be enabled. NOTE: the module must not be built-in. A helper
-library - libgpiomockup - is included to enable straightforward interaction
-with the module.
+added to the kernel). The tests work together with the gpio-sim kernel which
+must either be built-in or available for loading using kmod. A helper
+library - libgpiosim - is included to enable straightforward interaction with
+the module.
 
 To build the testing executable add the '--enable-tests' option when running
 the configure script. If enabled, the tests will be installed next to
@@ -251,12 +249,12 @@ The gpio-tools programs can be tested separately using the gpio-tools-test.bats
 script. It requires bats[1] to run and assumes that the tested executables are
 in the same directory as the script.
 
-Both C++ and Python bindings also include their own test-suites. Both reuse the
-libgpiomockup library to avoid code duplication when interacting with
-gpio-mockup.
+C++, Rust and Python bindings also include their own test-suites. Both reuse the
+libgpiosim library to avoid code duplication when interacting with gpio-sim.
 
 Python test-suite uses the standard unittest package. C++ tests use an external
-testing framework - Catch2 - which must be installed in the system.
+testing framework - Catch2 - which must be installed in the system. Rust
+bindings use the standard tests module layout and the #[test] attribute.
 
 DOCUMENTATION
 -------------
@@ -268,6 +266,8 @@ doxygen markup blocks. Doxygen documentation can be generated by executing
 Python bindings contain help strings that can be accessed with the help
 builtin.
 
+Rust bindings use rustdoc.
+
 Man pages for command-line programs are generated automatically if gpio-tools
 were selected and help2man is available in the system.
 
-- 
2.37.2

