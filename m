Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5035B34A6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Sep 2022 11:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIIJ4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Sep 2022 05:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiIIJ4i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Sep 2022 05:56:38 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D3129524
        for <linux-gpio@vger.kernel.org>; Fri,  9 Sep 2022 02:56:35 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id bq9so1858571wrb.4
        for <linux-gpio@vger.kernel.org>; Fri, 09 Sep 2022 02:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7RW5RoLyRMk7EH9/rGDpXewoEusVjU4pOR02uHsSrVM=;
        b=jeWUckSm83hC0bK6zIjSJr/DxEEhzMkMzDYuRrfWNStMEkz24OVTRE6MkWi9DV3wfx
         al7Gb0eX4p7zBF5Oik7I3y/4VQXNwCrR8o0Wrzs1y8Jyl3xds4RktxMTu1ynRme3UOBF
         D2od5R+o8pBx5pWABDDVZ7x9Q2WvtVAbbSCT52cc3Xsjc2GYLjte6lxXHIvU+J32O1pW
         cNCCceAVDY6gyjjHHd1KdHyUMSuuvsZwIRGglLqJ53jfsUMG+MfTC+aFAAWTPQED+z1s
         Sy8QeUJFeZ/9jpGEXmAMtIs+tkyew7vJxonh6zK3ACGfqyJc2gCTe9AR7EUyRV4OWAw2
         9SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7RW5RoLyRMk7EH9/rGDpXewoEusVjU4pOR02uHsSrVM=;
        b=bOq7Yvf44s9dIvMqCDkWCIK3B99JDwbjsBeeyPf+m1OcZzP4lBN0YmPQTlydgPpi+Q
         5AYc4IcMEQn/yGrmP2Rc9HRCbOsFq3vZcYU0/WoPSqgq5y3/Bio9S/3w6e9gedo9BX85
         959zYFXwxf5Ju+AkcU/9ufqxYvUiTVAPVTc5zk/sXzkZzWl66TdMgLkKh7ulh+a7a+fh
         iovo8Uj5cBT6Z2nC5GgMgzJ1EL9wlpg1dNURvNBWf5UXijc/5+E3N7QzwKwRFjQtzO5s
         eP6hOOOF94CxyC2WPuxH25u1Lw9tOvayjwEX50wv0+7a3CSNxS1SxhhtP9VlX1wCwYxf
         /SBw==
X-Gm-Message-State: ACgBeo10sPVgebFCuypCHuH2iFSnLDnRdAT1xTC1XVr1pOsyNJKadyVe
        RN+9uUrTz1vTvhSexfOmMtjNFtVFs7iNKQ==
X-Google-Smtp-Source: AA6agR5AHcQ4s916T7Z7+N2QkEqLCdkfOfqx1TK7hLPYycFlaffsHePzg6MZGvq91A3zLF7MkGsd/Q==
X-Received: by 2002:a5d:6f14:0:b0:228:e3c6:fa2 with SMTP id ay20-20020a5d6f14000000b00228e3c60fa2mr7061234wrb.516.1662717393571;
        Fri, 09 Sep 2022 02:56:33 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id bt4-20020a056000080400b002238ea5750csm117597wrb.72.2022.09.09.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:56:33 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, arinc.unal@arinc9.com,
        matthias.bgg@gmail.com
Subject: [PATCH 1/2] gpio: mt7621: Switch to use fwnode instead of of_node
Date:   Fri,  9 Sep 2022 11:56:31 +0200
Message-Id: <20220909095632.2056143-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO library now accepts fwnode as a firmware node, so
switch the driver to use it.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index d8a26e503ca5..05891dd3f96e 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -9,7 +9,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
@@ -205,7 +204,8 @@ mediatek_gpio_xlate(struct gpio_chip *chip,
 }
 
 static int
-mediatek_gpio_bank_probe(struct device *dev, int bank)
+mediatek_gpio_bank_probe(struct device *dev,
+			 struct fwnode_handle *fwnode, int bank)
 {
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
@@ -216,6 +216,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	memset(rg, 0, sizeof(*rg));
 
 	spin_lock_init(&rg->lock);
+	rg->chip.fwnode = fwnode;
 	rg->bank = bank;
 
 	dat = mtk->base + GPIO_REG_DATA + (rg->bank * GPIO_BANK_STRIDE);
@@ -290,7 +291,7 @@ static int
 mediatek_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct mtk *mtk;
 	int i;
 	int ret;
@@ -303,12 +304,12 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk->base))
 		return PTR_ERR(mtk->base);
 
-	mtk->gpio_irq = irq_of_parse_and_map(np, 0);
+	mtk->gpio_irq = fwnode_irq_get(fwnode, 0);
 	mtk->dev = dev;
 	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
-		ret = mediatek_gpio_bank_probe(dev, i);
+		ret = mediatek_gpio_bank_probe(dev, fwnode, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1

