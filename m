Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA0C19923
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2019 09:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfEJHnX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 May 2019 03:43:23 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49704 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727084AbfEJHnX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 May 2019 03:43:23 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4A7gCkn028382;
        Fri, 10 May 2019 09:43:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=8I2N6G3vO9y9aZ71WM6kdoKYNSOsW+23DY/TOYHKYeA=;
 b=oTSHYknBEu/ctOQkiI3lUJ+GlBPI+wnUXrAbpXXlVNUcxi4Lv2HqD3HZlnl5qWXPs/4T
 b1zI2oGg9K0/YnZeXfcBXRWrFnlvreqcag84iYulSNy4Y5wAs6chqbJm3olqxhvrwT7p
 hGEw2YRlJVlwiXp9MF4UeWtUgj9/vUh0k7EBrRPEAmlx6pvajYf0RlBIPSHWywx2T1+C
 TBH7Quc3fY97feXkyKND+uf8uOsEcaMHtCzWsPxIHUbZBAHs48Dr58IyAGrY0VR6CofJ
 aoBoE9MrVv0EQ38EH5gIYnbAT6IhLvjqTsB/IreO+x8krXLLB4nAf6TvKtzjqKjq5MZu Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2scfv2pya9-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 10 May 2019 09:43:06 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 92B7D31;
        Fri, 10 May 2019 07:43:04 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73B2D15B0;
        Fri, 10 May 2019 07:43:04 +0000 (GMT)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May 2019 09:43:04
 +0200
From:   Alexandre Torgue <alexandre.torgue@st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <alexandre.torgue@st.com>
Subject: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
Date:   Fri, 10 May 2019 09:43:03 +0200
Message-ID: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-09_02:,,
 signatures=0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIOs are split between several banks (A, B, ...) and each bank can have
up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
exti lines. As there are only 16 exti lines, a mux is used to select which
gpio line is connected to which exti line. Mapping is done as follow:

-A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
-A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
...

This patch adds a protection to avoid overriding on mux_n for exti_line_n.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2317ccf..99e4149 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -98,6 +98,8 @@ struct stm32_pinctrl {
 	struct stm32_desc_pin *pins;
 	u32 npins;
 	u32 pkg;
+	u16 irqmux_map;
+	spinlock_t irqmux_lock;
 };
 
 static inline int stm32_gpio_pin(int gpio)
@@ -307,9 +309,53 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 {
 	struct stm32_gpio_bank *bank = d->host_data;
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * gpio irq mux is shared between several banks, a lock has to be done
+	 * to avoid overriding.
+	 */
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+	if (pctl->hwlock)
+		ret = hwspin_lock_timeout(pctl->hwlock, HWSPINLOCK_TIMEOUT);
+
+	if (ret) {
+		dev_err(pctl->dev, "Can't get hwspinlock\n");
+		goto unlock;
+	}
+
+	if (pctl->irqmux_map & BIT(irq_data->hwirq)) {
+		dev_err(pctl->dev, "irq line %ld already requested.\n",
+			irq_data->hwirq);
+		ret = -EBUSY;
+		if (pctl->hwlock)
+			hwspin_unlock(pctl->hwlock);
+		goto unlock;
+	} else {
+		pctl->irqmux_map |= BIT(irq_data->hwirq);
+	}
 
 	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_ioport_nr);
-	return 0;
+
+	if (pctl->hwlock)
+		hwspin_unlock(pctl->hwlock);
+
+unlock:
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
+	return ret;
+}
+
+static void stm32_gpio_domain_deactivate(struct irq_domain *d,
+					 struct irq_data *irq_data)
+{
+	struct stm32_gpio_bank *bank = d->host_data;
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+	pctl->irqmux_map &= ~BIT(irq_data->hwirq);
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
 }
 
 static int stm32_gpio_domain_alloc(struct irq_domain *d,
@@ -338,6 +384,7 @@ static const struct irq_domain_ops stm32_gpio_domain_ops = {
 	.alloc          = stm32_gpio_domain_alloc,
 	.free           = irq_domain_free_irqs_common,
 	.activate	= stm32_gpio_domain_activate,
+	.deactivate	= stm32_gpio_domain_deactivate,
 };
 
 /* Pinctrl functions */
@@ -1290,6 +1337,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		pctl->hwlock = hwspin_lock_request_specific(hwlock_id);
 	}
 
+	spin_lock_init(&pctl->irqmux_lock);
+
 	pctl->dev = dev;
 	pctl->match_data = match->data;
 
-- 
2.7.4

