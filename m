Return-Path: <linux-gpio+bounces-21768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AEFADECFD
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51F118843A7
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A80D2DFF10;
	Wed, 18 Jun 2025 12:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c4M0QT47"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687C2556E;
	Wed, 18 Jun 2025 12:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250905; cv=none; b=Th8mPvN54bmR0PytDuEN97NftTLSYeUq4AOYYR8mItcdknmePrGW9bFsOyhSV/L4JN6+r7CzhnTz/8KtZqfmcrhdyeHfYBmpGl90swW23AXCwilvmmQsXj3a+mzsHmtsZmnplzzUC+AoCKbMwcBG419dQictcMdfxplrSE5NT7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250905; c=relaxed/simple;
	bh=Fc0FhuF+L6Lv28egdKqaXDSKAGB3oTUkQF1L7Zl2nd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P65hQxJ31U8IqwLbKJMF1iJfA9WWFi90PFsBCk3c2oItL8Sq95coqMN3NBUzHPMj9GY8NfktYTnDe3d5zwDF9PUaAzLByQJG7dnzdS1ttTiL3Wuj9rUhif7uae889HOIfI4hgehI0siOcynXt4LeNVhjpSlcUDedFHDm3dBmKhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c4M0QT47; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C27E822A;
	Wed, 18 Jun 2025 14:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750250888;
	bh=Fc0FhuF+L6Lv28egdKqaXDSKAGB3oTUkQF1L7Zl2nd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4M0QT47wzFOI7J5NzLuZKWU9Yn1xsM2l8S7a2X9rkQeBR1Ve0kQ8hJ3Abc91ble1
	 9kk2N50ZePQ7VxhWc6GR5X8KqKY11yE1mDbd4C4kkBizZsNFSatodzgwxtnwWT1jTj
	 lAuZOSaIgyaE5u+xXi9jkGyGp24AsHjIPvbKaOq8=
Date: Wed, 18 Jun 2025 14:48:18 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
	Andrey Utkin <andrey_utkin@fastmail.com>, Ismael Luceno <ismael@iodev.co.uk>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 7/7] media: i2c: max9286: use new GPIO line value
 setter callbacks
Message-ID: <hjlktxrmllq5igu2dbyp5lf7c57ztlbwb6mdm7cp62jd7pnjk3@pv6gtwmlavsu>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
 <20250616-gpiochip-set-rv-media-v2-7-6825114f18b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-7-6825114f18b0@linaro.org>

Hi Bartosz

On Mon, Jun 16, 2025 at 09:18:56AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Seems sane, thanks
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 9fc4e130a273f8547d7e7ec194cade5b5e9c8df2..1d0b5f56f989874e46f87db4a49d935049e6e7ce 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1193,12 +1193,12 @@ static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
>  			     MAX9286_0X0F_RESERVED | priv->gpio_state);
>  }
>
> -static void max9286_gpiochip_set(struct gpio_chip *chip,
> -				 unsigned int offset, int value)
> +static int max9286_gpiochip_set(struct gpio_chip *chip,
> +				unsigned int offset, int value)
>  {
>  	struct max9286_priv *priv = gpiochip_get_data(chip);
>
> -	max9286_gpio_set(priv, offset, value);
> +	return max9286_gpio_set(priv, offset, value);
>  }
>
>  static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
> @@ -1220,7 +1220,7 @@ static int max9286_register_gpio(struct max9286_priv *priv)
>  	gpio->owner = THIS_MODULE;
>  	gpio->ngpio = 2;
>  	gpio->base = -1;
> -	gpio->set = max9286_gpiochip_set;
> +	gpio->set_rv = max9286_gpiochip_set;
>  	gpio->get = max9286_gpiochip_get;
>  	gpio->can_sleep = true;
>
>
> --
> 2.48.1
>

