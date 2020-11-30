Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581EC2C8123
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 10:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgK3Jgv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 04:36:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8216 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgK3Jgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 04:36:51 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cl0TM3w6TzkcmW;
        Mon, 30 Nov 2020 17:35:35 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 17:36:00 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <bgolaszewski@baylibre.com>, <linus.walleij@linaro.org>,
        <Sergey.Semin@baikalelectronics.ru>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v1] gpio: dwapb: mask/unmask IRQ when disable/enable it
Date:   Mon, 30 Nov 2020 17:36:19 +0800
Message-ID: <1606728979-44259-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The mask and unmask registers are not configured in dwapb_irq_enable() and
dwapb_irq_disable(). In the following situations, the IRQ will be masked by
default after the IRQ is enabled:

mask IRQ -> disable IRQ -> enable IRQ

In this case, the IRQ status of GPIO controller is inconsistent with it's
irq_data too. For example, in __irq_enable(), IRQD_IRQ_DISABLED and
IRQD_IRQ_MASKED are both clear, but GPIO controller do not perform unmask.

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/gpio-dwapb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2a9046c..ca654eb 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -270,6 +270,8 @@ static void dwapb_irq_enable(struct irq_data *d)
 	u32 val;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	val = dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
+	dwapb_write(gpio, GPIO_INTMASK, val);
 	val = dwapb_read(gpio, GPIO_INTEN);
 	val |= BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTEN, val);
@@ -284,6 +286,8 @@ static void dwapb_irq_disable(struct irq_data *d)
 	u32 val;
 
 	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	val = dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
+	dwapb_write(gpio, GPIO_INTMASK, val);
 	val = dwapb_read(gpio, GPIO_INTEN);
 	val &= ~BIT(irqd_to_hwirq(d));
 	dwapb_write(gpio, GPIO_INTEN, val);
-- 
2.7.4

