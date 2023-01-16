Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4724666C37D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjAPPVg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 10:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbjAPPVL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 10:21:11 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4044E1CF57
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 07:16:52 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so22384552wms.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 07:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiDSfvvVnpnlPivdw8/50/rt1TZas44bwqpU4QDG+KM=;
        b=MXFMmsp6IH4Ui26w9QQlkuO+QQZFU1BhPmTplhIIf6Ez7G3vMUelROvs78F96C37rz
         068+fRc7bRA8Ww2tCBtn1+jtNOaG4P1Zx/9Nav74bCJJmnGpyHal0ZMz2L44UIXWbuiG
         rCUPt2D5nvyDkiVi8SmPZWCRqTl++kWpozJ8V/RsSTs/3tdwIA1iUu11FqMsl6qdPxrC
         Wa55XIi/rjbSUr6v8Bd3EhYwBwctFHeCPm+FRGQQrX9C/zX/Cf92ABdb7dNDEHiTAQbW
         4c9ba9HaPrL/8fLX8egJ5exoJzGZZDEDc64jIExmpsXTQa+DX4oozhrp04SU39wu48zC
         NYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiDSfvvVnpnlPivdw8/50/rt1TZas44bwqpU4QDG+KM=;
        b=A7ATuKSvn1dAzYlK8xw9mV6ZUI0Oy+gnbebKszDioTSiL8cHF79ihq+vuHxBZ9SD58
         ChObtmoaN+o9eWu2r/xBy4eBlvVG8xKNudgxu8m1DC89KRjBvjqW9vqw6Sp+MQUFoE0Q
         PwwRA+2fvtF7Bd/MjfAtHaGO7F3s+mDQTNi9TRco2dIyezbl8neb9xdU0sTB9qoDq4dr
         TnmUgk+w077832z+Vm2dQS1SH9z3z/hI4zc94vVz1YytKA5EImRLwXkVEbOXw1Xns4kE
         mlAcIY0YFgL/ZG+Y7LVjQtBJCpYi7wD+NIlK2yMrtxz4nohCTqDmFcQ+ysXyXfqGD97X
         NMEQ==
X-Gm-Message-State: AFqh2kr3p1T4que1EAR2CYiXokZTvXQ9XjDrUz7RvQWnaynAhnJaPbht
        zMWA3wMeRycDylgZRLINsp/9IQ==
X-Google-Smtp-Source: AMrXdXvCoZduBzcjYnGugfB09zZs95/zp8X+9+1AiXkQd5s1cyB5+HB4ADHJR4DiI5gv0a7EC9k2aQ==
X-Received: by 2002:a05:600c:354c:b0:3da:fc7b:1f7b with SMTP id i12-20020a05600c354c00b003dafc7b1f7bmr3158225wmq.33.1673882210814;
        Mon, 16 Jan 2023 07:16:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2f9d:c271:2ba9:4f2a])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b003db03725e86sm636892wmq.8.2023.01.16.07.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:16:50 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] build: update the required python version
Date:   Mon, 16 Jan 2023 16:16:46 +0100
Message-Id: <20230116151646.338282-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230116151646.338282-1-brgl@bgdev.pl>
References: <20230116151646.338282-1-brgl@bgdev.pl>
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

We don't guarantee libgpiod python bindings to work with anything older
than python 3.9. Let's fix the required version in configure.ac.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index d305506..7b8c65a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -216,7 +216,7 @@ AM_CONDITIONAL([WITH_BINDINGS_PYTHON], [test "x$with_bindings_python" = xtrue])
 
 if test "x$with_bindings_python" = xtrue
 then
-	AM_PATH_PYTHON([3.0], [],
+	AM_PATH_PYTHON([3.9], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
 	AC_CHECK_PROG([has_python_config], [python3-config], [true], [false])
 
-- 
2.37.2

