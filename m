Return-Path: <linux-gpio+bounces-23154-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC55B01AF9
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 13:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4146B1888F7B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 11:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E502D46C4;
	Fri, 11 Jul 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6adliW9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AA28DF04;
	Fri, 11 Jul 2025 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234199; cv=none; b=hr/Hl+D4zwRsWMl02QY+Yw7CSbn2RrR1XgFJ6vqpLo8El/MdtVWE3aWsnIx5188yhKVf1NjJVNLj7hGEw/Q+KQwlpz3qD4p5MXNqhcp6ziP1+5ACuQu/vEr0EvFHdVQYDkCvR5gIym6HHe29glvmMdgL9TVqVuJ1rhWNT2AiBI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234199; c=relaxed/simple;
	bh=pbORTqZjPACVm8KRmdOHNQU9CwZ29ZHm6z/OwerpFJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCd5pO7D6Wp4q5jN9Tsj5gtoYtLQE30t/+4PsvN+8zpTl2dyA4EEtBMFxv6IPYmmDHy8ZcUMfyRWtp30o1X/OhHOd2iIPzPfxFagulxQobBn6y7pH1o2JfiP3C+ulQ0K78nTIWgUSWAJa4szu7i84mOQZx6P6KPpbBtxlJJLuKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6adliW9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752234198; x=1783770198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=pbORTqZjPACVm8KRmdOHNQU9CwZ29ZHm6z/OwerpFJk=;
  b=Q6adliW9rJgIVKPB1mF+2nlHyY3/pq9ZqUgqQq5o1PezjGf/hLRKC270
   g6jmGaD4bJ1gZ4hg6VLQ312vPTvT2lb6FJEtyXZQOoU/dNVYmVUwGY+4H
   tYZQwe2G0wVMoLfQtVBsiEkT52OOMDEdsM55lneaytCge3mQ0uNyhWWm1
   m8T+Fwrjo3IEFTyD7eW0/ehsuQDcWp2rXSG6zhxV3edeouM6MiHmSmuIx
   6LZ9VkwBZUNrIcUPLZ0C8dSnhrXOE3vdTvwpH2vb8GIRG59oGyeOy8e8W
   4QHsNhw4LSpkyxzLo60VeYZKzgG7p1zQoL/r1rJ1OgabHTJcgAUTpFK0k
   g==;
X-CSE-ConnectionGUID: qJkgD570TQuJvmgKBs0D+g==
X-CSE-MsgGUID: 8e0xTuh+SzaAHfparjkMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53639604"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53639604"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 04:43:16 -0700
X-CSE-ConnectionGUID: P5zZNmYBRZSw/5+HFozIkw==
X-CSE-MsgGUID: fGdpqhPzRqm7yf8rdyqA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="157073391"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2025 04:43:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 340431A1; Fri, 11 Jul 2025 14:43:13 +0300 (EEST)
Date: Fri, 11 Jul 2025 14:43:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marcos Del Sol Vives <marcos@orca.pet>,
	William Breathitt Gray <wbg@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Message-ID: <aHD40TD8MLug0C6b@black.fi.intel.com>
References: <20250709091542.968968-1-marcos@orca.pet>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709091542.968968-1-marcos@orca.pet>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: William,
who is an expert in embedded industrial x86 platforms and might help with this.

Bart, thanks for Cc'ing me. I have tons of questions and comments regarding this.

On Wed, Jul 09, 2025 at 11:15:40AM +0200, Marcos Del Sol Vives wrote:
> Add a new simple GPIO device driver for Vortex86 lines of SoCs,
> implemented according to their programming reference manual [1].
> 
> This is required for detecting the status of the poweroff button and
> performing the poweroff sequence on ICOP eBox computers.
> 
> IRQs are not implemented as they are available for less than half the
> GPIO pins, and they are not the ones required for the poweroff stuff, so
> polling will be required anyway.

> [1]: http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_Reference_091216.pdf
> 

Make this a Link tag by removing a blank line and converting above to

Link: http://www.dmp.com.tw/tech/DMP_Vortex86_Series_Software_Programming_Reference_091216.pdf [1]

> Signed-off-by: Marcos Del Sol Vives <marcos@orca.pet>

