Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD3667516B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 10:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjATJp0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 04:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbjATJp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 04:45:26 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF237AF13
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso3215527wms.3
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5+SW9LTuCmqNqI0GFaxRM/Jn8L/U60QiwU3h3L6sx0=;
        b=ByzD2BGq0uBG9Ieqmj4I1nCLvrvm/6DHMyScgZY2/RNSvYUDRVkL9YUP5CsyxfQCCv
         x4GNznjWKM91kFsg88m1uuiW7pAipqOk7yeRYPwAnILVwNSJpUGYCLhKcActqk2L28kO
         WgnScl9QYvcEfrXXTPNKQKfFjNuMGGl+kqZCrRKZpMkCRskwT/SJH9NKx2SjWIZbhVlS
         hlgKrjJz0CmBDBT/ZnuDSmruE1W5SspJ/4Nwtxi7n71myAdvZZC7x4a3N1GEkoXNDzmu
         canuKTWuRvhgJIAKXt7TmespVVjMhVSxfS6uk0rLL8Ra22fXOcrRorwmGPftjaclqYIl
         vLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5+SW9LTuCmqNqI0GFaxRM/Jn8L/U60QiwU3h3L6sx0=;
        b=PK1vyny0WYCI1lxIANtfwbuqxb9aNzhHCjPcAU4kMxNi24IywImyjwwqyyKN6p6QoA
         4i/Fd7RdSVy94ic0NY8j5xA7ELAqZg+DNFCvzOr7uNlyG6eStK7Ui9GaUuwdLtpsz5vn
         uyO91240nKggatbgWR90I/CQxypnJffSQBfVd6FuFaEqlEOYhYoaZXumwtfrNX0uGfJ8
         TsOogbreh72OaY3lk5ecqHZVWuUqfqAnMRElTKxGol90sjef4t43/GoHqWCTqtiBJzvi
         ji7ZlS4UwJHRenjLKbS+DF8QB4pY/+gl7xXxI612rFi6CIj1rUve+7xVUxjtsG3ZSuNP
         3bkw==
X-Gm-Message-State: AFqh2kqKScFRGVvmOUWzRDJWnb+TS6ZbmJ4kQbRB3PIYZg+lzbBacJOo
        9Wdqmj4kSVwe5bBMTFvldPG0Zg==
X-Google-Smtp-Source: AMrXdXsIrg4FxG22oWxbe/uDx6cB1y9XNKC2QkIpWLVqBvoK4+jZF+J1W8UDmS9hJ2fg4+Wz/I4i7w==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr9828598wmq.11.1674207922955;
        Fri, 20 Jan 2023 01:45:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:580c:7b02:3ffd:b2e])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b003d9e74dd9b2sm1800485wmn.9.2023.01.20.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 01:45:22 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 1/8] README: update for libgpiod v2
Date:   Fri, 20 Jan 2023 10:45:08 +0100
Message-Id: <20230120094515.40464-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120094515.40464-1-brgl@bgdev.pl>
References: <20230120094515.40464-1-brgl@bgdev.pl>
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
 README | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/README b/README
index d51d701..b71739e 100644
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
+added to the kernel). The tests work together with the gpio-sim kernel module
+which must either be built-in or available for loading using kmod. A helper
+library - libgpiosim - is included to enable straightforward interaction with
+the module.
 
 To build the testing executable add the '--enable-tests' option when running
 the configure script. If enabled, the tests will be installed next to
@@ -251,12 +249,13 @@ The gpio-tools programs can be tested separately using the gpio-tools-test.bats
 script. It requires bats[1] to run and assumes that the tested executables are
 in the same directory as the script.
 
-Both C++ and Python bindings also include their own test-suites. Both reuse the
-libgpiomockup library to avoid code duplication when interacting with
-gpio-mockup.
+C++, Rust and Python bindings also include their own test-suites. All three
+reuse the libgpiosim library to avoid code duplication when interacting with
+gpio-sim.
 
 Python test-suite uses the standard unittest package. C++ tests use an external
-testing framework - Catch2 - which must be installed in the system.
+testing framework - Catch2 - which must be installed in the system. Rust
+bindings use the standard tests module layout and the #[test] attribute.
 
 DOCUMENTATION
 -------------
@@ -268,6 +267,8 @@ doxygen markup blocks. Doxygen documentation can be generated by executing
 Python bindings contain help strings that can be accessed with the help
 builtin.
 
+Rust bindings use rustdoc.
+
 Man pages for command-line programs are generated automatically if gpio-tools
 were selected and help2man is available in the system.
 
-- 
2.37.2

