Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9181E2003
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 12:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731858AbgEZKoP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 06:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731833AbgEZKoP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 06:44:15 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F43C03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 03:44:13 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m7so8544964plt.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=e3jQHUjVBv00ig0BpBqhSOhThjuR0OhSoD5v5s6qgLo=;
        b=rFINC2wSkSjvbvcXCKOE03TtCZYfILE2NTxoKce5CZ1UEflqC9Kx6rEmnCxXXFHiha
         r8kE71cX/Xph2qPk2xjSVZk1ZB1MdVt0ISnsP3Qea8Sm19HQRd+vp207rYDto4MKKoJP
         RMrO0la4t2OvgEQs4yEeN4k7jr9B4m2hH58bcfgVaeNJcOoImFqKFUssKCZuBK/BJKT5
         6/gC7ged8sQ7uQkvwMg9xXYq/8DVlBDDLRCEgn5AbQcP+7mR7wLdzWgwd71OmWEPF70n
         idhnC2noo//rn0Qz37PYFvsrMl7Z5RVB6KKrfPZ7VsQalc7jp9hFrsDPQqg4oibWRvWq
         nWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=e3jQHUjVBv00ig0BpBqhSOhThjuR0OhSoD5v5s6qgLo=;
        b=SSx7BJITNLkb70/kdE6qNH18dZzGRXacSOQ4RmToXZlSd5+0iFONvd9oMpeK+Pw7nP
         Ft4oxLRk2ko63qMa7jETXJgeuNgPgbzfmQfnjeOr2KyAvW+mDHj0LDAf94qhJ/I8TROt
         Xu2xucXHbaU2xBE3kg0NK1EutNQSGGC39BzFD8fP1v6z3nL9O7gcLnwcnjEQppqgIs4q
         5yy6i1ypIyEhymNQTxIrppfEw+tLSVOs8QfwDaRPv9fcEDprMzqRYzxmqQyZ+TQx/uEs
         OvfXkBkxw525s9vY3ylC9fIW5iT6KmQRKdviiWdkQ4Ewtx8fS0FPboP2C7Q7ioCtX4In
         mr7A==
X-Gm-Message-State: AOAM531j2uhnYTcwbnR0bOyuxE6FIAxv3mWh2pWeASy4l7fjj2ED5R4y
        32fapZLUiQw5JlxpD9uUEeBQO92KZK0=
X-Google-Smtp-Source: ABdhPJyvM6kVPjkkYuVyPW3tBIYEFaoZEyAGhWjntGFmHmeROOda7mC29lVZVL0PhT5g2dN7dlZ6uA==
X-Received: by 2002:a17:902:7783:: with SMTP id o3mr484375pll.286.1590489853329;
        Tue, 26 May 2020 03:44:13 -0700 (PDT)
Received: from localhost.localdomain ([101.15.161.162])
        by smtp.gmail.com with ESMTPSA id h3sm15037220pjk.10.2020.05.26.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 03:44:12 -0700 (PDT)
From:   Richard Hsu <saraon640529@gmail.com>
To:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Jesse1_Chang@asmedia.com.tw, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, Richard Hsu <saraon640529@gmail.com>
Subject: [PATCH] gpio:gpio-asm28xx-18xx: new driver
Date:   Tue, 26 May 2020 18:43:21 +0800
Message-Id: <20200526104321.4825-1-saraon640529@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz Golaszewski and Linux Walleij
  Sorry!I don't know why it diff against a patch in old repo.
I create a new git repo and re-process it.
I have modified it according to your suggestions.And our device
is similar as AMD South Bridge(amd8111),then i just take
gpio-amd8111.c in kernel driver source as reference.
It says that we can't use plain pci_driver mechanism,as the device
is really a multiple function device,main driver that binds to the
pci_device is a bus driver.It seems reasonable,then i follow it.

Signed-off-by: Richard Hsu <saraon640529@gmail.com>
---
 patch | 314 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 314 insertions(+)
 create mode 100644 patch

diff --git a/patch b/patch
index 0000000..220a8cf
--- /dev/null
+++ b/patch
@@ -0,0 +1,314 @@
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
+--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c	1970-01-01 08:00:00.000000000 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c	2020-05-26 10:41:11.401349769 +0800
+@@ -0,0 +1,281 @@
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
++#include <linux/bits.h>
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
++	if (offset == ASM_GPIO_PIN5)
++		return -ENODEV;
++
++	return 0;
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
++	/* We look for our device - Asmedia 28XX and 18XX Bridge
++	 * I don't know about a system with two such bridges,
++	 * so we can assume that there is max. one device.
++	 *
++	 * We can't use plain pci_driver mechanism,
++	 * as the device is really a multiple function device,
++	 * main driver that binds to the pci_device is an bus
++	 * driver and have to find & bind to the device this way.
++	 */
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
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Kconfig linux-5.7.0-rc6-patch/drivers/gpio/Kconfig
+--- linux-5.7.0-rc6/drivers/gpio/Kconfig	2020-05-22 11:54:00.862644198 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig	2020-05-26 09:42:21.777312685 +0800
+@@ -113,6 +113,14 @@ config GPIO_AMDPT
+ 	  driver for GPIO functionality on Promontory IOHub
+ 	  Require ACPI ASL code to enumerate as a platform device.
+
++config GPIO_ASM28XX
++	tristate "Asmedia 28XX/18XX GPIO support"
++	depends on PCI
++	select GPIO_GENERIC
++	help
++	  Driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Bridge.
++
++
+ config GPIO_ASPEED
+ 	tristate "Aspeed GPIO support"
+ 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
+diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Makefile linux-5.7.0-rc6-patch/drivers/gpio/Makefile
+--- linux-5.7.0-rc6/drivers/gpio/Makefile	2020-05-22 11:54:00.862644198 +0800
++++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile	2020-05-26 09:45:42.092095882 +0800
+@@ -31,6 +31,7 @@ obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8
+ obj-$(CONFIG_GPIO_AMD_FCH)		+= gpio-amd-fch.o
+ obj-$(CONFIG_GPIO_AMDPT)		+= gpio-amdpt.o
+ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
++obj-$(CONFIG_GPIO_ASM28XX)		+= gpio-asm28xx-18xx.o
+ obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
+ obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
+ obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
-- 
2.17.1

