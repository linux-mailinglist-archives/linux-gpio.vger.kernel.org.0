Return-Path: <linux-gpio+bounces-21858-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FEEAE0087
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 10:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98D0B1885167
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jun 2025 08:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7825A265609;
	Thu, 19 Jun 2025 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="o/6iUb+Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D5F264618;
	Thu, 19 Jun 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323294; cv=none; b=IApnfEMXjX5mDZjE2SC437dLsbCzCun/1ouKxCcnl0+IwKTMhVNnpjPmy/UR6ZUSzP0uOEh1NKLdq+h78st/O1rMFAJ0ZV2GrEp4m25VhFbq0PF/nQ8bnmBtd/Oe9WP+wJWcLI9vdksfG6wUNbpQciyR7w8C0ePlVAAYs7FViDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323294; c=relaxed/simple;
	bh=Oe3sQXha1qmerX9eSzIumQsaFzOJeWnD/5lIQE3te/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4Y5vYA+fAh7JRfqUnzahLj8Jw9vPDrDLni4sDuUtDqYSPCXRadEFOJ3uScopc1cjHmTM2RaQopMVgLRZaTvdsRXdabSxcEPRSIasnesdw7QHvdsaOi0nG1u0KLj3xNhCK7mkSWpniYYqMiUy+JEuGjwPmcmHdn02OKRK34yPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=o/6iUb+Z; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eD7eXQjCVZXrASkEWcilBg8DLF0GyjTxOwYQy8veqf8=; b=o/6iUb+ZXais31yF8EysEgF4nP
	6sr4Vg/Z4rY9ovh5IfCwzyhKZLARasyvwvWzjrhIYyyxi94HFmFUF14PJKRMupQZJHu1sLL8CP7/9
	SECVU1JfQoHKkLSmOR3KKA0UQEUmmCIT67OvC71waWiCBcHaOdGuMGxtQZoPF1BAOKLeLdZw+Zsyu
	k4jFb8axA9Owba/EOT3Sh7ZoDF4e1T8qJFLkArK4D9dl4XdvWvvvw/bYZuLkL7vKH8csHF98J6NmP
	WGgyR6kjpFPZLcAFtdmlZLcItUXUz7oMJQHdT/v5gBQLkHy+wTzvafJZPhcpxyKw8tMESvkTq17my
	Fnly6pzQ==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSB2j-00079q-Db; Thu, 19 Jun 2025 10:54:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [PATCH v2 10/12] gpio: rockchip: use new GPIO line value setter callbacks
Date: Thu, 19 Jun 2025 10:54:44 +0200
Message-ID: <15862883.tv2OnDr8pf@phil>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
References:
 <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
 <20250619-gpiochip-set-rv-gpio-v2-10-74abf689fbd8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 19. Juni 2025, 10:33:23 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Bartosz Golaszewski:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



> ---
>  drivers/gpio/gpio-rockchip.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 64700a003f9a17947dd38baea23a066e8c057caf..ecd60ff9e1dd1a090bfad204c=
8b86c4d7fb68ce7 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -177,8 +177,8 @@ static int rockchip_gpio_set_direction(struct gpio_ch=
ip *chip,
>  	return 0;
>  }
> =20
> -static void rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
> -			      int value)
> +static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +			     int value)
>  {
>  	struct rockchip_pin_bank *bank =3D gpiochip_get_data(gc);
>  	unsigned long flags;
> @@ -186,6 +186,8 @@ static void rockchip_gpio_set(struct gpio_chip *gc, u=
nsigned int offset,
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> +
> +	return 0;
>  }
> =20
>  static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
> @@ -325,7 +327,7 @@ static int rockchip_gpio_to_irq(struct gpio_chip *gc,=
 unsigned int offset)
>  static const struct gpio_chip rockchip_gpiolib_chip =3D {
>  	.request =3D gpiochip_generic_request,
>  	.free =3D gpiochip_generic_free,
> -	.set =3D rockchip_gpio_set,
> +	.set_rv =3D rockchip_gpio_set,
>  	.get =3D rockchip_gpio_get,
>  	.get_direction	=3D rockchip_gpio_get_direction,
>  	.direction_input =3D rockchip_gpio_direction_input,
>=20
>=20





