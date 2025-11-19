Return-Path: <linux-gpio+bounces-28750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55740C6E948
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E08A3516D4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 12:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A292C32D0ED;
	Wed, 19 Nov 2025 12:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ci5QtFfP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A5E2BE04C;
	Wed, 19 Nov 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763556011; cv=none; b=go1Kzftu0hogMbeHa/A0GTs24zwOFgHZjzoTxWnkfn7fIMeZ43m8cf8eKy3pymN5u2lh6EQAFeriB/BlYSWl0S8HV6hYTi+gT3wcXYyqc7ChYT/tCDsLMYtCmRAzlJ2wbebjklXyLeYtJ40KL/yEDH3mqapyYHoNyQChxSX9lXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763556011; c=relaxed/simple;
	bh=5i6z2W6q1iTm22YvLzIETMkmV4YtGu9mjO0O0P0maVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipVC/AYJb0UisiypD8sdRKGZfY5j6O61HiNNjo2ordNGTdtX5YUH9oMeIkhV6AUCldEmiy8tnTafjZKqVpvcHKPkCXo7+FgbSQwi4NI+eFey+UireSqrdbeU2AUrmTeBpSziVn0Yz9YLMX6uKVZnyici1ynKpj1aTRaNofLsowM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ci5QtFfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2717C2BCB0;
	Wed, 19 Nov 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763556010;
	bh=5i6z2W6q1iTm22YvLzIETMkmV4YtGu9mjO0O0P0maVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ci5QtFfPtrKrHOdXGKcUNsTjO9cHr3lNsAUrNAlN3Z1GAlKaG51bJsT60eqdMZ5cD
	 43/kIqazOsoffMtV03DC1AmwtydQ/NCc3+kLIGhftBvAR5USTyvvtnuorrC894QtJO
	 qqUZGL5bDDRlfmt5ZmvFr+kPKcl0SdWmeJCqmNaalQ2X+M+GRzGIi2awYNfohfP3Lu
	 i3xNEAS5kQ9Jh5AcGJ5zOCyYVCwBV0a5IVhj93O6wGDxi1gkIyGWfqBuob9W1ggy5x
	 T5yxwcXGSPWusWi8enUpDcxMKcf7EBBDocBdP/tc+fwZSGvvYs+3TfUTAbj9dnhrGN
	 Y5+HZWfLFdI3g==
Date: Wed, 19 Nov 2025 20:22:13 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
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
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
Message-ID: <aR22decsE0DYDUnS@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m2ecpvm20y.fsf@free.fr>

On Tue, Nov 18, 2025 at 11:03:41PM +0100, Robert Jarzmik wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> 
> > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org>
> > wrote:
> > > 
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> ...zip...
> > 
> > > -#ifdef CONFIG_PM
> > >         unsigned long   saved_gplr;
> > >         unsigned long   saved_gpdr;
> > >         unsigned long   saved_grer;
> > >         unsigned long   saved_gfer;
> > > -#endif
> 
> Actually this is not equivalent to what was there before.
> 
> With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to the
> structure. You might thing today, 16 bytes is nothing. True, but on a
> 64MB RAM devices, it's something.

hmm, each controller adds 16bytes, then even on 100 controller platforms
1600bytes. 1600 Bytes/64MB ~= 0.238%. it's trival. And is there such platform?

From another side, recently UP support is removed from the core sched,
that removing adds more .text and .data overhead, so if the users really
care about this kind of 16bytes, it means he(she) can't afford even the
16Bytes overhead, then I bet he(she) the always SMP in core sched, so
why not stick with the old kernel? What do you think?

> 
> That might not be a reason to reject the patch, but it's not only a
> "modernisation patch".
> 
> Cheers.
> 
> --
> Robert

