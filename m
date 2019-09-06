Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8A3AB9AF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 15:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388719AbfIFNsj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 09:48:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42472 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727031AbfIFNsj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 6 Sep 2019 09:48:39 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6E9F1C240AAF7362C57F;
        Fri,  6 Sep 2019 21:48:36 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Sep 2019
 21:48:28 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <Eugeniy.Paltsev@synopsys.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpio: creg-snps: use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 6 Sep 2019 21:10:32 +0800
Message-ID: <20190906131032.22148-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpio-creg-snps.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-creg-snps.c b/drivers/gpio/gpio-creg-snps.c
index 8cbc94d..ff19a8a 100644
--- a/drivers/gpio/gpio-creg-snps.c
+++ b/drivers/gpio/gpio-creg-snps.c
@@ -137,7 +137,6 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct creg_gpio *hcg;
-	struct resource *mem;
 	u32 ngpios;
 	int ret;
 
@@ -145,8 +144,7 @@ static int creg_gpio_probe(struct platform_device *pdev)
 	if (!hcg)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hcg->regs = devm_ioremap_resource(dev, mem);
+	hcg->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hcg->regs))
 		return PTR_ERR(hcg->regs);
 
-- 
2.7.4


