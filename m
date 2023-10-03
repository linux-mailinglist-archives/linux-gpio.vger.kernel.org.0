Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026437B6C4A
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Oct 2023 16:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240300AbjJCOwT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Oct 2023 10:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240302AbjJCOwJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Oct 2023 10:52:09 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDD3CD5
        for <linux-gpio@vger.kernel.org>; Tue,  3 Oct 2023 07:51:45 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40572aeb673so10692455e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Oct 2023 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696344703; x=1696949503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCaaX+GBykmnpaZwjrwxwJTXEqzANHLF7xpPc5hlhz4=;
        b=wxd/Ecn0vq1plLPGtGUk9IDCYFoJKOcuyIX4NDc5eewKHGGx6X80QxwMBDFg49QMe3
         NKkDUmBjMoO1hRUwxirY7v3jUxnhXNReAVeI41m/sWC6kOPFInxMHU52aoBZAZO/qqGk
         EmQEb8R6z8s4erloy8GGwh166U0zzMvZSB92x5p+EfkHu5j7/AJLyJsOQRFawROHDlHc
         bPGPuBjnBKy76FXE0NksckAdahVCSZsAmEUhbJu5yKm6qcBvII+3O1ZLwdmJluc2Hscm
         nQ1jnWkvnGMsTd1aX6hNVKjbj3NNIY63XqL22QPdeuHXT+IPZuaF9aIAulkY9kEETJn4
         jgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696344703; x=1696949503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCaaX+GBykmnpaZwjrwxwJTXEqzANHLF7xpPc5hlhz4=;
        b=G4uvZgZACQR1/ojz0u1Uqd+BM2In4F15pLuquR4EZ2+z8c8aK0O1F7qWNQdrCWUA6t
         sNKf3uhAtgiG/nh4diw/cRrjGuENqlHre52Vj420oYm/lO39cJMoWdA1oPzP1yu2O+wW
         tvwHrNCpXc9/dvvYHf3qi4VFza65xpqtb8g74yKv6ZMFiv47zCkmEe43LGPD0p31+D2p
         dJspuvY9+pNjJVLUNS0XiAFUQNUVi8Yt8R2RGRcSHzIi/GsGGI2ffs+ff1eFRP5kXPpU
         A6UBWosWUy1bhMABUOA7NCaQOc54BDuXph0kinKcJOumHCeIv6dXNu1BwzXE2N7foEpk
         Dkqw==
X-Gm-Message-State: AOJu0YyUgwQMmgGsfbGeWLmRnfZylVlBlyXsaZPEhTNZiYp0c2rB+cc3
        AJBe4xl+ezC36UUL3+5ZXi46bwGlKMS96u+p9LA=
X-Google-Smtp-Source: AGHT+IGd2nuDhoy1e9pdOBTGIgpwZjoPD5UKeWOvc84hA4lesOn6AvOox3r5S7NyZYBOA7TUEEOZDQ==
X-Received: by 2002:a05:600c:c9:b0:406:3fda:962c with SMTP id u9-20020a05600c00c900b004063fda962cmr12271371wmm.31.1696344703371;
        Tue, 03 Oct 2023 07:51:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1f2d:3479:a5de:fa35])
        by smtp.gmail.com with ESMTPSA id c15-20020a05600c0acf00b003fe29f6b61bsm1462773wmr.46.2023.10.03.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 07:51:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 25/36] pinctrl: cy8c95x0: use new pinctrl GPIO helpers
Date:   Tue,  3 Oct 2023 16:51:03 +0200
Message-Id: <20231003145114.21637-26-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003145114.21637-1-brgl@bgdev.pl>
References: <20231003145114.21637-1-brgl@bgdev.pl>
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

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index fae80b52a6fc..8c6006353515 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -554,7 +554,7 @@ static int cy8c95x0_read_regs_mask(struct cy8c95x0_pinctrl *chip, int reg,
 
 static int cy8c95x0_gpio_direction_input(struct gpio_chip *gc, unsigned int off)
 {
-	return pinctrl_gpio_direction_input(gc->base + off);
+	return pinctrl_gpio_direction_input_new(gc, off);
 }
 
 static int cy8c95x0_gpio_direction_output(struct gpio_chip *gc,
@@ -571,7 +571,7 @@ static int cy8c95x0_gpio_direction_output(struct gpio_chip *gc,
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(gc->base + off);
+	return pinctrl_gpio_direction_output_new(gc, off);
 }
 
 static int cy8c95x0_gpio_get_value(struct gpio_chip *gc, unsigned int off)
-- 
2.39.2

