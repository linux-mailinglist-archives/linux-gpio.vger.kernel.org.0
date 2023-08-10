Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41FD7780AA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 20:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbjHJSsx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 14:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236135AbjHJSsw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 14:48:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A312B213F
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 11:48:51 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe5c0e587eso11736425e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691693330; x=1692298130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fTUPDmN0RD9c6UY4vIsx3EGQnwVaJ1NcVveybj1jxU=;
        b=sRQmvkuBRvzf8u1smjIZa1n+1bbMBgWXcr64EOZAqM1uWz8TQcTKf4d5dAaFWZZJQ+
         4Sk5nNOVpHyicup0HZRCZWBBwchE8TvmRbWQUsRYru9dlaPN00HZWRQRc9lfRtLY0A2z
         Ku5zyRhaHmeB6pi9tkavyjaySpg7iImyU2NdNvwklSkFtFyOHvJ51C0eScO5X3P1mjzO
         Usx05hEYTEqvpFCFTg8qyXteHCbDWKbo2r3Jwn/OzvpEqj0Xp/Q2joIWmzX/aNOWm4Kn
         M3rgdTlkPO6bpu7Bg6REywW4ma11sd5P5OqxFVW3eab5GjC0G3FEaeRuBq1d2J2Bkck7
         XrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691693330; x=1692298130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fTUPDmN0RD9c6UY4vIsx3EGQnwVaJ1NcVveybj1jxU=;
        b=FtmhW3oA9IlKE/kqx5wF/6BbRqZOGNjPo3FFGY6+S3qNVjlBXPtWxq5mrIrAnoSPwL
         cb/4F2oNzr3ill6KxE9XwF+G0CgYrBmVAGD+gxl8Txi6AkAGAKo/vkLiPNPOkt5oLCHo
         vzUtMbvPibteiQC55SntVcOa4t4885DX92hMuuSf/Cm2XtjSbWlPbyhnS3g3EO7GhVCX
         7fGATEhoqpDWGJS7U40FsqAz3scfrTOif2VOOUDc+tZ13pverLLXdlY6ToG0ZUBcYg+u
         vmcBQISEzPdBqACdQ5n79xi9fs4uX1A5cGT9V/QbTwMLHJp1S4iNIfmmMZFSCen1VELM
         yD8w==
X-Gm-Message-State: AOJu0YzxkXPuNCUHtYiZOz327TdDIoPaWVNUfCHZqf+Ojk37ORVTXmIc
        J/PuLaJRinjnrE0eyov0NM7iQA==
X-Google-Smtp-Source: AGHT+IG6S3NST8Htj5D8W3zweQCLcCSPKm5LqpqlIDS144P5GWnpftySgs62XyAI5L1gjgjQ0TN2Kw==
X-Received: by 2002:a5d:4683:0:b0:317:5182:7b55 with SMTP id u3-20020a5d4683000000b0031751827b55mr2813580wrq.42.1691693330004;
        Thu, 10 Aug 2023 11:48:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:74d3:226a:31b3:454c])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d6641000000b00314367cf43asm2960250wrw.106.2023.08.10.11.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:48:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpiolib: fix reference leaks when removing GPIO chips still in use
Date:   Thu, 10 Aug 2023 20:48:46 +0200
Message-Id: <20230810184846.22144-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

After we remove a GPIO chip that still has some requested descriptors,
gpiod_free_commit() will fail and we will never put the references to the
GPIO device and the owning module in gpiod_free().

Rework this function to:
- not warn on desc == NULL as this is a use-case on which most free
  functions silently return
- put the references to desc->gdev and desc->gdev->owner unconditionally
  so that the release callback actually gets called when the remaining
  references are dropped by external GPIO users

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- add a comment about why we can't use VALIDATE_DESC_VOID()

 drivers/gpio/gpiolib.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 251c875b5c34..2158067c4fd2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2167,12 +2167,18 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	if (desc && desc->gdev && gpiod_free_commit(desc)) {
-		module_put(desc->gdev->owner);
-		gpio_device_put(desc->gdev);
-	} else {
+	/*
+	 * We must not use VALIDATE_DESC_VOID() as the underlying gdev->chip
+	 * may already be NULL but we still want to put the references.
+	 */
+	if (!desc)
+		return;
+
+	if (!gpiod_free_commit(desc))
 		WARN_ON(extra_checks);
-	}
+
+	gpio_device_put(desc->gdev);
+	module_put(desc->gdev->owner);
 }
 
 /**
-- 
2.39.2

