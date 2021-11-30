Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9D746410F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344747AbhK3WM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344678AbhK3WMU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67698C061757
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 14:08:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F159B81D3C
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F1FC53FD0;
        Tue, 30 Nov 2021 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310131;
        bh=K5kjoVixjmU2Vq/LXKt/KMDR0qFId8jnRJKidJLr00Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RqSbB4KOvGz1cn8u4iRgS/20RpUe+KO2Hxn9XbTcngU9F/5GiuchAQLOsWIbSxZ2P
         4RO8oG+mV1bdEnL+NJW7jR349NuMChTGlXCAFqqBnCnWZ9EtqN/AsFddsgmwjCcPT7
         NfMp+mao5cmSbvgMKoy+4acvJpTezdi+FUFzROMcTp4GbCHOR2EWzmP0nJgjQqvCHY
         yhezT7j6Sq8/MwGz7s0hG/5Ao4oXSgDUP8oxtB/+3hznmD6d67Z/+TdfcMKl7MdlzH
         mTdqm7iX8yr7cnjWhQty4CXPqH5kS6yrX2knvgfHY+rStuEVjePWyGjfLQo7C7+fPG
         m5bllxeTTsSlw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 3/5] gpio: ml-ioh: Cache &pdev->dev to reduce repetition
Date:   Tue, 30 Nov 2021 16:08:39 -0600
Message-Id: <20211130220841.2776562-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

ioh_gpio_probe() repeats the "&pdev->dev" expression several times.  Cache
the result as "struct device *dev" to reduce the repetition.  No functional
change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpio/gpio-ml-ioh.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index efa9acdc320a..4e9528dd1152 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -401,6 +401,7 @@ static int ioh_gpio_alloc_generic_chip(struct ioh_gpio *chip,
 static int ioh_gpio_probe(struct pci_dev *pdev,
 				    const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	int ret;
 	int i, j;
 	struct ioh_gpio *chip;
@@ -410,19 +411,19 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 
 	ret = pci_enable_device(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "%s : pci_enable_device failed", __func__);
+		dev_err(dev, "%s : pci_enable_device failed", __func__);
 		goto err_pci_enable;
 	}
 
 	ret = pci_request_regions(pdev, KBUILD_MODNAME);
 	if (ret) {
-		dev_err(&pdev->dev, "pci_request_regions failed-%d", ret);
+		dev_err(dev, "pci_request_regions failed-%d", ret);
 		goto err_request_regions;
 	}
 
 	base = pci_iomap(pdev, 1, 0);
 	if (!base) {
-		dev_err(&pdev->dev, "%s : pci_iomap failed", __func__);
+		dev_err(dev, "%s : pci_iomap failed", __func__);
 		ret = -ENOMEM;
 		goto err_iomap;
 	}
@@ -435,7 +436,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 
 	chip = chip_save;
 	for (i = 0; i < 8; i++, chip++) {
-		chip->dev = &pdev->dev;
+		chip->dev = dev;
 		chip->base = base;
 		chip->reg = chip->base;
 		chip->ch = i;
@@ -443,17 +444,17 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 		ioh_gpio_setup(chip, num_ports[i]);
 		ret = gpiochip_add_data(&chip->gpio, chip);
 		if (ret) {
-			dev_err(&pdev->dev, "IOH gpio: Failed to register GPIO\n");
+			dev_err(dev, "IOH gpio: Failed to register GPIO\n");
 			goto err_gpiochip_add;
 		}
 	}
 
 	chip = chip_save;
 	for (j = 0; j < 8; j++, chip++) {
-		irq_base = devm_irq_alloc_descs(&pdev->dev, -1, IOH_IRQ_BASE,
+		irq_base = devm_irq_alloc_descs(dev, -1, IOH_IRQ_BASE,
 						num_ports[j], NUMA_NO_NODE);
 		if (irq_base < 0) {
-			dev_warn(&pdev->dev,
+			dev_warn(dev,
 				"ml_ioh_gpio: Failed to get IRQ base num\n");
 			ret = irq_base;
 			goto err_gpiochip_add;
@@ -467,11 +468,10 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	}
 
 	chip = chip_save;
-	ret = devm_request_irq(&pdev->dev, pdev->irq, ioh_gpio_handler,
+	ret = devm_request_irq(dev, pdev->irq, ioh_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (ret != 0) {
-		dev_err(&pdev->dev,
-			"%s request_irq failed\n", __func__);
+		dev_err(dev, "%s request_irq failed\n", __func__);
 		goto err_gpiochip_add;
 	}
 
@@ -498,7 +498,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 
 err_pci_enable:
 
-	dev_err(&pdev->dev, "%s Failed returns %d\n", __func__, ret);
+	dev_err(dev, "%s Failed returns %d\n", __func__, ret);
 	return ret;
 }
 
-- 
2.25.1

