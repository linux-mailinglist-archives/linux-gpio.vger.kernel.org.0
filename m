Return-Path: <linux-gpio+bounces-18891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61612A8A83B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 21:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAFB18888D3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 19:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C662505A9;
	Tue, 15 Apr 2025 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwXmHwmr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ECC250BE1;
	Tue, 15 Apr 2025 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744745934; cv=none; b=MRWlCj2NgRCpij9CUuxaRQ0zOy+/cA/3uqgAT8D028qcHngTeOYksBkZZoaeCBNX+QbDApxEhLYHxG2IFdbyZKuBBrBsAJ51HZlcmCkmG9SIXy6qoqJ4jJDwk3fzgNTB0SetUnBIdsMcYkaeFjd3QqTrY5AOr+nAkzez2J5T+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744745934; c=relaxed/simple;
	bh=+X8PZp7ZJAtaPIiDYEIFalIVsT/0lgcDfgcWZzUFk0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bi/lIPaFhFHWbapyshCUhY5XUO2mxXNY9u3pc8UYHqLXJ/910xwgxbAUuPIZHJDfOnAsHepRv7kOFplJPRSw1/HGhSNfAFPNcacNtBKCnSKPNNPRAwmEtfMahoOMdlsrBNT4lhVBHDQBS8+0jlCTXsX9gDr/T8omVD8n2PN4SdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwXmHwmr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996C0C4CEF1;
	Tue, 15 Apr 2025 19:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744745933;
	bh=+X8PZp7ZJAtaPIiDYEIFalIVsT/0lgcDfgcWZzUFk0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QwXmHwmr9n+SApeHzUas+OtoRZJMrhoeh0R81kyW0D+KMv7H0dYo6A0zVAIE14s6l
	 9OioSxFrNEzCZqkR/ZPwAP8Mt7QfkHTwZXdB9+TeUcGUXgwRDHGnHg0CyH6VskKTM8
	 bCDj7haedPkBA+8xnkLnjIfr0vcYnTTdaBRXNz6RbgCJFX2bVULWtPtwJmkIVdEGxn
	 BxaHnstuq1TeVO5g3PiMSCbHCzIfMgZmxH7n4wX3SZ6F9kBOA7Kh6yk5l23wyzruAy
	 6M/5t2SIRmRgrcIU7QC0aIODXbZZEbfY75ctd2n+299mrucX5kX9JVaJdIoGd+c1be
	 wHoAGPF3Wu57g==
Date: Tue, 15 Apr 2025 14:38:51 -0500
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250415193851.GA846160-robh@kernel.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
 <20250412182737.GA1425287-robh@kernel.org>
 <20250412223431-GYA25375@gentoo>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412223431-GYA25375@gentoo>

On Sat, Apr 12, 2025 at 10:34:31PM +0000, Yixun Lan wrote:
> Hi Rob,
> 
> On 13:27 Sat 12 Apr     , Rob Herring wrote:
> > On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> > > For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> > > the driver instead of relying on bootloader or default hardware
> > > settings to enable it.
> > > 
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> > > --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> > > @@ -2,6 +2,7 @@
> > >  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
> > >  
> > >  #include <linux/bits.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/cleanup.h>
> > >  #include <linux/io.h>
> > >  #include <linux/of.h>
> > > @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > >  {
> > >  	struct device *dev = &pdev->dev;
> > >  	struct spacemit_pinctrl *pctrl;
> > > +	struct clk *func_clk, *bus_clk;
> > >  	const struct spacemit_pinctrl_data *pctrl_data;
> > >  	int ret;
> > >  
> > > @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(pctrl->regs))
> > >  		return PTR_ERR(pctrl->regs);
> > >  
> > > +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> > > +	if (IS_ERR(func_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> > > +
> > > +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> > > +	if (IS_ERR(bus_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");
> > 
> > Do you really need these to be optional? Yes, it maintains 
> >
> Yes, the motivation here to make it optional is maintaining the 
> compatibility, to not break the case of using old dtb with new kernel,
> since the serial console device (uart0) is activated now [1]
> 
> IIUC, from the DT perspective, it's mandatory to keep this compatibility?

It's up to the platform. It's only mandatory to understand you are 
breaking compatibility when you do.

> 
> In dt-binding of patch [1/2], the clocks/clock-names has been described as 
> required property, so it's sort of mandatory from DT's view.
> 
> One lesson I learned is that the pinctrl dt node shouldn't be activated
> untill all prerequisite dependencies meet.. it's ok to push the driver,
> but should postpone the DT part..
> 
> > compatibility, but if this platform isn't stable, then do you really 
> > need that?
> > 
> I don't get what's your meaning of "isn't stable" here, the fact won't
> change for K1 SoC: the pinctrl controller requires two clocks

You required 1 clock and now you require 2. That's not stable. 
Generally, early on with platforms, their DT is not complete enough to 
maintain compatibility. There's also likely not many users or h/w 
availability for compatibility to be an issue. So requiring the DT to be 
in-sync with the kernel is not a problem.

Rob

