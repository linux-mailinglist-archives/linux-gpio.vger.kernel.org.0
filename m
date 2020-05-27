Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D31E4803
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 17:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgE0Pqt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 11:46:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389888AbgE0Ppw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 11:45:52 -0400
Received: from localhost (mobile-166-175-190-200.mycingular.net [166.175.190.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEE5920776;
        Wed, 27 May 2020 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590594351;
        bh=iBUn9eSZBsoyN4YXtKGySx1f9z78+s19V78ywAbkNnY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=stC7rsipxQ4hSydKMOQuAtBZI3WOMwA0rAit5kpaLmhf8nWAyK5J0D+gnAXBFoUUh
         D7dcQQHQfBHIMIgdVLpi/mVDqJZLgockvnnqWgZZMv25Q9KdH+Q+ZQsTkuowq0vQIy
         I7WSEXWRysa7/DjwsyDm//jN/uuEIkvyvlG8Ej74=
Date:   Wed, 27 May 2020 10:45:48 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Richard Hsu <saraon640529@gmail.com>
Cc:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Andrew_Su@asmedia.com.tw, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] GPIO: Submit a new GPIO driver
Message-ID: <20200527154548.GA227578@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525054833.28995-1-saraon640529@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 01:48:33PM +0800, Richard Hsu wrote:
> This driver provide GPIO functionality on Asmedia 28XX and 18XX PCI-E
> Bridge

The correct styling appears to be "ASMedia" based on asmedia.com.tw
(appears many times here and below).

Please also make your subject line more useful by including the
company and device, e.g.,

  gpio: Add ASMedia 28XX and 18XX GPIO driver

s/PCI-E/PCIe/ (here and below).

> Signed-off-by: Richard Hsu <saraon640529@gmail.com>
> ---
>  patch | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 312 insertions(+)
>  create mode 100644 patch
> 
> diff --git a/patch b/patch
> index 0000000..a713f91
> --- /dev/null
> +++ b/patch
> @@ -0,0 +1,312 @@
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c
> +--- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c	1970-01-01 08:00:00.000000000 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c	2020-05-22 11:55:13.736272177 +0800
> +@@ -0,0 +1,282 @@
> ++// SPDX-License-Identifier: GPL-2.0-only
> ++/*
> ++ * Asmedia 28xx/18xx GPIO driver
> ++ *
> ++ * Copyright (C) 2020 ASMedia Technology Inc.
> ++ * Author: Richard Hsu <Richard_Hsu@asmedia.com.tw>
> ++ */
> ++
> ++
> ++#include <linux/module.h>
> ++#include <linux/kernel.h>
> ++#include <linux/gpio/driver.h>
> ++#include <linux/pci.h>
> ++#include <linux/spinlock.h>
> ++#include <linux/pm_runtime.h>
> ++
> ++
> ++/* GPIO registers offsets */
> ++#define ASM_GPIO_CTRL		0x920
> ++#define ASM_GPIO_OUTPUT		0x928
> ++#define ASM_GPIO_INPUT		0x930
> ++#define ASM_REG_SWITCH		0xFFF
> ++
> ++#define ASM_REG_SWITCH_CTL	0x01
> ++
> ++#define ASM_GPIO_PIN5		5
> ++#define ASM_GPIO_DEFAULT	0
> ++
> ++
> ++#define PCI_DEVICE_ID_ASM_28XX_PID1	0x2824
> ++#define PCI_DEVICE_ID_ASM_28XX_PID2	0x2812
> ++#define PCI_DEVICE_ID_ASM_28XX_PID3	0x2806
> ++#define PCI_DEVICE_ID_ASM_18XX_PID1	0x1824
> ++#define PCI_DEVICE_ID_ASM_18XX_PID2	0x1812
> ++#define PCI_DEVICE_ID_ASM_18XX_PID3	0x1806
> ++#define PCI_DEVICE_ID_ASM_81XX_PID1	0x812a
> ++#define PCI_DEVICE_ID_ASM_81XX_PID2	0x812b
> ++#define PCI_DEVICE_ID_ASM_80XX_PID1	0x8061
> ++
> ++/*
> ++ * Data for PCI driver interface
> ++ *
> ++ * This data only exists for exporting the supported
> ++ * PCI ids via MODULE_DEVICE_TABLE.  We do not actually
> ++ * register a pci_driver, because someone else might one day
> ++ * want to register another driver on the same PCI id.

s/ids/IDs/
s/id/ID/

> ++ */
> ++static const struct pci_device_id pci_tbl[] = {
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID1), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID2), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_28XX_PID3), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID1), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID2), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_18XX_PID3), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID1), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_81XX_PID2), 0 },
> ++	{ PCI_DEVICE(PCI_VENDOR_ID_ASMEDIA, PCI_DEVICE_ID_ASM_80XX_PID1), 0 },
> ++	{ 0, },	/* terminate list */
> ++};
> ++MODULE_DEVICE_TABLE(pci, pci_tbl);
> ++
> ++
> ++struct asm28xx_gpio {
> ++	struct gpio_chip	chip;
> ++	struct pci_dev		*pdev;
> ++	spinlock_t		lock;
> ++};
> ++
> ++void pci_config_pm_runtime_get(struct pci_dev *pdev)
> ++{
> ++	struct device *dev = &pdev->dev;
> ++	struct device *parent = dev->parent;
> ++
> ++	if (parent)
> ++		pm_runtime_get_sync(parent);
> ++	pm_runtime_get_noresume(dev);
> ++	/*
> ++	 * pdev->current_state is set to PCI_D3cold during suspending,
> ++	 * so wait until suspending completes
> ++	 */
> ++	pm_runtime_barrier(dev);
> ++	/*
> ++	 * Only need to resume devices in D3cold, because config
> ++	 * registers are still accessible for devices suspended but
> ++	 * not in D3cold.
> ++	 */
> ++	if (pdev->current_state == PCI_D3cold)
> ++		pm_runtime_resume(dev);
> ++}

