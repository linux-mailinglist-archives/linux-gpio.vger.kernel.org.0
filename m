Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3562649E67
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 12:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729529AbfFRKke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 06:40:34 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38287 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbfFRKke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 06:40:34 -0400
Received: from orion.localdomain ([95.114.66.109]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MA7Su-1hkI1F2aZm-00BeoB; Tue, 18 Jun 2019 12:40:31 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/2] drivers: gpio: siox: use module_siox_driver()
Date:   Tue, 18 Jun 2019 12:40:27 +0200
Message-Id: <1560854427-27537-3-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560854427-27537-1-git-send-email-info@metux.net>
References: <1560854427-27537-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:45Ac3UiLARhLc+RI3tf9JOC/IGGQDCADcprV2HEjVi8Z0XOcCcR
 h+KHapYSoNqkKxh2T8dt4jvrQNMV5/bfa62a8mVgEppDX+8q9ATwSUEcyVo5XuCfyjWAZg6
 bAgD5wj60+FFAL7o2KfVUosD2a/nVTbIaXYZyVYeN6ArQDBOUXvQSZnv7kQdbFkQpvMQKtk
 mK0IK2jTatxbhUlbYj4IQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L710K/kQJxs=:NynDmR7iOe4ZTnnQlmTXe5
 QG0aSHjXfZeiProtldHrG+pvy8Pb4TbAO/kr2PlBCp574pJg0KXPB2YJX9/7c50Ej69to+3sj
 61ZYvVE+3R5a9JQrp6FKrddpH+gnJ4YHa6ETPD4q8NXvzM5CUKkOvQOcVCHU6T+uVfc9hMh84
 vYghpGEGteh1UdghxjW7FBqB6md5QwluhlOYnCYWJzSVYqr9JcMvTzrGRXUB3OQZxQEngQBPS
 dVa2ig49/GkmgiVU25Dg+Sy9sd0jOTovmWf79gYebcAuGoq14VeEWjbSulbgOMA9Cwh0YMij/
 JZ21c1dJFD4qY+qYqzh7VjkJezTaxkoRCMA/yEGQ2bbaK5TH0OHoXBVhj+J+f+YIw+A4ER2+j
 e+Fjt9F0JSLoa/guQ+RsZZFuDRlDxx98kbLsNHoCXs7bDoWX5pPuUiEBLSFAIzgqI9BkZDYH9
 9tVw6Jgm35c18sSFUAuVioMKnvkca0CVABpThSVjYeYufeEVKe7nrt0iZKn3J7aJQSkeRcLDq
 IOzQOHRkHUx7OU0Z2/Iav6g9PyjHaYciAnYYFxl+bbNCBeMRhbdfSiaoimQFgc23IvhNxWIFN
 tHydZtvlZFCytJbziHXYzmlVDcG+nhWW4mdJ0L0uBbKlyItnxWIltCS9vFrb9z0iPBlwHIXYz
 VEn429JtFnT6zs8rY6RtUM7QkiSZ/PmX0GRHT08bgP6oLV2nvrqOs7WobFTuvbGo8+DC+/aPi
 Uov/L0xq1/xtxI5LZ3CRkfHofk6rwWoWm8pFnA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
module_siox_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-siox.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-siox.c b/drivers/gpio/gpio-siox.c
index 571b2a8..fb4e318 100644
--- a/drivers/gpio/gpio-siox.c
+++ b/drivers/gpio/gpio-siox.c
@@ -275,18 +275,7 @@ static int gpio_siox_remove(struct siox_device *sdevice)
 		.name = "gpio-siox",
 	},
 };
-
-static int __init gpio_siox_init(void)
-{
-	return siox_driver_register(&gpio_siox_driver);
-}
-module_init(gpio_siox_init);
-
-static void __exit gpio_siox_exit(void)
-{
-	siox_driver_unregister(&gpio_siox_driver);
-}
-module_exit(gpio_siox_exit);
+module_siox_driver(gpio_siox_driver);
 
 MODULE_AUTHOR("Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>");
 MODULE_DESCRIPTION("SIOX gpio driver");
-- 
1.9.1

