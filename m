Return-Path: <linux-gpio+bounces-22341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D767AEB841
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 14:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3031C46A90
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E8352D8DC5;
	Fri, 27 Jun 2025 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="porQaOmn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528F12BDC37;
	Fri, 27 Jun 2025 12:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028950; cv=none; b=eBq5s9XPJFJFORKCUBKfSDGE18ZiQcGpQ1bwAzv5xhwSHXJpah+YI1YeoLfhuzrF4wb3gcJW+lJKMu1O4amzSwCHtiDwIH8DxD9NGbL413VtsniyrmsSS3LOwzDMSuVE9B6y8Yz1DSOSs2HNj6Thhiest3DoCRJeL1xR8uuvoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028950; c=relaxed/simple;
	bh=6TA737hZFuJlNzhhKE0Cq46SUWvV+VYmzq+aO5tyEv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQBA1abtqOSoKp016XGQq3SNsWUP0RCMJfZ6p/U+m190b3lCsjiBxIKBcThot4CD1DQR7a80UysSAU3rqS2eF1vqwTLjneqWa9BwcH5S6IAbHBYdPn5J0FRhFzfXue7X6sr/KIbL/I/+FN4SMl2BQ/PpK0IzlIxhiF3aTNmHob4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=porQaOmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0C0C4CEED;
	Fri, 27 Jun 2025 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751028949;
	bh=6TA737hZFuJlNzhhKE0Cq46SUWvV+VYmzq+aO5tyEv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=porQaOmnwR5TuC3LG3hKWfzV7oKCMKzcHnL8MoZHNVbVWu2fUkdSdgyxM2HjRDh24
	 k2U49xL61YlTUDRdibPSAckpdVgTe+7sR70/39YxaighdvzEH+CmUzY1CEhh0rAf2O
	 +I795pctolDcYsfGqp3woWLVg5LWHk2zAeyouLjOQuB+rPLzm40aN3Jo/ebIGQZQJA
	 if3HYpzMjoUCBEUaHh68ynX4drDcjaWb4VfieE8+3EN6etAc3AiFAa1LdbzV+TXfR7
	 EuK51yaJUnIjJfLd9ZWRSCm6kQEnpOfEKHYBuHH/JJoqEuHOITZiQnESj20jUrBi1Y
	 N1dw2HwgF3qFw==
Date: Fri, 27 Jun 2025 13:55:43 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <20250627125543.GG10134@google.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
 <20250626132257.GE10134@google.com>
 <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>

On Thu, 26 Jun 2025, Bartosz Golaszewski wrote:

> On Thu, Jun 26, 2025 at 3:23 PM Lee Jones <lee@kernel.org> wrote:
> >
> > On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Replace struct bgpio_pdata - that we plan to remove - with software
> > > nodes containing properties encoding the same values thatr can now be
> >
> > Spelling.
> >
> > > parsed by gpio-mmio.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
> > >  1 file changed, 28 insertions(+), 18 deletions(-)
> >
> > Can this go in on its own, or does it have depend{encies,ants}?
> 
> It will break the MFD GPIO sub-driver without patch 1/6 from this
> series. It would be best if you could Ack it and I can set up an
> immutable branch for v6.17 if you need it.

Yes please.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

