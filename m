Return-Path: <linux-gpio+bounces-14373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98A9FEDFE
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 09:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C92BD3A2A29
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 08:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2781318C03A;
	Tue, 31 Dec 2024 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyTiQdVc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727B2D7BF;
	Tue, 31 Dec 2024 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735634336; cv=none; b=NexiLjRXlVGFLZd+L3yRwTxeG22l0xyzusFKCWMU6O7q1HXLCeCW7IpZMh5F7U5xTGVCLREaXcPOvkGqf0fylv1CUFzXhpKbFJfF3g3DFQ2lQDv56QRxXTsxAlOo2wfCBMpkRkCuKJFqOS4l11klb1/nnAvaHTD5mU0wERfAfK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735634336; c=relaxed/simple;
	bh=aqW05DBS8WrJdANtSfJJQFskLdzShDN4M4ITycwgAZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECoovanT8cN1v+65pPQmHTvY0Dzrem0TapTVKLIE6S6wyu7cO4JMbyzurBkValHHFtPgJXqtV7RJGmghBvJrquhVYmPjk8M3vQzs9R1ukl7nL5LsdvZxp3HUVmmkxHOYnFvlAQ2ZwN8A63Y2onsAsa4GUFywurg8yzK+yEokpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyTiQdVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D627C4CED6;
	Tue, 31 Dec 2024 08:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735634336;
	bh=aqW05DBS8WrJdANtSfJJQFskLdzShDN4M4ITycwgAZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyTiQdVc6Z4fBPUrJga7D0xt3/TAYt1UCc0pwFduSpuC00Zxh+8zuQ+v1xlvQVkkR
	 ChcPZb2Xeo742HaPFki8wHXOr+FSJlSPNwd/myGsVxA/lRdWYO2sAIhmceHj0zvSSd
	 2xpNXASgF2B8dPh0xVgt5kNncg/QIWWdTERBVglp9VfVefWRmVYuta65dm1gu6EGBx
	 OSG4SMPHIO0i/+Zb3s2ofiPGJvUmD+JyER4E8heCr3xjou/+O9zcNzf4y4TLl5jjFC
	 ANcwB37erFfXrhMUXp/e4Jkv5K/VuvdiusKm2xbQwDWykFcGSCJV527XFeYCZC3tLU
	 3begL/CFYbDRw==
Date: Tue, 31 Dec 2024 09:38:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [PATCH 2/2] gpio: add support for GPIO controller on Siflower
 SoCs
Message-ID: <csu3mg7nurpwxkr6drpz6xsw3dqn5ttdotvmfkfvrwpo3geedf@jos6rqxovqr2>
References: <20241225035851.420952-1-gch981213@gmail.com>
 <20241225035851.420952-3-gch981213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225035851.420952-3-gch981213@gmail.com>

On Wed, Dec 25, 2024 at 11:58:51AM +0800, Chuanhong Guo wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
> 
> Add a driver for the GPIO controller on Siflower SoCs.
> This controller is found on all current Siflower MIPS and RISC-V
> chips including SF19A2890, SF21A6826 and SF21H8898.
> 
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/gpio/Kconfig         |   9 +
>  drivers/gpio/Makefile        |   1 +
>  drivers/gpio/gpio-siflower.c | 353 +++++++++++++++++++++++++++++++++++
>  3 files changed, 363 insertions(+)
>  create mode 100644 drivers/gpio/gpio-siflower.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673..fdc9a89ffbf3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -637,6 +637,15 @@ config GPIO_SIFIVE
>  	help
>  	  Say yes here to support the GPIO device on SiFive SoCs.
>  
> +config GPIO_SIFLOWER
> +	tristate "SiFlower GPIO support"
> +	depends on OF_GPIO
> +	depends on MIPS || RISCV || COMPILE_TEST

This is supposed to be dependency on ARCH, not instruction set. I don't
se anything MIPS or RISCV here.

> +	select GPIOLIB_IRQCHIP
> +	help
> +	  GPIO controller driver for SiFlower MIPS and RISC-V SoCs
> +	  including SF19A2890, SF21A6826 and SF21H8898.

...

> +static void sf_gpio_remove(struct platform_device *pdev)
> +{
> +	struct sf_gpio_priv *priv = platform_get_drvdata(pdev);
> +
> +	reset_control_assert(priv->rstc);
> +}
> +
> +static const struct of_device_id sf_gpio_ids[] = {
> +	{ .compatible = "siflower,sf19a2890-gpio" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sf_gpio_ids);
> +
> +static struct platform_driver sf_gpio_driver = {
> +	.probe		= sf_gpio_probe,
> +	.remove		= sf_gpio_remove,
> +	.driver = {
> +		.name		= "siflower_gpio",
> +		.owner		= THIS_MODULE,

You sent us some old code with old code style, so probably you sent us
donwstream poor driver. Please clean it up before posting.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1. Most of these commands (checks or W=1
build) can build specific targets, like some directory, to narrow the
scope to only your code. The code here looks like it needs a fix. Feel
free to get in touch if the warning is not clear.

Best regards,
Krzysztof


