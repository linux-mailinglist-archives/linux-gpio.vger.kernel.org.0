Return-Path: <linux-gpio+bounces-16278-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 468A0A3D76D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 740A33A3EDB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBC91F1527;
	Thu, 20 Feb 2025 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="C05FatH4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0C1AF0C8;
	Thu, 20 Feb 2025 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740048760; cv=none; b=KFIQjnyLdS57R+UwX/TyKFtS0t1e4nnuZ1i0PepayT9zIWuYShavqogWgZwW/hMESpO+X3ZzF9GkRgXZLZct/czjYNMk4Bud1CN16oYe9TYvIajijwliEeyFI+dd4ajDyzaql+fLEU6TN3gOFcVZT+xkhxCVaD2TVMPcY5/0XII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740048760; c=relaxed/simple;
	bh=jzc3UeO8gPwWIIcpOp7LoiCQrGSVxTENx4elv1fUfkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMJ7iADjL+3BVqCRYK24DvE5KHqSQmZIYXei/AgR1GzDVDdMLx5JDZShfyNHVMQg0hXU5ItWbMT0VKjAEM6DqK8DWNYoH9uXSiTO4TGkrwN14HGksZrUynyrwVfJI6jYgsu8Ha0syeWeRPBOmlU153HFDF8e4e9XhS2nVvK1jvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=C05FatH4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S+RdLYqZdmsOg0CbsW6QLZRD3BJ6XER56v5MU0dQRVc=; b=C05FatH44QfhrPp864MxbxdgFr
	RabFjZsr9lUlg6YOhIu6yuvBktL81zlOGNcN2RsYemh78AGxGEdieEEgDWN3r5OprsTBtnpkVFjEX
	IJOpz4GYbru83ZD5gP36n4V7B4bQwWZ05QV1dk9tr+5ODIzUMrqN5TemnsIrgukQAMMTge+eEy6U/
	AYK5mMn21/lUaNvD4RgicLpIXUnGdUIH69r29oVGVtWbc4l4O4n0UGO8ScXiLGAmbQyQ48OPG+jke
	M2uH1h0YT4+NA/qTXDf55qzxm3vJ6d2KC/GeRwhlccGfBZji5cDp0zP9YOsrmEnzpjH1iTX7t9NEK
	8qJtlhEw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tl4AR-0004Vd-9R; Thu, 20 Feb 2025 11:52:31 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH 2/2] gpio: pcf857x: add support for reset-gpios on (most) PCA967x
Date: Thu, 20 Feb 2025 11:52:29 +0100
Message-ID: <6110750.alqRGMn8q6@diego>
In-Reply-To: <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
References:
 <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-2-6abbf043050e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 20. Februar 2025, 10:56:52 MEZ schrieb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
> that is used to reset the I2C GPIO expander.
>=20
> One needs to hold this pin low for at least 4us and the reset should be
> finished after about 100us according to the datasheet[1]. Once the reset
> is done, the "registers and I2C-bus state machine will be held in their
> default state until the RESET input is once again HIGH.".
>=20
> Because the logic is reset, the latch values eventually provided in the
> Device Tree via lines-initial-states property are inapplicable so they
> are simply ignored if a reset GPIO is provided.
>=20
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index 7c57eaeb0afeba8953d998d8eec60a65b40efb6d..94077208e24ae99a1e8762e78=
3f0eabc580fa520 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2007 David Brownell
>   */
> =20
> +#include <linux/delay.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>

this is missing
#include <linux/gpio/consumer.h>

because otherwise you end up with
=2E./drivers/gpio/gpio-pcf857x.c: In function =E2=80=98pcf857x_probe=E2=80=
=99:
=2E./drivers/gpio/gpio-pcf857x.c:300:21: error: implicit declaration of fun=
ction =E2=80=98devm_gpiod_get_optional=E2=80=99; did you mean =E2=80=98devm=
_regulator_get_optional=E2=80=99? [-Wimplicit-function-declaration]
  300 |         rstn_gpio =3D devm_gpiod_get_optional(&client->dev, "reset"=
, GPIOD_OUT_HIGH);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~
      |                     devm_regulator_get_optional
=2E./drivers/gpio/gpio-pcf857x.c:300:68: error: =E2=80=98GPIOD_OUT_HIGH=E2=
=80=99 undeclared (first use in this function)
  300 |         rstn_gpio =3D devm_gpiod_get_optional(&client->dev, "reset"=
, GPIOD_OUT_HIGH);
      |                                                                    =
^~~~~~~~~~~~~~
=2E./drivers/gpio/gpio-pcf857x.c:300:68: note: each undeclared identifier i=
s reported only once for each function it appears in
=2E./drivers/gpio/gpio-pcf857x.c:309:17: error: implicit declaration of fun=
ction =E2=80=98gpiod_set_value=E2=80=99 [-Wimplicit-function-declaration]
  309 |                 gpiod_set_value(rstn_gpio, 0);
      |                 ^~~~~~~~~~~~~~~



> @@ -272,12 +273,11 @@ static const struct irq_chip pcf857x_irq_chip =3D {
> =20
>  static int pcf857x_probe(struct i2c_client *client)
>  {
> +	struct gpio_desc *rstn_gpio;
>  	struct pcf857x *gpio;
> -	unsigned int n_latch =3D 0;
> +	unsigned int n_latch;
>  	int status;
> =20
> -	device_property_read_u32(&client->dev, "lines-initial-states", &n_latch=
);
> -
>  	/* Allocate, initialize, and register this gpio_chip. */
>  	gpio =3D devm_kzalloc(&client->dev, sizeof(*gpio), GFP_KERNEL);
>  	if (!gpio)
> @@ -297,6 +297,29 @@ static int pcf857x_probe(struct i2c_client *client)
>  	gpio->chip.direction_output	=3D pcf857x_output;
>  	gpio->chip.ngpio		=3D (uintptr_t)i2c_get_match_data(client);
> =20
> +	rstn_gpio =3D devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_=
HIGH);
> +	if (IS_ERR(rstn_gpio)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(rstn_gpio),
> +				     "failed to get reset GPIO\n");
> +	}
> +
> +	if (rstn_gpio) {
> +		/* Reset already held with devm_gpiod_get_optional with GPIOD_OUT_HIGH=
 */
> +		usleep_range(4, 8); /* tw(rst) > 4us */
> +		gpiod_set_value(rstn_gpio, 0);
> +		usleep_range(100, 200); /* trst > 100uS */
> +
> +		/*
> +		 * Reset "will initialize to their default states of all I/Os to
> +		 * inputs with weak current source to VDD", which is the same as
> +		 * writing 1 for all I/Os which is 0 in n_latch.
> +		 */
> +		n_latch =3D 0;
> +	} else {
> +		device_property_read_u32(&client->dev, "lines-initial-states",
> +					 &n_latch);

device_property_read_u32 will not fill n_latch if the property is missing.
Before n_latch was always set to 0 at the declaration point above.
I guess that should be kept, because we want 0, except if
device_property_read_u32 provides a different value.


Heiko



