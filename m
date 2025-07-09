Return-Path: <linux-gpio+bounces-23019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F01AFED1A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 17:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AE895A78ED
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FFE2C2ABF;
	Wed,  9 Jul 2025 15:01:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A50186295;
	Wed,  9 Jul 2025 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073310; cv=none; b=nnqOjWJWCd4G2qNe//nrfZcqU/2lQ9w+R8voww/MA8cggvxvFDFZ1fFf7fPBoLfLeu8yCjso8QbpZZINzBPlZFXYxb3VBfjSsGJ6b7a/fqbkZbZkH/FBQwlShAx6UkGTQkkP+4MUSh9cNB0TxtUS62tlFA6cHUiTzhhaDhqq/T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073310; c=relaxed/simple;
	bh=kfK2kzIznh/JmwWEWf+Ccswfe01XEUOrjd50Hs/zDPI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=eN3b7I6hall387nzIQyVs8WFDbPIgqKk2RquRFxq+4Ykijo/DmKk2HaVA5iL1tM1mI1KcZMFBq65FbWvqcPZbYBYu2LjwVa6enxacqW7/DNuUfx8ASJDDdWIecrGYCjntErTWanW9F8V7vuo/SGqqroLIYvB8IRqgtXS2VK7BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2AEDE46;
	Wed,  9 Jul 2025 17:01:39 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 17:01:38 +0200
Message-Id: <DB7M5DTXEACR.3N7DO1DM0PZB1@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn
 Guo" <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
In-Reply-To: <20250709112658.1987608-5-ioana.ciornei@nxp.com>

Hi Ioana,

great to see another user of gpio-regmap.

On Wed Jul 9, 2025 at 1:26 PM CEST, Ioana Ciornei wrote:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS CPLD which are single register fixed-direction. This cannot be
> modeled using the gpio-regmap as-is since there is no way to
> present the true direction of a GPIO line.

You mean input and output mixed together in one register? At least
to me, that wasn't so obvious by the commit message, I had to look
at the actual driver.

> In order to make this use case possible, add a new callback to the
> gpio_config structure - .get_direction() - which can be used by user
> drivers to provide the fixed direction per GPIO line.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
>  include/linux/gpio/regmap.h |  3 +++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 87c4225784cf..dac2acb26655 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -32,6 +32,8 @@ struct gpio_regmap {
>  	unsigned int reg_dir_in_base;
>  	unsigned int reg_dir_out_base;
> =20
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> +
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> @@ -129,6 +131,9 @@ static int gpio_regmap_get_direction(struct gpio_chip=
 *chip,
>  	unsigned int base, val, reg, mask;
>  	int invert, ret;
> =20
> +	if (gpio->get_direction)
> +		return gpio->get_direction(gpio, offset);
> +
>  	if (gpio->reg_dat_base && !gpio->reg_set_base)
>  		return GPIO_LINE_DIRECTION_IN;
>  	if (gpio->reg_set_base && !gpio->reg_dat_base)
> @@ -163,7 +168,16 @@ static int gpio_regmap_set_direction(struct gpio_chi=
p *chip,
>  {
>  	struct gpio_regmap *gpio =3D gpiochip_get_data(chip);
>  	unsigned int base, val, reg, mask;
> -	int invert, ret;
> +	int invert, ret, dir;
> +
> +	if (gpio->get_direction) {
> +		dir =3D gpio->get_direction(gpio, offset);
> +		if (dir =3D=3D GPIO_LINE_DIRECTION_IN && output)
> +			return -EOPNOTSUPP;
> +		if (dir =3D=3D GPIO_LINE_DIRECTION_OUT && !output)
> +			return -EOPNOTSUPP;
> +		return 0;
> +	}

What is the intention here? Shouldn't there be just a .set_direction
op and if there isn't one, return EOPNOTSUPP?

In any case, that is unused code for your driver as far as I see,
because you neither set .reg_dir_in_base nor .reg_dir_out_base and
thus, .direction_input nor .direction_output are set within the
gpio_chip struct (see gpio_regmap_register()).

>  	if (gpio->reg_dir_out_base) {
>  		base =3D gpio_regmap_addr(gpio->reg_dir_out_base);
> @@ -247,6 +261,7 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  	gpio->reg_clr_base =3D config->reg_clr_base;
>  	gpio->reg_dir_in_base =3D config->reg_dir_in_base;
>  	gpio->reg_dir_out_base =3D config->reg_dir_out_base;
> +	gpio->get_direction =3D config->get_direction;
> =20
>  	chip =3D &gpio->gpio_chip;
>  	chip->parent =3D config->parent;
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index c722c67668c6..99fd973e61fa 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -37,6 +37,8 @@ struct regmap;
>   *			offset to a register/bitmask pair. If not
>   *			given the default gpio_regmap_simple_xlate()
>   *			is used.
> + * @get_direction:	(Optional) Callback to the user driver to return the
> + *			fixed direction of the GPIO line
>   * @drvdata:		(Optional) Pointer to driver specific data which is
>   *			not used by gpio-remap but is provided "as is" to the
>   *			driver callback(s).
> @@ -81,6 +83,7 @@ struct gpio_regmap_config {
>  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
>  			      unsigned int offset, unsigned int *reg,
>  			      unsigned int *mask);
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> =20
>  	void *drvdata;
>  };