But the first question first. Is this not a dead code? I mean I have heard that
i486SX is not supported in Linux kernel as there is no more FP emu layer. Of
course it might be not a problem in some cases, but still. Second point is that
there is an ongoing (still ongoing?) discussion on removal i486 support completely.
Would it affect these SoCs? (According to the shared manual seems the answer is
"yes, it will".

...

> +	help
> +	  Driver to access the five 8-bit bidirectional GPIO ports present on
> +	  all DM&P Vortex86 SoCs.

...

> + *  Based on the it87xx GPIO driver by Diego Elio Pettenò

Why that driver can't be reused?

> + */

...

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

Why? The driver should use dev_*() macros which will uniquely define the device
for what the message is printed.

...

> +#include <linux/types.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/ioport.h>
> +#include <linux/spinlock.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>

This should be sorted alphabetically. Also follow IWYU principle.

...

> +static DEFINE_SPINLOCK(gpio_lock);

Global lock? Why?

...

> +static int vortex_gpio_get(struct gpio_chip *chip, unsigned int gpio_num)
> +{
> +	uint8_t port = gpio_num / GPIO_PER_PORT;
> +	uint8_t bit  = gpio_num % GPIO_PER_PORT;
> +	uint8_t val;

Use kernel types for kernel. Include types.h (you probably missed it anyway)
and then convert above to u8.

> +	val = inb(GPIO_DATA_BASE + port);

Better to use ioread8() / iowrite8() and "map" IO ports (see, for example,
how drivers/pinctrl/intel-pinctrl-lynxpoint.c does).

> +	return !!(val & (1 << bit));

BIT() from bits.h will help a lot.

> +}
> +
> +static int vortex_gpio_direction_in(struct gpio_chip *chip, unsigned int gpio_num)
> +{
> +	uint8_t port = gpio_num / GPIO_PER_PORT;
> +	uint8_t bit  = gpio_num % GPIO_PER_PORT;
> +	unsigned long flags;
> +	uint8_t dir;

All the same comments, plus...

> +	spin_lock_irqsave(&gpio_lock, flags);

...use APIs from cleanup.h, i.e. guard() in this case.

> +	dir = inb(GPIO_DIRECTION_BASE + port);
> +	dir &= ~(1 << bit); /* 0 = input */
> +	outb(dir, GPIO_DIRECTION_BASE + port);
> +
> +	spin_unlock_irqrestore(&gpio_lock, flags);
> +
> +	return 0;
> +}

...

So, the above is pretty much simple, why doesn't it use gpio-regmap with the
respective configuration? Moreover, SX and DX variants are differ since the
latter one may provide an IRQ chip, for which gpio-regmap also can be used,
i.o.w. with that done, it will be quite easy to support both.

...

> +static int vortex_gpio_probe(struct platform_device *pdev)
> +{
> +	/* Set up GPIO labels */
> +	for (int i = 0; i < GPIO_COUNT; i++) {
> +		sprintf(labels[i], "vortex_gp%u%u", i / 8, i % 8);
> +		labels_table[i] = &labels[i][0];

'&...[0]' is redundant.

> +	}

Why this can't be made static once?

> +	return devm_gpiochip_add_data(&pdev->dev, &gpio_chip, NULL);
> +}
> +
> +static struct platform_driver vortex_gpio_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,

> +		.owner = THIS_MODULE,

This field is not needed for ages (15+ years). Is this driver got dusted for this long?

> +	},
> +	.probe = vortex_gpio_probe,
> +};

...

> +static struct resource vortex_gpio_resources[] = {
> +	DEFINE_RES_IO_NAMED(GPIO_DATA_BASE, GPIO_PORTS, KBUILD_MODNAME " data"),
> +	DEFINE_RES_IO_NAMED(GPIO_DIRECTION_BASE, GPIO_PORTS, KBUILD_MODNAME " dir"),

Named resources? Why?

> +};

...

> +static int __init vortex_gpio_init(void)
> +{
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_VORTEX) {
> +		pr_err("Not a Vortex86 CPU, refusing to load\n");
> +		return -ENODEV;
> +	}
> +
> +	pdev = platform_create_bundle(&vortex_gpio_driver, vortex_gpio_probe,
> +			vortex_gpio_resources, ARRAY_SIZE(vortex_gpio_resources),
> +			NULL, 0);
> +	return PTR_ERR_OR_ZERO(pdev);
> +}

Oh my... Can you elaborate more on this ugly hack. Why do we need this at all?
What's wrong with the BIOS or other firmware that is provided?
(The documentation mentions BIOS, btw.)

Also, is this anyhow visible as a PCI device? Is it part of LPC (docs suggests
so for SX, but not so clear in DX diagram)?

...

On top of that the GPIO3 is marked as one with the pin muxing. Where is the driver
for it? Or what are the plans about it?

GPIO4 seems muxed with UART, so also subject to pin muxing.

-- 
With Best Regards,
Andy Shevchenko



