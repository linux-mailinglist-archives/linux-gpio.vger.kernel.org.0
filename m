Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10299503119
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Apr 2022 01:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbiDOV62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Apr 2022 17:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbiDOV62 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2022 17:58:28 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F6E34BBF
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2022 14:55:58 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 188CC83894;
        Fri, 15 Apr 2022 23:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650059757;
        bh=Sc/9lPXXzFl+T7U301MThVZf3KxvcYzU6cB1RmoDD3w=;
        h=From:To:Cc:Subject:Date:From;
        b=E3BprDWp5iG05mvyyy15lY1SeOg7gw/zOgEuyL/dzTc02jflqaqx9j96uaTgkrkEj
         kkBPCkTgEsNsbUKQTXig9oczEkvwmc/tNJi2YnGA0lxDieeY0+f+VJ114mi89sexW/
         noI+eQryJsFBNU8eBVFgWfwDVmDlWDTHT2HZ5GoKjSK4yEtNgedp4NAKJrLqcVzrGF
         1g7rCqjaQo/epnUxhL3WjyywxIa8RfNdVbvcSz0hzLBG15MwHha1/XPT9hipHpDOFI
         tUoDsATHznr3EVBaJ0v/Kefar8Gow49r9qViXZu+We4V4jn6XAxW5CYJApKkcZyMRG
         jfLYBbGV/b8tQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [RFC][PATCH] irqchip/stm32: Retrigger hierarchy for LEVEL triggered IRQs in tasklet
Date:   Fri, 15 Apr 2022 23:55:50 +0200
Message-Id: <20220415215550.498381-1-marex@denx.de>
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

The current EOI handler for LEVEL triggered interrupts calls clk_enable(),
register IO, clk_disable(). The clock manipulation requires locking which
happens with IRQs disabled in clk_enable_lock(). Move the LEVEL IRQ test
and retrigger into dedicated tasklet and schedule the tasklet every time
a LEVEL IRQ triggers. This makes EOI fast for majority of IRQs on this
platform again, since those are edge triggered IRQs, and LEVEL triggered
IRQs are the exception.

