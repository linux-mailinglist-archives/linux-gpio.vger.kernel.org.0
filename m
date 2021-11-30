Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B8946410E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 23:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344732AbhK3WMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 17:12:54 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:38614 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344671AbhK3WMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 17:12:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DF7E1CE1CAD
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 22:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1148CC53FCF;
        Tue, 30 Nov 2021 22:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638310128;
        bh=ICs1EZZPgNBH5xISNjPbuRfciO3/zeRncX7W82GW4dU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J4KLg3+i2972N7lAQNhoDrBBcDAuhU95HYlnrY62d6gIaw06rB3vvgLEiyB4DI2cr
         M5OuWmFeEZc3+2mqXg6Gj2XJM2vvP4vqGMBefMZWZ0Qtgy6WQm+G8n9dLv7Hk7axKI
         KZ84SgJyjHBFlnW4nAyq4hVbMb0MdCoWXUPGE7Fo4W14meen/Vzfm1izdo/l+VL1lj
         F8uYI6JqK46LcUlBmApp4Hof6nbwjK+tMv7ckYl8WSZY84HMXAmVHOjQHhjAe6Yl1C
         e+f6VoFkk+a1I8sqMIosDBPSHq8Z0uQFaT7LRbr4BvcZ0DHvsDVjRW6qq2u7cqnGpK
         UyF/+UZYCGChA==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/5] gpio: pch: Use .driver_data instead of checking Device IDs again
Date:   Tue, 30 Nov 2021 16:08:37 -0600
Message-Id: <20211130220841.2776562-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130220841.2776562-1-helgaas@kernel.org>
References: <20211130220841.2776562-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Previously, pch_gpio_probe() tested the Device ID to determine the type of
IOH.  But the driver core has already matched the Device ID with one of the
IDs in the pch_gpio_pcidev_id[] table, and we can supply the IOH type there
as .driver_data.

Use the pci_device_id.driver_data to learn the IOH type instead of testing
the Device ID again.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpio/gpio-pch.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index a552df298a97..625920421990 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -368,14 +368,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	}
 
 	chip->base = pcim_iomap_table(pdev)[1];
-
-	if (pdev->device == 0x8803)
-		chip->ioh = INTEL_EG20T_PCH;
-	else if (pdev->device == 0x8014)
-		chip->ioh = OKISEMI_ML7223m_IOH;
-	else if (pdev->device == 0x8043)
-		chip->ioh = OKISEMI_ML7223n_IOH;
-
+	chip->ioh = id->driver_data;
 	chip->reg = chip->base;
 	pci_set_drvdata(pdev, chip);
 	spin_lock_init(&chip->spinlock);
@@ -439,10 +432,14 @@ static int __maybe_unused pch_gpio_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(pch_gpio_pm_ops, pch_gpio_suspend, pch_gpio_resume);
 
 static const struct pci_device_id pch_gpio_pcidev_id[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x8803) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8014) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8043) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8803) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x8803),
+	  .driver_data = INTEL_EG20T_PCH },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8014),
+	  .driver_data = OKISEMI_ML7223m_IOH },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8043),
+	  .driver_data = OKISEMI_ML7223n_IOH },
+	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8803),
+	  .driver_data = INTEL_EG20T_PCH },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, pch_gpio_pcidev_id);
-- 
2.25.1

