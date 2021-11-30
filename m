Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF853464125
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344929AbhK3WRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:17:15 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:42176 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344549AbhK3WMN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5CD60B81D41
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95A3C53FCC;
        Tue, 30 Nov 2021 22:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310130;
        bh=Bwocmk2zGXOjzfa7u+dwaG1albWjVqET0kPSLgpOr4Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GciYKpYkLowc18qjD16FHkGNoP6Ov2oRhoVJ8Kkd84iYgWg1oZpIlAOqO7bQdcN+c
         j01N5OjFd5m6efB5OgEHLUr3UWgRFxQAkl5e79S/IqH1GFqDg1EocM+1HNM6dl5ut8
         EodXhAFQRDH2b6LAs15AyrmWtGmPydZyE8YAsPSGEipPUvYRXvYfUYOI4rmefEdiKb
         TaDOImRsKuCFy1cDtr9dWmfVdvtcR6hQj0eFOy7CxlEUW8lMf1HTwejGnenFy0VT5J
         IZSzUeAhOVPkQYQpGijF7yt9QGA5wEPNGFljj2Ie4n/S0G4e23fvEbt4X13XqDkjJH
         1UMIIkBudw7Jw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/5] gpio: pch: Cache &pdev->dev to reduce repetition
Date:   Tue, 30 Nov 2021 16:08:38 -0600
Message-Id: <20211130220841.2776562-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

pch_gpio_probe() repeats the "&pdev->dev" expression several times.  Cache
the result as "struct device *dev" to reduce the repetition.  No functional
change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpio/gpio-pch.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 625920421990..3a0bd8795741 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -346,24 +346,25 @@ static int pch_gpio_alloc_generic_chip(struct pch_gpio *chip,
 static int pch_gpio_probe(struct pci_dev *pdev,
 				    const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	s32 ret;
 	struct pch_gpio *chip;
 	int irq_base;
 
-	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
 		return -ENOMEM;
 
-	chip->dev = &pdev->dev;
+	chip->dev = dev;
 	ret = pcim_enable_device(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "pci_enable_device FAILED");
+		dev_err(dev, "pci_enable_device FAILED");
 		return ret;
 	}
 
 	ret = pcim_iomap_regions(pdev, BIT(1), KBUILD_MODNAME);
 	if (ret) {
-		dev_err(&pdev->dev, "pci_request_regions FAILED-%d", ret);
+		dev_err(dev, "pci_request_regions FAILED-%d", ret);
 		return ret;
 	}
 
@@ -374,16 +375,16 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	spin_lock_init(&chip->spinlock);
 	pch_gpio_setup(chip);
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gpio, chip);
+	ret = devm_gpiochip_add_data(dev, &chip->gpio, chip);
 	if (ret) {
-		dev_err(&pdev->dev, "PCH gpio: Failed to register GPIO\n");
+		dev_err(dev, "PCH gpio: Failed to register GPIO\n");
 		return ret;
 	}
 
-	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0,
+	irq_base = devm_irq_alloc_descs(dev, -1, 0,
 					gpio_pins[chip->ioh], NUMA_NO_NODE);
 	if (irq_base < 0) {
-		dev_warn(&pdev->dev, "PCH gpio: Failed to get IRQ base num\n");
+		dev_warn(dev, "PCH gpio: Failed to get IRQ base num\n");
 		chip->irq_base = -1;
 		return 0;
 	}
@@ -393,10 +394,10 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	iowrite32(BIT(gpio_pins[chip->ioh]) - 1, &chip->reg->imask);
 	iowrite32(BIT(gpio_pins[chip->ioh]) - 1, &chip->reg->ien);
 
-	ret = devm_request_irq(&pdev->dev, pdev->irq, pch_gpio_handler,
+	ret = devm_request_irq(dev, pdev->irq, pch_gpio_handler,
 			       IRQF_SHARED, KBUILD_MODNAME, chip);
 	if (ret) {
-		dev_err(&pdev->dev, "request_irq failed\n");
+		dev_err(dev, "request_irq failed\n");
 		return ret;
 	}
 
-- 
2.25.1

