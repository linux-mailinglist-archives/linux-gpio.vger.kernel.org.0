Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6262B4E89
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 18:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388136AbgKPRv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 12:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388135AbgKPRv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 12:51:57 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02849C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 09:51:57 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id x13so9172042qvk.8
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 09:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nUjsKL0zU5S6HV0p2Tb4kZwzesJlvPVoqD+app4iSn4=;
        b=Eg6YFSOHWXHxqCDSEtlXod31IpWO/UYohL7jld/A/5B+azxHGe9NEZJBwgPIgDpkr/
         Fw5vbBXBn14rHw8KWwkzUVlDa/nJMrdmKYyWj0qRsG+CLPvPd1nM7p3gPDdR/L/d6Fq0
         YSa8rHFPX1y5VyLZquto0p3IAc/GJ3aGjC3yBF+kblqlbSYDv7JIhLH7N4nFSWALPcul
         oBgy0zNt92bhE/sS9xl7fSkmLYcZmvh+P8xecBmAiC6mDPAZHa2iIV453bkxk0kQDZzP
         TLnHy49uuiDQMxTaiH4BDi7BRYHN5VsYoKnVE365V4yaTa80YOLHkxi4pi/F1NNtyj/z
         YGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nUjsKL0zU5S6HV0p2Tb4kZwzesJlvPVoqD+app4iSn4=;
        b=CIdzMSx+sHuIWIPVHQKYQOOTSadN1/rS9i4L3eyu7lELs7GRo4lOg09e1sJcG9qwk5
         MeSWkHtrGAAOVNYvbAFxuFSnZ1rURoPboIZyuKG2jTdCzoEDk3q6E2CdHjE/KKY0071B
         YoT4frEofgciwfujjTIepopeK7fn+T2+NLvwbA9kLq8bKcImA4wbyMjXN7aYyTZ1AXQq
         Ap7EK/tzevyxFoeNalJ/6VRs+OJ03xkkgS/YsEo65vb/L6okvxzJf52zwLNLulj142Cb
         d8qwN/XUHqNcHucNtDACywCJGdkaFcv4ponulOe4NjH1Xy6XECUP4x9mpwGa2d2AkAeB
         /kYA==
X-Gm-Message-State: AOAM531+EmIadk+bkj/7HhHi2zbNdfPrJRqyia2QAmEMiOOIexQdSYZp
        Tr0oLNXKJkhEOrnWa0Fe0dw=
X-Google-Smtp-Source: ABdhPJw8CUpVhRJ/gAqnk0fMGYaYvBQBYwbyRdHDB89olODl/3lHK3gQioPTRxRJMA0hYcBKUz3fjA==
X-Received: by 2002:ad4:4721:: with SMTP id l1mr16359295qvz.30.1605549116019;
        Mon, 16 Nov 2020 09:51:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id o8sm12608534qtm.9.2020.11.16.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:51:55 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linus.walleij@linaro.org
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] gpio: mxc: Remove unused .id_table support
Date:   Mon, 16 Nov 2020 14:51:28 -0300
Message-Id: <20201116175128.4824-1-festevam@gmail.com>
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
Changes since v1:
- Configure hw_type to of_id - Phillip

 drivers/gpio/gpio-mxc.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 643f4c557ac2..2ed4d920861e 100644
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
@@ -376,11 +358,7 @@ static void mxc_gpio_get_hw(struct platform_device *pdev)
 {
 	const struct of_device_id *of_id =
 			of_match_device(mxc_gpio_dt_ids, &pdev->dev);
-	enum mxc_gpio_hwtype hwtype;
-
-	if (of_id)
-		pdev->id_entry = of_id->data;
-	hwtype = pdev->id_entry->driver_data;
+	enum mxc_gpio_hwtype hwtype = (enum mxc_gpio_hwtype)of_id->data;
 
 	if (mxc_gpio_hwtype) {
 		/*
@@ -596,7 +574,6 @@ static struct platform_driver mxc_gpio_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe		= mxc_gpio_probe,
-	.id_table	= mxc_gpio_devtype,
 };
 
 static int __init gpio_mxc_init(void)
-- 
2.17.1

