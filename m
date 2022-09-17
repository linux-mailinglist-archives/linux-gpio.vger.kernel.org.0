Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5285BBA63
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 22:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiIQUco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 16:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiIQUcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 16:32:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D9F2EF3B
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 13:32:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o2so38649211lfc.10
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 13:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=3+6GQ5E50X5eoNGp8c0mJDmnGuLJAekGItKKrg5+Qow=;
        b=ioAF4C8j/kbzFbU3olNBDkljPoUMH+IsOcGZLbY+Jhp/pOHrnvQvMU5+C4fB9bImpk
         pTXRQljLtmMJtbrQaF3mXpQgH1bdkthpqk8s0tz5EDX1oKfb2/EFo9/q7887Yd+jm51Z
         VvbqYMiPxqY8OznRe3zj8vEthRpcZ6u2p2H+zfagHYKF/f71eEdqrJiQVurqkKCEBIsC
         B6kpTQ4lD+f2iZdjR1fS1oxWzUNAdkOVz0UXMpP8Ka1jmRwxehN1VOL0tax2RtqMpMBD
         G0B6s0YcdOYBwdh3AvqQY848jjoF/YDA4BZB8PCBQsPonydRYsceYeLsEVmuGE9jHa2f
         pG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=3+6GQ5E50X5eoNGp8c0mJDmnGuLJAekGItKKrg5+Qow=;
        b=MZj++dQGx+pG/iwZo2bOmUA3G0N2mxMqXr4Q1odGgL4neI0/cQniOfSg9I9MS89G1w
         ky7dRUcTYyD1rMmDOZtqcAqs5adhLziKzUTguJWqy147A+clfRmxxrwBbl10XKYwZ8Nk
         qakNq3oXv5CPKS6bONrCkNPNVJC3CnFnZAaaM4S6yIo15C1lNyoCPTdHKCcNkyh3ummE
         uOmbhoPGZ98Zu/MAEQhrp6NGaye6GzN02WKA2oHQBGjTB6d4h81u0yM7EAqMvblNiqxH
         cB9PzBHfYccbn2mi7OgOSFdSFircJ75KucRSQL7EbAjQk5hEEngxC+lQgOQynBBs5i8Y
         ESsg==
X-Gm-Message-State: ACrzQf14DSZ9bOybRsgiV2dXoMBVmANnDYOFlRG+NFkfwyBnepnPxK82
        KRPUzbx7NNKIadl9hCP1nzpTmazFhDxXPw==
X-Google-Smtp-Source: AMsMyM7MHdikQqjAsD2BU77o7XHyNc3vJoYd/WrYLgMyO04705QuKQriPBM2gjbaZCyeiD7NDs147Q==
X-Received: by 2002:a19:651e:0:b0:497:aaa5:44c with SMTP id z30-20020a19651e000000b00497aaa5044cmr3437532lfb.280.1663446759106;
        Sat, 17 Sep 2022 13:32:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id p4-20020ac24ec4000000b004948ddb4e4dsm4253687lfr.301.2022.09.17.13.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 13:32:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/2 v2] pinctrl: nomadik: Dereference gpio_chip properly
Date:   Sat, 17 Sep 2022 22:30:35 +0200
Message-Id: <20220917203036.167607-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq data passed to irc_chip handlers i the struct gpio_chip
and nothing else. We are just lucky that the nomadik chip
pointer is first in the struct. Use the proper dereferencing
and helpers.

Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- New patch for a bug identified by Marc.
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 30 +++++++++--------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index f5014d09d81a..da426568bb8a 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -608,8 +608,8 @@ static int __maybe_unused nmk_prcm_gpiocr_get_mode(struct pinctrl_dev *pctldev,
 
 static void nmk_gpio_irq_ack(struct irq_data *d)
 {
-	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
-	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 
 	clk_enable(nmk_chip->clk);
 	writel(BIT(d->hwirq), nmk_chip->addr + NMK_GPIO_IC);
@@ -677,13 +677,10 @@ static void __nmk_gpio_set_wake(struct nmk_gpio_chip *nmk_chip,
 
 static int nmk_gpio_irq_maskunmask(struct irq_data *d, bool enable)
 {
-	struct nmk_gpio_chip *nmk_chip;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
-	nmk_chip = irq_data_get_irq_chip_data(d);
-	if (!nmk_chip)
-		return -EINVAL;
-
 	clk_enable(nmk_chip->clk);
 	spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
 	spin_lock(&nmk_chip->lock);
@@ -712,13 +709,10 @@ static void nmk_gpio_irq_unmask(struct irq_data *d)
 
 static int nmk_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 {
-	struct nmk_gpio_chip *nmk_chip;
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 	unsigned long flags;
 
-	nmk_chip = irq_data_get_irq_chip_data(d);
-	if (!nmk_chip)
-		return -EINVAL;
-
 	clk_enable(nmk_chip->clk);
 	spin_lock_irqsave(&nmk_gpio_slpm_lock, flags);
 	spin_lock(&nmk_chip->lock);
@@ -740,14 +734,12 @@ static int nmk_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 
 static int nmk_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 	bool enabled = !irqd_irq_disabled(d);
 	bool wake = irqd_is_wakeup_set(d);
-	struct nmk_gpio_chip *nmk_chip;
 	unsigned long flags;
 
-	nmk_chip = irq_data_get_irq_chip_data(d);
-	if (!nmk_chip)
-		return -EINVAL;
 	if (type & IRQ_TYPE_LEVEL_HIGH)
 		return -EINVAL;
 	if (type & IRQ_TYPE_LEVEL_LOW)
@@ -784,7 +776,8 @@ static int nmk_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 static unsigned int nmk_gpio_irq_startup(struct irq_data *d)
 {
-	struct nmk_gpio_chip *nmk_chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 
 	clk_enable(nmk_chip->clk);
 	nmk_gpio_irq_unmask(d);
@@ -793,7 +786,8 @@ static unsigned int nmk_gpio_irq_startup(struct irq_data *d)
 
 static void nmk_gpio_irq_shutdown(struct irq_data *d)
 {
-	struct nmk_gpio_chip *nmk_chip = irq_data_get_irq_chip_data(d);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(gc);
 
 	nmk_gpio_irq_mask(d);
 	clk_disable(nmk_chip->clk);
-- 
2.37.3

