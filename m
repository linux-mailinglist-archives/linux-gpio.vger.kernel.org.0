Return-Path: <linux-gpio+bounces-16921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AFA4C07D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 13:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC066189349C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 12:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0559B1E5B78;
	Mon,  3 Mar 2025 12:40:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759507FBAC;
	Mon,  3 Mar 2025 12:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741005617; cv=none; b=X99yoFoeFGPFFbjoCAHXZHdw9Z4y1KYw45ECC6eZpVEsCCLYDCd1iTwvJRIdQRvJzq87JUR9qEcEQRFS+bFTaVFupDtEvfvDK7j9ub1zK9+V6v126hs1291hS8TklxahQxmxQL3sT8kSlau7wyPVYLQk4m9+hntPHvIiAT2igug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741005617; c=relaxed/simple;
	bh=r2XBzxVbY183ENmxhOU6qKFdYiUysRWHJxDNkNuv0aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJzL/WrErBuqUd4H+wQjkIGVisKi1fTi6QsiuAr1iiBKY+QM9s3dwXBFoob9TkD0E1ydcJE5IC6jwrInDxsxCRVTB3nK53A8fRNtcQTVfFaCvH8NZq5ADNiSvKo/tIiDBrcNZZE+83vgkixLzw1BzY5v+I4DwlWy+ZLaSIj/PDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 46A66342FEA;
	Mon, 03 Mar 2025 12:40:15 +0000 (UTC)
Date: Mon, 3 Mar 2025 12:40:11 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250303124011-GYA59067@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz97cml1.ffs@tglx>

Hello, Thomas Gleixner:

On 19:30 Sun 02 Mar     , Thomas Gleixner wrote:
> On Sun, Mar 02 2025 at 07:15, Yixun Lan wrote:
> > The is a prerequisite patch to support parsing three-cell
> > interrupts which encoded as <instance hwirq irqflag>,
> > the translate function will always retrieve irq number and
> > flag from last two cells.
> >
> > In this patch, we introduce a generic interrupt cells translation
> > function, others functions will be inline version.
> 
> Please read:
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
>   https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-changes
> 
> > +int irq_domain_translate_cells(struct irq_domain *d,
> > +			       struct irq_fwspec *fwspec,
> > +			       unsigned long *out_hwirq,
> > +			       unsigned int *out_type);
> 
> Please get rid of the extra line breaks. You have 100 (99) characters available.
> 
> > +static inline int irq_domain_translate_onecell(struct irq_domain *d,
> > +					       struct irq_fwspec *fwspec,
> > +					       unsigned long *out_hwirq,
> > +					       unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> > +
> > +static inline int irq_domain_translate_twocell(struct irq_domain *d,
> > +					       struct irq_fwspec *fwspec,
> > +					       unsigned long *out_hwirq,
> > +					       unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> > +
> > +static inline int irq_domain_translate_threecell(struct irq_domain *d,
> > +						 struct irq_fwspec *fwspec,
> > +						 unsigned long *out_hwirq,
> > +						 unsigned int *out_type)
> > +{
> > +	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
> > +}
> 
> What's this for? It's not used. The onecell/twocell wrappers are just
> there to keep the current code working.
>   
> > +int irq_domain_translate_cells(struct irq_domain *d,
> > +			       struct irq_fwspec *fwspec,
> > +			       unsigned long *out_hwirq,
> > +			       unsigned int *out_type)
> 
> Please remove the extra line breaks.
> 
> int irq_domain_translate_cells(struct irq_domain *d, struct irq_fwspec *fwspec,
> 			       unsigned long *out_hwirq, unsigned int *out_type)
> 
> is perfectly fine.
> 
> >  {
> > -	if (WARN_ON(fwspec->param_count < 1))
> > -		return -EINVAL;
> > -	*out_hwirq = fwspec->param[0];
> > -	*out_type = IRQ_TYPE_NONE;
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
> > +	unsigned int cells = fwspec->param_count;
> >  
> > -/**
> > - * irq_domain_translate_twocell() - Generic translate for direct two cell
> > - * bindings
> > - * @d:		Interrupt domain involved in the translation
> > - * @fwspec:	The firmware interrupt specifier to translate
> > - * @out_hwirq:	Pointer to storage for the hardware interrupt number
> > - * @out_type:	Pointer to storage for the interrupt type
> > - *
> > - * Device Tree IRQ specifier translation function which works with two cell
> > - * bindings where the cell values map directly to the hwirq number
> > - * and linux irq flags.
> > - */
> > -int irq_domain_translate_twocell(struct irq_domain *d,
> > -				 struct irq_fwspec *fwspec,
> > -				 unsigned long *out_hwirq,
> > -				 unsigned int *out_type)
> > -{
> > -	if (WARN_ON(fwspec->param_count < 2))
> > +	switch (cells) {
> > +	case 1:
> > +		*out_hwirq = fwspec->param[0];
> > +		*out_type = IRQ_TYPE_NONE;
> > +		return 0;
> > +	case 2 ... 3:
> 
> I have second thoughts about this when looking deeper.
> 
> The current one/two cell implementations validate that param_count is at
> least the number of parameters. Which means that the parameter count
> could be larger, but only evaluates the first one or the first two.
> 
> I have no idea whether this matters or not, but arguably a two cell
> fwspec could be successfully fed into translate_onecell(), no?
> 
> And that triggers a related question.
> 
> Why is the three cell translation not following the one/two cell scheme
> and has the parameters at the same place (index 0,1), i.e. adding the
> extra information at the end? That makes sense to me as the extra cell
> is obviously not directly related to the interrupt mapping.

this from gpio DT
 gpios = <&gpio instance offset flags>;

I think we currently just following the scheme with gpio cells order
scheme, which is (index(instance) offset flag..), the index and offset
are parameters to locate the irq which can easily derive from global
gpio pin number, so I thought it's more intuitive to group them 
orderly together..

But you really raise a good suggestion here, if we follow appending extra
information at the end, then it will make threecell translate scheme
compatible with twocell, which mean we don't really need extra function
to prase, and can eventually drop this patch, I personally like this direction.

hi, Linus Walleij, what do you think on this?

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

