Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E05E3834
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 18:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503629AbfJXQjR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 12:39:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38887 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503634AbfJXQjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 12:39:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id v9so15562853wrq.5
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 09:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sngj5o7xGqkV7qLAUdwJIeVbqtdWhiZfcov4EWWcqNw=;
        b=gu2EmY8T4fHww6db/Ps4E+DzcyakXOegNWEK+k+nCJBavbQOa3coQ2lLDuLLKpJgH0
         527sNalb8QrTyi16p3DfITfSx5Uh69Exsq2JOE5TJeLj6XP0RQhsbmm/y5o4ArWSOXT8
         yRbTAwvueOgdrfReKGZhjfTNT1DmuokenN3BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sngj5o7xGqkV7qLAUdwJIeVbqtdWhiZfcov4EWWcqNw=;
        b=Xr7lrBfe2LFNoe+1/BBCOqE3nmwepjBMsafwbikBWpOateWZy5dN8AgUPi8bJdMHzY
         auGJU5umqrIsEdGV0R3KPrnjYc4hXsQJ/wq6acXuOUeB84lxd01y1E5JJ/8tbmD8eti+
         FOYrJjKHnugMm6bF2AGUYyv4JQy/UcvkfqNTJDQh+m0id8QTvetY/TTxIpHLf26wQELc
         kp7z6O+k4BdhTOlLszGGJb1GEgt7qyN0XRmtBAV3uVljJ66QJSPXZBQ1MdYzICbuLCVN
         /Z9wB/gjcCXnyfnpyQ6CWNiMGlRN6VJmpOJbkksx07xv+B2MPZhuWFNnyESLNTslJaRi
         iarQ==
X-Gm-Message-State: APjAAAWREZcK46GSc2mGo3NTPnbbASw/pZVZ8TRO2VMqVouutE9VGq9b
        zTIyfCe2I6DPb2CK35ZAlTtEAQ==
X-Google-Smtp-Source: APXvYqyjhwovBTIEeMIpp6iSPZUvbueC+kdSnLk0tQnTPL2W+dwVPjZ4eNHddf0WxnYytVJv5c2dZQ==
X-Received: by 2002:adf:9f08:: with SMTP id l8mr4473943wrf.325.1571935153628;
        Thu, 24 Oct 2019 09:39:13 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id c16sm13340678wrw.32.2019.10.24.09.39.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:39:12 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] gpio: Add xgs-iproc driver
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20191024004816.5539-1-chris.packham@alliedtelesis.co.nz>
 <20191024004816.5539-3-chris.packham@alliedtelesis.co.nz>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <94183c8d-6ab2-50a4-a1a3-5348a2e1d8da@broadcom.com>
Date:   Thu, 24 Oct 2019 09:39:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024004816.5539-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris,

Some cleanups.

