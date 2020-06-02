Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6BB71EBBAE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 14:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgFBM3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 08:29:55 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42328 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbgFBM3z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jun 2020 08:29:55 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D7958EC8F4709A17E87D;
        Tue,  2 Jun 2020 20:29:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 20:29:40 +0800
From:   yu kuai <yukuai3@huawei.com>
To:     <baohua@kernel.org>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] pinctrl: sirf: add missing put_device() in error handling path in sirfsoc_gpio_probe()
Date:   Tue, 2 Jun 2020 20:29:21 +0800
Message-ID: <20200602122921.707395-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

in sirfsoc_gpio_probe(), if of_find_device_by_node() succeed,
put_device() is missing in the error handling patch.

Signed-off-by: yu kuai <yukuai3@huawei.com>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 1ebcb957c654..63a287d5795f 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -794,13 +794,17 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 		return -ENODEV;
 
 	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
-	if (!sgpio)
-		return -ENOMEM;
+	if (!sgpio) {
+		err = -ENOMEM;
+		goto out_put_device;
+	}
 	spin_lock_init(&sgpio->lock);
 
 	regs = of_iomap(np, 0);
-	if (!regs)
-		return -ENOMEM;
+	if (!regs) {
+		err = -ENOMEM;
+		goto out_put_device;
+	}
 
 	sgpio->chip.gc.request = sirfsoc_gpio_request;
 	sgpio->chip.gc.free = sirfsoc_gpio_free;
@@ -824,8 +828,10 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	girq->parents = devm_kcalloc(&pdev->dev, SIRFSOC_GPIO_NO_OF_BANKS,
 				     sizeof(*girq->parents),
 				     GFP_KERNEL);
-	if (!girq->parents)
-		return -ENOMEM;
+	if (!girq->parents) {
+		err = -ENOMEM;
+		goto out_put_device;
+	}
 	for (i = 0; i < SIRFSOC_GPIO_NO_OF_BANKS; i++) {
 		bank = &sgpio->sgpio_bank[i];
 		spin_lock_init(&bank->lock);
@@ -868,6 +874,8 @@ static int sirfsoc_gpio_probe(struct device_node *np)
 	gpiochip_remove(&sgpio->chip.gc);
 out:
 	iounmap(regs);
+out_put_device:
+	put_device(&pdev->dev);
 	return err;
 }
 
-- 
2.25.4

