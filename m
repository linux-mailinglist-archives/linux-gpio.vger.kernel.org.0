Return-Path: <linux-gpio+bounces-28751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC2BC6EB0C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C64F33466C4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4048353897;
	Wed, 19 Nov 2025 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWihpCfK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCF4349AF0;
	Wed, 19 Nov 2025 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557200; cv=none; b=qWWOvtLO+wcMuW1trlP67Onwq+PmCvmnPCPGUwdSMCDcljzffr/nAMconcSHL8wJPBUZYszJ0JbkE32zIEeQ5eoG9SKJLoRmcAeHAp8RHlHza+9t1k+Y7EbzMISN56u7pETKHpfNPvQXCS3EwUE6oTTFeMBchEsOnZsVDilGLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557200; c=relaxed/simple;
	bh=G5xOyYYZxALWZkH3/Ty9TlHQ4sn9EtrWTd/CD0Bb0X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uir7QEByXZQbCF0nF7F+YXHBmuroc9x5UPemTsB45Suh15b3IEiHP2suZJceW9PEZKxL3j3JTWP0kFgOdyXmy8UPx4BlD1MvDeRvV6ZrGv7haFiUaDIox83d7T8j8WfaBUQXXATL4SQax/fXGU4WkGmayx/1dVcuJOvXWWngqQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWihpCfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5858AC19422;
	Wed, 19 Nov 2025 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557200;
	bh=G5xOyYYZxALWZkH3/Ty9TlHQ4sn9EtrWTd/CD0Bb0X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWihpCfKkpIVKL5tDSd0kx+Q90HusOdDbd+2zTLAf4hf1QDNiAuRlzmr7CHwBwtiX
	 xDa/iUgMFEsSNpB15VQbZAhQd2xpf/79xZV1+3NiqlEwyTc+DAE/J94BH3hhjUWcI6
	 Xnta0GH41LmlPZUb+8AIReWdaB774KxkOTRpPDHY1Ec1kyQ9Ah2fbULu7X3EF7DfED
	 bEdjtuHYPbaAlGgO2cOmP6Zc22UGpaJQmkfr1gwADbefGlZL3KpNh+HtNd4X0DhJz6
	 x7BQ8d7mJ+RNjzYb/phsZBnyp/Jvd8RqRnpyJZp/ZjORIhJI5z2j1BbyhsCH9xiROV
	 bCUhL9Cd59AAA==
Date: Wed, 19 Nov 2025 20:42:05 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
Message-ID: <aR27HcbvUgvCEK2Z@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>

On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> >
> > Use the modern PM macros for the suspend and resume functions to be
> > automatically dropped by the compiler when CONFIG_PM or
> > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> >
> > This has the advantage of always compiling these functions in,
> > independently of any Kconfig option. Thanks to that, bugs and other
> > regressions are subsequently easier to catch.
> >
> > The dwapb_context structure is always embedded into struct
> > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv
> 
> SLEEP
> grepping
> 
> > dts dir, the max port number is 6, the berlin2q soc families, so this
> > means current we have wasted 216 bytes memory which is trivial
> 
> currently
> 
> > compared to the system memory.
> 
> I still think the embedding is not related to this change and should
> be justified in a separate patch. W/o that part the rest looks fine.

I got your mind now: it looks like you prefer a seperate patch for the
embedding. Let me explain why I have the embedding within this patch:
the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but the
PM funtions are still compiled, so w/o the embedding, it's impossible
to clean up the code with the modern PM macros.

