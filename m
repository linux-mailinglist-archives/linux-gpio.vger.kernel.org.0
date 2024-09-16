Return-Path: <linux-gpio+bounces-10161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D9979A01
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 05:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2827B228E9
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 03:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4400E1757D;
	Mon, 16 Sep 2024 03:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Mhr8UTK3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB11B7E9;
	Mon, 16 Sep 2024 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726455615; cv=none; b=IM6LnjcX88x4+LUBO7/77MJMVIywjHyc/bOfyVpX6AzhABlSi6m55bZovPHSK1CQz+cPO8Wz5tYZaM5rcav3YXOkfcLJQVY7XpuUkJuD6CuLpg3OcEEi1Blhrq4Zvp7gglDHZ8CE5tAwEFKSsh+UAEyWTfVeiz8yfH6/e/qBH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726455615; c=relaxed/simple;
	bh=DMK5ywKhw9wFiKg/q+L5T1pTj05x8AwqbAD4TIbk4xs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fWQGXjsyNElkvXXrnZKzDdjgrAJsqeiBs3Az3SS/7M3IlLihbIMoFgnqQodBp3LMYAxUWdbt3Ue5MgnVmwj5LIjXq1ldcl9l4rY9BA4mIAMOvyXBF5mWa8ByydbwBcQrGSiqGSr9j0xraWyAJA47+plyLkWcvmjypHMYCYh7gs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Mhr8UTK3; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726455610;
	bh=BNTYdhTtlJ9cule6aTxZ738rFQbVSxMHKJYJZH3DTPU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Mhr8UTK3DhV+M+ttTIozKd8WNeHSt/s6X5IzPdcy2MaR1x5FqKEyOeP+iuC1Ciaza
	 rDcWjg042hGNdlJBb7hGK79rkn0ixSq+qSr9cn4A0imn3Yon9EnOnTrAweYx71B2ym
	 vp4Z75SsH4P43JjrhHppJDKky8fu7nBr5pzAcYH3x/6FTCvnR9Uk67qszL/LjrCE8B
	 9FuAiqDt0i9KrkdIp5SzduEd/S+dhatM2hAS0Ub1RRRgXM3CgrJrLRKrpo5T0dtsx1
	 J5Dua/g61daFRxIkHNbbig7NQyDotjYl7lSfN2VU4PqckJkVC28MfZzLnUe74v8yTv
	 NxHyHXmKC8/ew==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A900E65027;
	Mon, 16 Sep 2024 11:00:08 +0800 (AWST)
Message-ID: <2be44ea18d15f1ecda22d867396671802be14ebf.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 12:30:07 +0930
In-Reply-To: <20240913074325.239390-4-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-13 at 15:43 +0800, Billy Tsai wrote:
>=20
> @@ -1218,15 +1206,17 @@ static int __init aspeed_gpio_probe(struct platfo=
rm_device *pdev)
>  	 * Populate it with initial values read from the HW and switch
>  	 * all command sources to the ARM by default
>  	 */
> -	for (i =3D 0; i < banks; i++) {
> -		const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> -		void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);
> -		gpio->dcache[i] =3D ioread32(addr);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 0, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 1, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 2, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
> -	}
> +	if (gpio->config->cmd_source_supoort)

This test only reflects the level of effort put into supporting the
AST2700 GPIO controllers so far, it doesn't reflect the actual
capability of the hardware...

> +		for (i =3D 0; i < banks; i++) {
> +			const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> +			void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);

... and I don' think this is correct if/when the command source support
is implemented for the AST2700. Can you please add a comment about the
bank/address calculation, and change the condition above to account for
this implementation being specific to SoCs earlier than the AST2700?

Andrew

> +
> +			gpio->dcache[i] =3D ioread32(addr);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 0, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 8, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 16, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 24, GPIO_CMDSRC_ARM);
> +		}
> =20
>  	/* Set up an irqchip */
>  	irq =3D platform_get_irq(pdev, 0);


