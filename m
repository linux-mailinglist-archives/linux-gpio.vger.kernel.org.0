Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71B52D5C7F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbgLJN4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:56:39 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9494 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbgLJN43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:56:29 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CsFmL098SzhpfS;
        Thu, 10 Dec 2020 21:55:14 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Dec 2020 21:55:40 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: simplify the return expression of cs5535_gpio_probe()
Date:   Thu, 10 Dec 2020 21:56:09 +0800
Message-ID: <20201210135609.1372-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-cs5535.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-cs5535.c b/drivers/gpio/gpio-cs5535.c
index 53b24e3ae7de..6da3a247614a 100644
--- a/drivers/gpio/gpio-cs5535.c
+++ b/drivers/gpio/gpio-cs5535.c
@@ -345,12 +345,8 @@ static int cs5535_gpio_probe(struct platform_device *pdev)
 				mask_orig, mask);
 
 	/* finally, register with the generic GPIO API */
-	err = devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
-				     &cs5535_gpio_chip);
-	if (err)
-		return err;
-
-	return 0;
+	return devm_gpiochip_add_data(&pdev->dev, &cs5535_gpio_chip.chip,
+				      &cs5535_gpio_chip);
 }
 
 static struct platform_driver cs5535_gpio_driver = {
-- 
2.22.0

