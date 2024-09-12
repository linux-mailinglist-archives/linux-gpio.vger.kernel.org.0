Return-Path: <linux-gpio+bounces-9996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19C976361
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 09:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 027A51F24781
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 07:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD2618E030;
	Thu, 12 Sep 2024 07:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ndgOCnRM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544B15C3;
	Thu, 12 Sep 2024 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127496; cv=none; b=ON2A82PENUrVWfCkMbuPEuAjZyrdimvZGuB+GAGZvgUYoYHRqhJlDmPNbgU6b5Hlwkccz3dEq09e8GMXoQM3sDA6N1ZESNTXZa0cp6YS82sFa4AXoyPvnaF7PNOoUY4G19Axp3uO6d+9XptH/m6MgpS6QyWL0luIrocoXlAgmlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127496; c=relaxed/simple;
	bh=VHcRQuoxPFhoVZk5YRRYRhlSg6Set0bZ3wGoTO/kLr8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rhtE+VoROT9727uOwvPrMyWtREsO60nvor85RCiiFxNcCqjKWgYyUqhQks8VxbT8hT1nL9DCqtqSFG9Cu6O8PPMAobxgT4oiMl3Hzv8G7UHelXawJsy4Q25ytostN1LOWBWHi7kuLlzjKr99BPMiosxVq3r8FAKeH4Uw5c/vqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ndgOCnRM; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726127491;
	bh=BVckwXlxO0ttpW9EBp9kcUb5ZsRUnWvKF9yggJGH4tw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ndgOCnRMm9DP5nqPfb/Q1HJ60NjTaYIavMvMLzuAecoA3g74SwXxDjy/B79v9KZYi
	 hUmE18v8tmFnd86orpVbW0PML4rSpcD2zgCjpKYduraJzUbPON3GDsgUlpojgFY0zy
	 0QUFMT/pZSoYBJOiuU+er/Ydo64H6J68vH31EVyJQSCOzUH8h9th8Cm4TdRqznrwVR
	 NfMypaLoYefNCEpMKDTg1Je24cHR5pgcSkWMto+Qm09yU/MvYshRSDNX0a3vMP4Zhm
	 zI+USeIei1rBQhK/sBI5hXxdrvQRpnuntk9Kw+QEK6L51mepF/Tl4HaIDjXLXZjLRZ
	 fyyYBmQgqoYLw==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1478E64FDD;
	Thu, 12 Sep 2024 15:51:27 +0800 (AWST)
Message-ID: <7e2643f7586a7ed5d3cc90630d78fb3abd813a54.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: Remove the name for bank array
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Date: Thu, 12 Sep 2024 17:21:27 +0930
In-Reply-To: <20240830034047.2251482-3-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
	 <20240830034047.2251482-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-08-30 at 11:40 +0800, Billy Tsai wrote:
> The bank array name is only used to determine if the GPIO offset is valid=
,
> and this condition can be replaced by checking if the offset exceeds the
> ngpio property.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 04c03402db6d..24f50a0ea4ab 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -77,7 +77,6 @@ struct aspeed_gpio_bank {
>  	uint16_t	debounce_regs;
>  	uint16_t	tolerance_regs;
>  	uint16_t	cmdsrc_regs;
> -	const char	names[4][3];
>  };
> =20
>  /*
> @@ -104,7 +103,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0040,
>  		.tolerance_regs =3D 0x001c,
>  		.cmdsrc_regs =3D 0x0060,
> -		.names =3D { "A", "B", "C", "D" },
>  	},
>  	{
>  		.val_regs =3D 0x0020,
> @@ -113,7 +111,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0048,
>  		.tolerance_regs =3D 0x003c,
>  		.cmdsrc_regs =3D 0x0068,
> -		.names =3D { "E", "F", "G", "H" },
>  	},
>  	{
>  		.val_regs =3D 0x0070,
> @@ -122,7 +119,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x00b0,
>  		.tolerance_regs =3D 0x00ac,
>  		.cmdsrc_regs =3D 0x0090,
> -		.names =3D { "I", "J", "K", "L" },
>  	},
>  	{
>  		.val_regs =3D 0x0078,
> @@ -131,7 +127,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0100,
>  		.tolerance_regs =3D 0x00fc,
>  		.cmdsrc_regs =3D 0x00e0,
> -		.names =3D { "M", "N", "O", "P" },
>  	},
>  	{
>  		.val_regs =3D 0x0080,
> @@ -140,7 +135,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0130,
>  		.tolerance_regs =3D 0x012c,
>  		.cmdsrc_regs =3D 0x0110,
> -		.names =3D { "Q", "R", "S", "T" },
>  	},
>  	{
>  		.val_regs =3D 0x0088,
> @@ -149,7 +143,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0160,
>  		.tolerance_regs =3D 0x015c,
>  		.cmdsrc_regs =3D 0x0140,
> -		.names =3D { "U", "V", "W", "X" },
>  	},
>  	{
>  		.val_regs =3D 0x01E0,
> @@ -158,7 +151,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x0190,
>  		.tolerance_regs =3D 0x018c,
>  		.cmdsrc_regs =3D 0x0170,
> -		.names =3D { "Y", "Z", "AA", "AB" },
>  	},
>  	{
>  		.val_regs =3D 0x01e8,
> @@ -167,7 +159,6 @@ static const struct aspeed_gpio_bank aspeed_gpio_bank=
s[] =3D {
>  		.debounce_regs =3D 0x01c0,
>  		.tolerance_regs =3D 0x01bc,
>  		.cmdsrc_regs =3D 0x01a0,
> -		.names =3D { "AC", "", "", "" },
>  	},
>  };
> =20
> @@ -280,11 +271,11 @@ static inline const struct aspeed_bank_props *find_=
bank_props(
>  static inline bool have_gpio(struct aspeed_gpio *gpio, unsigned int offs=
et)
>  {
>  	const struct aspeed_bank_props *props =3D find_bank_props(gpio, offset)=
;
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	unsigned int group =3D GPIO_OFFSET(offset) / 8;
> =20
> -	return bank->names[group][0] !=3D '\0' &&
> -		(!props || ((props->input | props->output) & GPIO_BIT(offset)));
> +	if (offset > gpio->chip.ngpio)

Should this be `>=3D`? ngpio is a count.

Andrew

> +		return false;
> +
> +	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
>  }
> =20
>  static inline bool have_input(struct aspeed_gpio *gpio, unsigned int off=
set)


