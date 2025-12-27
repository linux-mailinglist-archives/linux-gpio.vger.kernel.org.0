Return-Path: <linux-gpio+bounces-29947-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A2CDFC8E
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 14:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08B7430010F3
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4FC31BC80;
	Sat, 27 Dec 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRgVXU5Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3617B506;
	Sat, 27 Dec 2025 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840424; cv=none; b=Wl2Q4HmHop8mVG5Qs2Rd5YNem20cxjPgHuksnu0zMx30/EYG04RLmgPLUkXi021/i088cbHFsrlzP/VXkVRsMLFIRyESFrORNa3DijFzE3lrGPiHv9/oLqqjLFHXx9RZUu9BgqUYN7Wrp7CEf/wQM2Fd86eX+PxvmRFfY6qhHo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840424; c=relaxed/simple;
	bh=Gh6gqoS5hMGDmiIF264QlqRD2aJHzbjUVlGUqxG43cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxAW1oMCcjHNgYvnn4NwX0j+JpMLjbwlGZo9JUYat1BnQ12Ulfrcm7hhDYBoQ9fvN0PlmVk6KQoM8epvMjxdLKacxkOLYZat0LJRaqrRgTt7JkZvlOtcpJS9LELadHNQvZ5AFaSzeEzIi1ZLwm7cWAeRsJ6Z0tR8sLqsFv3j4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRgVXU5Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFFEC4CEF1;
	Sat, 27 Dec 2025 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840424;
	bh=Gh6gqoS5hMGDmiIF264QlqRD2aJHzbjUVlGUqxG43cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRgVXU5YOBBADhBt7fo0NPjp5x67v/ZS3Kkc5iQtFeEVf9ojbZuhzwTJ5EX9g7Ad4
	 Lk0DgezSXYiM6gm73K6CvbfUzrNTQyGM9xqP5VsiST3jUsq6RurBWB7vSkD9AZUi5y
	 dnZwfCO+feez9AMKLXMr0Pp+CMNDtjEsrtPFASUClKbh3y45B7xosdX5beSLGhomyB
	 OXYrD+9RkAllOvCBSE68bylE4SRO3Mir03EEsrFlreW54K3SrPGWHBy4dEvOYmtT8M
	 jBMDuj7Yco6Se8vEQL3Mxq4O4CNs9/D1bdra63n3jLNC4qNqRq0CoUhtiybmOfIZAJ
	 uyeqLV/Z6rbqQ==
Date: Sat, 27 Dec 2025 14:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20251227-pastel-certain-orca-4b53cf@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>

On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> IO domain power control registers are used to configure the operating
> voltage of dual-voltage GPIO banks. By default, these registers are
> configured for 3.3V operation. As a result, even when a GPIO bank is
> externally supplied with 1.8V, the internal logic continues to
> operate in the 3.3V domain, which may lead to functional failures.
> 
> This patch adds support for programming the IO domain power control

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> registers, allowing dual-voltage GPIO banks to be explicitly configured
> for 1.8V operation when required.
> 
> Care must be taken when configuring these registers. If a GPIO bank is
> externally supplied with 3.3V while the corresponding IO power domain
> is configured for 1.8V, external current injection (back-powering)
> may occur, potentially causing damage to the GPIO pin.
> 
> Due to these hardware constraints and safety considerations, the IO
> domain power control registers are implemented as secure registers.
> Access to these registers requires unlocking via the AIB Secure Access
> Register (ASAR) in the APBC block before a single read or write
> operation can be performed.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi  |   4 +-

No, this never, never comes together with driver code. You cannot fix
non-bisectability and ABI break that way.

Read carefully maintainers soc profile and submitting patches in DT dir.

...


>  static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct device *dev = &pdev->dev;
>  	struct spacemit_pinctrl *pctrl;
>  	struct clk *func_clk, *bus_clk;
> @@ -816,6 +927,18 @@ static int spacemit_pinctrl_probe(struct platform_device *pdev)
>  	if (IS_ERR(pctrl->regs))
>  		return PTR_ERR(pctrl->regs);
>  
> +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pctrl->io_pd_reg))
> +		return PTR_ERR(pctrl->io_pd_reg);
> +
> +	pctrl->regmap_apbc =
> +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> +						     &pctrl->regmap_apbc_offset);
> +
> +	if (IS_ERR(pctrl->regmap_apbc))
> +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> +				     "failed to get syscon\n");

Actual ABI break.

Best regards,
Krzysztof


