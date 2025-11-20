Return-Path: <linux-gpio+bounces-28861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B3EC7199D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 228913016D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7241E230E;
	Thu, 20 Nov 2025 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnJQBFzn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CD846F;
	Thu, 20 Nov 2025 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599575; cv=none; b=sgePFjS68kqQ2N7qIvJlwjySNQ/nvDXTrf+2HArnzutunIF9c83o/49P5OW/keWaS/9YUZ4QXJLKcaQCEdrva7kFfUvTGnG2ev2YDAc4AlcCTFeAkc74+6gnfAHCe3BUR70LgoZbWgmGy+pQgKU0YZWUL8ZW7doNjOURhqejvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599575; c=relaxed/simple;
	bh=V+lbau4ImiiyPpelZNyUjrC1edHPTz1Ab2ur4WE0RJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bCj4HPppvDLbdRaSC7z3aUB7mJcVvuIw46086nbD33XpcLRe2WZ9DAagsQ+KsyW12zFMEVhA4kOigm+qz/tEERNN/UTvcZbjqP62yijodsBvBWt+4yM3uE5Ivj2YwbtihHhJEuIqaY7bD4MG2qh649fdYE7BVjeG+qBf90rhkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnJQBFzn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DCD4C4CEF5;
	Thu, 20 Nov 2025 00:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599574;
	bh=V+lbau4ImiiyPpelZNyUjrC1edHPTz1Ab2ur4WE0RJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnJQBFzneWDiAgLExO/LCxn62DHBVvuSu8IeCo094JIS7t8nW5OKL+fekyx6XZ1nN
	 P0Pxfk6AvPK+q67YosInlD3k4aXkiqTK/go3gGfVhwYw8hkqbA1HIGSjYKw9yWDn6l
	 UVYKZ98zZOUDkoTztJrAuVlM3fDU+hQGzzRqsVRg/7sYx8k00rgn6Q/X8Xlt+mRgJH
	 YtSA0rt+/6siBRGtO+zvpUHWI4kjmzDuOk4Ar+DaznKSFsSfAunJyj2UVyByH3lkM2
	 V/TgfWRtyaxwz139B0GW7PIR9Y0TGEVBu6YApjZdp3KnYhLd4FNtT+6FYSR8QF7cY7
	 SYNEItuNm7Igg==
Date: Thu, 20 Nov 2025 08:28:22 +0800
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
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
Message-ID: <aR5gpsbw_r-y4JdS@xhacker>
References: <20251119163327.16306-1-jszhang@kernel.org>
 <20251119163327.16306-3-jszhang@kernel.org>
 <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aR4CLQ_2-kUM-e2F@smile.fi.intel.com>

On Wed, Nov 19, 2025 at 07:45:17PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:
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
> >  static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> > -	.suspend_noirq	= brcmstb_gpio_suspend,
> > -	.resume_noirq = brcmstb_gpio_resume,
> > +	.suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend),
> > +	.resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> 
> Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?

Yep I agree with you. But IMHO, it's better to make the
DEFINE_NOIRQ_DEV_PM_OPS() switching as a seperate patch and merge this
series which wants to clean up various #ifdef #endif usages

