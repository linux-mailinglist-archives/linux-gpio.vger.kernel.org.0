Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD12E6F64C8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 May 2023 08:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjEDGN4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 May 2023 02:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjEDGNz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 May 2023 02:13:55 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92892697
        for <linux-gpio@vger.kernel.org>; Wed,  3 May 2023 23:13:53 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64115e652eeso10155281b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 May 2023 23:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683180833; x=1685772833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNK+GFYQNFfrXlO2P4DY/jJ+PwhqpeLTvSaR5hnoRsc=;
        b=E0dz5RM20FDVKsd/SLY2cOQbd3fTdeP1pdzub0HhYBvvtSldLPCiBwFqKeZ4YegaP/
         TaoiAQHOCW7re+Apzok1TJOvc6SAHSey1bO99GNuna6NBpXaTfPo1rseSYUAxHmkwtKZ
         e/eBPfV2UsBHeAA1U6YzaiLcigAyqZEBKQWmI8IlqsmSGwfDqe9FNFuKKeUrK2FJ2raQ
         NWiSvvj2THnMbyocUImcTGqVTMR1jqSJLVrZxaaiva8zXy9vUkzLFacvBmw0vUK56cAH
         4KOX1cYs7zT3vkR7KhFtSThZODmPr31vjQaqlmXIozqdKhqnscII+5bXcW/HNQ07/Uha
         kQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683180833; x=1685772833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNK+GFYQNFfrXlO2P4DY/jJ+PwhqpeLTvSaR5hnoRsc=;
        b=ZYqJlMS/zmqaQZFn583F7IlP/JOol2kODiPk682RG+Dllo03tTE6V98z+N0iguE9a2
         NyWdkBA2TAJvdaWWWWAe3/O/l99cxWaDuD5nmAEcOv5Gjctexu1R6poGj/dxSjtqH8vH
         WDL8Ba79zmdNQtdpdxliQzKmx/KH414SF+jkND9GVx8CutNimxrqn/V6oRG2xcZsQZav
         IoYatFNNKp6B750pFpF+anHbXfdhs4Q/th4OA4BSdjkKGJ1clgbIrYJUZu4BUV5mRUEt
         /6563K/s0A/WJUJT4im0ZYAxUpicx67T0Ps1Vsf+nP1kTWOcK8QLozTv4suzO937ByMq
         QgIA==
X-Gm-Message-State: AC+VfDzhCW1xRuO1WGNjNgYRb8z3fV6B6vGHMr8JYo4CTvK76+tdgAfE
        vkQ6to5QSUqQhJcBXgT3coNz5w==
X-Google-Smtp-Source: ACHHUZ4hFmmxf0M5EGFJXGNp3Gt4Cc9D6Zz6i9qxeYbKWEI58Temqu0vJB2ffgyTwXON0VJxohz7YA==
X-Received: by 2002:a05:6a20:4422:b0:f2:4c39:8028 with SMTP id ce34-20020a056a20442200b000f24c398028mr1218466pzb.21.1683180833218;
        Wed, 03 May 2023 23:13:53 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id m9-20020a629409000000b00639eae8816asm24506697pfe.130.2023.05.03.23.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 23:13:52 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] bindings: rust: skip building all rust crates by default
Date:   Thu,  4 May 2023 11:43:44 +0530
Message-Id: <7bdede8a77fd5868d19a255378bebfb2d7706bfd.1683180819.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We don't really need to build all the available rust crates here by
default, but only what's required by the libgpiod crate.

Currently we try to build gpiosim-sys crate as well, even if
"--enable-tests" isn't passed to autogen.sh, which results in following
build failure:

  error: could not find native static library `gpiosim`, perhaps an -L flag is missing?

Fix this by building just the libgpiod crate instead, which can force
building of the other crates based on the enabled configuration options.

Reported-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 bindings/rust/Makefile.am          | 17 -----------------
 bindings/rust/libgpiod/Makefile.am | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
index 1e01024b04ea..7903f828d87d 100644
--- a/bindings/rust/Makefile.am
+++ b/bindings/rust/Makefile.am
@@ -2,22 +2,5 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
 
-command = cargo build --release --lib
-
-if WITH_TESTS
-command += --tests
-endif
-
-if WITH_EXAMPLES
-command += --examples
-endif
-
-all:
-	$(command)
-
-clean:
-	cargo clean
-
 EXTRA_DIST = Cargo.toml
-
 SUBDIRS = gpiosim-sys libgpiod libgpiod-sys
diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
index 6b55d0d509d1..38f2ebf37aff 100644
--- a/bindings/rust/libgpiod/Makefile.am
+++ b/bindings/rust/libgpiod/Makefile.am
@@ -2,5 +2,21 @@
 # SPDX-FileCopyrightText: 2022 Linaro Ltd.
 # SPDX-FileCopyrightTest: 2022 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
 
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
+
 EXTRA_DIST = Cargo.toml
 SUBDIRS = examples src tests
-- 
2.31.1.272.g89b43f80a514

