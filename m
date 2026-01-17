Return-Path: <linux-gpio+bounces-30690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77104D38F88
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 16:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD9E030087BC
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Jan 2026 15:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478F3218592;
	Sat, 17 Jan 2026 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fFxoiG5o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619B199E94;
	Sat, 17 Jan 2026 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664816; cv=none; b=RFXU6fohrUhykZSj6NwjMVIYDJuviLqnTYxZ5/I7sdulnip85opqznY6b2aGPXVOD6G1IM+mUWQ0H6q6zFqPj0Ru7nRApSTBV2tmYzOUeik9O3HgxpUm/4rXtiSx5bJhfbLM4+bWIgB74FyZSoLkullDGWsdVDFH8NplaRDrOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664816; c=relaxed/simple;
	bh=dpXbYGxqy64vK7fpF7LFHI57Q1HYBfmZuEIcGXDm+0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAD5zTWfKJKRfMe27Y/OIg20Uywb1qzyAMmXtyA/1Yf/LLkCKzOojQrgb0j4QiFrhxi0qn7rwCm4OP+7Gp3UPUx2q7ETNNupO07BdGSg6yIoD/ZNTlICfsKoBZDoKZsdaP45Y4jP1qiBCsW7N2qi//adqZBGdTdDN0xwbzi2PiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fFxoiG5o; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gF8+Zq1qK4nUISuq8ZYKam6dKSKTtWo9A81RsKUSatk=; b=fFxoiG5ouamEjvJWtIjJJqiZmZ
	ETa+cz75RUWA6SQbZuAAIwaD6U7YvThjuoYnJld2ETo7MDh6SNe9ENtr/+MUgD8W/Uslb4wpbD/cS
	W2Lsc2ZEzRzEUtD2Uv1FZ22e+IlEGXE28W+koektM/uK/4g4nlGqQni5usy4HXoir3zA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vh8VU-003DhI-R8; Sat, 17 Jan 2026 16:46:32 +0100
Date: Sat, 17 Jan 2026 16:46:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org, bmc-sw@aspeedtech.com
Subject: Re: [PATCH 3/5] gpio: aspeed-sgpio: Create llops to handle hardware
 access
Message-ID: <55fbb766-12b5-441a-b06c-d807097e5476@lunn.ch>
References: <20260117-upstream_sgpio-v1-0-850ef3ffb680@aspeedtech.com>
 <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-upstream_sgpio-v1-3-850ef3ffb680@aspeedtech.com>

On Sat, Jan 17, 2026 at 07:17:10PM +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for SGPIO
> registers. With this abstraction layer, the driver can separate the
> hardware and software logic, making it easier to extend the driver to
> support different hardware register layouts.

With a quick look at the code, it appears the register numbers stay
the same? Is that true?

I think you have reinvented regmap.

> @@ -318,30 +278,25 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
>  	u32 type0 = 0;
>  	u32 type1 = 0;
>  	u32 type2 = 0;
> -	u32 bit, reg;
> -	const struct aspeed_sgpio_bank *bank;
>  	irq_flow_handler_t handler;
> -	struct aspeed_sgpio *gpio;
> -	void __iomem *addr;
> -	int offset;
> -
> -	irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> +	struct aspeed_sgpio *gpio = irq_data_get_irq_chip_data(d);
> +	int offset = irqd_to_hwirq(d);
>  
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_BOTH:
> -		type2 |= bit;
> +		type2 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_RISING:
> -		type0 |= bit;
> +		type0 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_FALLING:
>  		handler = handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
> -		type0 |= bit;
> +		type0 = 1;
>  		fallthrough;
>  	case IRQ_TYPE_LEVEL_LOW:
> -		type1 |= bit;
> +		type1 = 1;
>  		handler = handle_level_irq;
>  		break;

This change is not obviously correct to me. It is not about
abstracting register accesses, what you actually write to the
registers appears to of changed. Maybe you could add a refactoring
patch first which does this change, with a commit message explaining
it, and then insert the register abstraction?


> @@ -374,16 +318,14 @@ static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
>  {
>  	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>  	struct irq_chip *ic = irq_desc_get_chip(desc);
> -	struct aspeed_sgpio *data = gpiochip_get_data(gc);
> +	struct aspeed_sgpio *gpio = gpiochip_get_data(gc);

This rename does not belong in this patch. You want lots of small
patches, each doing one logical thing, with a good commit message, and
obviously correct. Changes like this make it a lot less obviously
correct.

>  	/* Disable IRQ and clear Interrupt status registers for all SGPIO Pins. */
> -	for (i = 0; i < ARRAY_SIZE(aspeed_sgpio_banks); i++) {
> -		bank =  &aspeed_sgpio_banks[i];
> +	for (i = 0; i < gpio->chip.ngpio; i += 2) {

Why are ARRAY_SIZE() gone? There probably is a good reason, so doing
this in a patch of its own, with a commit message explaining "Why?"
would make this easier to review.

      Andrew

