Return-Path: <linux-gpio+bounces-32385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EQ7CBxjpWmx+wUAu9opvQ
	(envelope-from <linux-gpio+bounces-32385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:14:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9A1D6314
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 11:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3715A3016EF4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 10:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D5939E6CB;
	Mon,  2 Mar 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfL8jdZ0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A76539B962;
	Mon,  2 Mar 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446482; cv=none; b=g3Sy7TbuLVicTnuBZ7pfB0V/OwfIQQWSiY8ynlzzr6l8RnTsADre/1HpcvxWe04mwoToWwFHLfclOcfHB9F/mjbm1TsPMbT8wg10e2AojYviyJ7ZKqo3ktw98rEaKZ7F9fSlndKFIx+ROp/7TsDbPLz9VgMXWYtB00t7f4Ol8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446482; c=relaxed/simple;
	bh=cm+gQb+Ff1wi2vrfUxgKpSyYLxhvw06uD6cNoSXrE2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAxTs7tXQjOJPVi1+za5IPuAZ+NYk6xmLHo3L0uWfWIiiBKuZYqUbnj6JrfXmwJkRp3GTI7DxBC9Ng5Tn74q/KkQAY+OfRLPSrltdrcIrUnAr7rMPj4/TF9qPH2P0o/Xm9TmPDFa0xEtS8DUCEgGVW50vbtDeqyTUYafF293SQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfL8jdZ0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772446477; x=1803982477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cm+gQb+Ff1wi2vrfUxgKpSyYLxhvw06uD6cNoSXrE2Y=;
  b=YfL8jdZ0yJteWTefiWZHr89SwcevONnMNHnmKDWn8UJ5mCE3lGHPruTD
   v1aWrvuyTyy4j+Uk7/fDOrnquaVp71cDzDyAzGwuqTrDNzIBEiX20AU2X
   c4LKBmUgaW0TtXrFIHVko/KGCvMKgyLDr3P7ggldvBky8jjUfXgLLcKdv
   QOlmX6UCm0bZygL7N8wrHa0Z84jPctWJkacq9fPOdR57P2RJSkWeI0IIo
   DOWkOVgPkar6RKIloiHHCbzP6JC5l8PeKravMOP7hTFe+Ou1/09ohlM7O
   YcGqgi538sIiCDdoWHjkLndWiWM9lR/KZGrFr+PIT4VghCv/fRDcxwDsk
   w==;
X-CSE-ConnectionGUID: fOk0ArX8SMSV7AojV9Fxpg==
X-CSE-MsgGUID: LFbJrWWrRuGw6d8imaPKYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77288608"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="77288608"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:14:36 -0800
X-CSE-ConnectionGUID: +2oRPrdUTXyeVMJh7n/9vw==
X-CSE-MsgGUID: 3ZNxpxOITAeF3rmPhrFEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217631877"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 02:14:34 -0800
Date: Mon, 2 Mar 2026 12:14:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Zhu Ling <1536943441@qq.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	chenbaozi@phytium.com.cn
Subject: Re: [PATCH v1 2/3] gpio: add support for Phytium platform GPIO
 controller
Message-ID: <aaVjB15jAJden4UR@ashevche-desk.local>
References: <20260302095147.2483-1-1536943441@qq.com>
 <tencent_C88C86C89249067BA4D394FC9CCC1AB62406@qq.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C88C86C89249067BA4D394FC9CCC1AB62406@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32385-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[qq.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: CCD9A1D6314
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:51:46PM +0800, Zhu Ling wrote:
> Add support for the Phytium platform GPIO controller with:
> - shared core helpers and irqchip implementation
> - platform probe path for OF/ACPI
> - Kconfig/Makefile integration

Why you can't use one of the gpio-regmap, gpio-mmio?

> The driver supports GPIO direction and value configuration, plus
> interrupt delivery for platform devices.

...

> +/*
> + * Copyright (c) 2019-2023, Phytium Technology Co., Ltd.

My calendar shows 2026...

> + */

...

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/bitops.h>
> +#include <linux/seq_file.h>
> +#include <linux/interrupt.h>

Follow IWYU principle.

...

I'm not going to review the rest as gpio-remap (or gpio-mmio) should make this
driver much better and smaller.

Take your time to study existing cases.

...

> +EXPORT_SYMBOL_GPL(phytium_gpio_irq_disable);

No way.  And if it's really needed, must be namespaced.

Btw, why the three files and not a standalone single one?

...

> + * Derived from drivers/gpio/gpio-pl061.c

Why? Does it uses the same or similar register layout?

> + *   Copyright (C) 2008, 2009 Provigent Ltd.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>

> +#include <linux/kernel.h>

No way this header should be anyhow needed in this driver.

> +#include <linux/module.h>

> +#include <linux/of.h>



> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +
> +#include "gpio-phytium-core.h"

...

> +static const struct of_device_id phytium_gpio_of_match[] = {
> +	{ .compatible = "phytium,gpio", },

No inner comma.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, phytium_gpio_of_match);
> +
> +static const struct acpi_device_id phytium_gpio_acpi_match[] = {
> +	{ "PHYT0001", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);

These tables should be moved closer to their user.

...

> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct phytium_gpio *gpio;
> +	struct gpio_irq_chip *girq;
> +	struct fwnode_handle *fwnode;

> +	int i;

Why is 'i' signed?

> +	int err, irq_count;

...

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	gpio->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(gpio->regs))
> +		return PTR_ERR(gpio->regs);

There is a combined call devm_platform_...().


> +	if (!device_get_child_node_count(dev))
> +		return -ENODEV;

Why?!

...

> +	device_for_each_child_node(dev, fwnode) {

Use _scoped() variant

> +		int idx;
> +
> +		if (fwnode_property_read_u32(fwnode, "reg", &idx) ||
> +		    idx >= MAX_NPORTS) {
> +			dev_err(dev, "missing/invalid port index\n");

			return dev_err_probe(...);

> +			fwnode_handle_put(fwnode);
> +			return -EINVAL;
> +		}
> +
> +		if ((fwnode_property_read_u32(fwnode, "ngpios",
> +					      &gpio->ngpio[idx])) &&
> +		    (fwnode_property_read_u32(fwnode, "nr-gpios",
> +					      &gpio->ngpio[idx]))) {
> +			dev_info(dev,
> +				 "failed to get number of gpios for Port%c\n",
> +				 idx ? 'B' : 'A');

It rings a bell. Do you really have to create a brand new driver? Please check
existing ones and clarify why the brand new driver is required.

> +			gpio->ngpio[idx] = NGPIO_DEFAULT;
> +		}
> +	}

...

> +	dev_info(dev, "Phytium GPIO controller @%pa registered\n",
> +		 &res->start);

The successfully probed device is kept silent in the logs.

...

> +#ifdef CONFIG_PM_SLEEP

No way, please, use modern PM macros from pm.h.

> +static int phytium_gpio_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct phytium_gpio *gpio = platform_get_drvdata(pdev);

dev_get_drvdata()

> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	gpio->ctx.swporta_dr = readl(gpio->regs + GPIO_SWPORTA_DR);
> +	gpio->ctx.swporta_ddr = readl(gpio->regs + GPIO_SWPORTA_DDR);
> +	gpio->ctx.swportb_dr = readl(gpio->regs + GPIO_SWPORTB_DR);
> +	gpio->ctx.swportb_ddr = readl(gpio->regs + GPIO_SWPORTB_DDR);
> +
> +	gpio->ctx.inten = readl(gpio->regs + GPIO_INTEN);
> +	gpio->is_resuming = 1;
> +	gpio->ctx.intmask = readl(gpio->regs + GPIO_INTMASK);
> +	gpio->ctx.inttype_level = readl(gpio->regs + GPIO_INTTYPE_LEVEL);
> +	gpio->ctx.int_polarity = readl(gpio->regs + GPIO_INT_POLARITY);
> +	gpio->ctx.debounce = readl(gpio->regs + GPIO_DEBOUNCE);
> +
> +	writel(~gpio->wake_en, gpio->regs + GPIO_INTMASK);
> +	writel(gpio->wake_en, gpio->regs + GPIO_INTEN);
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int phytium_gpio_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct phytium_gpio *gpio = platform_get_drvdata(pdev);

Ditto.

> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);

Use guard()().

> +	writel(gpio->ctx.swporta_dr, gpio->regs + GPIO_SWPORTA_DR);
> +	writel(gpio->ctx.swporta_ddr, gpio->regs + GPIO_SWPORTA_DDR);
> +	writel(gpio->ctx.swportb_dr, gpio->regs + GPIO_SWPORTB_DR);
> +	writel(gpio->ctx.swportb_ddr, gpio->regs + GPIO_SWPORTB_DDR);
> +
> +	writel(gpio->ctx.intmask, gpio->regs + GPIO_INTMASK);
> +	writel(gpio->ctx.inttype_level, gpio->regs + GPIO_INTTYPE_LEVEL);
> +	writel(gpio->ctx.int_polarity, gpio->regs + GPIO_INT_POLARITY);
> +	writel(gpio->ctx.debounce, gpio->regs + GPIO_DEBOUNCE);
> +
> +	writel(GPIO_CLEAR_IRQ, gpio->regs + GPIO_PORTA_EOI);
> +
> +	writel(gpio->ctx.inten, gpio->regs + GPIO_INTEN);
> +	gpio->is_resuming = 0;
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return 0;
> +}
> +#endif

...

> +static SIMPLE_DEV_PM_OPS(phytium_gpio_pm_ops, phytium_gpio_suspend,
> +			 phytium_gpio_resume);

Use new PM macros.

...

> +static struct platform_driver phytium_gpio_driver = {
> +	.driver		= {
> +		.name	= "gpio-phytium-platform",
> +		.pm	= &phytium_gpio_pm_ops,

> +		.of_match_table = of_match_ptr(phytium_gpio_of_match),
> +		.acpi_match_table = ACPI_PTR(phytium_gpio_acpi_match),

No way of_match_ptr() and/or ACPI_PTR() should appear in a new code.

> +	},
> +	.probe		= phytium_gpio_probe,
> +};

> +

Redundant blank line.

> +module_platform_driver(phytium_gpio_driver);

-- 
With Best Regards,
Andy Shevchenko



