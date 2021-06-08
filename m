Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB31539F917
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 16:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhFHOa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 10:30:26 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:8095 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233358AbhFHOaR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 10:30:17 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FzswD4DkmzYrKm;
        Tue,  8 Jun 2021 22:25:32 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 22:28:21 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] gpio: idt3243x: Fix return value check in idt_gpio_probe()
Date:   Tue, 8 Jun 2021 14:38:53 +0000
Message-ID: <20210608143853.4153234-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case of error, the function devm_platform_ioremap_resource_byname()
returns ERR_PTR() and never returns NULL. The NULL test in the return
value check should be replaced with IS_ERR().

Fixes: 4195926aedca ("gpio: Add support for IDT 79RC3243x GPIO controller")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-idt3243x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index e961acee1571..50003ad2e589 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -142,8 +142,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctrl->gpio = devm_platform_ioremap_resource_byname(pdev, "gpio");
-	if (!ctrl->gpio)
-		return -ENOMEM;
+	if (IS_ERR(ctrl->gpio))
+		return PTR_ERR(ctrl->gpio);
 
 	ctrl->gc.parent = dev;
 
@@ -160,8 +160,8 @@ static int idt_gpio_probe(struct platform_device *pdev)
 
 	if (device_property_read_bool(dev, "interrupt-controller")) {
 		ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
-		if (!ctrl->pic)
-			return -ENOMEM;
+		if (IS_ERR(ctrl->pic))
+			return PTR_ERR(ctrl->pic);
 
 		parent_irq = platform_get_irq(pdev, 0);
 		if (!parent_irq)

