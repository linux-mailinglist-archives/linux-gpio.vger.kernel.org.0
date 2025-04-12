Return-Path: <linux-gpio+bounces-18748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2E5A86EBE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 20:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A877F7B16FA
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 18:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE0C21B1B9;
	Sat, 12 Apr 2025 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaDTUKSR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753641C3C08;
	Sat, 12 Apr 2025 18:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744482459; cv=none; b=fNEX2h49bjSSceONFmlViFb0iX+wmPFBhdoEKheENgQ2mWt08NP6ualc0hE/W3OiykEOWbEQ3bZ0XkSRSjjfrKZfF+da34RvTYTA7MFe2urVmLnrnEr5yvRrpStdihtHDDXdYEZIvVzD1gK2kynEtLDqAg4F68fTldFQDSMBu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744482459; c=relaxed/simple;
	bh=5jrniUTmToNcT6JYZS1XF5QtKtluIwGUs3hnv44XPvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y7yxJOpyV5wMdeguWjDHEvl7mupT/iGEhvtz3PfLSInD763IvC3uVXoJzjsuXijrfULTPgBHorZ5HfI5bAjdm4lGtqYyNOR8KYLjt/Wt0bjUG/mtoXN3mMaZkzFDHYCoH02BS/rubX6BW58l02l1Wog7Xf1+RNkKM1szKH6Ae3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaDTUKSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD05C4CEE3;
	Sat, 12 Apr 2025 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744482458;
	bh=5jrniUTmToNcT6JYZS1XF5QtKtluIwGUs3hnv44XPvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaDTUKSRACe488kdE+7xZwixRfG6BNyTWwTGWMOcvOHy/C/21FsAKHRHY0mL8rnAc
	 DjkTG+MgoTRtGul7YElGwKc2Mrd4pkxv0Ecgsgc4x+OOo27Qj5W5yQd7wspvUzGUI3
	 sk//jx1faHzWqhn+ONT8inmPPMXvPIrLBzFvjAlX1Y1UXWUnULQ3BiBQ3BP+xO3Br5
	 79WW4A5hivdxH+WNW+OxhFiDPn8OuKNOHypUgQarvvtvdZNkAB/xialBmbf1lceRwt
	 7Dkm/SP+/8zRf9QYgx+GztyVVMNzBPpx/148Xz+yru7AVL2iqyDWJgjAtkVEfYSrYh
	 6B6EWuQ6IQ0+g==
Date: Sat, 12 Apr 2025 13:27:37 -0500
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: add clock support for K1 SoC
Message-ID: <20250412182737.GA1425287-robh@kernel.org>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412-02-k1-pinctrl-clk-v1-2-e39734419a2d@gentoo.org>

On Sat, Apr 12, 2025 at 02:58:11PM +0800, Yixun Lan wrote:
> For SpacemiT K1 SoC's pinctrl, explicitly acquiring clocks in
> the driver instead of relying on bootloader or default hardware
> settings to enable it.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index 67e867b04a02ea1887d93aedfdea5bda037f88b1..3805fb09c1bc3b8cf2ccfc22dd25367292b397b9 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2024 Yixun Lan <dlan@gentoo.org> */
>  
>  #include <linux/bits.h>
> +#include <linux/clk.h>
>  #include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> @@ -721,6 +722,7 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct spacemit_pinctrl *pctrl;
> +	struct clk *func_clk, *bus_clk;
>  	const struct spacemit_pinctrl_data *pctrl_data;
>  	int ret;
>  
> @@ -739,6 +741,14 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(pctrl->regs))
>  		return PTR_ERR(pctrl->regs);
>  
> +	func_clk = devm_clk_get_optional_enabled(dev, "func");
> +	if (IS_ERR(func_clk))
> +		return dev_err_probe(dev, PTR_ERR(func_clk), "failed to get func clock\n");
> +
> +	bus_clk = devm_clk_get_optional_enabled(dev, "bus");
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk), "failed to get bus clock\n");

Do you really need these to be optional? Yes, it maintains 
compatibility, but if this platform isn't stable, then do you really 
need that?

Rob

