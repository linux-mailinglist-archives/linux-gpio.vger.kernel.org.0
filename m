Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309533CBF28
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jul 2021 00:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237493AbhGPWUr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 18:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbhGPWUr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jul 2021 18:20:47 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F4CC061762
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 15:17:50 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l26so14828287eda.10
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jul 2021 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zmnEwB1TtIKAG1YOLLif2erRI6Bwj7HWT6BiJYO/Mc=;
        b=gsLeM8r98ER7oZNdNs58cF9sKrIM//L7j2huZvBHLeRAdDT/qSs/jhl0hWL0Umt3eT
         G+HWJ4fhLmT/rRPQg6PuEhs4kyDBZRkmcRrlXpRhWqBQqV9PN3s0wDU7A3kXw5X7DOkB
         37XE5Sc2vrK6UR8oEn7/tiPMWmYureHYJcdfVbtgRebCABh3U3AUZ7pAEl8gpzG52zNA
         RgGZ66fCaCwntvjcT6ETMY+fshyEbW07xuxpu5OdffTfM4ikIrvP2I8Luy322YbSDxJb
         hKnDJpKQJOb5bazSbTI8DCXzoRHtrpMf6vJqpZOSvLJG4W1DvmSXt1PkMDILDGWG3svA
         /29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0zmnEwB1TtIKAG1YOLLif2erRI6Bwj7HWT6BiJYO/Mc=;
        b=LMdqp2g3hSFW4QdK5W4NFFFRneVJw6pqUWpjg+owe7b5xI2F+0yPhAtQO9oWP4tUn2
         8xb/kTf8ZRDZBIBH8MGN7HjEASE4O86+dc9UKp5ibHz8QwfNV9scD7ykzkZrgu3kQsje
         ZcCXj5evjs3xs2b1QFZEvkCODoRkRmf9tQXojMBGKhPplNeP66h6sco7LyzPbUGV6zuw
         GwA1I4My12vKYoYClc5J6j1ACt8Fkxl6da+gieqrGoWOOF3BVDzKgNyadA3uwBW/M0TF
         GnQkJRq/UULAXoEqTqT5BfU0uRCYmKyzSdvQAupPfZohh+LEjNd49nkAP4bu/sFem7Wq
         EPSA==
X-Gm-Message-State: AOAM530ZLt8lp6g/KfvmCa97YcJthUzObTHmBS+NNnYB87+50rloQxQe
        LHPElHef8emFVokO8BvEMji4bg==
X-Google-Smtp-Source: ABdhPJz9jrPDOrGYB1Okan8upTdnPr+gsyBRyAaMiC1g7PU6vJsVBLk/JFGbErB4MBKjBJceTbz9DA==
X-Received: by 2002:aa7:d809:: with SMTP id v9mr17822433edq.146.1626473869562;
        Fri, 16 Jul 2021 15:17:49 -0700 (PDT)
Received: from localhost.localdomain (dh207-98-239.xnet.hr. [88.207.98.239])
        by smtp.googlemail.com with ESMTPSA id f22sm4242634edr.16.2021.07.16.15.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 15:17:49 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 1/2] gpio: tn48m: Add support for Delta TN4810M CPLD
Date:   Sat, 17 Jul 2021 00:17:43 +0200
Message-Id: <20210716221744.5445-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Delta TN4810M uses a similar CPLD GPIO expander
like the TN48M, but it has pins for 48 SFP+ ports,
making a total of 192 pins.
It also provides the TX fault pins which the TN48M
does not.

Only TX disable pins like on the TN48M are output
ones.

Thankfully, regmap GPIO allows for the driver to be
easily extended to support the TN4810M.

Note that this patch depends on the following series:
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=247538

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/gpio/gpio-tn48m.c | 56 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tn48m.c b/drivers/gpio/gpio-tn48m.c
index b12a6b4bc4b3..e429e7ade941 100644
--- a/drivers/gpio/gpio-tn48m.c
+++ b/drivers/gpio/gpio-tn48m.c
@@ -19,6 +19,10 @@ enum tn48m_gpio_type {
 	TN48M_SFP_TX_DISABLE = 1,
 	TN48M_SFP_PRESENT,
 	TN48M_SFP_LOS,
+	TN4810M_SFP_TX_DISABLE,
+	TN4810M_SFP_TX_FAULT,
+	TN4810M_SFP_PRESENT,
+	TN4810M_SFP_LOS,
 };
 
 static int tn48m_gpio_probe(struct platform_device *pdev)
@@ -46,17 +50,36 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
 
 	config.regmap = regmap;
 	config.parent = &pdev->dev;
-	config.ngpio = 4;
+	config.ngpio_per_reg = 8;
 
 	switch (type) {
 	case TN48M_SFP_TX_DISABLE:
 		config.reg_set_base = base;
+		config.ngpio = 4;
 		break;
 	case TN48M_SFP_PRESENT:
 		config.reg_dat_base = base;
+		config.ngpio = 4;
 		break;
 	case TN48M_SFP_LOS:
 		config.reg_dat_base = base;
+		config.ngpio = 4;
+		break;
+	case TN4810M_SFP_TX_DISABLE:
+		config.reg_set_base = base;
+		config.ngpio = 48;
+		break;
+	case TN4810M_SFP_TX_FAULT:
+		config.reg_dat_base = base;
+		config.ngpio = 48;
+		break;
+	case TN4810M_SFP_PRESENT:
+		config.reg_dat_base = base;
+		config.ngpio = 48;
+		break;
+	case TN4810M_SFP_LOS:
+		config.reg_dat_base = base;
+		config.ngpio = 48;
 		break;
 	default:
 		dev_err(&pdev->dev, "unknown type %d\n", type);
@@ -67,9 +90,34 @@ static int tn48m_gpio_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id tn48m_gpio_of_match[] = {
-	{ .compatible = "delta,tn48m-gpio-sfp-tx-disable", .data = (void *)TN48M_SFP_TX_DISABLE },
-	{ .compatible = "delta,tn48m-gpio-sfp-present", .data = (void *)TN48M_SFP_PRESENT },
-	{ .compatible = "delta,tn48m-gpio-sfp-los", .data = (void *)TN48M_SFP_LOS },
+	{
+		.compatible = "delta,tn48m-gpio-sfp-tx-disable",
+		.data = (void *)TN48M_SFP_TX_DISABLE
+	},
+	{
+		.compatible = "delta,tn48m-gpio-sfp-present",
+		.data = (void *)TN48M_SFP_PRESENT
+	},
+	{
+		.compatible = "delta,tn48m-gpio-sfp-los",
+		.data = (void *)TN48M_SFP_LOS
+	},
+	{
+		.compatible = "delta,tn4810m-gpio-sfp-tx-disable",
+		.data = (void *)TN4810M_SFP_TX_DISABLE
+	},
+	{
+		.compatible = "delta,tn4810m-gpio-sfp-tx-fault",
+		.data = (void *)TN4810M_SFP_TX_FAULT
+	},
+	{
+		.compatible = "delta,tn4810m-gpio-sfp-present",
+		.data = (void *)TN4810M_SFP_PRESENT
+	},
+	{
+		.compatible = "delta,tn4810m-gpio-sfp-los",
+		.data = (void *)TN4810M_SFP_LOS
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tn48m_gpio_of_match);
-- 
2.31.1

