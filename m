Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05FA2B49B6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 16:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbgKPPoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 10:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729795AbgKPPoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 10:44:16 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAB9C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 07:44:16 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id o66so3773448qkd.4
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 07:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eSunKcksHHT/bVys02/ZbrpRg77FJh70tQ/dvpdAX8E=;
        b=HyseX0xw3GI7emA7dS02JQ9OxcHw5RndxIRnUO0Py3qI4nagtkXgMskrbX+mQuih7w
         2cFKBpUbpIb4NCZlcMer2MIzi2YdwWsY7ArNUzER2ySxdrDpcOSMpTjt67Mb9V4QBWL5
         xcIa1wncjfpetIPRI6SEbPXzlLyoAe8sl6QtSL4RSRkdUqBlZONRUs5H36Mx2k70TzBB
         icgSzzyKA9PV7mkTPqB9o225+JVowRmsZ9LeeTSfIuSnE1CXVPgsacFQjq+Ae/sAkCkB
         I0qMMy5cNOhoiFW8qel1yJXhnN9i3Ri33OagGyGOlK0L1zTLvJy7yxJDwUIHYXdm95iJ
         ElDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eSunKcksHHT/bVys02/ZbrpRg77FJh70tQ/dvpdAX8E=;
        b=dECICP0Mnl+rLs8cvpbE5MpL8nIDuNkHxpVlr1/Owi+J5yiMdOBY4wNbUVdO9JgqAg
         VpDrpax9ErmMKuvmoZhAeBbueK23tYsSOHSIbGeurw9m/5ljETulnEyZDvs+aQzrmrbK
         AEs/V8JvJnzL2dsU2dYDmKQZdFTbKhCNo5AUrSXjhCTckBLKVO1PQkwCOUwjmU5hxSul
         zLdVLdn0rbBHckQvo231j37i09w93RPIothpNBzxsGZM2zz33eG49ogk091HDQLcFNW8
         dfoZV3zfd6tsI408B9sy1nFhRERj7NAQWbO7OxB5mS5I8CGE1HNyZJYw97JzW6pys/24
         2WPw==
X-Gm-Message-State: AOAM531y0BjdzYBap4bdSmS4GbBIqwcKCh4zuHVRkhBnntKZ1CN4UupG
        80EHaRHo40VvPneciWMsdW0=
X-Google-Smtp-Source: ABdhPJyCe5pzUULS55NLjLoDFCq/JBxJzsyVkOrjc3nrqOH3vwk3dAUVAdeW0s9jsGpyA4otSvV4Yg==
X-Received: by 2002:ae9:eb10:: with SMTP id b16mr14959976qkg.494.1605541455739;
        Mon, 16 Nov 2020 07:44:15 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id 189sm8192778qkn.125.2020.11.16.07.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 07:44:15 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] gpio: mxc: Remove unused .id_table support
Date:   Mon, 16 Nov 2020 12:44:07 -0300
Message-Id: <20201116154407.15179-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
.id_table support in this driver was only useful for old non-devicetree
platforms.

Get rid of the .id_table since it is no longer used.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpio/gpio-mxc.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 643f4c557ac2..aadc11064b74 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -133,30 +133,12 @@ static struct mxc_gpio_hwdata *mxc_gpio_hwdata;
 #define GPIO_INT_FALL_EDGE	(mxc_gpio_hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
-static const struct platform_device_id mxc_gpio_devtype[] = {
-	{
-		.name = "imx1-gpio",
-		.driver_data = IMX1_GPIO,
-	}, {
-		.name = "imx21-gpio",
-		.driver_data = IMX21_GPIO,
-	}, {
-		.name = "imx31-gpio",
-		.driver_data = IMX31_GPIO,
-	}, {
-		.name = "imx35-gpio",
-		.driver_data = IMX35_GPIO,
-	}, {
-		/* sentinel */
-	}
-};
-
 static const struct of_device_id mxc_gpio_dt_ids[] = {
-	{ .compatible = "fsl,imx1-gpio", .data = &mxc_gpio_devtype[IMX1_GPIO], },
-	{ .compatible = "fsl,imx21-gpio", .data = &mxc_gpio_devtype[IMX21_GPIO], },
-	{ .compatible = "fsl,imx31-gpio", .data = &mxc_gpio_devtype[IMX31_GPIO], },
-	{ .compatible = "fsl,imx35-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
-	{ .compatible = "fsl,imx7d-gpio", .data = &mxc_gpio_devtype[IMX35_GPIO], },
+	{ .compatible = "fsl,imx1-gpio", .data = (const void *)IMX1_GPIO },
+	{ .compatible = "fsl,imx21-gpio", .data = (const void *)IMX21_GPIO },
+	{ .compatible = "fsl,imx31-gpio", .data = (const void *)IMX31_GPIO },
+	{ .compatible = "fsl,imx35-gpio", .data = (const void *)IMX35_GPIO },
+	{ .compatible = "fsl,imx7d-gpio", .data = (const void *)IMX35_GPIO },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxc_gpio_dt_ids);
@@ -596,7 +578,6 @@ static struct platform_driver mxc_gpio_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe		= mxc_gpio_probe,
-	.id_table	= mxc_gpio_devtype,
 };
 
 static int __init gpio_mxc_init(void)
-- 
2.17.1

