Return-Path: <linux-gpio+bounces-16821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99922A49ADB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A518C1895C31
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF3626D5BF;
	Fri, 28 Feb 2025 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qVYTqV+a";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yLCrTvGT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82A26D5A2;
	Fri, 28 Feb 2025 13:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750281; cv=none; b=lpr5v83HucgM6NztfbSz246y3Bzk88FhDABjVcrt25pasTiL9fhujhKZ+QbX/GjPOcu/LN06du0a/FACIiGfn7lvz50IjEbyyPCO9SAa/z+eA/AqnDFnvVx8JldQyAXWXkLkT4DftQoxZ3YIr9/hlPYFnU5pWcYpUMm/hLc2ElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750281; c=relaxed/simple;
	bh=qsH6o8fcr8KIivNvOtBKztdbPy08AQY/IX0+74VcbZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UTRPq77cIhst3VN2oiACWBsWYuNDNUAQWgdFJx+Dx2Et9ERny4NkPTqkYYESzEZDwSNvHIp7kdLieiZnqWkpbrDGrJwIhjpeHZFaYBPJRfVEWjZBdap4dCQLAvMSh18qX/riNul4EKVit5pDHCyTbcwr3/YoyKNRalfjF/tFI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qVYTqV+a; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yLCrTvGT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740750277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xT5+WG3VHi4NewtOLqTVlQbqf36jSOz2HnCAsZWMVDY=;
	b=qVYTqV+aE6XVgHtMV0wbBmT0Pkl0w2415c+t42gYFc7tG0aiHNwqp0dWW3yNctqBUnqjhn
	gfcoLyz/UcQgNqB38YM45iZIhoa0VLV+6/TRT7K/IqVRfmOBoUaSQ/50Q59fPNh/TflxzG
	JKJvHLL2sU7aTLp0oXMz1AOYkZOKbKGQAtTZYmy4FBP4J0N4sKCHYefMcMo1Qhro1521H7
	qy2O8f4MMD25J6XCX8IM7TmWX4gQkcl3inQi7ia7essMeIP/oJzuezaN8H+iiRN+Ym3HKZ
	HWN77mrN63cZ9Y73NZNespXKdk3gd0lPYwMdwduqeM53am1IZ5LNiFyDBUnJAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740750277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xT5+WG3VHi4NewtOLqTVlQbqf36jSOz2HnCAsZWMVDY=;
	b=yLCrTvGTYw0fg8jZFBrxswcSZsKpYPj5EIvwiPDBktdjbvuloIxsOxgz6j+lA5hS2qt8uv
	3QRdstTL3J/NrkBA==
To: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
In-Reply-To: <20250227204155-GYA51171@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
 <20250227204155-GYA51171@gentoo>
Date: Fri, 28 Feb 2025 14:44:36 +0100
Message-ID: <871pvidvzv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 27 2025 at 20:41, Yixun Lan wrote:
> On 10:12 Thu 27 Feb     , Alex Elder wrote:
>> On 2/27/25 5:24 AM, Yixun Lan wrote:
>> > 
>> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>> > index ec6d8e72d980f604ded2bfa2143420e0e0095920..cb874ab5e54a4763d601122becd63b6d759e55d2 100644
>> > --- a/kernel/irq/irqdomain.c
>> > +++ b/kernel/irq/irqdomain.c
>> > @@ -1208,10 +1208,17 @@ int irq_domain_translate_twocell(struct irq_domain *d,
>> >   				 unsigned long *out_hwirq,
>> >   				 unsigned int *out_type)
>> >   {
>> 
>> This function is meant for "twocell".  There is also another function
>> irq_domain_translate_onecell().  Why don't you just create
>> irq_domain_translate_threecell" instead?
>> 
> good question!
>
> it's too many changes for adding "threecell" which I thought not worth
> the effort, or maybe we can rename the function to *twothreecell()?
>
> I'm not sure which way to go is the best, ideas from maintainer are
> welcome

We really want to have explicit functions for two and three cells.
 
>> > +	u32 irq, type;
>> > +
>> >   	if (WARN_ON(fwspec->param_count < 2))
>> >   		return -EINVAL;
>> > -	*out_hwirq = fwspec->param[0];
>> > -	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
>> > +
>> > +	irq = fwspec->param_count - 2;
>> > +	type = fwspec->param_count - 1;
> no matter two or three cell, it's always parse the last two cells,
> virtually they are same syntax, which can reuse the *_translate_twocell()
> function perfectly..

Yes, that works but the code is completely non-obvious. So what you
really want is something like this:

int irq_domain_translate_cells(struct irq_domain *d, unsigned long *hwirq,
			       unsigned int *type)
{
        unsigned int cells = fwspec->param_count;

        switch (cells) {
       	case 1:
                *hwirq = fwspec->param[0];
                *type = IRQ_TYPE_NONE;
                return 0;
       	case 2..3:
	        /*
        	 * For multi cell translations the hardware interrupt number and type
	         * are in the last two cells.
	         */
		*hwirq = fwspec->param[cells - 2];
        	*type = fwspec->param[cells - 1] & IRQ_TYPE_SENSE_MASK;
                return 0;
        default:
   		return -EINVAL;
        }
}

Then have inline helpers:

static inline int irq_domain_translate_XXXcell(struct irq_domain *d, unsigned long *hwirq,
					       unsigned int *type)
{
        return irq_domain_translate_cells(d, hwirq, type);
}

That avoids changing all call sites at once and merges the one cell
translation into it.

You get the idea....

Thanks,

        tglx

