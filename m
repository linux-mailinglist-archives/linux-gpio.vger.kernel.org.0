Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FB05E0F0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 11:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfGCJWi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 05:22:38 -0400
Received: from onstation.org ([52.200.56.107]:60234 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727184AbfGCJWi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jul 2019 05:22:38 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 1C05E3E95F;
        Wed,  3 Jul 2019 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562145757;
        bh=MH4ZrK2Jua+n6MRiflRYHzLRS4WvfEi4I6wWLLkwjEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YXfV6H2YadszOhH1PJDpU8vjEfzK0SNyA6ky+iUUtf8gTW8wCyog4iIqmOcAvx0vm
         FxDSJeS/COsKTv1Kq5EAs/N5rMJMXy1yEwYUlfHmoY1qdDXqavzSBsnJxZqNPMd8nM
         BNUH6ZfdLAtOL6nnFoHSI2bVNuTVi36TUB7OrQlY=
Date:   Wed, 3 Jul 2019 05:22:36 -0400
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
Message-ID: <20190703092236.GA15393@onstation.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jun 24, 2019 at 03:25:28PM +0200, Linus Walleij wrote:
>  static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
> +	struct irq_domain *domain = chip->irq.domain;
> +
>  	if (!gpiochip_irqchip_irq_valid(chip, offset))
>  		return -ENXIO;
>  
> -	return irq_create_mapping(chip->irq.domain, offset);
> +	if (irq_domain_is_hierarchy(domain)) {
> +		struct irq_fwspec spec;
> +
> +		spec.fwnode = domain->fwnode;
> +		spec.param_count = 2;
> +		spec.param[0] = offset;
> +		spec.param[1] = IRQ_TYPE_NONE;
> +
> +		return irq_create_fwspec_mapping(&spec);
> +	}

spmi-gpio's to_irq() needs to add one to the offset:

	static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
	{
		struct pmic_gpio_state *state = gpiochip_get_data(chip);
		struct irq_fwspec fwspec;
	
		fwspec.fwnode = state->fwnode;
		fwspec.param_count = 2;
		fwspec.param[0] = pin + PMIC_GPIO_PHYSICAL_OFFSET;
		/*
		 * Set the type to a safe value temporarily. This will be overwritten
		 * later with the proper value by irq_set_type.
		 */
		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
	
		return irq_create_fwspec_mapping(&fwspec);
	}

ssbi-gpio will have the same problem as well.

What do you think about adding a new field to the struct gpio_irq_chip
inside the CONFIG_IRQ_DOMAIN_HIERARCHY ifdef called something like
to_irq_offset? (I'm bad at naming things.)

Also, instead of hardcoding IRQ_TYPE_NONE, what do you think about using
the default_type field that's available?

Brian
