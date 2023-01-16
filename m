Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924C266C37E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjAPPVi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 10:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjAPPVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 10:21:11 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCB52659C
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 07:16:51 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso3967177wmb.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+mL4L0xcPESJQvTN8KhYxnxWI1AKSYGpakjuOvVjoIk=;
        b=rsa7CsZjLedut9Va58uW8UrPQh9wpUkTkecL5nAJUKRAiJVttVOttaFWAgjwzj+KJw
         oJygsK8zVgKLYasydQWrCZwAyRDchV5LleBo4oEB+BqIgs6VAbpPdMuHrTjhNl6miFzJ
         iWmYj86BdJSdfbrehLarQYfIZ3/daOnOgJ9LzcYGfGIY/6AWwuDDmY57f4Wl/Spld7j2
         xvMOb9iIL6CIorm1uV4/O8uLJ03oC8Vn2XwkCi1sg3ezm/1Kz4rgb62oUPsNnsm4bCjj
         X8s8ll0JGRSc9Wz2tgQ1XLKtcN/lvA8dc9Y4N7rp2r0Vw61icF5AbZPgOrc4cGP65bXp
         l9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+mL4L0xcPESJQvTN8KhYxnxWI1AKSYGpakjuOvVjoIk=;
        b=nDWcUZLh/npNurzFtflSLxquB/VAO3Nypnt8PumieNJm/+PtFDTBe09+E35wVmiT9B
         1926LI9wwWIA6VijfKp1wqP4TSGNkI2QdlrxKrfnetsmDQvytA1us0fOqN6OkPXdMO3A
         vOg0w8KiEdlhWJM5sZ+g3T2eeLV4vSyTgaS7vodTYBvUHfxL32PIZ3/lStA9h2wRiv3r
         Xp+zhhxyi8HAVxqKWe8MjVKzkfGIx8URNuzMUQb8xONN5AULKFml5OS8uPoz8aqe777y
         va94MsneFKhE7+fpyiU4n99xTvHCT8jBSavmbWVl4oDAmrRLu44opE5w+8tjh8DKGS7a
         iMYA==
X-Gm-Message-State: AFqh2kogNHJkAC7mCNZUZKSHGCOccmRi7hSrJk2l2XH9FRHlCcKMLBFZ
        5S07/pm0JG7aN4XnZrJHEbS2xA==
X-Google-Smtp-Source: AMrXdXutKxv3sP1vKe1XEOm+HykS0wYNf5yGxNMHRvYG/1UtP1X3HFpCoUgcxvPlgQ4QCQcAuDH7yw==
X-Received: by 2002:a7b:c003:0:b0:3d2:bca5:10a2 with SMTP id c3-20020a7bc003000000b003d2bca510a2mr67191900wmb.22.1673882209818;
        Mon, 16 Jan 2023 07:16:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f9d:c271:2ba9:4f2a])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003db03725e86sm636892wmq.8.2023.01.16.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:16:49 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 1/2] build: drop unused python-related bits from configure.ac
Date:   Mon, 16 Jan 2023 16:16:45 +0100
Message-Id: <20230116151646.338282-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
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

We no longer use autotools to build python bindings. We should still
check the interpreter but let's not set any automake variables.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/configure.ac b/configure.ac
index 599c598..d305506 100644
--- a/configure.ac
+++ b/configure.ac
@@ -40,11 +40,6 @@ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
 m4_pattern_forbid([^AX_],
 	[Unexpanded AX_ macro found. Please install GNU autoconf-archive.])
 
-AC_ARG_VAR([PYTHON_CPPFLAGS],
-	[Compiler flags to find Python headers [default: auto-detect]])
-AC_ARG_VAR([PYTHON_LIBS],
-	[Libraries to link into Python extensions [default: auto-detect]])
-
 AC_CONFIG_SRCDIR([lib])
 AC_CONFIG_HEADERS([config.h])
 
@@ -229,16 +224,6 @@ then
 	then
 		AC_MSG_ERROR([python3-config not found - needed for python bindings])
 	fi
-
-	if test -z "$PYTHON_CPPFLAGS"
-	then
-		AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])
-	fi
-
-	if test -z "$PYTHON_LIBS"
-	then
-		AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])
-	fi
 fi
 
 AC_ARG_ENABLE([bindings-rust],
-- 
2.37.2

