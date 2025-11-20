Return-Path: <linux-gpio+bounces-28860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20FC71952
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2C2934B5FB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7E51DD543;
	Thu, 20 Nov 2025 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBv7UVMv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0530F19992C;
	Thu, 20 Nov 2025 00:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599347; cv=none; b=amJoAwOiGAzlVNZ9p06PrjynKDzVWmTUXdw3DTt3O4tzRFW0bVrW/xxCzMgKjGBmKAURUqjmTtIAPaJywtMiw7qHEoUVFIRWZCdGVsyr4WCdUDfPZrorx/yepNUVnbjnn+aUyC3Qi8U8duZiURFxbzLzPQl3eLLIXmQZpUlBLf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599347; c=relaxed/simple;
	bh=Ajyj6guw9ILg0uUELthy7g4sRzTM7I8Q8BpMXUy4Zz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXCJupxo3HdXuvOMqkzeGBRjs+C9dL9gmGMt4fnLFxmoSC5ELLGfsQNxT3pInwIr6QlypuwKqcJzFwBWCgIXpWPUfTR/jWuRQnbHQ+7oROfLY1qKzegbcT1OfclezB8vKPokE+gY329pk7C9DMCbtTodyCQv64jSLmU+AWkx0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBv7UVMv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD29FC4CEF5;
	Thu, 20 Nov 2025 00:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599346;
	bh=Ajyj6guw9ILg0uUELthy7g4sRzTM7I8Q8BpMXUy4Zz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBv7UVMvJZ3EzYmsKQgv29nHMgeiNXyoojfczj2R/qu5jqzsBbMQT8ucyfYaHHlo3
	 95aVG23IdkWHwM1omBHQ+OP05obSG0tjm+7Oe1lX+PodT7CFz/bWJJPfHZZEXIEmpm
	 OdRJZIJlqg75wz5p+/jdgkIUKMz+azSmG15FG7dtEGQksbMv/lbiNL+r8Puoj9qp6l
	 vVMg6Tu9T+0u6WweiHLH9QE8kg7iOMXtDJ7TeFqT0/1lFAJMUQd5PMixCf4kGCP803
	 5Eid7MvPVPXbsZ9Ye+s8mTo9UuskLEf4epxvxm9twCwIRyB0+DdCMTvXlA2/RjiGVW
	 3vhNbj75aM2Gg==
Date: Thu, 20 Nov 2025 08:24:34 +0800
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
Subject: Re: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR5fwvGYqf1MAbq7@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-6-jszhang@kernel.org>
 <aR4BWLo4BdyKhnlI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR4BWLo4BdyKhnlI@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 07:41:44PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
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
> >  static struct syscore_ops pxa_gpio_syscore_ops = {
> > -	.suspend	= pxa_gpio_suspend,
> > -	.resume		= pxa_gpio_resume,
> > +	.suspend	= pm_ptr(pxa_gpio_suspend),
> > +	.resume		= pm_ptr(pxa_gpio_resume),
> >  };
> 
> I believe this needs to be thoroughly checked and thought through as
> this is *not* a dev_pm_ops.

pm_ptr()/pm_sleep_ptr() is defined in pm.h, so I think we can make use
of it for syscore_ops as well.
E.g This patch makes use of pm_ptr() to optimize out .suspend/.resume when !PM
while get in them when PM. Thus the same result can be acchieved between
before and after this patch.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

