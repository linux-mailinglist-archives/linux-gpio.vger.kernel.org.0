Return-Path: <linux-gpio+bounces-23021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC64AFED98
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 17:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBBE5C3E4A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 15:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0E62E7BB7;
	Wed,  9 Jul 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="y8wzZTnp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7037535958;
	Wed,  9 Jul 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074241; cv=none; b=SSBjq4K2pxyybWNZRXXpSYMnFFMlovD9eZ0HpsoABzX9WkhggrGwO+E0uNjBsV04tEj/72+Kju8M9io6x0zU7+EAKUTFTeiAFwRjoeJ2115v0KpnOXYH3fWe4TJcbtAMTzrqVfDWTRy0InLVJu8l4SEIDMCbDJ8d8cRO3Suwb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074241; c=relaxed/simple;
	bh=fW+9x2s6lvNsCTljHhcU4z5uUSJOFa9JnhC+Ifk1fVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4I6Q45NVNuQwL1Eu+RVVCqTv0NKDoFam30i19amkVSOrPrdytOvZxJcmfEqEforFXVSksTNm8NU9of/JAIR1Q++nWiy3GeHWlKynktVyKopuBtOhn0AbxBxrPhJM3LYX/BN2qp1LPT7SmM0Fgc9kAo15Hzl0sn2+w63mPw+JgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=y8wzZTnp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xOjCg4XbxOkhT8S8sZPEP73rpNtOVJZ5nJWx075Q+eE=; b=y8wzZTnpsTg0FnFL3ruJPMnfCs
	4SAUf9W1zsjwJ9bwsBAqpEkCDCK441+3WUMr+3M5HjRS4r68s07b7M1DCm5fZoyBxTp4uZ+ORdJlx
	IrKAcri0wEJcSe6UuHU3ZWu9cftE4qz4TnB/+agXCAzn35OfwCx3AL9UFzvN2o1BmIBQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZWXu-000xJZ-3C; Wed, 09 Jul 2025 17:17:18 +0200
Date: Wed, 9 Jul 2025 17:17:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Message-ID: <898af9ea-9b90-4d1f-8e0d-a8e0686d72a7@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-6-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-6-ioana.ciornei@nxp.com>

> A GPIO controller has a maximum of 8 lines (all found in the same
> register). Even within the same controller, the GPIO lines' direction is
> fixed, either output or input, without the possibility to change it.

Since this is an FPGA, not silicon, is the selection of output or
input a syntheses option?

> +static const struct of_device_id qixis_cpld_gpio_of_match[] = {
> +	{
> +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp2",
> +		.data = &lx2160ardb_sfp2_cfg,
> +	},
> +	{
> +		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp3",
> +		.data = &lx2160ardb_sfp3_cfg,
> +	},
> +	{
> +		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
> +		.data = &ls1046aqds_stat_pres2_cfg,
> +	},

Does the FPGA have an ID register you can read to confirm it is what
you think it is?

Or is the bitstream downloaded at boot by another driver? Can you ask
that driver what bitstream it downloaded?

Given how similar these devices are, it seems like a typ0 could give a
mostly working device which passes testing, so doing some validation
of the compatible against the actual FPGA would be nice.

	Andrew

