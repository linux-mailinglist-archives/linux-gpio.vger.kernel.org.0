Return-Path: <linux-gpio+bounces-28754-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F5AC6EE21
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9F9B93A532A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1C5366DAA;
	Wed, 19 Nov 2025 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0QAw68F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F7436654C;
	Wed, 19 Nov 2025 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763558225; cv=none; b=LKS8hiU9vQGr/wVXJeoICcM4sQZJIHbpKZbPcQOEPU2PMB6tb0j0+jisnWj5yPAE8MLUd+lxj+P56m40ehQws2kN/TRp+Ly4Jv38EH/SaAIuxQt40olF7sMmJwLIcrCb1kMsF681iTT6QJ9sFy5uE68GtJPNm2G4qLNsspDm7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763558225; c=relaxed/simple;
	bh=JXSrd7AS3plurZH18pOineLNFbtf/RNitoM8R5NVDc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqU5plD+wpGhyWHgs3saPraiMruxYWmL43qJnpeZfC4RDxz85MfhRJhYOHL1hEGRxzVLI6VzvvvNZcJxPLgovNzFLsXS5dBpJw2TtxQgkLp/vTRGXJE+4Nrf+470ZlNRWKkZtuRcZ2wIsReKpNgOrjihzMKVrrZPS2LdTF5Khjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0QAw68F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893AEC2BC9E;
	Wed, 19 Nov 2025 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763558225;
	bh=JXSrd7AS3plurZH18pOineLNFbtf/RNitoM8R5NVDc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0QAw68F5WILJt/cARL3GavnTHZwI0glHVNZ7rp0OlqIxcPmZzqszBZsgX4VaPALE
	 v4N5gp5eAhQNn4JvdnhJX6YTYz6aEb1GUfwPQXkuMxQhM8knmcVb+EsRb3acoqD9F/
	 uhhjdBnplRB3p1X2hGZu3flHmX6vsMFIE6DH8s8zOvKuzQW7iqMHNlBwzt7K0VAodF
	 TXlvwSU9j9FT8IIqXPsC9Jg7qutVU+b5HWLrQ42GiPOFmmb7wKgepv56Z3i95+Qf3q
	 HDamHxsUjCNJTakvfTJYRsnD0mCPVKi70bFRN9DZVIJQ9y1CxjGGXPID8nouNub5oC
	 MhHRkJLARfIUQ==
Date: Wed, 19 Nov 2025 20:59:05 +0800
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
Message-ID: <aR2_GVi6E5gLeS47@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-2-jszhang@kernel.org>
 <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
 <aR27HcbvUgvCEK2Z@xhacker>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aR27HcbvUgvCEK2Z@xhacker>

On Wed, Nov 19, 2025 at 08:42:05PM +0800, Jisheng Zhang wrote:
> On Tue, Nov 18, 2025 at 12:15:35PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang <jszhang@kernel.org> wrote:
> > >
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > >
> > > This has the advantage of always compiling these functions in,
> > > independently of any Kconfig option. Thanks to that, bugs and other
> > > regressions are subsequently easier to catch.
> > >
> > > The dwapb_context structure is always embedded into struct
> > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv
> > 
> > SLEEP
> > grepping
> > 
> > > dts dir, the max port number is 6, the berlin2q soc families, so this
> > > means current we have wasted 216 bytes memory which is trivial
> > 
> > currently
> > 
> > > compared to the system memory.
> > 
> > I still think the embedding is not related to this change and should
> > be justified in a separate patch. W/o that part the rest looks fine.
> 
> I got your mind now: it looks like you prefer a seperate patch for the
> embedding. Let me explain why I have the embedding within this patch:
> the pm_ptr() or pm_sleep_ptr() just optimizes out the PM functions, but the
> PM funtions are still compiled, so w/o the embedding, it's impossible
> to clean up the code with the modern PM macros.

For dwapb, I can still acchieve the clean up w/ only embedding the
pointer. But I'm not sure whether embedding the struture deserve a seperate
patch.

BTW: as Michael mentioned during v1 review, the driver allocates the
struct with kzalloc and stores a pointer to it, so considering the
pointer itself and the kmalloc overhead/alignment etc, current gpio-dwapb
have an overhead in the same order of magnitude when PM=y

