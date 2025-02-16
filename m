Return-Path: <linux-gpio+bounces-16087-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA3A37482
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 14:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B2B3A89E3
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8281922E1;
	Sun, 16 Feb 2025 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Yot2FZiX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6494190462
	for <linux-gpio@vger.kernel.org>; Sun, 16 Feb 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739711837; cv=none; b=jkUkVpFZhCqeRnfJW9vIbgKhmKeFHwRJkLUtGSufrl/SfSz8KLeHMo3L+g1re03hVysOoCC5pQ49otmJMkR0NwujPZZPqNW4+XgfYNsyOCK7MA8o846szpy42RqTZkBI3MRxBuv2BtLxXxiu5fLwdvYTYRte4Xtgt/gyNVZyTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739711837; c=relaxed/simple;
	bh=sfcZRcJwPeOIU9XKiIxo6nI71to/19D4OItEfcVxOMg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bfjcnkiiyS3WB0lvU9CmkuHoQyN0UJfl5kEvl4OVZGNapExLm5KLANNL3CG9vfbDb9Kb8a/4k6kVl0ZmSVABdMehx9f5iqK0WGuAcPVg2c7rBbzHBl7aSWECbOd8P8Cm15Dss58N1kCho4/HpDlpVNs4Liv7a04UbJegbDPbl9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Yot2FZiX; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [192.168.90.187] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id B328F5BC49F;
	Sun, 16 Feb 2025 14:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1739711826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R7IgcHlLJeAGnnUahqICvLFnrNle5U16KsUlP1mgP+Y=;
	b=Yot2FZiXf09qLXMd9tESzQK0lwOv9lDJrcNbgrtNqVH8Viq/fgK+IqIQ78mTa/3zAELodY
	yYp8smZjK54QLZe3O/w4Tmce6kR/YOR+A9fg74IufA7M6pfBl0roUHFID/a5wjEw3S+++A
	nr2UzzByfTBT6SMkf61HHDwTOzzuwL1y9b9fUnVpQdxzivcCNcmhDMrcFEx4oeURoV1Xt8
	uUZfBzmOX8oxwLou9vH6R4GAZf6mQuHlWWwjWv+UElwom8Ed7cWYNTpXIunpxYCjssXshw
	o1XKSyGg49erUrdHTUs75fcI5oepn0TB6rkJiVd8nGvGUJFJWeE/U69Qax3Y/w==
Message-ID: <e6194c5ed4f305f2150ab89a91a998028ac687c0.camel@svanheule.net>
Subject: Re: [PATCH v4 04/10] gpio: regmap: Allow to provide request and
 free callbacks
From: Sander Vanheule <sander@svanheule.net>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Lee Jones
	 <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kamel Bouhara
	 <kamel.bouhara@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski
	 <brgl@bgdev.pl>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <ukleinek@kernel.org>, Michael Walle <mwalle@kernel.org>, Mark Brown
	 <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki"
	 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pwm@vger.kernel.org, andriy.shevchenko@intel.com, 
 =?ISO-8859-1?Q?Gr=E9gory?= Clement	 <gregory.clement@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Feb 2025 14:17:03 +0100
In-Reply-To: <20250214-mdb-max7360-support-v4-4-8a35c6dbb966@bootlin.com>
References: <20250214-mdb-max7360-support-v4-0-8a35c6dbb966@bootlin.com>
	 <20250214-mdb-max7360-support-v4-4-8a35c6dbb966@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mathieu,

On Fri, 2025-02-14 at 12:49 +0100, Mathieu Dubois-Briand wrote:
> Allows to populate the gpio_regmap_config structure with request() and
> free() callbacks to set on the final gpio_chip structure.
>=20
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> ---
> =C2=A0drivers/gpio/gpio-regmap.c=C2=A0 | 2 ++
> =C2=A0include/linux/gpio/regmap.h | 7 +++++++
> =C2=A02 files changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 05f8781b5204..ba72c23bcf97 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -261,6 +261,8 @@ struct gpio_regmap *gpio_regmap_register(const struct
> gpio_regmap_config *config
> =C2=A0	chip->names =3D config->names;
> =C2=A0	chip->label =3D config->label ?: dev_name(config->parent);
> =C2=A0	chip->can_sleep =3D regmap_might_sleep(config->regmap);
> +	chip->request =3D config->request;
> +	chip->free =3D config->free;
> =C2=A0
> =C2=A0	chip->request =3D gpiochip_generic_request;
> =C2=A0	chip->free =3D gpiochip_generic_free;

You probably have a bad rebase here, as the chip->{request,free} functions =
are immediately
overwritten by gpiochip_generic_{request,free}. Perhaps those can actually =
be used if you
provide a pinctrl driver for the MFD.


Best,
Sander


