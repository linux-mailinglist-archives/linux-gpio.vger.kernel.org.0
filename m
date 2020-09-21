Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082A62724E0
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Sep 2020 15:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbgIUNL5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Sep 2020 09:11:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59860 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727418AbgIUNKo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:44 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 619AF2FDFB859F15DE85;
        Mon, 21 Sep 2020 21:10:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:33 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] pinctrl: ocelot: simplify the return expression of ocelot_gpiochip_register()
Date:   Mon, 21 Sep 2020 21:10:57 +0800
Message-ID: <20200921131057.92895-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/pinctrl/pinctrl-ocelot.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 425a3d764..a4a1b00f7 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -1120,7 +1120,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 {
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
-	int ret, irq;
+	int irq;
 
 	info->gpio_chip = ocelot_gpiolib_chip;
 
@@ -1147,11 +1147,7 @@ static int ocelot_gpiochip_register(struct platform_device *pdev,
 		girq->handler = handle_edge_irq;
 	}
 
-	ret = devm_gpiochip_add_data(&pdev->dev, gc, info);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, gc, info);
 }
 
 static const struct of_device_id ocelot_pinctrl_of_match[] = {
-- 
2.23.0

