Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E371634F70B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 04:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhCaC4c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 22:56:32 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15111 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbhCaC4S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 22:56:18 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F99rL6xMWz1BFQv;
        Wed, 31 Mar 2021 10:54:10 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 10:56:10 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <grygorii.strashko@ti.com>, <ssantosh@kernel.org>,
        <khilman@kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>
CC:     <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH] gpio: omap: Use device_get_match_data() helper
Date:   Wed, 31 Mar 2021 10:56:40 +0800
Message-ID: <1617159400-19775-1-git-send-email-tiantao6@hisilicon.com>
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
 drivers/gpio/gpio-omap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 41952bb..9d94486 100644
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
+	pdata = pdata ? : dev_get_platdata(dev);
 	if (!pdata)
 		return -EINVAL;
 
-- 
2.7.4

