Return-Path: <linux-gpio+bounces-24590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D7B2D4AE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 09:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE882A747E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 07:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9070B2D375A;
	Wed, 20 Aug 2025 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+Mg0cGN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4827A925;
	Wed, 20 Aug 2025 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674223; cv=none; b=Lu1epyEsRLX2a4b02vdoaWYpKvTaiBqvim7AfyYG4MsaPRZ9+YlYCS4tMkh+v+LVe3eZ47SkjCZRL6COvnzOsXM8BBqjPU/9F3c+wJkYXbH6lKZ3+VmNK+UZAsf0gsaqs+6AwXna1ou8njF+xx/1XDrGe/WWfiT28RJPMoOwnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674223; c=relaxed/simple;
	bh=5QX32rJNvEnTDH9xV1QQy+bxz6g/HzsiTFIRBQBuJ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psSdg3vUZDGFjTOF3zu0zIg+J+djoJ8AQhpZg8yHaBd/HHpvHv1My0I8lqIzMczbO5oKsMT0YRVNsU6iwBR3HUjrfD/yfTJ+MD0skQtk098X90DAR/DDJL9fE5LFy1bccH6ge0FYqqDfOuop47gbjhEnQrSxkpExpxE4Vo03aAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+Mg0cGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EFEC113CF;
	Wed, 20 Aug 2025 07:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755674222;
	bh=5QX32rJNvEnTDH9xV1QQy+bxz6g/HzsiTFIRBQBuJ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+Mg0cGNBCCwxQQj2Tjgj8vdHuLmQ65VgO8Of2q/PXj28Ep11hlLnAUYzM8gGeT3I
	 TvtUfcXRTnjvokClpW85XKTT8emnXz6gwpQjGIs7H3ZExlR+nY1E91PG4zDCoECDm9
	 bgnZTITT9Ma4MHizmbzzMFEnb7J5q1d3k7Wr8pBPvZQEx8FkZOn9znRWvSK+egIPiu
	 Fj6veHIhqOwnd6lFGtigpN8mWJqqZZDkkzYxVXXG9h9gp24MhGFH2HOVF32Mgad4ge
	 jO/wXgd3+CbeS7EXPCFlTGhmX1ajCIUhsambS/u4VNVPAfhGCUeZvM0M/djR6azWqi
	 CyIXvDVsr40+g==
Date: Wed, 20 Aug 2025 08:16:56 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Anish Kumar <yesanishhere@gmail.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/21] leds: gpio: make legacy gpiolib interface optional
Message-ID: <20250820071656.GJ7508@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-11-arnd@kernel.org>
 <20250819121907.GA7508@google.com>
 <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9252384-a55c-4a91-9c61-06e05a0b2ce4@app.fastmail.com>

On Tue, 19 Aug 2025, Arnd Bergmann wrote:

> On Tue, Aug 19, 2025, at 14:19, Lee Jones wrote:
> > On Fri, 08 Aug 2025, Arnd Bergmann wrote:
> >>  {
> >>  	struct gpio_desc *gpiod;
> >> +#ifdef CONFIG_GPIOLIB_LEGACY
> >>  	int ret;
> >> +#endif
> >
> > Isn't there another way to do his that doesn't entail sprinkling #ifery
> > around C-files?
> >
> 
> An alternativew would be to duplicate the driver and have
> one modern variant and an additional legacy variant that
> is only used on the few remaining platforms that select CONFIG_GPIOLIB_LEGACY and define platform data. See below
> for the list of files that reference struct gpio_led.
> 
> There are already patches to convert some of those to
> software nodes, and a lot of the others can probably be
> removed, in particular the orion5x ones.
> 
> The leds-gpio driver with just the legacy interfaces left
> would be a really small driver, and removing those bits from
> the normal one would make that a bit simpler as well, but
> there would be some amount of duplication.

Sounds like we're between a rock and a hard place with this.

Will the legacy parts be removed at some point or do you foresee us
supporting this forever?

-- 
Lee Jones [李琼斯]

