Return-Path: <linux-gpio+bounces-28800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9AC7002B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5AC5C241E2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB01369209;
	Wed, 19 Nov 2025 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxpId7Tq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC3369205;
	Wed, 19 Nov 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568975; cv=none; b=PXU7jo7LA/e+3lJFAYdUoPgQ3MbyCx62IdUVjsDl6lvUP2lgKNkQVA9sN71kZpM7vd5Tkj4oxKzBLiROt+xN436UUefhfKA8JEhzvtmTq4F9oGcbG6GaYSyLclXf+kgUgNczfNRxnoI+UzkTmsVzbdo8dsYC+OS2W4L4TnnHvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568975; c=relaxed/simple;
	bh=hmoxcs1J4r1vAy4hNatH5Of3A1Db8qTiymbbgM0k4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwMAj3S5noaS8FcLBSbV31+Xpfj407YVm9IkJOBUBFg9dhgkaGgaKCtCwG27OTDFXvSB1Ob2WWXFiiQFfnnWn0in2Pr/78cahHRKoI95Yxwa+lQRdTiSt19DTr34tW16PtIbj6bElU2TTpRyhQn8VQ5gHqxtT0NZ5zpv4+J10zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxpId7Tq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC07C113D0;
	Wed, 19 Nov 2025 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763568974;
	bh=hmoxcs1J4r1vAy4hNatH5Of3A1Db8qTiymbbgM0k4C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxpId7TqNXbStVPFHPH4xEAEXkFK5ANyvwq6YrYG6USNEK2ButctKZuoqnFzviN0h
	 tHlJELFs2HsAhqQfeIhIzf1sPz4OHFYiY/AcYEda32CCBu2u1TRjO/xtAeJkc20f/G
	 P137wL/kx4oCSnMenYNrlp4fabk3I3NwraMAq0qTlFE1Sc8/28cj0wg19AiX/IQiB9
	 u1NF2dCOOKRG+aLcuIf/Fua5IsYilvxya4zdfeZmRBJSZ7BMZqUvlrMaAd/sDy7W/h
	 MKKvUUa8wRJS+uoPWlN88AfrRj5gqnemrl0HKxwi73p6M2YDOh83rj+kRH04J8lk63
	 1/x8hkGq9GH6Q==
Date: Wed, 19 Nov 2025 23:58:19 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR3pG7Em5RcRqAKT@xhacker>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-6-jszhang@kernel.org>
 <aR3mnWQedt7SMRP0@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR3mnWQedt7SMRP0@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 05:47:41PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 10:43:17PM +0800, Jisheng Zhang wrote:
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > 
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> 
> ...
> 
> > struct pxa_gpio_bank {
> 
> ...
> 
> >  	unsigned long	irq_mask;
> >  	unsigned long	irq_edge_rise;
> >  	unsigned long	irq_edge_fall;
> 
> > -
> 
> As I already pointed out this is stray change. Why you ignored my comment?
> 
> > -#ifdef CONFIG_PM
> >  	unsigned long	saved_gplr;
> >  	unsigned long	saved_gpdr;
> >  	unsigned long	saved_grer;
> >  	unsigned long	saved_gfer;
> > -#endif
> 
> Same Q as per dwapb driver. The CONFIG_PM=n doesn't need these.

Now, I know why you commented like these... 
the pm_ptr() and pm_sleep_ptr() can optimize out the PM
functions, but those functions still need to be compiled. So if
we keep these #ifdef, there will be build errors in case of !PM

> 
> >  };
> 
> ...
> 
> >  static struct syscore_ops pxa_gpio_syscore_ops = {
> > -	.suspend	= pxa_gpio_suspend,
> > -	.resume		= pxa_gpio_resume,
> > +	.suspend	= pm_ptr(pxa_gpio_suspend),
> > +	.resume		= pm_ptr(pxa_gpio_resume),
> >  };
> 
> This is not a device PM ops actually. Is there any guarantees on the
> relationship with CONFIG_PM and these callbacks? If so, I think we
> need to have special macros somewhere in include/linux/syscore_ops.h.
> 
> Otherwise I'm not sure this will be a good patch at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