This also fixes the following splat found when using preempt-rt:
 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 0 at kernel/locking/rtmutex.c:2040 __rt_mutex_trylock+0x37/0x62
 Modules linked in:
 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.109-rt65-stable-standard-00068-g6a5afc4b1217 #85
 Hardware name: STM32 (Device Tree Support)
 [<c010a45d>] (unwind_backtrace) from [<c010766f>] (show_stack+0xb/0xc)
 [<c010766f>] (show_stack) from [<c06353ab>] (dump_stack+0x6f/0x84)
 [<c06353ab>] (dump_stack) from [<c01145e3>] (__warn+0x7f/0xa4)
 [<c01145e3>] (__warn) from [<c063386f>] (warn_slowpath_fmt+0x3b/0x74)
 [<c063386f>] (warn_slowpath_fmt) from [<c063b43d>] (__rt_mutex_trylock+0x37/0x62)
 [<c063b43d>] (__rt_mutex_trylock) from [<c063c053>] (rt_spin_trylock+0x7/0x16)
 [<c063c053>] (rt_spin_trylock) from [<c036a2f3>] (clk_enable_lock+0xb/0x80)
 [<c036a2f3>] (clk_enable_lock) from [<c036ba69>] (clk_core_enable_lock+0x9/0x18)
 [<c036ba69>] (clk_core_enable_lock) from [<c034e9f3>] (stm32_gpio_get+0x11/0x24)
 [<c034e9f3>] (stm32_gpio_get) from [<c034ef43>] (stm32_gpio_irq_trigger+0x1f/0x48)
 [<c034ef43>] (stm32_gpio_irq_trigger) from [<c014aa53>] (handle_fasteoi_irq+0x71/0xa8)
 [<c014aa53>] (handle_fasteoi_irq) from [<c0147111>] (generic_handle_irq+0x19/0x22)
 [<c0147111>] (generic_handle_irq) from [<c014752d>] (__handle_domain_irq+0x55/0x64)
 [<c014752d>] (__handle_domain_irq) from [<c0346f13>] (gic_handle_irq+0x53/0x64)
 [<c0346f13>] (gic_handle_irq) from [<c0100ba5>] (__irq_svc+0x65/0xc0)
 Exception stack(0xc0e01f18 to 0xc0e01f60)
 1f00:                                                       0000300c 00000000
 1f20: 0000300c c010ff01 00000000 00000000 c0e00000 c0e07714 00000001 c0e01f78
 1f40: c0e07758 00000000 ef7cd0ff c0e01f68 c010554b c0105542 40000033 ffffffff
 [<c0100ba5>] (__irq_svc) from [<c0105542>] (arch_cpu_idle+0xc/0x1e)
 [<c0105542>] (arch_cpu_idle) from [<c063be95>] (default_idle_call+0x21/0x3c)
 [<c063be95>] (default_idle_call) from [<c01324f7>] (do_idle+0xe3/0x1e4)
 [<c01324f7>] (do_idle) from [<c01327b3>] (cpu_startup_entry+0x13/0x14)
 [<c01327b3>] (cpu_startup_entry) from [<c0a00c13>] (start_kernel+0x397/0x3d4)
 [<c0a00c13>] (start_kernel) from [<00000000>] (0x0)
 ---[ end trace 0000000000000002 ]---

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
To: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 55 +++++++++++++++++++++------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 242d1c37c6e4b..f4287fc18cf9a 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -10,6 +10,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/hwspinlock.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -95,6 +96,7 @@ struct stm32_gpio_bank {
 	u32 bank_ioport_nr;
 	u32 pin_backup[STM32_GPIO_PINS_PER_BANK];
 	u8 irq_type[STM32_GPIO_PINS_PER_BANK];
+	struct tasklet_struct tasklet;
 };
 
 struct stm32_pinctrl {
@@ -307,20 +309,43 @@ static const struct gpio_chip stm32_gpio_template = {
 	.set_config		= gpiochip_generic_config,
 };
 
+static void stm32_gpio_irq_tasklet(struct tasklet_struct *t)
+{
+	struct stm32_gpio_bank *bank = from_tasklet(bank, t, tasklet);
+	struct irq_desc *desc;
+	struct irq_data *data;
+	int irq, pin, level;
+
+	/* Retrigger all LEVEL triggered pins which are still asserted. */
+	for (pin = 0; pin < STM32_GPIO_PINS_PER_BANK; pin++) {
+		if (!(bank->irq_type[pin] & IRQ_TYPE_LEVEL_MASK))
+			continue;
+
+		level = stm32_gpio_get(&bank->gpio_chip, pin);
+		if ((level == 0 && bank->irq_type[pin] == IRQ_TYPE_LEVEL_LOW) ||
+		    (level == 1 && bank->irq_type[pin] == IRQ_TYPE_LEVEL_HIGH)) {
+			irq = irq_find_mapping(bank->domain, pin);
+
+			desc = irq_to_desc(irq);
+			if (!desc)
+				continue;
+
+			data = irq_desc_get_irq_data(desc);
+			if (!data)
+				continue;
+
+			irq_chip_retrigger_hierarchy(data);
+		}
+	}
+}
+
 static void stm32_gpio_irq_trigger(struct irq_data *d)
 {
 	struct stm32_gpio_bank *bank = d->domain->host_data;
-	int level;
-
-	/* Do not access the GPIO if this is not LEVEL triggered IRQ. */
-	if (!(bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK))
-		return;
 
-	/* If level interrupt type then retrig */
-	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
-	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
-	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
-		irq_chip_retrigger_hierarchy(d);
+	/* If this is LEVEL triggered interrupt, retrigger in tasklet. */
+	if (bank->irq_type[d->hwirq] & IRQ_TYPE_LEVEL_MASK)
+		tasklet_schedule(&bank->tasklet);
 }
 
 static void stm32_gpio_irq_eoi(struct irq_data *d)
@@ -450,6 +475,8 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	unsigned long flags;
 	int ret = 0;
 
+	tasklet_setup(&bank->tasklet, stm32_gpio_irq_tasklet);
+
 	/*
 	 * Check first that the IRQ MUX of that line is free.
 	 * gpio irq mux is shared between several banks, protect with a lock
@@ -475,7 +502,11 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	irq_domain_set_hwirq_and_chip(d, virq, hwirq, &stm32_gpio_irq_chip,
 				      bank);
 
-	return irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
+	ret = irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
+	if (ret)
+		tasklet_kill(&bank->tasklet);
+
+	return ret;
 }
 
 static void stm32_gpio_domain_free(struct irq_domain *d, unsigned int virq,
@@ -486,6 +517,8 @@ static void stm32_gpio_domain_free(struct irq_domain *d, unsigned int virq,
 	struct irq_data *irq_data = irq_domain_get_irq_data(d, virq);
 	unsigned long flags, hwirq = irq_data->hwirq;
 
+	tasklet_kill(&bank->tasklet);
+
 	irq_domain_free_irqs_common(d, virq, nr_irqs);
 
 	spin_lock_irqsave(&pctl->irqmux_lock, flags);
-- 
2.35.1

