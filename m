Return-Path: <linux-gpio+bounces-17956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D04BA6ED05
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 10:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92EA716F58C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897642528FC;
	Tue, 25 Mar 2025 09:51:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C9A1E7C2D;
	Tue, 25 Mar 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896309; cv=none; b=dYNAPvq5fYrFSWIsFQG+e0p89K6/MKcyZS8m91vjd2oTgZ+BBankvTAWb7djikMGtBv2c6crJ3yOmZ9H+/NEy+dBccjPTajBqDMdKedB2Zxdd6pr1si6yQw3shhJaHhrkAn7fy/emWRwxv4V+EsfPFMKXaojucIQqlcmg+BT8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896309; c=relaxed/simple;
	bh=geEQ9L3WSsvtuUPOzyFKEAimIffbGKiqFvF1u+F1W+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhATQFhA7oxP+6OG3MEVqMlXOM5EodRy3dhUehmDExmuLErzZ8Fb4/okLK14zGiwUUy1qS1huM5g0mTSMeYSjC7l0Wfi+n/nGDe1oczc9rrdAbTfVOcdgfX/AKiHTuvHYnl/EXZgc0K6qFv/1FPkx8snpxqSRwGmoI8uOrOEcoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C804034331D;
	Tue, 25 Mar 2025 09:51:46 +0000 (UTC)
Date: Tue, 25 Mar 2025 09:51:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250325095135-GYA22131@gentoo>
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

Hi Thomas:

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
I think this isn't a problem, the function translate_onecell() or twocell()
will be called explicitly, so they will parse cells with only wanted number
but ignore additional one

when come to this, I do think there is problem in my previous patch
that implicitly extend the translate_twocell() to parse three cells,
I will try to fix this in next version by introducing a threecell()
or translate_twothreecell() function for corresponding cases.

> And that triggers a related question.
> 
> Why is the three cell translation not following the one/two cell scheme
> and has the parameters at the same place (index 0,1), i.e. adding the
> extra information at the end? That makes sense to me as the extra cell
> is obviously not directly related to the interrupt mapping.
> 
> Thanks,
> 
>         tglx

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