On 2019-10-23 5:48 p.m., Chris Packham wrote:
> This driver supports the Chip Common A GPIO controller present on a
> number of Broadcom switch ASICs with integrated SoCs. The controller is
> similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
> different enough that a separate driver is required.
>
> This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
> support (pinctrl-iproc-gpio covers CCB).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>      Changes in v3:
>      - prefix local #defines with 'IPROC'
>      - use {readl,writel}_relaxed
>      - remove unnecessary headers
>      - actually use spinlock to guard hardware accesses
>      
>      Changes in v2:
>      - use more of the generic infrastructure for gpio chips
>      - handling the root interrupt is still done manually due to sharing with uart0.
>
>   drivers/gpio/Kconfig          |   9 +
>   drivers/gpio/Makefile         |   1 +
>   drivers/gpio/gpio-xgs-iproc.c | 321 ++++++++++++++++++++++++++++++++++
>   3 files changed, 331 insertions(+)
>   create mode 100644 drivers/gpio/gpio-xgs-iproc.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 38e096e6925f..4b3c0f8397d7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -156,6 +156,15 @@ config GPIO_BRCMSTB
>   	help
>   	  Say yes here to enable GPIO support for Broadcom STB (BCM7XXX) SoCs.
>   
> +config GPIO_XGS_IPROC
Place config option in alpha order in this file, like the rest of the 
config options.  Perhaps change the name to CONFIG_BCM_GPIO_XGS_IPROC
> +	tristate "BRCM XGS iProc GPIO support"
> +	depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> +	select GPIO_GENERIC
> +	select GPIOLIB_IRQCHIP
> +	default ARCH_BCM_IPROC
> +	help
> +	  Say yes here to enable GPIO support for Broadcom XGS iProc SoCs.
> +
>   config GPIO_CADENCE
>   	tristate "Cadence GPIO support"
>   	depends on OF_GPIO
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d2fd19c15bae..3783c3d43fbe 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
>   obj-$(CONFIG_GPIO_BD70528)		+= gpio-bd70528.o
>   obj-$(CONFIG_GPIO_BD9571MWV)		+= gpio-bd9571mwv.o
>   obj-$(CONFIG_GPIO_BRCMSTB)		+= gpio-brcmstb.o
> +obj-$(CONFIG_GPIO_XGS_IPROC)		+= gpio-xgs-iproc.o
config options are in alpha order
>   obj-$(CONFIG_GPIO_BT8XX)		+= gpio-bt8xx.o
>   obj-$(CONFIG_GPIO_CADENCE)		+= gpio-cadence.o
>   obj-$(CONFIG_GPIO_CLPS711X)		+= gpio-clps711x.o
> diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
> new file mode 100644
> index 000000000000..fcf41cf9efc3
> --- /dev/null
> +++ b/drivers/gpio/gpio-xgs-iproc.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2017 Broadcom Corporation
Change "Broadcom Corporation" to "Broadcom."
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
#includes should be in alpha order
> +
> +#define IPROC_CCA_INT_F_GPIOINT		BIT(0)
> +#define IPROC_CCA_INT_STS		0x20
> +#define IPROC_CCA_INT_MASK		0x24
> +
> +#define IPROC_GPIO_CCA_DIN		0x0
> +#define IPROC_GPIO_CCA_DOUT		0x4
> +#define IPROC_GPIO_CCA_OUT_EN		0x8
> +#define IPROC_GPIO_CCA_INT_LEVEL	0x10
> +#define IPROC_GPIO_CCA_INT_LEVEL_MASK	0x14
> +#define IPROC_GPIO_CCA_INT_EVENT	0x18
> +#define IPROC_GPIO_CCA_INT_EVENT_MASK	0x1C
> +#define IPROC_GPIO_CCA_INT_EDGE		0x24
> +
> +struct iproc_gpio_chip {
> +	struct irq_chip irqchip;
> +	struct gpio_chip gc;
> +	spinlock_t lock;
> +	struct device *dev;
> +	void __iomem *base;
> +	void __iomem *intr;
> +};
> +
> +static inline struct iproc_gpio_chip *
> +to_iproc_gpio(struct gpio_chip *gc)
> +{
> +	return container_of(gc, struct iproc_gpio_chip, gc);
> +}
> +
> +static void iproc_gpio_irq_ack(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
> +	int pin = d->hwirq;
> +	unsigned long flags;
> +	u32 irq = d->irq;
> +	u32 irq_type, event_status = 0;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	irq_type = irq_get_trigger_type(irq);
> +	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +		event_status |= BIT(pin);
> +		writel_relaxed(event_status,
> +			       chip->base + IPROC_GPIO_CCA_INT_EVENT);
> +	}
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static void iproc_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
> +	int pin = d->hwirq;
> +	unsigned long flags;
> +	u32 irq = d->irq;
> +	u32 int_mask, irq_type, event_mask;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	irq_type = irq_get_trigger_type(irq);
> +	event_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
> +	int_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
> +
> +	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +		event_mask |= 1 << pin;
> +		writel_relaxed(event_mask,
> +			       chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
> +	} else {
> +		int_mask |= 1 << pin;
> +		writel_relaxed(int_mask,
> +			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
> +	}
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static void iproc_gpio_irq_mask(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
> +	int pin = d->hwirq;
> +	unsigned long flags;
> +	u32 irq = d->irq;
> +	u32 irq_type, int_mask, event_mask;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	irq_type = irq_get_trigger_type(irq);
> +	event_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
> +	int_mask = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
> +
> +	if (irq_type & IRQ_TYPE_EDGE_BOTH) {
> +		event_mask &= ~BIT(pin);
> +		writel_relaxed(event_mask,
> +			       chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
> +	} else {
> +		int_mask &= ~BIT(pin);
> +		writel_relaxed(int_mask,
> +			       chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
> +	}
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static int iproc_gpio_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
> +	int pin = d->hwirq;
> +	unsigned long flags;
> +	u32 irq = d->irq;
> +	u32 event_pol, int_pol;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		event_pol = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EDGE);
> +		event_pol &= ~BIT(pin);
> +		writel_relaxed(event_pol, chip->base + IPROC_GPIO_CCA_INT_EDGE);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		event_pol = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EDGE);
> +		event_pol |= BIT(pin);
> +		writel_relaxed(event_pol, chip->base + IPROC_GPIO_CCA_INT_EDGE);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		int_pol = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
> +		int_pol &= ~BIT(pin);
> +		writel_relaxed(int_pol, chip->base + IPROC_GPIO_CCA_INT_LEVEL);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		int_pol = readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
> +		int_pol |= BIT(pin);
> +		writel_relaxed(int_pol, chip->base + IPROC_GPIO_CCA_INT_LEVEL);
> +		break;
> +	default:
> +		/* should not come here */
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	if (type & IRQ_TYPE_LEVEL_MASK)
> +		irq_set_handler_locked(irq_get_irq_data(irq), handle_level_irq);
> +	else if (type & IRQ_TYPE_EDGE_BOTH)
> +		irq_set_handler_locked(irq_get_irq_data(irq), handle_edge_irq);
> +
> +out_unlock:
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
> +{
> +	struct gpio_chip *gc = (struct gpio_chip *)data;
> +	struct iproc_gpio_chip *chip = to_iproc_gpio(gc);
> +	int bit;
> +	unsigned long int_bits = 0;
> +	u32 int_status;
> +
> +	/* go through the entire GPIOs and handle all interrupts */
> +	int_status = readl_relaxed(chip->intr + IPROC_CCA_INT_STS);
> +	if (int_status & IPROC_CCA_INT_F_GPIOINT) {
> +		u32 event, level;
> +
> +		/* Get level and edge interrupts */
> +		event =
> +		    readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT_MASK);
> +		event &= readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_EVENT);
> +		level = readl_relaxed(chip->base + IPROC_GPIO_CCA_DIN);
> +		level ^= readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL);
> +		level &=
> +		    readl_relaxed(chip->base + IPROC_GPIO_CCA_INT_LEVEL_MASK);
> +		int_bits = level | event;
> +
> +		for_each_set_bit(bit, &int_bits, gc->ngpio)
> +			generic_handle_irq(irq_linear_revmap(gc->irq.domain, bit));
> +	}
> +
> +	return int_bits ? IRQ_HANDLED : IRQ_NONE;
> +}
> +
> +static int iproc_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *dn = pdev->dev.of_node;
> +	struct iproc_gpio_chip *chip;
> +	u32 num_gpios;
> +	int irq, ret;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->dev = dev;
> +	platform_set_drvdata(pdev, chip);
> +	spin_lock_init(&chip->lock);
> +
> +	chip->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(chip->base))
> +		return PTR_ERR(chip->base);
> +
> +	ret = bgpio_init(&chip->gc, dev, 4,
> +			 chip->base + IPROC_GPIO_CCA_DIN,
> +			 chip->base + IPROC_GPIO_CCA_DOUT,
> +			 NULL,
> +			 chip->base + IPROC_GPIO_CCA_OUT_EN,
> +			 NULL,
> +			 0);
> +	if (ret) {
> +		dev_err(dev, "unable to init GPIO chip\n");
> +		return ret;
> +	}
> +
> +	chip->gc.label = dev_name(dev);
> +	if (of_property_read_u32(dn, "ngpios", &num_gpios))
> +		chip->gc.ngpio = num_gpios;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq > 0) {
> +		struct gpio_irq_chip *girq;
> +		struct irq_chip *irqc;
> +		u32 val;
> +
> +		irqc = &chip->irqchip;
> +		irqc->name = dev_name(dev);
> +		irqc->irq_ack = iproc_gpio_irq_ack;
> +		irqc->irq_mask = iproc_gpio_irq_mask;
> +		irqc->irq_unmask = iproc_gpio_irq_unmask;
> +		irqc->irq_set_type = iproc_gpio_irq_set_type;
> +
> +		chip->intr = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(chip->intr))
> +			return PTR_ERR(chip->intr);
> +
> +		/* Enable GPIO interrupts for CCA GPIO */
> +		val = readl_relaxed(chip->intr + IPROC_CCA_INT_MASK);
> +		val |= IPROC_CCA_INT_F_GPIOINT;
> +		writel_relaxed(val, chip->intr + IPROC_CCA_INT_MASK);
> +
> +		/*
> +		 * Directly request the irq here instead of passing
> +		 * a flow-handler to gpiochip_set_chained_irqchip,
> +		 * because the irq is shared.
> +		 */
> +		ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
> +				       IRQF_SHARED, chip->gc.label, &chip->gc);
> +		if (ret) {
> +			dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
> +			return ret;
> +		}
> +
> +		girq = &chip->gc.irq;
> +		girq->chip = irqc;
> +		/* This will let us handle the parent IRQ in the driver */
> +		girq->parent_handler = NULL;
> +		girq->num_parents = 0;
> +		girq->parents = NULL;
> +		girq->default_type = IRQ_TYPE_NONE;
> +		girq->handler = handle_simple_irq;
> +	}
> +
> +	ret = devm_gpiochip_add_data(dev, &chip->gc, chip);
> +	if (ret) {
> +		dev_err(dev, "unable to add GPIO chip\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __exit iproc_gpio_remove(struct platform_device *pdev)
> +{
> +	struct iproc_gpio_chip *chip;
> +
> +	chip = platform_get_drvdata(pdev);
> +	if (!chip)
> +		return -ENODEV;
> +
> +	if (chip->intr) {
> +		u32 val;
> +
> +		val = readl_relaxed(chip->intr + IPROC_CCA_INT_MASK);
> +		val &= ~IPROC_CCA_INT_F_GPIOINT;
> +		writel_relaxed(val, chip->intr + IPROC_CCA_INT_MASK);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcm_iproc_gpio_of_match[] __initconst = {
> +	{ .compatible = "brcm,iproc-gpio-cca" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, bcm_iproc_gpio_of_match);
> +
> +static struct platform_driver bcm_iproc_gpio_driver = {
> +	.driver = {
> +		.name = "iproc-xgs-gpio",
> +		.owner = THIS_MODULE,
> +		.of_match_table = bcm_iproc_gpio_of_match,
> +	},
> +	.probe = iproc_gpio_probe,
> +	.remove = iproc_gpio_remove,
> +};
> +
> +module_platform_driver(bcm_iproc_gpio_driver);
> +
> +MODULE_DESCRIPTION("XGS IPROC GPIO driver");
> +MODULE_LICENSE("GPL v2");

