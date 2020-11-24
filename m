Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FF62C1B4C
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 03:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgKXCIt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 21:08:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7721 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgKXCIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 21:08:49 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cg6r401hdzkWWb;
        Tue, 24 Nov 2020 10:08:20 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 24 Nov 2020
 10:08:38 +0800
From:   Zheng Liang <zhengliang6@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <wangli74@huawei.com>,
        <fangwei1@huawei.com>, <zhengliang6@huawei.com>
Subject: [PATCH v2] gpio: arizona: disable pm_runtime in case of failure
Date:   Tue, 24 Nov 2020 11:06:06 +0800
Message-ID: <20201124030606.40588-1-zhengliang6@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pm_runtime_enable will increase power disable depth. Thus a
pairing decrement is needed on the error handling path to keep
it balanced.

Fixes:27a49ed17e224(gpio: arizona: Add support for GPIOs that)
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
---
 drivers/gpio/gpio-arizona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 5bda38e0780f..2bc173c352ce 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -192,6 +192,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
 				     arizona_gpio);
 	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
 			ret);
 		return ret;
-- 
2.17.1

