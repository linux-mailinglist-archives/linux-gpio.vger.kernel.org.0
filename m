Return-Path: <linux-gpio+bounces-28858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22769C718C9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 72C2D29E9B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D52B1DB34C;
	Thu, 20 Nov 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3fAf1fE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CA733E7;
	Thu, 20 Nov 2025 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763598503; cv=none; b=Q3JL4z4wXYOfP5asuxbtEIjIgcd3db/loi8hxnZUooSnLZcF5bfM6uI7hU0H6p0iZ6W72o6qWn4M/YVwDFD42Ind5MMyCqgFN05ZlLXcxhe/3qUGdpcvDKwsdX4cIT/S97i/6XzDcvzUVxgPQe7a5lD/PmZ9YbE44lKgCWP0MA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763598503; c=relaxed/simple;
	bh=WE4dW3eUoC04Cv20exXr2znqJM0ssIf18VtMt9cY1Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boohCwoK2nFZCTIvtX+Z2nRhE5Gp80B1HvwHgg02YojhjAKMyM58fiFCZzEVvN9NNNLAvzmMW4qmIhl66toPlC/fV6VLmmbquNAIhlcKHEKjpBd6GV4CjeAlvrkPnGjGAtOnYklpTfkAPfodyCLS1e+QSxm9m+IeUm+7rG+2eJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3fAf1fE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D13EC4CEF5;
	Thu, 20 Nov 2025 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763598501;
	bh=WE4dW3eUoC04Cv20exXr2znqJM0ssIf18VtMt9cY1Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3fAf1fEjlc6JfEMeWVU8D8PY8Mp0elxZly9c1vM+iApTrCF1jVRJQKuUuJ5SH3wQ
	 M5e/rillypC8dVafplgA+XZNNgRSkQAJKJbP6hP/2vwkEF9AkxBzhlZ8UiecV2umP0
	 G0vpANV4Px5paJ95EGxblaLnT7qX+bNHj2/YWH+cNGPbzaMYz6BcoF/Acw6/DvLw7X
	 GTO/LzCcKRwUGVfNiaq3mOmk0tFnn33Fj/Ij6mD9GVFwFPIzCfJCpPrlsbA+th9/PA
	 6siC08YuAQf8xsMtS2jSOk82gaEUjvZqyLoYK9Ft9xP9Q/EGWNm6H883T7Pccjp+LL
	 0M2Foj/imHjuA==
Date: Thu, 20 Nov 2025 08:10:28 +0800
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
Subject: Re: [PATCH v4 11/15] gpio: tqmx86: Use modern PM macros
Message-ID: <aR5cdOOKl1Anji1h@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-12-jszhang@kernel.org>
 <aR38PkERpLxXhNfD@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR38PkERpLxXhNfD@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 07:19:58PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:23AM +0800, Jisheng Zhang wrote:
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused
> 
> ...
> 
> >  static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
> > -	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
> > -			   tqmx86_gpio_runtime_resume, NULL)
> > +	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
> >  };
> 
> ...
> 
> >  static struct platform_driver tqmx86_gpio_driver = {
> >  	.driver = {
> >  		.name = "tqmx86-gpio",
> > -		.pm = &tqmx86_gpio_dev_pm_ops,
> > +		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),
> 
> For RPM this should be pm_ptr(), no?

Indeed, pm_ptr() is better. Thanks. Let me do it in next version, I will
wait for one or two days as Bart kindly reminded ;)

> 
> >  	},
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

