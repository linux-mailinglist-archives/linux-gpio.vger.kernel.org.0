Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B54765301
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 13:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjG0L6M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 07:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbjG0L6L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 07:58:11 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E3E41FF0;
        Thu, 27 Jul 2023 04:58:10 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RBThq6sykztRTy;
        Thu, 27 Jul 2023 19:54:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 19:58:06 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <j-keerthy@ti.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <andy@kernel.org>, <grygorii.strashko@ti.com>,
        <ssantosh@kernel.org>, <khilman@kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] gpio: davinci: Remove redundant dev_err_probe()
Date:   Thu, 27 Jul 2023 19:57:26 +0800
Message-ID: <20230727115726.2666041-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
v2:
- split into 2 patches on per-driver basis
---
 drivers/gpio/gpio-davinci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index fff510d86e31..8db5717bdabe 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -236,7 +236,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	for (i = 0; i < nirq; i++) {
 		chips->irqs[i] = platform_get_irq(pdev, i);
 		if (chips->irqs[i] < 0)
-			return dev_err_probe(dev, chips->irqs[i], "IRQ not populated\n");
+			return chips->irqs[i];
 	}
 
 	chips->chip.label = dev_name(dev);
-- 
2.34.1

