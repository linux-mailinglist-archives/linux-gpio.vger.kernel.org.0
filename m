Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC4711C90B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 10:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbfLLJYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 04:24:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7675 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbfLLJYg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Dec 2019 04:24:36 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 25B33D606BB1D6A3F7AF;
        Thu, 12 Dec 2019 17:24:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Thu, 12 Dec 2019 17:24:23 +0800
From:   Chen Zhou <chenzhou10@huawei.com>
To:     <tomasz.figa@gmail.com>, <krzk@kernel.org>,
        <s.nawrocki@samsung.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chenzhou10@huawei.com>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] pinctrl: samsung: fix build error without CONFIG_OF_GPIO
Date:   Thu, 12 Dec 2019 17:21:36 +0800
Message-ID: <20191212092136.37870-1-chenzhou10@huawei.com>
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

Reported-by: Hulk Robot <hulkci@huawei.com>Fixes
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

