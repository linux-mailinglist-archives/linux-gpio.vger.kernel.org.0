Return-Path: <linux-gpio+bounces-16886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83366A4B40F
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 19:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14821188EA34
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 18:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48271C5D50;
	Sun,  2 Mar 2025 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JhEE6Sy9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cnsHIUzQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07191B87EE;
	Sun,  2 Mar 2025 18:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740940212; cv=none; b=f3TOs2ff1DxL8BhqlfazkqdZQyeqahtuUCyz9RwirS+ryVVElu9NclsQdI1umedufVM8m/Kk5j/eafWFFnmCvee2M7jR3SLPXP8i2Qm4bdWLgjqFdy3xN3htoUjyAgDMr9ECz/gjlvtBhCdYojO64r/7so4vBmwnYoSQuUN8kLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740940212; c=relaxed/simple;
	bh=bY35PyefGpfNSi+6VAM8+WPE41caGN+ArZK2Kj84gcA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mFkEDhS0lKgaqFtRbOW4uziyU9KPORB4PwfUgvHUfkD9B4tLL+UF2FSpcI8P6wsTfmyMjAbDasLWQFRwie977neWZNsgCjh5WVp4KhDPBqguAcOydD/SCzpgA8nkSvNGjS2YP/UQXR5DOjDRQ+D/KsPJ5wt8sxM3mvgFAh/ZB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JhEE6Sy9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cnsHIUzQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740940203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OggkcNn0CKOnNyjOJiAOPJdtTYiXPnknmr72FoMHxZc=;
	b=JhEE6Sy92xvRpi//F5igT/6cPmqXPmLe/QshCEQQ3REbTHsRQr4nre5lJ1WCun3DjdYG6F
	KKyg66ToZ42msupKberz8GFdM+QuLl7DrvgjQY7DV1+SiEHf4s6QbegDwAhbpuTCn53t77
	uMM9hRM4LQDfabTuG1cflmukMKaY6b+ktMTdz6iE5RlbwufQvMsh6TBM1nAVO+KR3Sm7Ta
	AkSCREWwwElbR6MwrDG9v6Unet7jv8Y95sBSmAYR6p7BV4y3pQQsafOYfGSd/I9iiTq2jA
	B4e9PNywJsvTy9RL4o9DHsaHLGd3QA+/XeMkJDaUQQoe7TSZdxotOy+sVIsfxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740940203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OggkcNn0CKOnNyjOJiAOPJdtTYiXPnknmr72FoMHxZc=;
	b=cnsHIUzQ8LaG99IMzMzRq3TW5s/YJNrrnQrjXdu6MZqsbYBoGVwGrCgqcGvwd0dlwP1LmQ
	xSlaxbgGOJWtvdBQ==
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan
 <dlan@gentoo.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
Date: Sun, 02 Mar 2025 19:30:02 +0100
Message-ID: <87jz97cml1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Mar 02 2025 at 07:15, Yixun Lan wrote:
> The is a prerequisite patch to support parsing three-cell
> interrupts which encoded as <instance hwirq irqflag>,
> the translate function will always retrieve irq number and
> flag from last two cells.
>
> In this patch, we introduce a generic interrupt cells translation
> function, others functions will be inline version.

Please read:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes

> +int irq_domain_translate_cells(struct irq_domain *d,
> +			       struct irq_fwspec *fwspec,
> +			       unsigned long *out_hwirq,
> +			       unsigned int *out_type);

Please get rid of the extra line breaks. You have 100 (99) characters available.

> +static inline int irq_domain_translate_onecell(struct irq_domain *d,
> +					       struct irq_fwspec *fwspec,
> +					       unsigned long *out_hwirq,
> +					       unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}
> +
> +static inline int irq_domain_translate_twocell(struct irq_domain *d,
> +					       struct irq_fwspec *fwspec,
> +					       unsigned long *out_hwirq,
> +					       unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}
> +
> +static inline int irq_domain_translate_threecell(struct irq_domain *d,
> +						 struct irq_fwspec *fwspec,
> +						 unsigned long *out_hwirq,
> +						 unsigned int *out_type)
> +{
> +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> +}

What's this for? It's not used. The onecell/twocell wrappers are just
there to keep the current code working.
  
> +int irq_domain_translate_cells(struct irq_domain *d,
> +			       struct irq_fwspec *fwspec,
> +			       unsigned long *out_hwirq,
> +			       unsigned int *out_type)

Please remove the extra line breaks.

int irq_domain_translate_cells(struct irq_domain *d, struct irq_fwspec *fwspec,
			       unsigned long *out_hwirq, unsigned int *out_type)

is perfectly fine.

>  {
> -	if (WARN_ON(fwspec->param_count < 1))
> -		return -EINVAL;
> -	*out_hwirq = fwspec->param[0];
> -	*out_type = IRQ_TYPE_NONE;
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> +	unsigned int cells = fwspec->param_count;
>  
> -/**
> - * irq_domain_translate_twocell() - Generic translate for direct two cell
> - * bindings
> - * @d:		Interrupt domain involved in the translation
> - * @fwspec:	The firmware interrupt specifier to translate
> - * @out_hwirq:	Pointer to storage for the hardware interrupt number
> - * @out_type:	Pointer to storage for the interrupt type
> - *
> - * Device Tree IRQ specifier translation function which works with two cell
> - * bindings where the cell values map directly to the hwirq number
> - * and linux irq flags.
> - */
> -int irq_domain_translate_twocell(struct irq_domain *d,
> -				 struct irq_fwspec *fwspec,
> -				 unsigned long *out_hwirq,
> -				 unsigned int *out_type)
> -{
> -	if (WARN_ON(fwspec->param_count < 2))
> +	switch (cells) {
> +	case 1:
> +		*out_hwirq = fwspec->param[0];
> +		*out_type = IRQ_TYPE_NONE;
> +		return 0;
> +	case 2 ... 3:

I have second thoughts about this when looking deeper.

The current one/two cell implementations validate that param_count is at
least the number of parameters. Which means that the parameter count
could be larger, but only evaluates the first one or the first two.

I have no idea whether this matters or not, but arguably a two cell
fwspec could be successfully fed into translate_onecell(), no?

And that triggers a related question.

Why is the three cell translation not following the one/two cell scheme
and has the parameters at the same place (index 0,1), i.e. adding the
extra information at the end? That makes sense to me as the extra cell
is obviously not directly related to the interrupt mapping.

Thanks,

        tglx

