Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7525479E8
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jun 2022 13:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234722AbiFLLYC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jun 2022 07:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbiFLLYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jun 2022 07:24:01 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7494FC5A
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 04:24:00 -0700 (PDT)
Received: from terra.. (unknown [IPv6:2a02:a03f:eaf9:8401:aa9f:5d01:1b2a:e3cd])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 51C9A2E6B8B;
        Sun, 12 Jun 2022 13:23:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1655033036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=eSUapk17NBllvNrC69eum4Deeo6pZ/m671Rq1flgQIw=;
        b=7azhbMoTOZNzsauEzNEz0+mIQpTo9TY7k+Q51CV5lSJWpXbqlTTLxCoU52BhZ3CUAm5fWK
        XjFV/2w/Wof+cZRphrsHQVCkeqAqjHW3SdvWjmFqW4vvG1wV8EZOh5et/8kQyKhYPWnocU
        j2fPtAPml4gwt6KojBBpfL0JcxFSNva5higr7fOrVOQJcMAUp3UcDjBkxcrOZGFREXGJSH
        c+Q2AXn4Yx8//YvSO6km0dH8pFMc8UH0HIsmLKXmNdxGHYrcsKfBjKwHr+InaD1A7v0p1H
        D+m4si2LnmdWNHxZpv0ATqUE50sRU+K+t+65aG9uUuBTxej6Vl/Jt9ppjgdyCA==
From:   Sander Vanheule <sander@svanheule.net>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v1] gpio: realtek-otto: Make the irqchip immutable
Date:   Sun, 12 Jun 2022 13:23:09 +0200
Message-Id: <20220612112308.320447-1-sander@svanheule.net>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") a warning is issued for the realtek-otto driver:

    gpio gpiochip0: (18003500.gpio): not an immutable chip, please consider fixing it!

Make the driver's irqchip immutable to fix this.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 drivers/gpio/gpio-realtek-otto.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 127799b2e2f6..b33558c29fd7 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -172,6 +172,8 @@ static void realtek_gpio_irq_unmask(struct irq_data *data)
 	unsigned long flags;
 	u16 m;
 
+	gpiochip_enable_irq(&ctrl->gc, line);
+
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	m = ctrl->intr_mask[port];
 	m |= realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
@@ -195,6 +197,8 @@ static void realtek_gpio_irq_mask(struct irq_data *data)
 	ctrl->intr_mask[port] = m;
 	realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+
+	gpiochip_disable_irq(&ctrl->gc, line);
 }
 
 static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
@@ -316,13 +320,15 @@ static int realtek_gpio_irq_init(struct gpio_chip *gc)
 	return 0;
 }
 
-static struct irq_chip realtek_gpio_irq_chip = {
+static const struct irq_chip realtek_gpio_irq_chip = {
 	.name = "realtek-otto-gpio",
 	.irq_ack = realtek_gpio_irq_ack,
 	.irq_mask = realtek_gpio_irq_mask,
 	.irq_unmask = realtek_gpio_irq_unmask,
 	.irq_set_type = realtek_gpio_irq_set_type,
 	.irq_set_affinity = realtek_gpio_irq_set_affinity,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static const struct of_device_id realtek_gpio_of_match[] = {
@@ -405,7 +411,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	irq = platform_get_irq_optional(pdev, 0);
 	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
 		girq = &ctrl->gc.irq;
-		girq->chip = &realtek_gpio_irq_chip;
+		gpio_irq_chip_set_chip(girq, &realtek_gpio_irq_chip);
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
 		girq->parent_handler = realtek_gpio_irq_handler;
-- 
2.36.1

