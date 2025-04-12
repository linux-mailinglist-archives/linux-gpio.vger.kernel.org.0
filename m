Return-Path: <linux-gpio+bounces-18750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B2AA87000
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Apr 2025 00:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60E017ABC6F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 22:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AE91F03FE;
	Sat, 12 Apr 2025 22:34:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F02317C21C;
	Sat, 12 Apr 2025 22:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744497284; cv=none; b=QAlmY3SxZl8cq0k1XWw2xAmfUzNGlcBi/Ne1CjDDytEXwkrA0+3sAV926Ou9xSxIsHinvvjvfsooi1Msav89zl3i5VyEfvpESZ62jWMO7nTDaeY9lJyUKdUDT0uGlYgPmxGZdsG4orGMiApyLr/YK/XFP94H+A3SzWtx4UX4Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744497284; c=relaxed/simple;
	bh=+vTIpcux5xo6tvbpM4VgRTZ9LEot9EsuWfaDrUeI7EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO5+nRAh114OqxhsMtmMOxJ93ybTcnUYxF1puua8ynb9AVoiFmx5CQFn9qrqUr83VQkWjTqarabKcvKJWQFNleLTJD860lTEN4swEQd7BZayfJ9g46CPeIoitnYctERJRYWAzNppQu5zWm9Y3kvAx8S5CHGpshtMNRIq6+cn8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 44B4A343096;
	Sat, 12 Apr 2025 22:34:41 +0000 (UTC)
Date: Sat, 12 Apr 2025 22:34:31 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250412223431-GYA25375@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412182737.GA1425287-robh@kernel.org>

Hi Rob,

On 13:27 Sat 12 Apr     , Rob Herring wrote:
> On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > the driver instead of relying on bootloader or default hardware
> > settings to enable it.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > @@ -2,6 +2,7 @@
> >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> >  
> >  #include <linux/bits.h>
> > +#include <linux/clk.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct spacemit_pinctrl *pctrl;
> > +	struct clk *func_clk, *bus_clk;
> >  	const struct spacemit_pinctrl_data *pctrl_data;
> >  	int ret;
> >  
> > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> >  	if (IS_ERR(pctrl->regs))
> >  		return PTR_ERR(pctrl->regs);
> >  
> > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > +	if (IS_ERR(func_clk))
> > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > +
> > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > +	if (IS_ERR(bus_clk))
> > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> 
> Do you really need these to be optional? Yes, it maintains 
>
Yes, the motivation here to make it optional is maintaining the 
compatibility, to not break the case of using old dtb with new kernel,
since the serial console device (uart0) is activated now [1]

IIUC, from the DT perspective, it's mandatory to keep this compatibility?

In dt-binding of patch [1/2], the clocks/clock-names has been described as 
required property, so it's sort of mandatory from DT's view.

One lesson I learned is that the pinctrl dt node shouldn't be activated
untill all prerequisite dependencies meet.. it's ok to push the driver,
but should postpone the DT part..

> compatibility, but if this platform isn't stable, then do you really 
> need that?
> 
I don't get what's your meaning of "isn't stable" here, the fact won't
change for K1 SoC: the pinctrl controller requires two clocks

[1] https://github.com/torvalds/linux/blob/master/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts#L22

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

