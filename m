Return-Path: <linux-gpio+bounces-16727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAD3A48A0A
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 21:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E73F188FA56
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 20:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC55270ED9;
	Thu, 27 Feb 2025 20:42:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16217270ED4;
	Thu, 27 Feb 2025 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688924; cv=none; b=cucm8Ax+hNHgr6ScFfLdZYK08N/Hzc1Z5WrA8esO7JLg3b+lJfZ/5E8frn18XR0i6tgJxST4l2m3k5hBLRCkxmHi/HohHD9RhTXvGLI/51ETJkOPF8j2Dq9KnzxYvOR2l5kjGTFpN1JQ2FmO92/plBmMw0EeuafScwsMJOzSZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688924; c=relaxed/simple;
	bh=C4un7h2vLOJXmNoYfRXp1pL8mPiY/UKkzqFRlYn3W8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXQ/JlrciEo3bvlze51ax1h82QEdlVFIkSwh38LdjR3SHlMv6PQvaVoGqDf1ZcqNzkK9ntvhItqgFOAOctSTz9CDdrlsO1OorlwHbJZAuqM6hT7VSD501Jzd1oFSUf+xXpKK6irNY3rGGE2DAsTUWQQa+OAKYY4N88TeRYyMq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 068D9343018;
	Thu, 27 Feb 2025 20:42:00 +0000 (UTC)
Date: Thu, 27 Feb 2025 20:41:55 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250227204155-GYA51171@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>


On 10:12 Thu 27 Feb     , Alex Elder wrote:
> On 2/27/25 5:24 AM, Yixun Lan wrote:
> > The is a prerequisite patch to support parsing three-cell
> > interrupts which encoded as <instance hwirq irqflag>,
> > the translate function will always retrieve irq number and
> > flag from last two cells.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   kernel/irq/irqdomain.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
> >   				 unsigned long *out_hwirq,
> >   				 unsigned int *out_type)
> >   {
> 
> This function is meant for "twocell".  There is also another function
> irq_domain_translate_onecell().  Why don't you just create
> irq_domain_translate_threecell" instead?
> 
good question!

it's too many changes for adding "threecell" which I thought not worth
the effort, or maybe we can rename the function to *twothreecell()?

I'm not sure which way to go is the best, ideas from maintainer are
welcome

> 
> > +	u32 irq, type;
> > +
> >   	if (WARN_ON(fwspec->param_count < 2))
> >   		return -EINVAL;
> > -	*out_hwirq = fwspec->param[0];
> > -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
> > +
> > +	irq = fwspec->param_count - 2;
> > +	type = fwspec->param_count - 1;
no matter two or three cell, it's always parse the last two cells,
virtually they are same syntax, which can reuse the *_translate_twocell()
function perfectly..

> > +
> > +	*out_hwirq = fwspec->param[irq];
> > +	*out_type = fwspec->param[type] & IRQ_TYPE_SENSE_MASK;
> > +
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
> > 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

