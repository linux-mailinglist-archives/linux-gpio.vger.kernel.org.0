Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3D56D4866
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 16:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbjDCO2Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 10:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbjDCO2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 10:28:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7EE2D7DE
        for <linux-gpio@vger.kernel.org>; Mon,  3 Apr 2023 07:28:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m8so6326939wmq.5
        for <linux-gpio@vger.kernel.org>; Mon, 03 Apr 2023 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1680532098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c69I40asUiXC1/1NZRt23nN5G7jYoqWcWOA5d1uMQwQ=;
        b=sXoZEyrPhbM+5mRHFGVcpp9iYdHYSEcchjcr/hh5DKknIWT/01GERM/DEgvm/i20gY
         2ra4f0uTTcMFVSTpJutXk0hVvVeFE9sn2vTHwTPiOhMTKrAtyRHLi6Uii+ZUQF9HzLv0
         b8lSUlwTWcFwmMz5M1zcU2p7dMrCtfcX5bKJPc281hmfACBxQ/k0vY3BaNVlyK/m4fPZ
         lh8prwfci4D2AjfKi8Y+CZTJgOAar3x/eTcsymJWjgOcsNXuClWVtW3VEij/yNEXVCcw
         BH1y3nVsHBtLhpQFwPX98SrdwF33ZMqFd2vbLpo5vB7HpRY6ZvgK8LDvCDo4r4dsHyHT
         V1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680532098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c69I40asUiXC1/1NZRt23nN5G7jYoqWcWOA5d1uMQwQ=;
        b=FuQFUN9IX+jzi7AIQ5IOtEIdiW34p4b9n1YkE0cl/4O+zu4B54CDvVG9X+qgg3+BCz
         5JU6uYLDltlbmqKZu++lCBl6b703yAhhqGyLvgyRogH9Z+3fMKj4WS0Mw3x22/Or8OKI
         SQN5b9CzANEBOaY8Z7Ddshuly4MvcSkcR2npFmATUMhca3ORtK9xlMGUsrzMObesJaLZ
         VlTyLfUecjfYftnhqCfHq9+oWdBlBjAaCCXVu9Y9W09dmHLfRWM83W5oaufXj6mGDBS5
         GOogDyN3yO+cPD3Tthpy+UASqDxK3uadSWBISd5Kb4R+62GBy9ybXYauVr3ROylRgDmv
         HUVA==
X-Gm-Message-State: AO0yUKWxk5se/YR/95B4+fiwtME98KMnaVYkio/EInDvH5AIe9avInN0
        Vo7uVd7Kj2auCnlgIywmpoLXQ4DZbO5XJCxYpqo=
X-Google-Smtp-Source: AK7set+1f/bpKNODSoQJju3hqUWXpdzTwxf3nbPEzUDpmRXha0jwfDgZuZzUa44EmaRgkb19TloIJA==
X-Received: by 2002:a7b:cc83:0:b0:3df:ee64:4814 with SMTP id p3-20020a7bcc83000000b003dfee644814mr24761940wma.20.1680532098518;
        Mon, 03 Apr 2023 07:28:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3f82:f31e:2ae5:627c])
        by smtp.gmail.com with ESMTPSA id n5-20020a1c7205000000b003f049a42689sm8593805wmc.25.2023.04.03.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 07:28:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] tools: replace alphasort() with versionsort()
Date:   Mon,  3 Apr 2023 16:28:15 +0200
Message-Id: <20230403142815.183891-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With a high enough number of chips, gpiodetect currently sorts them
like this:

gpiochip0
gpiochip1
gpiochip10
gpiochip11
gpiochip12
gpiochip13
gpiochip14
gpiochip15
gpiochip16
gpiochip17
gpiochip18
gpiochip19
gpiochip2
gpiochip20
gpiochip21
gpiochip22
gpiochip23
gpiochip24
gpiochip25
gpiochip26
gpiochip3
gpiochip4
gpiochip5
gpiochip6
gpiochip7
gpiochip8
gpiochip9

Switching to using versionsort() instead of alphasort() makes it look
better and the order is more logical:

gpiochip0
gpiochip1
gpiochip2
gpiochip3
gpiochip4
gpiochip5
gpiochip6
gpiochip7
gpiochip8
gpiochip9
gpiochip10
gpiochip11
gpiochip12
gpiochip13
gpiochip14
gpiochip15
gpiochip16
gpiochip17
gpiochip18
gpiochip19
gpiochip20
gpiochip21
gpiochip22
gpiochip23
gpiochip24
gpiochip25
gpiochip26

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac         | 2 +-
 tools/tools-common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index 7d72c24..c1005a9 100644
--- a/configure.ac
+++ b/configure.ac
@@ -119,7 +119,7 @@ AS_IF([test "x$with_tools" = xtrue],
 	AC_CHECK_FUNC([daemon], [], [FUNC_NOT_FOUND_TOOLS([daemon])])
 	AC_CHECK_FUNC([asprintf], [], [FUNC_NOT_FOUND_LIB([asprintf])])
 	AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
-	AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_LIB([alphasort])])
+	AC_CHECK_FUNC([versionsort], [], [FUNC_NOT_FOUND_LIB([versionsort])])
 	AS_IF([test "x$with_gpioset_interactive" = xtrue],
 		[PKG_CHECK_MODULES([LIBEDIT], [libedit >= 3.1])])
 	])
diff --git a/tools/tools-common.c b/tools/tools-common.c
index e5f6fc1..64592d3 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -469,7 +469,7 @@ int all_chip_paths(char ***paths_ptr)
 	struct dirent **entries;
 	char **paths;
 
-	num_chips = scandir("/dev/", &entries, chip_dir_filter, alphasort);
+	num_chips = scandir("/dev/", &entries, chip_dir_filter, versionsort);
 	if (num_chips < 0)
 		die_perror("unable to scan /dev");
 
-- 
2.37.2

