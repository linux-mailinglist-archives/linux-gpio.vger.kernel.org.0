Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5461C2C6130
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Nov 2020 09:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgK0Itw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Nov 2020 03:49:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8045 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgK0Itw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Nov 2020 03:49:52 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cj7bW5BKRzhXwL;
        Fri, 27 Nov 2020 16:49:27 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 16:49:42 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <bgolaszewski@baylibre.com>, <linus.walleij@linaro.org>,
        <Sergey.Semin@baikalelectronics.ru>
CC:     <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v2] gpio: dwapb: fix NULL pointer dereference at dwapb_gpio_suspend()
Date:   Fri, 27 Nov 2020 16:50:02 +0800
Message-ID: <1606467002-62964-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Following Calltrace is found when running echo freeze > /sys/power/state.

[  272.755506] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[  272.755585] Call trace:
[  272.755587]  dwapb_gpio_suspend+0x18/0x318
[  272.755588]  pm_generic_suspend+0x2c/0x48
[  272.755595]  acpi_subsys_suspend+0x60/0x70
[  272.755599]  dpm_run_callback.isra.18+0x40/0xe0
[  272.755601]  __device_suspend+0xf4/0x360

The reason is platform_set_drvdata() is deleted, and dwapb_gpio_suspend()
get *gpio by dev_get_drvdata().

Fixes: feeaefd378ca ("gpio: dwapb: Use resource managed GPIO-chip add data method")
Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
Acked-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

---
   v1->v2:
          1. reduce calltrace log
          2. delete blank line in tag block
---
---
 drivers/gpio/gpio-dwapb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 2a9046c..4275c18 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -724,6 +724,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	platform_set_drvdata(pdev, gpio);
+
 	return 0;
 }
 
-- 
2.7.4

