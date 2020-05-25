Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A0C1E068D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 07:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388589AbgEYFs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 01:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388519AbgEYFs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 01:48:58 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D09DC061A0E
        for <linux-gpio@vger.kernel.org>; Sun, 24 May 2020 22:48:58 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z26so8398631pfk.12
        for <linux-gpio@vger.kernel.org>; Sun, 24 May 2020 22:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XIYM4GVeLTC3Z9axuoz5t2DilkFQp57CUQomC0SpqIw=;
        b=eGBNakDRVgMWj2dTPvt/BMALH7JreKe9qU11uzmmrzr8KbfLvfMJLlUDd8RBk3wiZA
         VOg6CnyRjqFs+vvh5YVGVjtFyp7Aa2pH0wh0jQpG5ukFkKWz8juLF7z2zqZj3CtWyOTt
         gvFqMZiZzUDCJPBN4IKvTCWddiQKgGUG/nN0scKMUuVvl93UsrRFuCHNlIV7crkd4lGu
         3CzvnR99qqBxp9wCbespEta2HKSPiXspww55z/Q9+q87f9lYpaTEAtEeii9LjExxuRtW
         O1EsBuP//On9nGJ70wnpPr61Bg7KNFghZf8bSwzG68iTYPZSow/CowR00wYRCvF/QQz5
         VM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XIYM4GVeLTC3Z9axuoz5t2DilkFQp57CUQomC0SpqIw=;
        b=NwUPr8Uvo/OLfU/Eob1ux+sTK5YIfuhf0sgdXBPJcXa8UN15bPQJxeZICLym01bDth
         wyKXknbfJ7TeTumgFEOOCrJtLJs6V0mWS/PBmU6GwdgeWXAAg9DP4ol8XqAMVyqLYWcR
         R/ECoZfj4OdOSOeij2+VBTWZbTaN2FudgHo6e+9E8RVJPIMAhe3gNTled20AmINVa122
         O/4+d4t396PCqc/JEHZgVvyk3MkVZPPdE/cEuyRN8EnR1YnJsasFI5KArFHmuY19Kzzb
         IXMkmb8eZIkRlatP6eLo0d0N8BlkL/+VAxsWFeOT4z2zuS5ReuC4wBTIYgrV274BCJd5
         EEQw==
X-Gm-Message-State: AOAM531xXr1rDsIf6v1uUpxG/MbV2NoPnLuDk9n/Tn9VMqGWJ5JT+dxI
        dpMqiRK5zeY76euRgP/G5Iu3Rz8/0HM=
X-Google-Smtp-Source: ABdhPJwARDCLk/ts5xBrYofSFIW+t0zy+lCvRZs5dlXiZTO/Ee21EywEVrk3weLqRpFLcx7Gd/J6tA==
X-Received: by 2002:a63:d34a:: with SMTP id u10mr23883325pgi.297.1590385737738;
        Sun, 24 May 2020 22:48:57 -0700 (PDT)
Received: from localhost.localdomain ([49.216.48.63])
        by smtp.gmail.com with ESMTPSA id y23sm10637637pgc.78.2020.05.24.22.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 22:48:57 -0700 (PDT)
From:   Richard Hsu <saraon640529@gmail.com>
To:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Andrew_Su@asmedia.com.tw, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, Richard Hsu <saraon640529@gmail.com>
Subject: [PATCH] GPIO: Submit a new GPIO driver
Date:   Mon, 25 May 2020 13:48:33 +0800
Message-Id: <20200525054833.28995-1-saraon640529@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver provide GPIO functionality on Asmedia 28XX and 18XX PCI-E
Bridge

Signed-off-by: Richard Hsu <saraon640529@gmail.com>
---
 patch | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 312 insertions(+)
 create mode 100644 patch

