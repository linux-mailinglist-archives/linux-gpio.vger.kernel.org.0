Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C7111C91E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfLLJaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:30:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7676 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbfLLJaX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 04:30:23 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id CBF2CE826BD3C26BC609;
        Thu, 12 Dec 2019 17:30:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Dec 2019 17:30:13 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <tomasz.figa@gmail.com>, <krzk@kernel.org>,
        <s.nawrocki@samsung.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] pinctrl: samsung: fix build error without CONFIG_OF_GPIO
Date:   Thu, 12 Dec 2019 17:27:26 +0800
Message-ID: <20191212092726.41027-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

If CONFIG_OF_GPIO is n, build fails:

drivers/pinctrl/samsung/pinctrl-samsung.c: In function samsung_gpiolib_register:
drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: struct gpio_chip has no member named of_node
   gc->of_node = bank->of_node;

Use #ifdef to guard this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f26574e..5c29ad8 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -966,7 +966,9 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		gc->base = bank->grange.base;
 		gc->ngpio = bank->nr_pins;
 		gc->parent = &pdev->dev;
+#ifdef CONFIG_OF_GPIO
 		gc->of_node = bank->of_node;
+#endif
 		gc->label = bank->name;
 
 		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
-- 
2.7.4

