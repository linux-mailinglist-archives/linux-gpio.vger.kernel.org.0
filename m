Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4B5190244
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Mar 2020 00:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgCWXvj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 19:51:39 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:35019 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgCWXvi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Mar 2020 19:51:38 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 48mWPN2dYYz1qsZp;
        Tue, 24 Mar 2020 00:51:36 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 48mWPN1tZ9z1qyDv;
        Tue, 24 Mar 2020 00:51:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id V8WqiL3sBpwT; Tue, 24 Mar 2020 00:51:34 +0100 (CET)
X-Auth-Info: fYrbgeBEJtUWyFdzn5WfLLQMdR0dzZxQ6mlQUdSA0vE=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 24 Mar 2020 00:51:34 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] irqchip/stm32: Retrigger both in eoi and unmask callbacks
Date:   Tue, 24 Mar 2020 00:51:32 +0100
Message-Id: <20200323235132.530550-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sampling the IRQ line state in EOI and retriggering the interrupt to
work around missing level-triggered interrupt support only works for
non-threaded interrupts. Threaded interrupts must be retriggered the
same way in unmask callback.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>,
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 9ac9ecfc2f34..2dd4a4dd944c 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -304,18 +304,22 @@ static const struct gpio_chip stm32_gpio_template = {
 	.get_direction		= stm32_gpio_get_direction,
 };
 
-void stm32_gpio_irq_eoi(struct irq_data *d)
+static void stm32_gpio_irq_trigger(struct irq_data *d)
 {
 	struct stm32_gpio_bank *bank = d->domain->host_data;
 	int level;
 
-	irq_chip_eoi_parent(d);
-
 	/* If level interrupt type then retrig */
 	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
 	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
 	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
 		irq_chip_retrigger_hierarchy(d);
+}
+
+void stm32_gpio_irq_eoi(struct irq_data *d)
+{
+	irq_chip_eoi_parent(d);
+	stm32_gpio_irq_trigger(d);
 };
 
 static int stm32_gpio_set_type(struct irq_data *d, unsigned int type)
@@ -371,12 +375,18 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
 	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
 }
 
+static void stm32_gpio_irq_unmask(struct irq_data *d)
+{
+	irq_chip_unmask_parent(d);
+	stm32_gpio_irq_trigger(d);
+}
+
 static struct irq_chip stm32_gpio_irq_chip = {
 	.name		= "stm32gpio",
 	.irq_eoi	= stm32_gpio_irq_eoi,
 	.irq_ack	= irq_chip_ack_parent,
 	.irq_mask	= irq_chip_mask_parent,
-	.irq_unmask	= irq_chip_unmask_parent,
+	.irq_unmask	= stm32_gpio_irq_unmask,
 	.irq_set_type	= stm32_gpio_set_type,
 	.irq_set_wake	= irq_chip_set_wake_parent,
 	.irq_request_resources = stm32_gpio_irq_request_resources,
-- 
2.25.1

