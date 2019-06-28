Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 145A9598A3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2019 12:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfF1Knd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jun 2019 06:43:33 -0400
Received: from onstation.org ([52.200.56.107]:59458 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfF1Knd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Jun 2019 06:43:33 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 322103E95F;
        Fri, 28 Jun 2019 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561718612;
        bh=y5BPmEA222fcndo6wlgkJ9JcrH99qkYAFXosEDkT6rA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KcB1IpflNNp1czkVz8q//hXRQfkR18A5fR2N/xskfJJmZ438jEU9cGW4nxE/09RCp
         V981wjjEwu2WMRDR9uDs/HI1+jHxuVq6eXDC+0SF/0U3T0gHeLam4/Np/i4rHOvgbj
         yZ+VTdIRk4UTpXFzn3+9n5502Q0EeyLL2619BQcM=
Date:   Fri, 28 Jun 2019 06:43:31 -0400
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
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190628104331.GB17335@onstation.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 24, 2019 at 03:25:28PM +0200, Linus Walleij wrote:
> +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> +					       unsigned int irq,
> +					       unsigned int nr_irqs,
> +					       void *data)
> +{
> +	struct gpio_chip *gc = d->host_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec = data;
> +	int ret;
> +	int i;
> +
> +	chip_info(gc, "called %s\n", __func__);
> +
> +	ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	chip_info(gc, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> +		  irq, irq + nr_irqs - 1,
> +		  hwirq, hwirq + nr_irqs - 1);
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_fwspec parent_fwspec;
> +		unsigned int parent_hwirq;
> +		unsigned int parent_type;
> +		struct gpio_irq_chip *girq = &gc->irq;
> +
> +		ret = girq->child_to_parent_hwirq(gc, hwirq, type,
> +						  &parent_hwirq, &parent_type);
> +		if (ret) {
> +			chip_err(gc, "can't look up hwirq %lu\n", hwirq);
> +			return ret;
> +		}
> +		chip_info(gc, "found parent hwirq %u\n", parent_hwirq);
> +
> +		/*
> +		 * We set handle_bad_irq because the .set_type() should
> +		 * always be invoked and set the right type of handler.
> +		 */
> +		irq_domain_set_info(d,
> +				    irq + i,
> +				    hwirq + i,
> +				    gc->irq.chip,
> +				    gc,
> +				    handle_bad_irq,
> +				    NULL, NULL);
> +		irq_set_probe(irq + i);
> +
> +		/*
> +		 * Create a IRQ fwspec to send up to the parent irqdomain:
> +		 * specify the hwirq we address on the parent and tie it
> +		 * all together up the chain.
> +		 */
> +		parent_fwspec.fwnode = d->parent->fwnode;
> +		parent_fwspec.param_count = 2;
> +		parent_fwspec.param[0] = parent_hwirq;
> +		/* This parent only handles asserted level IRQs */
> +		parent_fwspec.param[1] = parent_type;
> +		chip_info(gc, "alloc_irqs_parent for %d parent hwirq %d\n",
> +			  irq + i, parent_hwirq);
> +		ret = irq_domain_alloc_irqs_parent(d, irq + i, 1,
> +						   &parent_fwspec);

I started to convert qcom's spmi-gpio over to this new API. I'm not done
yet but I noticed that this new API assumes two cells for the parent,
however spmi-gpio's parent (drivers/spmi/spmi-pmic-arb.c) expects four
cells. See pmic_gpio_domain_alloc() in
drivers/pinctrl/qcom/pinctrl-spmi-gpio.c for more details.

What do you think about adding a function pointer to struct
gpio_irq_chip that is used to populate the parent_fwspec?

Brian
