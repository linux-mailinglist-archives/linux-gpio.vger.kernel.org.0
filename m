Return-Path: <linux-gpio+bounces-18901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1CA8ABD1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 01:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497CE179668
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 23:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD22D86AF;
	Tue, 15 Apr 2025 23:06:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83EA2528E1;
	Tue, 15 Apr 2025 23:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744758416; cv=none; b=gtq2Eov1Ca96OvX4OTJBz5GPB555NVT7zGTTrkBD7N+ytJTAH0AmWNhRcbFRPplJmvad2nZOfKdjCrV5pk7+SrR0dHjYzl9cjuMIQXcYqDqvZ6GQ48stv62gsD/Vrp3XwkKZPH8pxgI5RRhkyxVByLJsYDAJGu22AolemEWLS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744758416; c=relaxed/simple;
	bh=Q3Ya5E9jgZNJaOvVG2ieIXqSWyLeJz1NnSZgYxNKszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki2QQTGOtcDDhRJB1hfU2Vaq9BoqHDMgYBNdYIjXmUw4E3EOa0cJ0mDpjuejMFr+0d3KZ4ThlanBTGVOjpQvCeIQcW/7wHJdYlDKPxfKd0C2eMS9VNQXhnoEAYc3HIBM0WzHUNCN6kdj0TrF5tL1al22vCyIpy/YPMfoZTYTlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B2696343026;
	Tue, 15 Apr 2025 23:06:53 +0000 (UTC)
Date: Tue, 15 Apr 2025 23:06:49 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250415230649-GYB30943@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
 <20250412223431-GYA25375@gentoo>
 <20250415193851.GA846160-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415193851.GA846160-robh@kernel.org>

Hi Rob,

On 14:38 Tue 15 Apr     , Rob Herring wrote:
> On Sat, Apr 12, 2025 at 10:34:31PM +0000, Yixun Lan wrote:
> > Hi Rob,
> > 
> > On 13:27 Sat 12 Apr     , Rob Herring wrote:
> > > On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > > > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > > > the driver instead of relying on bootloader or default hardware
> > > > settings to enable it.
> > > > 
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > > ---
> > > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > > > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > > @@ -2,6 +2,7 @@
> > > >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > > >  
> > > >  #include <linux/bits.h>
> > > > +#include <linux/clk.h>
> > > >  #include <linux/cleanup.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/of.h>
> > > > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > > >  {
> > > >  	struct device *dev = &pdev->dev;
> > > >  	struct spacemit_pinctrl *pctrl;
> > > > +	struct clk *func_clk, *bus_clk;
> > > >  	const struct spacemit_pinctrl_data *pctrl_data;
> > > >  	int ret;
> > > >  
> > > > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > > >  	if (IS_ERR(pctrl->regs))
> > > >  		return PTR_ERR(pctrl->regs);
> > > >  
> > > > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > > > +	if (IS_ERR(func_clk))
> > > > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > > > +
> > > > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > > > +	if (IS_ERR(bus_clk))
> > > > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> > > 
> > > Do you really need these to be optional? Yes, it maintains 
> > >
> > Yes, the motivation here to make it optional is maintaining the 
> > compatibility, to not break the case of using old dtb with new kernel,
> > since the serial console device (uart0) is activated now [1]
> > 
> > IIUC, from the DT perspective, it's mandatory to keep this compatibility?
> 
> It's up to the platform. It's only mandatory to understand you are 
> breaking compatibility when you do.
> 
> > 
> > In dt-binding of patch [1/2], the clocks/clock-names has been described as 
> > required property, so it's sort of mandatory from DT's view.
> > 
> > One lesson I learned is that the pinctrl dt node shouldn't be activated
> > untill all prerequisite dependencies meet.. it's ok to push the driver,
> > but should postpone the DT part..
> > 
> > > compatibility, but if this platform isn't stable, then do you really 
> > > need that?
> > > 
> > I don't get what's your meaning of "isn't stable" here, the fact won't
> > change for K1 SoC: the pinctrl controller requires two clocks
> 
> You required 1 clock and now you require 2. That's not stable. 
previously pinctrl requires no clock (no clock property populated)

> Generally, early on with platforms, their DT is not complete enough to 
> maintain compatibility. There's also likely not many users or h/w 
> availability for compatibility to be an issue. So requiring the DT to be 
> in-sync with the kernel is not a problem.
> 
Ok, then in this case, I will simply drop this _optional_ API

thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

