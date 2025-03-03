Return-Path: <linux-gpio+bounces-16963-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA4A4C708
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 17:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AD5177BAB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 16:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9E6238D2E;
	Mon,  3 Mar 2025 16:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KpM830zl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38A1EE7D9;
	Mon,  3 Mar 2025 16:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018865; cv=none; b=n/AC4eul/s/y8s3XNbXvbCxtLXrW8Kgv3ymps7/Y0PD75Yb81X6BzFwgMSsoX/GaoRXYTlYxxVQF7TMZMGhVxguEjc+25c/8XuNoEzjNp7waJ7xND2I/3Tjj479zBzTakF32ubnwxtgwdMdXWNedlgt1D1ZfSLIS7jwm9su9bQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018865; c=relaxed/simple;
	bh=YIT1d/q+orGecLl5orTXRH7qx/DgkQpVYnSgn9Yhm1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NyL82BqdHR1dJpj60wjlD/pPP4pwgtzeN//+sqbMs8mZnwio+ymIBV6mtVaDx1AWJFNl3MR7jzXBBL/qHTvgE+BH/QyNeTEFT4rRgsaRAV7VM8OQdaCDgPB76dFwy1cg8OElevf0Pfo1MLUH7bgEhUyW0hyvPqcupKmWcD0C2Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KpM830zl; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0278B441F3;
	Mon,  3 Mar 2025 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741018860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dauOXHXwGsTaP/HxOOC7rZkG3NVNUX/S1MEByrvvY10=;
	b=KpM830zlTqEcm4D18hmT0SdHdeXkomGxiXlu5A5/0HoRBGEpGVnzeQuOAwlRX1bDLCFmlk
	idkDZjU9ginNuBLj1mbZSjRG9s9IRWUrOp8l8k/z4PXa11Ii+02UMCOP8Jo/0f6ig9pSKl
	vWiQ45UGCDnbszdfcq+diffcxnv8271hNz9JKzI8m/ed4Zn+hCopR6BbeazOqNvmUe812T
	CbSpH03gXUa2fIRGXx8CaoSntgsa/boORiBtekruNufKG85iOnY1KHWCK4SIV8n1WGE8ey
	7FEGR4WA3oT56pB99tf43DnctYVc0rFxvRPci9rhpYUC40JPobF/TCMA6SjlQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-wpan@vger.kernel.org,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org,  Alexander
 Aring <alex.aring@gmail.com>,  Stefan Schmidt <stefan@datenfreihafen.org>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Linus
 Walleij <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH net-next v1 2/2] ieee802154: ca8210: Switch to using
 gpiod API
In-Reply-To: <20250303150855.1294188-3-andriy.shevchenko@linux.intel.com>
	(Andy Shevchenko's message of "Mon, 3 Mar 2025 17:07:40 +0200")
References: <20250303150855.1294188-1-andriy.shevchenko@linux.intel.com>
	<20250303150855.1294188-3-andriy.shevchenko@linux.intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 17:20:59 +0100
Message-ID: <8734fu84r8.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelleehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdifphgrnhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehli
 hhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrrghrihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehsthgvfhgrnhesuggrthgvnhhfrhgvihhhrghfvghnrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthh
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Andy,

> @@ -350,8 +348,8 @@ struct work_priv_container {
>   * @extclockenable: true if the external clock is to be enabled
>   * @extclockfreq:   frequency of the external clock
>   * @extclockgpio:   ca8210 output gpio of the external clock
> - * @gpio_reset:     gpio number of ca8210 reset line
> - * @gpio_irq:       gpio number of ca8210 interrupt line
> + * @reset_gpio:     GPIO of ca8210 reset line

What about "CA8210 Reset GPIO line"? Or Just "Reset GPIO line"? Or even
"Reset GPIO descriptor" (whatever).

> + * @irq_gpio:       GPIO of ca8210 interrupt line

Same

>   * @irq_id:         identifier for the ca8210 irq
>   *
>   */
> @@ -359,8 +357,8 @@ struct ca8210_platform_data {
>  	bool extclockenable;
>  	unsigned int extclockfreq;
>  	unsigned int extclockgpio;
> -	int gpio_reset;
> -	int gpio_irq;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *irq_gpio;
>  	int irq_id;
>  };

[...]

>  	/* Wait until wakeup indication seen */
> @@ -2784,25 +2782,14 @@ static void ca8210_unregister_ext_clock(struct sp=
i_device *spi)
>   */
>  static int ca8210_reset_init(struct spi_device *spi)
>  {
> -	int ret;
> -	struct ca8210_platform_data *pdata =3D spi->dev.platform_data;
> +	struct device *dev =3D &spi->dev;
> +	struct ca8210_platform_data *pdata =3D dev_get_platdata(dev);
>

Can you either mention the additional cleanup that you do in the commit
log or split it in a separate commit? (splitting is probably not
necessary here given that most of the cleanup anyway is related to the
actual changes.

> -	pdata->gpio_reset =3D of_get_named_gpio(
> -		spi->dev.of_node,
> -		"reset-gpio",
> -		0
> -	);
> +	pdata->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(pdata->reset_gpio))
> +		dev_crit(dev, "Reset GPIO did not set to output mode\n");
>=20=20
> -	ret =3D gpio_direction_output(pdata->gpio_reset, 1);
> -	if (ret < 0) {
> -		dev_crit(
> -			&spi->dev,
> -			"Reset GPIO %d did not set to output mode\n",
> -			pdata->gpio_reset
> -		);
> -	}
> -
> -	return ret;
> +	return PTR_ERR_OR_ZERO(pdata->reset_gpio);

This is not a strong request, but in general I think it is preferred to ret=
urn
immediately, so this looks easier to understand:

+	pdata->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(pdata->reset_gpio)) {
+		dev_crit(dev, "Reset GPIO did not set to output mode\n");
+                return PTR_ERR(pdata->reset_pgio);
+       }
+
+       return 0;

Otherwise the rest lgtm.

Thanks,
Miqu=C3=A8l

