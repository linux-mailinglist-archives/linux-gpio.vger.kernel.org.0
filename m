Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2AD8F85A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 03:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726108AbfHPBK4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 21:10:56 -0400
Received: from onstation.org ([52.200.56.107]:49918 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725983AbfHPBK4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Aug 2019 21:10:56 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id EE4203E998;
        Fri, 16 Aug 2019 01:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565917855;
        bh=trw4UAl1Eb+fVV8ZdiSFdjA+FeU/YpldiCUXoiwWXas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GS8uyytoGyrdQNXg5spsgIJ9xfYuHND5aXCwKgk5WCdrI1+/SEMdbuKwEkpsKJJcd
         Rirz2Pxkl+N4NAGCog+XLutC6DK1tLOz4V2cZj5AyllsH4c5zHZwvl6CggRkG/WPlC
         CFkKFJ/fBCQp25agKqP9IYpl1GZdWGov5nWwZSI0=
Date:   Thu, 15 Aug 2019 21:10:54 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/6 v2] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190816011054.GA1041@onstation.org>
References: <20190808123242.5359-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808123242.5359-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Aug 08, 2019 at 02:32:37PM +0200, Linus Walleij wrote:
> Hierarchical IRQ domains can be used to stack different IRQ
> controllers on top of each other.
> 
> Bring hierarchical IRQ domains into the GPIOLIB core with the
> following basic idea:
> 
> Drivers that need their interrupts handled hierarchically
> specify a callback to translate the child hardware IRQ and
> IRQ type for each GPIO offset to a parent hardware IRQ and
> parent hardware IRQ type.
> 
> Users have to pass the callback, fwnode, and parent irqdomain
> before calling gpiochip_irqchip_add().
> 
> We use the new method of just filling in the struct
> gpio_irq_chip before adding the gpiochip for all hierarchical
> irqchips of this type.
> 
> The code path for device tree is pretty straight-forward,
> while the code path for old boardfiles or anything else will
> be more convoluted requireing upfront allocation of the
> interrupts when adding the chip.
> 
> One specific use-case where this can be useful is if a power
> management controller has top-level controls for wakeup
> interrupts. In such cases, the power management controller can
> be a parent to other interrupt controllers and program
> additional registers when an IRQ has its wake capability
> enabled or disabled.
> 
> The hierarchical irqchip helper code will only be available
> when IRQ_DOMAIN_HIERARCHY is selected to GPIO chips using
> this should select or depend on that symbol. When using
> hierarchical IRQs, the parent interrupt controller must
> also be hierarchical all the way up to the top interrupt
> controller wireing directly into the CPU, so on systems
> that do not have this we can get rid of all the extra
> code for supporting hierarchical irqs.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Cc: Bitan Biswas <bbiswas@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: David Daney <david.daney@cavium.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Co-developed-by: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[ snip ]


> @@ -1827,10 +2099,23 @@ EXPORT_SYMBOL_GPL(gpiochip_irq_domain_deactivate);
>  
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)

   ^^^^^^

I started to convert ssbi-gpio over to this and pm8xxx_gpio_to_irq() has
this little snippet that's different from spmi-gpio:

	[ fwspec mapping code ]

	/*
	 * Cache the IRQ since pm8xxx_gpio_get() needs this to get determine the
	 * line level.
	 */
	pin->irq = ret;

Here's the relevant code in pm8xxx_gpio_get():

	if (pin->mode == PM8XXX_GPIO_MODE_OUTPUT) {
		ret = pin->output_value;
	} else if (pin->irq >= 0) {
		ret = irq_get_irqchip_state(pin->irq, IRQCHIP_STATE_LINE_LEVEL, &state);
		...
	}

What do you think about using EXPORT_SYMBOL_GPL() for gpiochip_to_irq() so
that we can call it in pm8xxx_gpio_to_irq()? Or do you have any other
suggestions for how we can get rid of that IRQ cache?

I don't see any other issues for ssbi-gpio.

Brian
