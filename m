Return-Path: <linux-gpio+bounces-10394-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02328983B01
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 03:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE5A1F230DE
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 01:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504ED1C32;
	Tue, 24 Sep 2024 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="NOXalGUX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742EB38C;
	Tue, 24 Sep 2024 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727142496; cv=none; b=DAVSdb45nDcHn9ogJtaZv4YGLuQ83+pOZL46Zi7ikfl1oDiiYopt2Mpw0VWJ7ZLH8U7CnCefWTSYHCAimPBGSzdn37HVNpc2iBXvDkZ0eNgEpbyFk0xZV59rlw3yp80mXeK4Of/kEc50TxoTJRw7sXmCN7BiXSO/4eTYilWhvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727142496; c=relaxed/simple;
	bh=Yub2xhfeYUDGpyEbPUsa0PaJtfrLVEY9t/vX1rtaW4g=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZY0wS45Qwq5msc2aiecXabGwUAfHNUGxl0MRMeqYxL9hE15dFoMheEH97RjIhHskxrEiA/fnNKZaSt8WpTXYK93aRMQY55U70X9voX3U4yVEaTuLFWAv/6jLV659a6LpqeUGO1h8zZElUgl2AqbMpqHj8K9uf2SEsi71i5Nayts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=NOXalGUX; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727142492;
	bh=GCefvpkLAdF/COhltMUzJr2wnq0riZTXfytdaX3aWA0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=NOXalGUXVBW/7tJhLWIPxi4cDFvCD59mXvbWbMjer2AyUGx4KPf9J0QB+NWD9thPZ
	 y+qOMrKmWIZ4VVniJA4Et0wtqBWunOK4DLhGHADgomMtVyl/fsEPwPZ608hbH10DHY
	 THjixeU0aEchjpsx/DgVVZ0j/Qv5l3CsYWw4SrtoFQAC94YyPd2zedfK0kWDcgk9Xm
	 rYbGwhTKQ3WPnBUfCcqr/G2LDyyMwXZbAAEWlvx2JatQGOARTs6VO0ZsLtew4X0rqC
	 /B9A3ONI6DmFH0qVeyf+4xYRwWIDgtR1lbvRVIz9fpJuGrFZK2Zk6xkt+AOexwUbjQ
	 qhF0mh+7q8ybA==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 453B16502A;
	Tue, 24 Sep 2024 09:48:11 +0800 (AWST)
Message-ID: <95d87d38cabccb04b82e66123d78137e9cb38958.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Tue, 24 Sep 2024 11:18:10 +0930
In-Reply-To: <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
	 <20240923100611.1597113-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-09-23 at 18:06 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 443 +++++++++++++++++++------------------
>  1 file changed, 233 insertions(+), 210 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d20e15b2079d..d3994d833684 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -39,6 +39,10 @@ struct aspeed_bank_props {
>  struct aspeed_gpio_config {
>  	unsigned int nr_gpios;
>  	const struct aspeed_bank_props *props;
> +	const struct aspeed_gpio_llops *llops;
> +	const int *debounce_timers_array;
> +	int debounce_timers_num;
> +	bool require_dcache;
>  };
> =20
>  /*
> @@ -178,6 +182,19 @@ enum aspeed_gpio_reg {
>  	reg_cmdsrc1,
>  };
> =20
> +struct aspeed_gpio_llops {
> +	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*reg_bit_set)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg, bool val);
> +	bool (*reg_bit_get)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg);
> +	int (*reg_bank_get)(struct aspeed_gpio *gpio, unsigned int offset,
> +			    const enum aspeed_gpio_reg reg);
> +	void (*privilege_ctrl)(struct aspeed_gpio *gpio, unsigned int offset, i=
nt owner);
> +	void (*privilege_init)(struct aspeed_gpio *gpio);

I made a request down below, so given that, do you mind re-arranging
the member ordering in this struct? It'd be nice to have some flow to
it. Probably just move the copro_* members down the bottom? So:

struct aspeed_gpio_llops {
	void (*reg_bit_set)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg, bool val);
	bool (*reg_bit_get)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg);
	int (*reg_bank_get)(struct aspeed_gpio *gpio, unsigned int offset,
			    const enum aspeed_gpio_reg reg);
	void (*privilege_ctrl)(struct aspeed_gpio *gpio, unsigned int offset, int =
owner);
	void (*privilege_init)(struct aspeed_gpio *gpio);
	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
};

*snip*


> @@ -1182,7 +1205,7 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
>  	if (!gpio_id)
>  		return -EINVAL;
> =20
> -	gpio->clk =3D of_clk_get(pdev->dev.of_node, 0);
> +	gpio->clk =3D devm_clk_get_enabled(&pdev->dev, 0);

Nice - however, can you please make this its own patch and add a Fixes:
tag?

Otherwise I think the patch is looking okay. I'll try to get some
testing done.

Andrew

