Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B82050A1A1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 16:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388955AbiDUOMB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 10:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389020AbiDUOLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 10:11:54 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43013DA40
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:08:42 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3507283BF4;
        Thu, 21 Apr 2022 16:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650550120;
        bh=GXAbl7k1LtV1G+BEDr5GpTwqouJ1Lxo5WQY7nELQLe8=;
        h=From:To:Cc:Subject:Date:From;
        b=ZKdRSzT5gDM8MKTxaERfavoaovfNVnIrGUV7WovmM5AkzAz7z5vNLdZG1r+avLHcq
         lh83gGIs+Abt88BkoCO0yB5+4hFCqlR/iIEbhfevBnlrab7/JfOt8zVSCPa25kqiQs
         UduAPS0kqsE04Pc9jZIr4thqfTMOPofrUbDhtkS2XkBoD/Zs2/5fnvS1d90p8Oueay
         yN3OWHBmJtjm5nUWAVj465V9mLbPPwHN9rglrR4gbRCosHLAAuTKeMmNxNAL70AQna
         uDtaDXwdgdf1t6uQATryRX3LdCjdmTpm5x2aPyRXHl7cLrvaRSfs5vLqovQp1mHGkh
         jzWTxz7HtuZag==
From:   Marek Vasut <marex@denx.de>
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested
Date:   Thu, 21 Apr 2022 16:08:27 +0200
Message-Id: <20220421140827.214088-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current EOI handler for LEVEL triggered interrupts calls clk_enable(),
register IO, clk_disable(). The clock manipulation requires locking which
happens with IRQs disabled in clk_enable_lock(). Instead of turning the
clock on and off all the time, enable the clock in case LEVEL interrupt is
requested and keep the clock enabled until all LEVEL interrupts are freed.
The LEVEL interrupts are an exception on this platform and seldom used, so
this does not affect the common case.

This simplifies the LEVEL interrupt handling considerably and also fixes
the following splat found when using preempt-rt:
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

Power consumption measured on STM32MP157C DHCOM SoM is not increased or
is below noise threshold.

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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 242d1c37c6e4..7aecd0efde07 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -226,6 +226,13 @@ static void stm32_gpio_free(struct gpio_chip *chip, unsigned offset)
 	pinctrl_gpio_free(chip->base + offset);
 }
 
+static int stm32_gpio_get_noclk(struct gpio_chip *chip, unsigned int offset)
+{
+	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
+
+	return !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
+}
+
 static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct stm32_gpio_bank *bank = gpiochip_get_data(chip);
@@ -233,7 +240,7 @@ static int stm32_gpio_get(struct gpio_chip *chip, unsigned offset)
 
 	clk_enable(bank->clk);
 
-	ret = !!(readl_relaxed(bank->base + STM32_GPIO_IDR) & BIT(offset));
+	ret = stm32_gpio_get_noclk(chip, offset);
 
 	clk_disable(bank->clk);
 
@@ -317,7 +324,7 @@ static void stm32_gpio_irq_trigger(struct irq_data *d)
 		return;
 
 	/* If level interrupt type then retrig */
-	level = stm32_gpio_get(&bank->gpio_chip, d->hwirq);
+	level = stm32_gpio_get_noclk(&bank->gpio_chip, d->hwirq);
 	if ((level == 0 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_LOW) ||
 	    (level == 1 && bank->irq_type[d->hwirq] == IRQ_TYPE_LEVEL_HIGH))
 		irq_chip_retrigger_hierarchy(d);
@@ -359,6 +366,7 @@ static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
 {
 	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
 	int ret;
 
 	ret = stm32_gpio_direction_input(&bank->gpio_chip, irq_data->hwirq);
@@ -372,6 +380,10 @@ static int stm32_gpio_irq_request_resources(struct irq_data *irq_data)
 		return ret;
 	}
 
+	flags = irqd_get_trigger_type(irq_data);
+	if (flags & IRQ_TYPE_LEVEL_MASK)
+		clk_enable(bank->clk);
+
 	return 0;
 }
 
@@ -379,6 +391,9 @@ static void stm32_gpio_irq_release_resources(struct irq_data *irq_data)
 {
 	struct stm32_gpio_bank *bank = irq_data->domain->host_data;
 
+	if (bank->irq_type[irq_data->hwirq] & IRQ_TYPE_LEVEL_MASK)
+		clk_disable(bank->clk);
+
 	gpiochip_unlock_as_irq(&bank->gpio_chip, irq_data->hwirq);
 }
 
-- 
2.35.1

