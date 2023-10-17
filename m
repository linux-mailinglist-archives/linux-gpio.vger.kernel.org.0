Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625FC7CC258
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343636AbjJQMGe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbjJQMF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:56 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDC5D76
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507a29c7eefso3877685e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544308; x=1698149108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJw60bvTofR8qZvXWplxQFllGHB1oEM7kWCtPgsLTlc=;
        b=uSbNJi62ypO16TmTwo7X63ldRq28O14OUqM3J8XiqpFP+97o63RvUIfBLeYspZzWtx
         a7RFKvKBqJxYYSs7yErmXDPfEoeDXGVUNI8NmUuD5J+QELa2879syo/f5SzXlper4DeT
         nUBcOfv/EomnTsS4CgXHbW7E9yZaAgU5LaMN+r4oHSlNYwjCYd9rjtvgjbvDZ7NOVny9
         eyPkYUGqDieCeJGpu6RyiBdill2vjtyMt7bdE9vKJHLah3kvNslF8em+w0/Wp70KF1Rs
         UbI5VzihKbJKot5gXVgevA3ILB4ZSUHScIagXzhlvZGHHYqS+9P1uN5uDGBhBY69ysP7
         miqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544308; x=1698149108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJw60bvTofR8qZvXWplxQFllGHB1oEM7kWCtPgsLTlc=;
        b=Nk3MnRchKnbbc/GOZQlJ/KUi3JYYmubdqMib7mfw8zs/I6eWMVCikGVSrn0H2ZMPuk
         UkrULcZhJnauDyz9gBL2sirtVZq8FMGj/9CjdCueAm8APaREHx0bOrKIoG7iiUqi22kV
         +P/fZUl1JXgmePKVAd+vgBIbjV4I+iZbJxc0p9RSnQnMCGnm6GzKIwI72bZmm2V1MjYv
         I2zupZ0tneFn5eqLl5r/xys70yVuyntfdDgy5FN3GxY/aA1me809rU98GfFYGLjtnTQr
         yDIqpHcahOjz220tfC+sEBxVMOtPaw0Dpf4ZT85/zRCgXNHrFWxFOux0iMX9PTnhZORS
         gZOQ==
X-Gm-Message-State: AOJu0YygtTBBDeDqIxpcquxwc2M4UhlbaSTQQYx9PrgahxSDVQm7LK81
        mAcxHRkVZVUewkfQDGY+nYnKvQ==
X-Google-Smtp-Source: AGHT+IHLepSxDvIfZp7gFDezQH1gl/4yTCL9vjA9vC+7blRw7kvyufotAOsLm9SCIxMRMd+MHjG4Sw==
X-Received: by 2002:a19:6557:0:b0:505:7371:ec83 with SMTP id c23-20020a196557000000b005057371ec83mr1533434lfj.48.1697544308381;
        Tue, 17 Oct 2023 05:05:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 20/73] pinctrl: starfive: jh7110: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:38 +0200
Message-Id: <20231017120431.68847-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 640f827a9b2c..5557ef3fbeb2 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -547,12 +547,12 @@ static const struct pinconf_ops jh7110_pinconf_ops = {
 
 static int jh7110_gpio_request(struct gpio_chip *gc, unsigned int gpio)
 {
-	return pinctrl_gpio_request(gc->base + gpio);
+	return pinctrl_gpio_request_new(gc, gpio);
 }
 
 static void jh7110_gpio_free(struct gpio_chip *gc, unsigned int gpio)
 {
-	pinctrl_gpio_free(gc->base + gpio);
+	pinctrl_gpio_free_new(gc, gpio);
 }
 
 static int jh7110_gpio_get_direction(struct gpio_chip *gc,
-- 
2.39.2

