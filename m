Return-Path: <linux-gpio+bounces-28797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B04C6FF7C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 676AF302AE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C0726FDBF;
	Wed, 19 Nov 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjUvSkcD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A536E573;
	Wed, 19 Nov 2025 16:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763568573; cv=none; b=STBz0U4nVl0DIPqAkUL3CxchAqvf04kSGOkj1wiWoW1D9We5m+b02aa1nDMnC146NzxfTEEucG9jMBrGJe77/cLVOkhZcSLshpBcy1zHghcW2eMvlgWFl/qt9ggmvn6T2pQqjjPSDgOpo+hBGM5CbZTfQ7oWa2/eJ5OZSot3Wl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763568573; c=relaxed/simple;
	bh=yecPozP/mhu1K7P05yYjbd9mozStHCFHTnKHlNBGXiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qatv+7eGsiL+IFLYcwxrks3HO67Q49/+5XHGvtfa6zUH1LDkaQSPWh3WMOJ8k/V6hIfMVHCmQNPtdrrCikU/wH3DMzhQtmex4c5sql79wZnwwbDOgv0oTVWGWlsIRVKJ3ElQ6Lh3UJMlY1TbovATrSTFdY5eITzMBeGBir9ujFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjUvSkcD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AA9C4CEF5;
	Wed, 19 Nov 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763568572;
	bh=yecPozP/mhu1K7P05yYjbd9mozStHCFHTnKHlNBGXiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjUvSkcDGUJEE+Av8jzmS5XLVnwXLssfrykP50/4nIIPVnLIqfVBaCgRURGi0IVE+
	 Obfwm1uTdpEzQchELcnOaP80OZeMzF48vT/d5YNIsH4mXRVk7yf90r5vBR+joKGjbS
	 X4b6moTHOqY8Z6iLyPosaqBKxpkyJzr/dqXpLJesk1Q+wp8hg0aUDV9gCEyy6KZSkO
	 kFMtTMCzkCiC4z1Lzz2hZmq6RwRNq/TJg5foUaUr5SNt6T1305GA43CiozGTv+UJLd
	 3l81FBCi1jXqOah7G3KyoUQznS0jegPKjyR3KwJHxS7JvdLhTHcnY9QcqYl8qLmWcE
	 wOQrTicaq9wDw==
Date: Wed, 19 Nov 2025 23:51:39 +0800
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
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR3niy7_jwzQSJ33@xhacker>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR3lg0aNaoT-_7SM@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:
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
> > -#ifdef CONFIG_PM_SLEEP
> >  /* Store GPIO context across system-wide suspend/resume transitions */
> >  struct dwapb_context {
> >  	u32 data;
> 
> >  	u32 int_deb;
> >  	u32 wake_en;
> >  };
> > -#endif
> 
> This ifdeffery is to protect the type definition? It may be removed for sure.
> 
> ...
> 
> >  struct dwapb_gpio_port_irqchip {
> >  	unsigned int		nr_irqs;
> 
> >  	struct gpio_generic_chip chip;
> >  	struct dwapb_gpio_port_irqchip *pirq;
> >  	struct dwapb_gpio	*gpio;
> > -#ifdef CONFIG_PM_SLEEP
> >  	struct dwapb_context	*ctx;
> > -#endif
> 
> But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.

the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
functions, but those functions are still compiled, so if we keep the
#ifdef, there will be build errors.

> 
> >  	unsigned int		idx;
> >  };
> 
> Otherwise LGTM.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

