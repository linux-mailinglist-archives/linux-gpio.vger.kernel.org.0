Return-Path: <linux-gpio+bounces-23417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB5B090A3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 17:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D0F189A55E
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jul 2025 15:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47EE2F85DE;
	Thu, 17 Jul 2025 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ChdZWPZW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3615A85A;
	Thu, 17 Jul 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752766359; cv=none; b=RdRu/YRt+fGvgIqgLhCjihWKLEX05+rfCGxZbXFbhU/pDtjH2J7fed2HFT1hmxz3b4gJvyEcBXJV4t/fz7CFWTyL5KIBzsfTUd+sZpGW3FgA9pqxqo8EdMvLwK4srCrQHiBPMfPVkJIcVqmBHEd57m5GzEXlPLJhtzDY8PDCnkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752766359; c=relaxed/simple;
	bh=8XWUDjdcjJ8Lo2aAKU4QJ0mq3GpPZfx1c9BGDxP41q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NAkKQpLq1++8KopXIFpHHgQEVw4uhm/o8PWWf9qAkaJDTNFcRPYJkFEfHZuFTh6TX2KMQPZVWs0s4hRM15eP67dQMMpGAwroPpONhzCwVouOD6LngVEcpBZTWAWCmrKP2cYB09mtR8NgRqlfwU394gTxF2F3XgEaInFtdntJpvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ChdZWPZW; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 584A8442A5;
	Thu, 17 Jul 2025 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752766349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jGQZPAYuxea84F1MrxXy8WT8badaATjxgMOWCz62zdo=;
	b=ChdZWPZWrOlMVc4lEVvKLVobptjA2Eu8FwS8MDkrMo5Gvp+OkvLcdpxMV+rjVGMJDo0U7K
	ikCKCSb9SbfPe+RyaLKtNrUZyk0KrJbQyHmkW6FHjfAfKsOPtfsuDIXgCB/N8FjR2Q1aWj
	Lmr3MjaQW03Wtkh6u22h1ZM5rGSB15JTmSfLTGmLPfSqMKIn5qqZ55YNsnWktnzJ6Iv1QW
	LMUKNtgMx57cgQGQYez90lGQYINIhsYCYyk396gWGhHgwnRsW4eEZdCQRz5V3/Xwo2XCoL
	ONljVfcaoZWqgCP7LNUFRSxp0nc9yvFWcDNEz5JpkmV4MNxqaLF5+B02tNUouw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [PATCH 2/2] misc: ti-fpc202: use new GPIO line value setter callbacks
Date: Thu, 17 Jul 2025 17:32:25 +0200
Message-ID: <2583871.PYKUYFuaPT@fw-rgant>
In-Reply-To: <20250717130357.53491-2-brgl@bgdev.pl>
References:
 <20250717130357.53491-1-brgl@bgdev.pl> <20250717130357.53491-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart23341617.EfDdHjke4D";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieekkeffvdeugfekjeegfefhvdetuefhtdelieduheeileduledvteelgefgffffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart23341617.EfDdHjke4D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Thu, 17 Jul 2025 17:32:25 +0200
Message-ID: <2583871.PYKUYFuaPT@fw-rgant>
In-Reply-To: <20250717130357.53491-2-brgl@bgdev.pl>
MIME-Version: 1.0

On Thursday, 17 July 2025 15:03:56 CEST Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/misc/ti_fpc202.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
> index ca415ef45cbe..f84cae50e2c9 100644
> --- a/drivers/misc/ti_fpc202.c
> +++ b/drivers/misc/ti_fpc202.c
> @@ -118,8 +118,8 @@ static void fpc202_set_enable(struct fpc202_priv *priv,
> int enable) gpiod_set_value(priv->en_gpio, enable);
>  }
> 
> -static void fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int fpc202_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>  {
>  	struct fpc202_priv *priv = gpiochip_get_data(chip);
>  	int ret;
> @@ -128,7 +128,7 @@ static void fpc202_gpio_set(struct gpio_chip *chip,
> unsigned int offset, ret = fpc202_read(priv, FPC202_REG_OUT_A_OUT_B_VAL);
>  	if (ret < 0) {
>  		dev_err(&priv->client->dev, "Failed to set GPIO %d value! err 
%d\n",
> offset, ret); -		return;
> +		return ret;
>  	}
> 
>  	val = (u8)ret;
> @@ -138,7 +138,7 @@ static void fpc202_gpio_set(struct gpio_chip *chip,
> unsigned int offset, else
>  		val &= ~BIT(offset - FPC202_GPIO_P0_S0_OUT_A);
> 
> -	fpc202_write(priv, FPC202_REG_OUT_A_OUT_B_VAL, val);
> +	return fpc202_write(priv, FPC202_REG_OUT_A_OUT_B_VAL, val);
>  }
> 
>  static int fpc202_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -333,7 +333,7 @@ static int fpc202_probe(struct i2c_client *client)
>  	priv->gpio.base = -1;
>  	priv->gpio.direction_input = fpc202_gpio_direction_input;
>  	priv->gpio.direction_output = fpc202_gpio_direction_output;
> -	priv->gpio.set = fpc202_gpio_set;
> +	priv->gpio.set_rv = fpc202_gpio_set;
>  	priv->gpio.get = fpc202_gpio_get;
>  	priv->gpio.ngpio = FPC202_GPIO_COUNT;
>  	priv->gpio.parent = dev;

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart23341617.EfDdHjke4D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmh5F4kACgkQmGofZEox
B4PQqQ//ZCt2/VYTliHztQT/knZWinp+SAOPZBPE/YsImKNp2P0+kXXslyKM4R50
awvcQZJ53FiVnRlbE1TN6MOJOhhmY+72Hwj3+Hj2ejBAimW2g2zweRj9AGwN24wD
SRCmY6WBCKvXZ4LRWIde/4uCKus1ye8LY7xiTW3ff7DsjfLBLxOKDNHVpvu7fAy6
2b7pd+fojwEwsExA10k/upuGML74qOiMek6RBQL//X5sipiBwOv2FcXN3DYy0grq
Es1qDUu9ICPyJDx/UmMc0gjbIRFtgM/7E82r7DgWHv1dXiO8ffhyNnWhhwPiA+lw
cF2kuefqSHOJ+zuyfWtSIXHE1K9meYCI+Yf1qlzIJ62j8ePGAgqLWo+5Q5yGZu7q
qiwApNrvTnpO7o055+MuOtpSjJGNANvIea/WMBx1BSY54i1WMAwESpw68m+CVaTB
RXu0392i/CW7iMmUKeXyBlpc4ONbQb4al3frQqTi1suM99PhmEwXRavHFbjOOQKS
jhBOp83Q3uv24LCkwHq3uGUnTGaxYc1gbKvrNU2U8fTXXiQO9b2kDJPwXza118fh
0jhMlZ9r3LQe/wz3t/jR5jTVrPK9PTAZKBo6RIHg0OerLZa8dh46AwzaOjbsPbW7
3s7KUiGABxKR7yFN9BfauXUPzXxHJfHcKLRPCA6se/iRFYLBRm4=
=BUfS
-----END PGP SIGNATURE-----

--nextPart23341617.EfDdHjke4D--




