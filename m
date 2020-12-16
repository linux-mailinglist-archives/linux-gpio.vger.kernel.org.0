Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63B12DC139
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 14:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgLPN1S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 08:27:18 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9219 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgLPN1S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 08:27:18 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwwqZ53x5zkqKJ;
        Wed, 16 Dec 2020 21:25:46 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:26:25 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:26:57 +0800
Message-ID: <20201216132657.15582-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-sl28cpld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index 889b8f5622c2..52404736ac86 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -65,13 +65,13 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	if (!irq_chip)
 		return -ENOMEM;
 
-	irq_chip->name = "sl28cpld-gpio-irq",
+	irq_chip->name = "sl28cpld-gpio-irq";
 	irq_chip->irqs = sl28cpld_gpio_irqs;
 	irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
 	irq_chip->num_regs = 1;
 	irq_chip->status_base = base + GPIO_REG_IP;
 	irq_chip->mask_base = base + GPIO_REG_IE;
-	irq_chip->mask_invert = true,
+	irq_chip->mask_invert = true;
 	irq_chip->ack_base = base + GPIO_REG_IP;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-- 
2.22.0

