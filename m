Return-Path: <linux-gpio+bounces-24766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B71B300AF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 19:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24C7E3B3698
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 17:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707312FB600;
	Thu, 21 Aug 2025 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OL94fan1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AE1E8333;
	Thu, 21 Aug 2025 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755795733; cv=none; b=MbeFUDXWRrgBoLmPHHU162CWKcLk7qs9yWWMGQ9Nx89pRF5XnH69Eodqxg6IUI4rcW18iffJNiAiPP+WVsH+vD8Dw4nAwo+M0Klar1Gmhparpw1w0rvga9vm8DlaUvIBOm5hYktcoqA9+n7KRcGZqUbfGcavQ+d1hbT4X5VBctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755795733; c=relaxed/simple;
	bh=QlyP+EybHdG/BjvDs4e1GOTfEiPxKwv1SmW3xs+WcNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PMNqmwDKNSiMv1wsR6lcHVsV1XMQfG9w2zwmX/hl833HI8oChYm7Pk5CNy/+pYeS8Czb1Cd1jmdXfWC3bpSSeJAyqDcky2CU2mzpYSalmezhwrIGFrhOyBi4R/4i/3k/DJHvnon1nOyAcwTVhs5/XAMGrwKNE9zmJHAO6hJ2U9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OL94fan1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F21C4CEEB;
	Thu, 21 Aug 2025 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755795732;
	bh=QlyP+EybHdG/BjvDs4e1GOTfEiPxKwv1SmW3xs+WcNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OL94fan15xuckPr35axKla7h8MZtGA8yIcVd+buWXzAQSG05oIGUBiqEBb53XRhle
	 JmeFYsuGXJGOunPKsS1Lbfbr70a40ig3+CNUml+LCM4CLjRStOkv9+PzortwXBztYv
	 RkypUQ7qLmOuK0P5rdvLNOi1hBU/5yZ+GdWob8NfDtHKYfXYdCVz9UH0/XTolmBFCh
	 kZoIzbEGtG9kun8xTlL20/iCNyBFn13AtJsXb/uF+eLHMoMU+MHvFu8nOb9qMCU/zR
	 RqEipU7pPALnBOKvCOhPuQVSUaCq7k2Miy1P5EUFNH+taITrJVdEsun71ru50sR1kH
	 9W8Udw2mBmj2A==
Date: Fri, 22 Aug 2025 00:44:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>,
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
	Michal Simek <michal.simek@amd.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
Message-ID: <aKdNBhpNofchexgb@xhacker>
References: <20250820154037.22228-1-jszhang@kernel.org>
 <20250820154037.22228-2-jszhang@kernel.org>
 <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
 <20250820191039.4f8af41e@barney>
 <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vdpgf3DUMQw0mYqhG=9UrYG8KWrobbd387QZapBor_LHg@mail.gmail.com>

On Wed, Aug 20, 2025 at 10:04:39PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 20, 2025 at 8:11 PM Michael Büsch <mb@bues.ch> wrote:
> >
> > On Wed, 20 Aug 2025 19:54:44 +0300
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >
> > > > The dwapb_context structure is always embedded into struct
> > > > dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> > > > data overhead for !CONFIG_PM_SLEP.
> > >
> > > I don't think it's a good approach to add a lot of data for peanuts in
> > > case of PM_SLEEP=n.
> >
> > It wastes 36 bytes in case of PM=n.
> 
> ...per port.
> 
> > The driver currently allocates the struct with kzalloc and stores a pointer to it
> > in case of PM=y.
> > So this probably has an overhead in the same order of magnitude (pointer +
> > malloc overhead/alignment/fragmentation) in case of PM=y now.
> 
> ...per driver.

Before the patch, struct dwapb_context *ctx is also per port.

> 
> So, I can't say it's equal, but I leave this to maintainers to decide,

What in my mind now: this is linux rather than RTOS. After greping the
the arm/arm64/riscv dts dir, the max port number is 6, the berlin2q
soc families, so this means current we have wasted 216 bytes memory which
is trivial compared to the system memory.