I'm dubious about all this PM stuff here.  There are ~170 drivers in
drivers/gpio/, and only five of them (arizona, intel-mid, omap, rcar,
and zynq) use any flavor of pci_runtime_get.*().

What's special about asm28xx that means you need this when almost
nobody else does?

> ++void pci_config_pm_runtime_put(struct pci_dev *pdev)
> ++{
> ++	struct device *dev = &pdev->dev;
> ++	struct device *parent = dev->parent;
> ++
> ++	pm_runtime_put(dev);
> ++	if (parent)
> ++		pm_runtime_put_sync(parent);
> ++}
> ++
> ++static int asm28xx_gpio_request(struct gpio_chip *chip, unsigned offset)
> ++{
> ++

Spurious blank line, remove.

> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d request\n", offset);
> ++
> ++	if (offset == ASM_GPIO_PIN5)
> ++		return -ENODEV;
> ++
> ++	return 0;
> ++}
> ++
> ++static void asm28xx_gpio_free(struct gpio_chip *chip, unsigned offset)
> ++{
> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d free\n", offset);
> ++}
> ++
> ++static void asm28xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> ++{
> ++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
> ++	unsigned char temp;

Nit: pci_read_config_byte() and pci_write_config_byte() take a "u8"
(other occurrences below).

> ++	unsigned long flags;
> ++
> ++	pci_config_pm_runtime_get(agp->pdev);
> ++	spin_lock_irqsave(&agp->lock, flags);
> ++	pci_read_config_byte(agp->pdev, ASM_GPIO_OUTPUT, &temp);
> ++	if (value)
> ++		temp |= BIT(offset);
> ++	else
> ++		temp &= ~BIT(offset);
> ++
> ++	pci_write_config_byte(agp->pdev, ASM_GPIO_OUTPUT, temp);
> ++	spin_unlock_irqrestore(&agp->lock, flags);
> ++	pci_config_pm_runtime_put(agp->pdev);
> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx gpio %d set %d reg=%02x\n", offset, value, temp);
> ++}
> ++
> ++static int asm28xx_gpio_get(struct gpio_chip *chip, unsigned offset)
> ++{
> ++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
> ++	unsigned char temp;
> ++	unsigned long flags;
> ++
> ++	pci_config_pm_runtime_get(agp->pdev);
> ++	spin_lock_irqsave(&agp->lock, flags);
> ++	pci_read_config_byte(agp->pdev, ASM_GPIO_INPUT, &temp);
> ++	spin_unlock_irqrestore(&agp->lock, flags);
> ++	pci_config_pm_runtime_put(agp->pdev);
> ++
> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx GPIO Pin %d get reg=%02x\n", offset, temp);
> ++	return (temp & BIT(offset)) ? 1 : 0;
> ++}
> ++
> ++static int asm28xx_gpio_dirout(struct gpio_chip *chip, unsigned offset, int value)
> ++{
> ++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
> ++	unsigned char temp;
> ++	unsigned long flags;
> ++
> ++	pci_config_pm_runtime_get(agp->pdev);
> ++	spin_lock_irqsave(&agp->lock, flags);
> ++	pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
> ++	temp |= BIT(offset);
> ++	pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
> ++	spin_unlock_irqrestore(&agp->lock, flags);
> ++	pci_config_pm_runtime_put(agp->pdev);
> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirout gpio %d  reg=%02x\n", offset, temp);
> ++
> ++	return 0;
> ++}
> ++
> ++static int asm28xx_gpio_dirin(struct gpio_chip *chip, unsigned offset)
> ++{
> ++	struct asm28xx_gpio *agp = gpiochip_get_data(chip);
> ++	unsigned char temp;
> ++	unsigned long flags;
> ++
> ++	pci_config_pm_runtime_get(agp->pdev);
> ++	spin_lock_irqsave(&agp->lock, flags);
> ++	pci_read_config_byte(agp->pdev, ASM_GPIO_CTRL, &temp);
> ++	temp &= ~BIT(offset);
> ++	pci_write_config_byte(agp->pdev, ASM_GPIO_CTRL, temp);
> ++	spin_unlock_irqrestore(&agp->lock, flags);
> ++	pci_config_pm_runtime_put(agp->pdev);
> ++	dev_dbg(chip->parent, "ASMEDIA-28xx/18xx dirin gpio %d  reg=%02x\n", offset, temp);
> ++
> ++	return 0;
> ++}
> ++
> ++static struct asm28xx_gpio gp = {
> ++	.chip = {
> ++		.label		= "ASM28XX-18XX GPIO",
> ++		.owner		= THIS_MODULE,
> ++		.ngpio		= 8,
> ++		.request	= asm28xx_gpio_request,
> ++		.free		= asm28xx_gpio_free,
> ++		.set		= asm28xx_gpio_set,
> ++		.get		= asm28xx_gpio_get,
> ++		.direction_output = asm28xx_gpio_dirout,
> ++		.direction_input = asm28xx_gpio_dirin,
> ++	},
> ++};

