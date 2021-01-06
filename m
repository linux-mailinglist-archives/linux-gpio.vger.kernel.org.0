Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4749E2EBE7E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbhAFNTY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:19:24 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9719 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbhAFNTW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:19:22 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D9qfK6NPXzl0dN;
        Wed,  6 Jan 2021 21:17:29 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:18:32 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: tegra186: use resource_size
Date:   Wed, 6 Jan 2021 21:19:15 +0800
Message-ID: <20210106131915.648-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-tegra186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 9500074b1f1b..05974b760796 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -647,7 +647,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	gpio->gpio.get_direction = tegra186_gpio_get_direction;
 	gpio->gpio.direction_input = tegra186_gpio_direction_input;
 	gpio->gpio.direction_output = tegra186_gpio_direction_output;
-	gpio->gpio.get = tegra186_gpio_get,
+	gpio->gpio.get = tegra186_gpio_get;
 	gpio->gpio.set = tegra186_gpio_set;
 	gpio->gpio.set_config = tegra186_gpio_set_config;
 	gpio->gpio.add_pin_ranges = tegra186_gpio_add_pin_ranges;
-- 
2.22.0

