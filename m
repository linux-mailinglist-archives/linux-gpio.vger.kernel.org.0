Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587217CC288
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbjJQMI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235067AbjJQMH1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:07:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5748026A6
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:46 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso2765375e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544344; x=1698149144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7vwTYIFniGiyz7XRLA7xg+vLp9rwMPLvTrSR1tRaqM=;
        b=nukhAjCGdeoLzDn4zvxP8sKIiwsjZzUizJ21uBsT2vzDuxr0gbiWrOmMFjWrYgnFC9
         S1w4vqEJM8u6MkhL2xUAX5yaLffzgmWIN0srq+r2Evi0cTDyWzZUc27bX+N218TwhrLJ
         FGOIxkrjCwBtfmUIpFSXetwqAKrE/84XcDUpfI5XdckWQPPxvQ0vKtEOVGNZT/O0UEZG
         ghwbtAHY1nq5jRW1tVWBZhQdaCeMU9Y6OPe91b5444CjwbFAzOqFXjYOSOegQjI9qlDL
         TAvbwnpRBrC+6MoLkT/UX1i+KiZ/JVko6yZlX2/GL1ls86ahYi8d/nGiWR2DgILipzG/
         fqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544344; x=1698149144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7vwTYIFniGiyz7XRLA7xg+vLp9rwMPLvTrSR1tRaqM=;
        b=Zqf0+7P3wlpjzqWAIZlmz+c6bDKsVrLNW0wb1cTUHocEMLwP1BHPTQE58xbEt2DvFl
         36VGJS8E4gYcYz9nnPqHD4KXIhmzCbOMLITzaRS199wWzvQ+EIOVnrnsA8vJweeFGZ5n
         /4WwUtRCUYH5a3NWqsFhAJpjBVCDxAmMFKkljeheV1RXNZD5IAoN/+a2kK5Lud3eho/3
         G2cz6V3ZWoS+LGcr3qdKrynoGwlV84qLqjA90IIcs8jBIlYCd72nK5Cy7BULLEtuNATa
         xKym9D7U+tn9NG9HeQywpCPmaGSjxfoINesMhmCy3iQB3zF4cqbxMqKNc4Tft7RMuHtg
         AWCw==
X-Gm-Message-State: AOJu0YzwaFv1KYYeiJ/uBBXzNEIpFVegR3OPKBJjMtIwNjLtuvijl7pF
        9Pw/0C8116N3UADt6WbRC1i/PQ==
X-Google-Smtp-Source: AGHT+IFIgfi7pZ3g+7aVZOm45Ji9thDsax/eelHNrrvfzHb5t4na36ifzcVgwLAo0t47nAKQBKWORQ==
X-Received: by 2002:a05:600c:3b82:b0:406:80b4:efd5 with SMTP id n2-20020a05600c3b8200b0040680b4efd5mr1581862wms.14.1697544344711;
        Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:05:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 58/73] pinctrl: as3722: drop the wrapper around pinctrl_gpio_direction_input()
Date:   Tue, 17 Oct 2023 14:04:16 +0200
Message-Id: <20231017120431.68847-59-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
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

pinctrl_gpio_direction_input() now has the same signature as the
wrapper around it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-as3722.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 5ebd1939663f..6a5f23cf7a2a 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -500,11 +500,6 @@ static void as3722_gpio_set(struct gpio_chip *chip, unsigned offset,
 			"GPIO_SIGNAL_OUT_REG update failed: %d\n", ret);
 }
 
-static int as3722_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip, offset);
-}
-
 static int as3722_gpio_direction_output(struct gpio_chip *chip,
 		unsigned offset, int value)
 {
@@ -526,7 +521,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.free			= gpiochip_generic_free,
 	.get			= as3722_gpio_get,
 	.set			= as3722_gpio_set,
-	.direction_input	= as3722_gpio_direction_input,
+	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,
 	.can_sleep		= true,
-- 
2.39.2

