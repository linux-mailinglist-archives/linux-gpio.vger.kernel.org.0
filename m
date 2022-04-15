Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C13150314F
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Apr 2022 01:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356000AbiDOV47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Apr 2022 17:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244519AbiDOV44 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2022 17:56:56 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 373ABDD5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2022 14:54:24 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3A70483894;
        Fri, 15 Apr 2022 23:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650059662;
        bh=CikPWEoVsPPQ9qQACVoJTyNXfRZhEnbtHIAX4K2c1OQ=;
        h=From:To:Cc:Subject:Date:From;
        b=foG04/ApDyCcDs20x0fnX3ov7sJ7HaXpZZz0Fh869/+GvmZ7NEFXTA8wJhYDqWvsW
         WQZS3Ye/3yGG+UkEyZ/hHIT2XMGfo3k+Tm9MVtGlwKII8G4NWD11sX4UjX+y2ZI6qT
         M8oJdnq8Mfc9vkljkK6YfHVlSgQGlu2GBXrZaVHPcG0/WGqsC86RRU9RlJ47eOcQX4
         Ot08cWJCi2F5piweQAqqyomsA9n09su1u7L4eFOO6Twu54Zv1mxAlxTRRGcxl1c0SV
         KZ627KYsCsXM9C6uMh7Zg9oZJZsvWPNh234lIUe2UR6kzfqvwrVxWtksxoWfID17t7
         0Q7bXh6xUlpmA==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/stm32: Do not call stm32_gpio_get() for edge triggered IRQs in EOI
Date:   Fri, 15 Apr 2022 23:54:10 +0200
Message-Id: <20220415215410.498349-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The stm32_gpio_get() should only be called for LEVEL triggered interrupts,
skip calling it for EDGE triggered interrupts altogether to avoid wasting
CPU cycles in EOI handler. On this platform, EDGE triggered interrupts are
the majority and LEVEL triggered interrupts are the exception no less, and
the CPU cycles are not abundant.

Fixes: 47beed513a85b ("pinctrl: stm32: Add level interrupt support to gpio irq chip")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
To: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 09952c463f67d..242d1c37c6e4b 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -312,6 +312,10 @@ static void stm32_gpio_irq_trigger(struct irq_data *d)
 	struct stm32_gpio_bank *bank = d->domain->host_data;
 	int level;
 
+	/* Do not access the GPIO if this is not LEVEL triggered IRQ. */
+	if (!(bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK))
+		return;
+
 	/* If level interrupt type then retrig */
 	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
 	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
-- 
2.35.1

