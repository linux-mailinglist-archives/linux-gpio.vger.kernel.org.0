Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E4C645641
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 10:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiLGJQE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 04:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiLGJPk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 04:15:40 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44ECF31231
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 01:14:17 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso593561wmo.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Dec 2022 01:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=guZ21h4gKwlTdokC735AMLz0/cZxHGIjotDSFByxJ/E=;
        b=S1+D/S+1+nVhRcEwua6H0WcYITJFowMGN8zJ02XL2q5hdPXDpsRFIJZEdOD+leozFk
         iRo6as4vueea2tJOyYPFDEtnuVEg9mOdttEOJIbfRcV6qd/TyVMCYtJXZVHARS9PZkEx
         zwqDBWAzR6ZRW9+FlrS4ukT2QbrUSysQfAYsLotkkZyxh7CO6MUW7k8l6Wlqq3D67xC8
         ujaT0kG/oRq7ilHLn+t8X6tXS3qT0pXSt4d2v8rnZ/d480l6XeKe/qaokqjFZdTxvEV2
         x+d1tVLJNt9e7tielqsNh/kkQuNm0LvmPNAdaiu7DfoPpkYpOq28vBFvX5CdpWZye8Rq
         MaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guZ21h4gKwlTdokC735AMLz0/cZxHGIjotDSFByxJ/E=;
        b=jn9E/S24bWjNKFBwEU3/0Ne15AQSAU6iRJKgEWlM4asTDa7xulBFl38rdnO4JcJavn
         6evbZUplrONqGmeL+UjzjbpljX6a1Hn/Wj4qmHbpwHHG+W4WSZtqomp7YHAD3HvaGqbm
         5Kuh5ODOErai+dUx/XZ6EQNqA+kamz9hOgqtjnhPZN8sSO+grX7paNAWnld1nf0CkfKc
         NRQAu/ztXJCwPqmph/S2fSVu+pfFZI3qv0XaIXoTIMC8cmj6WZQoBefBhcF9EikAEp3x
         SDmmtRB7btZ8xf673wCb+rHq6S40hvopNBExrIz30vF1eN02xWkO0zNzhYtg36QP6zBa
         8pSg==
X-Gm-Message-State: ANoB5pm0B+dGYVHT0BhTxId5ek0DksOf5tTZy4H26OEqpWKOoOaz7axm
        zOowTVEJerIx7AoDKtO/pJZKJA==
X-Google-Smtp-Source: AA0mqf4xZNg2WVDylFn4QJuyBVHgqHHK3nk0zcvaF2gMxFNHV7bypMTWbVIKA/tIMfE50i+LwMgKdQ==
X-Received: by 2002:a05:600c:3496:b0:3d0:878b:d005 with SMTP id a22-20020a05600c349600b003d0878bd005mr512026wmq.41.1670404455712;
        Wed, 07 Dec 2022 01:14:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6baf:a66c:194c:fe07])
        by smtp.gmail.com with ESMTPSA id l10-20020a05600c47ca00b003c6b70a4d69sm944388wmo.42.2022.12.07.01.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:14:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 1/2] gpiosim: get the process name using prctl()
Date:   Wed,  7 Dec 2022 10:14:12 +0100
Message-Id: <20221207091413.61616-1-brgl@bgdev.pl>
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

program_invocation_short_name is set once at the program's start. If we
change the process name using prctl(), we need to retrieve it using the
same system call as program_invocation_short_name will not be updated.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac            |  2 ++
 tests/gpiosim/gpiosim.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/configure.ac b/configure.ac
index dc945ef..07706f0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -85,10 +85,12 @@ AC_CHECK_FUNC([scandir], [], [FUNC_NOT_FOUND_LIB([scandir])])
 AC_CHECK_FUNC([alphasort], [], [FUNC_NOT_FOUND_LIB([alphasort])])
 AC_CHECK_FUNC([ppoll], [], [FUNC_NOT_FOUND_LIB([ppoll])])
 AC_CHECK_FUNC([realpath], [], [FUNC_NOT_FOUND_LIB([realpath])])
+AC_CHECK_FUNC([prctl], [], [FUNC_NOT_FOUND_LIB([prctl])])
 AC_CHECK_HEADERS([getopt.h], [], [HEADER_NOT_FOUND_LIB([getopt.h])])
 AC_CHECK_HEADERS([dirent.h], [], [HEADER_NOT_FOUND_LIB([dirent.h])])
 AC_CHECK_HEADERS([sys/poll.h], [], [HEADER_NOT_FOUND_LIB([sys/poll.h])])
 AC_CHECK_HEADERS([sys/sysmacros.h], [], [HEADER_NOT_FOUND_LIB([sys/sysmacros.h])])
+AC_CHECK_HEADERS([sys/prctl.h], [], [HEADER_NOT_FOUND_LIB([sys/prctl.h])])
 AC_CHECK_HEADERS([linux/version.h], [], [HEADER_NOT_FOUND_LIB([linux/version.h])])
 AC_CHECK_HEADERS([linux/const.h], [], [HEADER_NOT_FOUND_LIB([linux/const.h])])
 AC_CHECK_HEADERS([linux/ioctl.h], [], [HEADER_NOT_FOUND_LIB([linux/ioctl.h])])
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 881ecc8..e2a97fa 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/mount.h>
+#include <sys/prctl.h>
 #include <sys/random.h>
 #include <sys/stat.h>
 #include <sys/types.h>
@@ -365,11 +366,14 @@ out_unref_kmod:
 
 static char *configfs_make_item(int at, int id)
 {
-	char *item_name;
+	char *item_name, prname[17];
 	int ret;
 
-	ret = asprintf(&item_name, "%s.%u.%d",
-		       program_invocation_short_name, getpid(), id);
+	ret = prctl(PR_GET_NAME, prname);
+	if (ret)
+		return NULL;
+
+	ret = asprintf(&item_name, "%s.%u.%d", prname, getpid(), id);
 	if (ret < 0)
 		return NULL;
 
-- 
2.37.2

