Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D28F48C78
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 20:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbfFQSm1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 14:42:27 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:47977 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728971AbfFQSm0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 14:42:26 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZkxd-1i5l5A3J9L-00Wmd7; Mon, 17 Jun 2019 20:42:11 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     thloh@altera.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, andriy.shevchenko@linux.intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 29/30] drivers: gpio: max7300: use arch_platform_driver()
Date:   Mon, 17 Jun 2019 20:41:10 +0200
Message-Id: <1560796871-18560-29-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560796871-18560-1-git-send-email-info@metux.net>
References: <1560796871-18560-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:n45SzJ0LrnQE0VD1afvGYwn7FX+jGR+YxB9RgxD+J1Yg2Ei+4DD
 kAIP8UJ55viTpteajydyqKRO+he3zkaKyU9SIaEkO03Omj/2fxi4A/1y8Muz+tbDigx6viO
 aVc0s802LGgItzKa0aCSIdP4g7NOOkJYT2VxkRl+CD1J3nMoBxH75R0Xfpo9x11rXzV7u25
 VXCTPW4X9Sxb12/HsT78Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eBAWNbocN7E=:jJRldIVZGXVaq0/syEgHMa
 M7tjuLbNDK1B/rjkaRmumtKabLgJaPw0cHoh4/1aN5ylb1okzqvVOTqb0qWq107ZXYCesSXYL
 c2ZhEgg9iQxFb4JiyYaE6FrOTKk8p5zd7MA/F64Xkoj0KvBuY0ff4NIoezG8JZU0e6JjnMwTX
 wh71Z2pFV2t4R7JjZFGaxepeh0dfW2Kjvt6bqEf+kw4C3kLTaWOiderT1pnY4obY/0pdr/bIT
 2eVLlis4sgIl6vyh7cTQdWp8cO7TiJrOsisWDT011pYa+jv/GjCTyS8AiRK8g2CfhnQParoyY
 9w1n/7O7GS+ubQ37nIq6s9bN9Gk15PgV7srtBxVZxJS5vQRlQ5ENAGX8wG06EHvTRN4XPbcdi
 pwXHI+M091W3uQaN2i5Q0IjFxZquLe5n6wTIQm0IiBbWYPMqOECjkDiFTmNzlkTNb8SYtBOaz
 gJFapgv6WXZKMuyWAz01xH0ghFTsCL22Yh54f8uKV4hu3WIpLoPQxIsHr9X3iByPaITmX0gCd
 3VhU3X39ZngOOmHnlE2yHaUTt9+XiZ9bIBa0ptDnSjSz/sn02ZBm45jlvtxNfmqcMH/uOk3Qu
 sVcRnQz0n4cfx48KLK0Cu5XgPPtHSOe98IYvBJhhbubZWcDkzZklqmLUBbNab3FixLQTU6ZAV
 YvLZRmfF7Giweo1e5WovWlyTjaoHpRWc8EiLeSKVL3/9yDfHeedCBrQlU9U+8HsbvGcMvA7ak
 j7eoFNqGNvdW/AJ2E7mgxfEEpmr3V2hw4Oce9VX82K1kLmAWeM+a3CiHpLstpQH6HuaR+Ec4+
 CIdduP7CDs+N/XpZUZfZSP4m5xyQyj9szEzivGgr3MlNZXRwMSezT2Advj31DjicizUgJMbuy
 Ic0zSlhtbt5dVEDraC1zf0ZkDz3thMJh4YRU+RtDETk5UdAvo21/GGZZLPVlJWfVqRywFlVL0
 sF7NvPYVQiw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

Reduce driver init boilerplate by using the new
subsys_i2c_driver() macro.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/gpio/gpio-max7300.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index 1ae9ba8..36d5afa 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -70,18 +70,7 @@ static int max7300_remove(struct i2c_client *client)
 	.remove = max7300_remove,
 	.id_table = max7300_id,
 };
-
-static int __init max7300_init(void)
-{
-	return i2c_add_driver(&max7300_driver);
-}
-subsys_initcall(max7300_init);
-
-static void __exit max7300_exit(void)
-{
-	i2c_del_driver(&max7300_driver);
-}
-module_exit(max7300_exit);
+subsys_i2c_driver(max7300_driver);
 
 MODULE_AUTHOR("Wolfram Sang");
 MODULE_LICENSE("GPL v2");
-- 
1.9.1

