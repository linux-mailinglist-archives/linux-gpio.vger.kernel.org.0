Return-Path: <linux-gpio+bounces-28801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A791BC70268
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 17:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D17F33A01ED
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7375B36655C;
	Wed, 19 Nov 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOuK7cMw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31A364030;
	Wed, 19 Nov 2025 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569374; cv=none; b=kdTn0AJhP9Fn+ci+dQmqHsWvb6HQHXmXFm+VH9SIOS4vqDdVsjhFvAj0dufvlbboUMLdYyGq7f1AhxK2Pxab9X7yvRR1/FKKIj32ZvPaFs1875ZHMzZRav4GYIhXLI/TwTEuooKpu7czywlnDIZW1yM07RAaorWqOUvpHQo3jXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569374; c=relaxed/simple;
	bh=bOZ9VsSLadY5qHCWXIgDU1673Fh1ooGTdtfaLRU7ric=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPcWLutgwfdLaNSPDFKtvpQ34XS8MOX2AKqeFLZi0onxgCYdZKhmEZp4oi7U6cbTPKDhfHOfryu8or1bm/57VLUK14tg0PhB8attRQsklsFRIXr5ZV0TgbthK+bibIrMf9MAAqMNWDVvBQffqmqdyAZKuV+mEBH4PBELjk4koQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOuK7cMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE20DC4CEF5;
	Wed, 19 Nov 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763569373;
	bh=bOZ9VsSLadY5qHCWXIgDU1673Fh1ooGTdtfaLRU7ric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOuK7cMwpmvuXliCZLru5zWoT3DiuHH19HM0Sj1lBHvCADMIe+LOuvWZvnnRe7uxn
	 W4o3tNtqHTTniBp/XDZfV5D7KOp8JZgWMMrOwN8VPk3SD9P7Q1Bozzg3QXgaX1yeC3
	 0KLkLM5QaQEQ0anjvmBdkKU9SivdjkXyC1cyQspMe3pE18XxzJ7VyrpipXlOFyEQgf
	 bkQlZNs/3gRPW2DAcKxdGsAuzndK7PhE+0ZhkKi1EUBLduJV5S+OnPFMbRuDX+KPKD
	 dVc1EOgYqromm9CHjpHb4XGAKDKU0NL//zhcBYX76TpJa/Wa+eMcTSVKjAhhEkri0k
	 a6lsM6e9dXfRg==
Date: Thu, 20 Nov 2025 00:04:58 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Doug Berger <opendmb@gmail.com>,
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
Message-ID: <aR3qqkgdqFS6dlf6@xhacker>
References: <20251119144327.13345-1-jszhang@kernel.org>
 <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com>
 <aR3niy7_jwzQSJ33@xhacker>
 <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>

On Wed, Nov 19, 2025 at 06:11:53PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 6:09 PM Jisheng Zhang <jszhang@kernel.org> wrote:
> > On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:
> 
> ...
> 
> > > > -#ifdef CONFIG_PM_SLEEP
> > > >     struct dwapb_context    *ctx;
> > > > -#endif
> > >
> > > But why this? For the PM_SLEEP=n cases it will give an unrequested overhead.
> >
> > the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> > functions, but those functions are still compiled, so if we keep the
> > #ifdef, there will be build errors.
> 
> Is this an expectation or you can share the error, please?

drivers/gpio/gpio-dwapb.c: In function ‘dwapb_irq_set_wake’:
drivers/gpio/gpio-dwapb.c:368:51: error: ‘struct dwapb_gpio_port’ h
as no member named ‘ctx’
  368 |         struct dwapb_context *ctx = gpio->ports[0].ctx;