Drivers should not use static instance data because it limits them to
a single device instance.

> ++static int __init asm28xx_gpio_init(void)
> ++{
> ++	int err = -ENODEV;
> ++	struct pci_dev *pdev = NULL;
> ++	const struct pci_device_id *ent;
> ++	u8 temp;
> ++	unsigned long flags;
> ++	int type;
> ++
> ++	for_each_pci_dev(pdev) {
> ++		ent = pci_match_id(pci_tbl, pdev);
> ++		if (ent) {

Above you explained that you don't register a pci_driver because
someone else might someday want to register another driver on the same
ID.  I don't think that's a very good reason.  for_each_pci_dev()
loops are problematic because they circumvent the driver model that
makes it clear what code is responsible for what device.  We end up
with multiple drivers controlling the device without any coordination
between them.  For example, this driver fiddles with runtime PM
settings, and another driver for the device may do the same thing.

Also, for_each_pci_dev() doesn't handle the hotplug case at all.  That
might not be a problem for this particular device, but it's a pattern
that may be copied to places where it *is* a problem.

This particular use doesn't handle multiple matching devices.  Again,
maybe you know that's not an issue for this particular case, but it's
better style if we can use the pci_driver model that everybody
understands.

> ++			/* Because GPIO Registers only work on Upstream port. */
> ++			type = pci_pcie_type(pdev);
> ++			if (type == PCI_EXP_TYPE_UPSTREAM) {
> ++				dev_info(&pdev->dev, "ASMEDIA-28xx/18xx Init Upstream detected\n");
> ++				goto found;
> ++			}
> ++		}
> ++	}
> ++
> ++	/* ASMEDIA-28xx/18xx GPIO not found. */
> ++	dev_info(&pdev->dev, "ASMEDIA-28xx/18xx Init GPIO not detected\n");

Drivers should not complain if they don't find a matching device.

> ++	goto out;
> ++
> ++found:
> ++	gp.pdev = pdev;
> ++	gp.chip.parent = &pdev->dev;
> ++
> ++	spin_lock_init(&gp.lock);
> ++
> ++	err = gpiochip_add_data(&gp.chip, &gp);
> ++	if (err) {
> ++		dev_err(&pdev->dev, "GPIO registering failed (%d)\n", err);
> ++		goto out;
> ++	}
> ++
> ++	pci_config_pm_runtime_get(pdev);
> ++
> ++	/* Set PCI_CFG_Switch bit = 1,then we can access GPIO Registers. */
> ++	spin_lock_irqsave(&gp.lock, flags);
> ++	pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
> ++	temp |= ASM_REG_SWITCH_CTL;
> ++	pci_write_config_byte(pdev, ASM_REG_SWITCH, temp);
> ++	pci_read_config_byte(pdev, ASM_REG_SWITCH, &temp);
> ++	spin_unlock_irqrestore(&gp.lock, flags);
> ++
> ++	pci_config_pm_runtime_put(pdev);
> ++	dev_err(&pdev->dev, "ASMEDIA-28xx/18xx Init SWITCH = 0x%x\n", temp);
> ++out:
> ++	return err;
> ++}
> ++
> ++static void __exit asm28xx_gpio_exit(void)
> ++{
> ++	unsigned long flags;
> ++
> ++	pci_config_pm_runtime_get(gp.pdev);
> ++
> ++	spin_lock_irqsave(&gp.lock, flags);
> ++	/* Set GPIO Registers to default value. */
> ++	pci_write_config_byte(gp.pdev, ASM_GPIO_OUTPUT, ASM_GPIO_DEFAULT);
> ++	pci_write_config_byte(gp.pdev, ASM_GPIO_INPUT, ASM_GPIO_DEFAULT);
> ++	pci_write_config_byte(gp.pdev, ASM_GPIO_CTRL, ASM_GPIO_DEFAULT);
> ++	/* Clear PCI_CFG_Switch bit = 0,then we can't access GPIO Registers. */
> ++	pci_write_config_byte(gp.pdev, ASM_REG_SWITCH, ASM_GPIO_DEFAULT);
> ++	spin_unlock_irqrestore(&gp.lock, flags);
> ++	pci_config_pm_runtime_put(gp.pdev);
> ++
> ++	gpiochip_remove(&gp.chip);
> ++}
> ++
> ++module_init(asm28xx_gpio_init);
> ++module_exit(asm28xx_gpio_exit);
> ++
> ++MODULE_LICENSE("GPL");
> ++MODULE_AUTHOR("Richard Hsu <Richard_Hsu@asmedia.com.tw>");
> ++MODULE_DESCRIPTION("Asmedia 28xx 18xx GPIO Driver");
> ++
> ++
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Kconfig linux-5.7.0-rc6-patch/drivers/gpio/Kconfig
> +--- linux-5.7.0-rc6/drivers/gpio/Kconfig	2020-05-22 11:54:00.862644198 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/Kconfig	2020-05-22 11:55:13.680270929 +0800
> +@@ -113,6 +113,14 @@ config GPIO_AMDPT
> + 	  driver for GPIO functionality on Promontory IOHub
> + 	  Require ACPI ASL code to enumerate as a platform device.
> +
> ++config GPIO_ASM28XX
> ++	tristate "Asmedia 28XX/18XX GPIO support"
> ++	depends on PCI
> ++	select GPIO_GENERIC
> ++	help
> ++	  driver for GPIO functionality on Asmedia 28XX and 18XX PCI-E Bridge.
> ++
> ++
> + config GPIO_ASPEED
> + 	tristate "Aspeed GPIO support"
> + 	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> +diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/drivers/gpio/Makefile linux-5.7.0-rc6-patch/drivers/gpio/Makefile
> +--- linux-5.7.0-rc6/drivers/gpio/Makefile	2020-05-22 11:54:00.862644198 +0800
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/Makefile	2020-05-22 11:55:13.680270929 +0800
> +@@ -176,3 +176,4 @@ obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtens
> + obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
> + obj-$(CONFIG_GPIO_ZX)			+= gpio-zx.o
> + obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
> ++obj-$(CONFIG_GPIO_ASM28XX)		+= gpio-asm28xx-18xx.o
> --
> 2.17.1
> 
