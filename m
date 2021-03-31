Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585D034FB61
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 10:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbhCaITW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 04:19:22 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15112 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhCaISw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 04:18:52 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9K0R46WJz1BFwF;
        Wed, 31 Mar 2021 16:16:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:18:40 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
        <khilman@kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v2] gpio: omap: Use device_get_match_data() helper
Date:   Wed, 31 Mar 2021 16:19:11 +0800
Message-ID: <1617178751-18937-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the device_get_match_data() helper instead of open coding.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---

v2: drop the space between ? and :.
---
 drivers/gpio/gpio-omap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 41952bb..f4df555 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1364,15 +1364,14 @@ static int omap_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
-	const struct of_device_id *match;
 	const struct omap_gpio_platform_data *pdata;
 	struct gpio_bank *bank;
 	struct irq_chip *irqc;
 	int ret;
 
-	match = of_match_device(of_match_ptr(omap_gpio_match), dev);
+	pdata = device_get_match_data(dev);
 
-	pdata = match ? match->data : dev_get_platdata(dev);
+	pdata = pdata ?: dev_get_platdata(dev);
 	if (!pdata)
 		return -EINVAL;
 
-- 
2.7.4

