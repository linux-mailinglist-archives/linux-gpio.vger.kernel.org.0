Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64581765433
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 14:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbjG0Ml3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 08:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbjG0Ml1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 08:41:27 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B063A1AD;
        Thu, 27 Jul 2023 05:41:26 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RBVfl6Gy0ztR5P;
        Thu, 27 Jul 2023 20:38:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 20:41:22 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <andy@kernel.org>,
        <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
        <khilman@kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v3] gpio: omap: Remove redundant dev_err_probe() and zero value handle code
Date:   Thu, 27 Jul 2023 20:40:43 +0800
Message-ID: <20230727124043.2751747-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to call the dev_err_probe() function directly to print
a custom message when handling an error from platform_get_irq() function as
it is going to display an appropriate error message in case of a failure.

And the code to handle bank->irq = 0 is redundant because
platform_get_irq() do not return 0.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v3:
- remove the redundant zero value handle code
---
v2:
- split into 2 patches on per-driver basis
---
 drivers/gpio/gpio-omap.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 2b78fde74e30..a927680c66f8 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1412,11 +1412,8 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	bank->dev = dev;
 
 	bank->irq = platform_get_irq(pdev, 0);
-	if (bank->irq <= 0) {
-		if (!bank->irq)
-			bank->irq = -ENXIO;
-		return dev_err_probe(dev, bank->irq, "can't get irq resource\n");
-	}
+	if (bank->irq < 0)
+		return bank->irq;
 
 	bank->chip.parent = dev;
 	bank->chip.owner = THIS_MODULE;
-- 
2.34.1