diff --git a/patch b/patch
index 0000000..a713f91
--- /dev/null
+++ b/patch
@@ -0,0 +1,312 @@
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
+--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c	1970-01-01 08:00:00.000000000 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c	2020-05-22 11:55:13.736272177 +0800
+@@ -0,0 +1,282 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Asmedia 28xx/18xx GPIO driver
++ *
++ * Copyright (C) 2020 ASMedia Technology Inc.
++ * Author: Richard Hsu <Richard_Hsu@asmedia.com.tw>
++ */
++
++
++#include <linux/module.h>
++#include <linux/kernel.h>
++#include <linux/gpio/driver.h>
++#include <linux/pci.h>
++#include <linux/spinlock.h>
++#include <linux/pm_runtime.h>
++
++
++/* GPIO registers offsets */
++#define ASM_GPIO_CTRL		0x920
++#define ASM_GPIO_OUTPUT		0x928
++#define ASM_GPIO_INPUT		0x930
++#define ASM_REG_SWITCH		0xFFF
++
++#define ASM_REG_SWITCH_CTL	0x01
++
++#define ASM_GPIO_PIN5		5
++#define ASM_GPIO_DEFAULT	0
++
++
++#define PCI_DEVICE_ID_ASM_28XX_PID1	0x2824
++#define PCI_DEVICE_ID_ASM_28XX_PID2	0x2812
++#define PCI_DEVICE_ID_ASM_28XX_PID3	0x2806
++#define PCI_DEVICE_ID_ASM_18XX_PID1	0x1824
++#define PCI_DEVICE_ID_ASM_18XX_PID2	0x1812
++#define PCI_DEVICE_ID_ASM_18XX_PID3	0x1806
++#define PCI_DEVICE_ID_ASM_81XX_PID1	0x812a
++#define PCI_DEVICE_ID_ASM_81XX_PID2	0x812b
++#define PCI_DEVICE_ID_ASM_80XX_PID1	0x8061
++
++/*
++ * Data for PCI driver interface
++ *
++ * This data only exists for exporting the supported
++ * PCI ids via MODULE_DEVICE_TABLE.  We do not actually
++ * register a pci_driver, because someone else might one day
++ * want to register another driver on the same PCI id.
++ */
++static const struct pci_device_id pci_tbl[] = {
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID1), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID2), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID3), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID1), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID2), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID3), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID1), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID2), 0 },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_80XX_PID1), 0 },
++	{ 0, },	/* terminate list */
++};
++MODULE_DEVICE_TABLE(pci, pci_tbl);
++
++
++struct asm28xx_gpio {
++	struct gpio_chip	chip;
++	struct pci_dev		*pdev;
++	spinlock_t		lock;
++};
++
++void pci_config_pm_runtime_get(struct pci_dev *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct device *parent = dev->parent;
++
++	if (parent)
++		pm_runtime_get_sync(parent);
++	pm_runtime_get_noresume(dev);
++	/*
++	 * pdev->current_state is set to PCI_D3cold during suspending,
++	 * so wait until suspending completes
++	 */
++	pm_runtime_barrier(dev);
++	/*
++	 * Only need to resume devices in D3cold, because config
++	 * registers are still accessible for devices suspended but
++	 * not in D3cold.
++	 */
++	if (pdev->current_state == PCI_D3cold)
++		pm_runtime_resume(dev);
++}
++
++void pci_config_pm_runtime_put(struct pci_dev *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct device *parent = dev->parent;
++
++	pm_runtime_put(dev);
++	if (parent)
++		pm_runtime_put_sync(parent);
++}
++
++static int asm28xx_gpio_request(struct gpio_chip *chip, unsigned offset)
++{
++
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d request\n", offset);
++
++	if (offset == ASM_GPIO_PIN5)
++		return -ENODEV;
++
++	return 0;
++}
++
++static void asm28xx_gpio_free(struct gpio_chip *chip, unsigned offset)
++{
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d free\n", offset);
++}
++
++static void asm28xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
++{
++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
++	unsigned char temp;
++	unsigned long flags;
++
++	pci_config_pm_runtime_get(agp->pdev);
++	spin_lock_irqsave(&agp->lock, flags);
++	pci_read_config_byte(agp->pdev, ASM_GPIO_OUTPUT, &temp);
++	if (value)
++		temp |= BIT(offset);
++	else
++		temp &= ~BIT(offset);
++
++	pci_write_config_byte(agp->pdev, ASM_GPIO_OUTPUT, temp);
++	spin_unlock_irqrestore(&agp->lock, flags);
++	pci_config_pm_runtime_put(agp->pdev);
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d set %d reg=%02x\n", offset, value, temp);
++}
++
++static int asm28xx_gpio_get(struct gpio_chip *chip, unsigned offset)
++{
++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
++	unsigned char temp;
++	unsigned long flags;
++
++	pci_config_pm_runtime_get(agp->pdev);
++	spin_lock_irqsave(&agp->lock, flags);
++	pci_read_config_byte(agp->pdev, ASM_GPIO_INPUT, &temp);
++	spin_unlock_irqrestore(&agp->lock, flags);
++	pci_config_pm_runtime_put(agp->pdev);
++
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx GPIO Pin %d get reg=%02x\n", offset, temp);
++	return (temp & BIT(offset)) ? 1 : 0;
++}
++
++static int asm28xx_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
++{
++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
++	unsigned char temp;
++	unsigned long flags;
++
++	pci_config_pm_runtime_get(agp->pdev);
++	spin_lock_irqsave(&agp->lock, flags);
++	pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
++	temp |= BIT(offset);
++	pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
++	spin_unlock_irqrestore(&agp->lock, flags);
++	pci_config_pm_runtime_put(agp->pdev);
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirout gpio %d  reg=%02x\n", offset, temp);
++
++	return 0;
++}
++
++static int asm28xx_gpio_dirin(struct gpio_chip *chip, unsigned offset)
++{
++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
++	unsigned char temp;
++	unsigned long flags;
++
++	pci_config_pm_runtime_get(agp->pdev);
++	spin_lock_irqsave(&agp->lock, flags);
++	pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
++	temp &= ~BIT(offset);
++	pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
++	spin_unlock_irqrestore(&agp->lock, flags);
++	pci_config_pm_runtime_put(agp->pdev);
++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirin gpio %d  reg=%02x\n", offset, temp);
++
++	return 0;
++}
++
++static struct asm28xx_gpio gp = {
++	.chip = {
++		.label		= "ASM28XX-18XX GPIO",
++		.owner		= THIS_MODULE,
++		.ngpio		= 8,
++		.request	= asm28xx_gpio_request,
++		.free		= asm28xx_gpio_free,
++		.set		= asm28xx_gpio_set,
++		.get		= asm28xx_gpio_get,
++		.direction_output = asm28xx_gpio_dirout,
++		.direction_input = asm28xx_gpio_dirin,
++	},
++};
++
++static int __init asm28xx_gpio_init(void)
++{
++	int err = -ENODEV;
++	struct pci_dev *pdev = NULL;
++	const struct pci_device_id *ent;
++	u8 temp;
++	unsigned long flags;
++	int type;
++
++	for_each_pci_dev(pdev) {
++		ent = pci_match_id(pci_tbl, pdev);
++		if (ent) {
++			/* Because GPIO Registers only work on Upstream port. */
++			type = pci_pcie_type(pdev);
++			if (type == PCI_EXP_TYPE_UPSTREAM) {
++				dev_info(&pdev->dev, "ASMEDIA-28xx/18xx Init Upstream detected\n");
++				goto found;
++			}
++		}
++	}
++
++	/* ASMEDIA-28xx/18xx GPIO not found. */
++	dev_info(&pdev->dev, "ASMEDIA-28xx/18xx Init GPIO not detected\n");
++	goto out;
++
++found:
++	gp.pdev = pdev;
++	gp.chip.parent = &pdev->dev;
++
++	spin_lock_init(&gp.lock);
++
++	err = gpiochip_add_data(&gp.chip, &gp);
++	if (err) {
++		dev_err(&pdev->dev, "GPIO registering failed (%d)\n", err);
++		goto out;
++	}
++
++	pci_config_pm_runtime_get(pdev);
++
++	/* Set PCI_CFG_Switch bit = 1,then we can access GPIO Registers. */
++	spin_lock_irqsave(&gp.lock, flags);
++	pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
++	temp |= ASM_REG_SWITCH_CTL;
++	pci_write_config_byte(pdev, ASM_REG_SWITCH, temp);
++	pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
++	spin_unlock_irqrestore(&gp.lock, flags);
++
++	pci_config_pm_runtime_put(pdev);
++	dev_err(&pdev->dev, "ASMEDIA-28xx/18xx Init SWITCH = 0x%x\n", temp);
++out:
++	return err;
++}
++
++static void __exit asm28xx_gpio_exit(void)
++{
++	unsigned long flags;
++
++	pci_config_pm_runtime_get(gp.pdev);
++
++	spin_lock_irqsave(&gp.lock, flags);
++	/* Set GPIO Registers to default value. */
++	pci_write_config_byte(gp.pdev, ASM_GPIO_OUTPUT, ASM_GPIO_DEFAULT);
++	pci_write_config_byte(gp.pdev, ASM_GPIO_INPUT, ASM_GPIO_DEFAULT);
++	pci_write_config_byte(gp.pdev, ASM_GPIO_CTRL, ASM_GPIO_DEFAULT);
++	/* Clear PCI_CFG_Switch bit = 0,then we can't access GPIO Registers. */
++	pci_write_config_byte(gp.pdev, ASM_REG_SWITCH, ASM_GPIO_DEFAULT);
++	spin_unlock_irqrestore(&gp.lock, flags);
++	pci_config_pm_runtime_put(gp.pdev);
++
++	gpiochip_remove(&gp.chip);
++}
++
++module_init(asm28xx_gpio_init);
++module_exit(asm28xx_gpio_exit);
++
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Richard Hsu <Richard_Hsu@asmedia.com.tw>");
++MODULE_DESCRIPTION("Asmedia 28xx 18xx GPIO Driver");
++
++
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Kconfig linux-5.7.0-rc6-patch/drivers/gpio/Kconfig
+--- linux-5.7.0-rc6/drivers/gpio/Kconfig	2020-05-22 11:54:00.862644198 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig	2020-05-22 11:55:13.680270929 +0800
+@@ -113,6 +113,14 @@ config GPIO_AMDPT
+ 	  driver for GPIO functionality on Promontory IOHub
+ 	  Require ACPI ASL code to enumerate as a platform device.
+
++config GPIO_ASM28XX
++	tristate "Asmedia 28XX/18XX GPIO support"
++	depends on PCI
++	select GPIO_GENERIC
++	help
++	  driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Bridge.
++
++
+ config GPIO_ASPEED
+ 	tristate "Aspeed GPIO support"
+ 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Makefile linux-5.7.0-rc6-patch/drivers/gpio/Makefile
+--- linux-5.7.0-rc6/drivers/gpio/Makefile	2020-05-22 11:54:00.862644198 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile	2020-05-22 11:55:13.680270929 +0800
+@@ -176,3 +176,4 @@ obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtens
+ obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
+ obj-$(CONFIG_GPIO_ZX)			+= gpio-zx.o
+ obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
++obj-$(CONFIG_GPIO_ASM28XX)		+= gpio-asm28xx-18xx.o
--
2.17.1

