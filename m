Return-Path: <linux-gpio+bounces-28752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BFC6EACD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 432002DF3E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A614352FB1;
	Wed, 19 Nov 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBISDiEa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C142E3AEA;
	Wed, 19 Nov 2025 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557535; cv=none; b=Qv2qk/6ialp/YhXxjLx54N/DwbkDOBH7+7IMdoitFD15poUujaveiGXC2LJuRhfJvFJ5U6WFhumZw+st6OslCAIH/lo3MTD1dYTbtCeNWICIjqqzwnVyFXOfCS6lUmBcHIHZ4hcEkbr/zK1rnkfkVHHkde0g1b6ghix1HfSoGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557535; c=relaxed/simple;
	bh=bOxV0akRmRQphkd8T9wn2CINlAiaytOn/UCtqXjyjjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guAmzIT6xPNSey7HhyiRNMhxuMztHKuTPj9HHKEgcBSEorI1p2xiHce6LY3ztfKpFg6kPLc1gUEyUtRJCLvLxXzDZqHoc7sNTbSMVRjWaQ5g0NpMmpIqOroT4xtWS9aqbmFhh+ndFE1fohAXUfcXgXH1HcKeAgcfpRXmhK/r+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBISDiEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7481BC116B1;
	Wed, 19 Nov 2025 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557534;
	bh=bOxV0akRmRQphkd8T9wn2CINlAiaytOn/UCtqXjyjjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uBISDiEaSrr5rLUSgmDBtymBsazyAm2s34IBEQ45cPMpZyTiLWiUmqS7bprWzoifX
	 KvJYXxk5aU+3aNgEJr+ZWwIEB+zidOLsZBCEhM0CDlFBfO29CA5otJVNYfGXI78LoC
	 GnFNCuGuFvbuz+22lCpk4Df74S/T0SLwOHnqrdrwrCuXdCBgGCbMQwxRSe02WKBVea
	 1+Iz8LITHTVZpKx3EWnWfwYIjcca0mkfQ+f76myXNO8iRGtTmC1msF8iJE6gp9I9kx
	 dv6NGhIdImfj13lNt41gsr86BXS2xKYB+PP8PlwmcGY9pTq4mxVWyRPGgkVeqt5uFI
	 8bq/sGnMKTdCQ==
Date: Wed, 19 Nov 2025 20:47:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
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
Message-ID: <aR28aq0xHQOOISYq@xhacker>
References: <20251118003229.26636-1-jszhang@kernel.org>
 <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
 <m2ecpvm20y.fsf@free.fr>
 <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>

On Wed, Nov 19, 2025 at 09:56:12AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 19, 2025 at 12:04 AM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > > On Tue, Nov 18, 2025 at 2:50 AM Jisheng Zhang
> > > <jszhang@kernel.org> wrote:
> 
> ...
> 
> > >> -#ifdef CONFIG_PM
> > >>         unsigned long   saved_gplr;
> > >>         unsigned long   saved_gpdr;
> > >>         unsigned long   saved_grer;
> > >>         unsigned long   saved_gfer;
> > >> -#endif
> >
> > Actually this is not equivalent to what was there before.
> >
> > With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to
> > the
> > structure. You might thing today, 16 bytes is nothing. True, but
> > on a
> > 64MB RAM devices, it's something.
> >
> > That might not be a reason to reject the patch, but it's not only
> > a
> > "modernisation patch".
> 
> Actually a good point! On the same grounds I semi-nacked the gpio-dwapb change.

Hi Andy and Robert,

I have explained the reason of embedding within the cleanup/modernize
patch. Could you plz check?

Thanks

