Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D0B77755C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 12:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235321AbjHJKF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbjHJKF0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 06:05:26 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE3435A6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 03:03:42 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307d20548adso698703f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 03:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691661821; x=1692266621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YLNyJJxImTMb77ahFur8tDBev0QNJcAaI7522FZEALk=;
        b=PlIAOobjw8RO1syhEZGreHmiYYCyih1N4G+s7Dj7XxyEwxEQ8eexmopxNiWGDzxPbA
         +IWcGLpL0TdnAkaki91WK84gRTvILCv2p9lUNwAKONjMdTg7HrYo+L9CadlW45FDm661
         AqTa4Q9no8Nq7qxXsOxVa8yHPgCjia8ZN1PQuZKMS+6Ka5V6aMyFY1miCutGkY/TNv4c
         jcLbvWQGkTkjqUi+A+wuQymMm2w2nIxeav0jpNcnb7GoB7Z0PW135LF8lFxigpVssDr/
         wMuONd0rUh//AuaTsgLF+NCubgHKSEGOCNUDVmzhHqa1Lspcu1mOm7O4rWnRZXaifvA1
         u1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691661821; x=1692266621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLNyJJxImTMb77ahFur8tDBev0QNJcAaI7522FZEALk=;
        b=PMw68W3EQp2GQUzN0ffnwcb+sQT8+k5sUOEC4OA21nuIbbvmDwmm3W8z84DldcIJ/g
         ZrXoxYNhNyuBB67cZ1XAi1EcXnavsgcYVEtwLOVlWPHJPvp23Y1cOeH2r4YsUQmzz422
         v4OKlqXU/6WsX1jvCrgQu5SYDRR8wC1IACIIuLhEtsYpzf+uQThA5wNgQCbXsY4xTyMu
         rUp1IyMvScevkfkPGahtIkSLMLtRN+jcGox3gk1dSu0OUhoII6XH6ihL0jKulG9OCIPO
         TRsBgTQuH1iM+sVeC0DzZGiGwy2CxAglNy5tfWcXSSdz6Ui0CDI3IncrPsBe88weerrT
         vtCw==
X-Gm-Message-State: AOJu0YwAWHFsn3ZcUEcdX75DDGCHgWViNcEudwpMQFLNBanNdTel/fWu
        0EHfcJYac9NftT3F5MeGlJoHWE40fst3jA51dN67Mg==
X-Google-Smtp-Source: AGHT+IFP3dkfs5TTjEQlwRat/KlFvZxnefHBn0Av+woaGf4/4Jq6wLVZl0GlRBSaVAPXhsZZh8t9Ng==
X-Received: by 2002:a5d:6584:0:b0:307:8c47:a266 with SMTP id q4-20020a5d6584000000b003078c47a266mr1322416wru.61.1691661820693;
        Thu, 10 Aug 2023 03:03:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:74d3:226a:31b3:454c])
        by smtp.gmail.com with ESMTPSA id s7-20020adfecc7000000b0031912c0ffebsm891135wro.23.2023.08.10.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 03:03:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: fix reference leaks when removing GPIO chips still in use
Date:   Thu, 10 Aug 2023 12:03:34 +0200
Message-Id: <20230810100335.9330-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
I'm going through the resource management issues one-by-one using the
new virtual consumer module. This is something I found when I noticed
that IDA numbers never get freed for a chip that was removed with descs
still in use.

 drivers/gpio/gpiolib.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 251c875b5c34..7408e2561b2d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2167,12 +2167,14 @@ static bool gpiod_free_commit(struct gpio_desc *desc)
 
 void gpiod_free(struct gpio_desc *desc)
 {
-	if (desc && desc->gdev && gpiod_free_commit(desc)) {
-		module_put(desc->gdev->owner);
-		gpio_device_put(desc->gdev);
-	} else {
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

