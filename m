Return-Path: <linux-gpio+bounces-21777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5FBADF004
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4845F3A3070
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 14:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0409A202C3A;
	Wed, 18 Jun 2025 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijl85kXx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA192EBB96;
	Wed, 18 Jun 2025 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257918; cv=none; b=otsEKpjV6EFOuMZeEbxDkqCU0k/5Kw5baT3dvG2E1+exi1bQ0uXBDBDp6/8k6Fe7vo6D9C5kzM+pVj3n9v27y8Uj+/oTJxXvz25gbFSTM7GULpGMFviFQ7iIrwHx9ZGKR2wRAuMdVkMiPEJYGfTilMIxriIjbVgl+P+gefFTseQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257918; c=relaxed/simple;
	bh=V32Lxoh+JWBZUtGJvr4ddA6AvsipGh9FWI2K8eeI8/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxVaIOKHOG168v4PHIfJlHZABk8eW5+ijL/Mw+j2baa0copoEfXhk8D4sjKg3dpCBCEP7Fc7bqtglBOvAJQFB7xT4D597JJ62cfSxKREWnPFeSsYOELAzZHAoERqxWlJEip7VYRKK2C5qsJSQ+JkrUSVADLmbQKOOoF10T9kGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijl85kXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2298EC4CEE7;
	Wed, 18 Jun 2025 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257917;
	bh=V32Lxoh+JWBZUtGJvr4ddA6AvsipGh9FWI2K8eeI8/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijl85kXx5K3iAg46xVHFDAG/f1yyfGNLk+aeiggM+PUA3YmAkN8giMBDRRQ/N48Bv
	 LAO/252JYcE/vM+fkcdL739enNH+00FWYHRD3EPLwAYB1Pt4tDIQZdXoI5ajMNMhuW
	 XmCvEknPyFylshhTmC38x84xYg42YfM/zzRm25PL4prBpkbdwY8qheDZkf+sOV8k9i
	 eY7oE4KQZZll+LytWGhfk423/5+Jkjo7tCKXli6NieqsNHw/UZgvFGuyyXXvko5n0n
	 3lsAPWmqTvJjhBxVAhco2QVMZsufTTQ/8hUl0in7tVQruy4cOBJh+I/KbtCbQpacP7
	 ci8x4OqEfrZPA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRu2O-000000005IN-2icM;
	Wed, 18 Jun 2025 16:45:16 +0200
Date: Wed, 18 Jun 2025 16:45:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] USB: serial: cp210x: use new GPIO line value setter
 callbacks
Message-ID: <aFLQ_G0HnGWVSE12@hovoldconsulting.com>
References: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
 <20250610-gpiochip-set-rv-usb-serial-v1-2-a9343ca109e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-usb-serial-v1-2-a9343ca109e8@linaro.org>

On Tue, Jun 10, 2025 at 02:43:47PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/usb/serial/cp210x.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 9960ac2b10b719192dfbab0a6e81b2cf80f40d36..caeb2873a60451fb7a9a5b5d25071547b5401d52 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1504,7 +1504,7 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>  	return !!(mask & BIT(gpio));
>  }
>  
> -static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
> +static int cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
>  {
>  	struct usb_serial *serial = gpiochip_get_data(gc);
>  	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
> @@ -1522,8 +1522,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
>  	mask = BIT(gpio);
>  
>  	result = usb_autopm_get_interface(serial->interface);
> -	if (result)
> -		goto out;
> +	if (result < 0)
> +		return result;

This is arguably an unrelated change, please keep it as is.

>  	switch (priv->partnum) {
>  	case CP210X_PARTNUM_CP2105:
> @@ -1555,11 +1555,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
>  	}
>  
>  	usb_autopm_put_interface(serial->interface);
> -out:
> -	if (result < 0) {
> -		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
> -				result);
> -	}

And keep this in place too, and just result if negative.

> +
> +	return result < 0 ? result : 0;

And return 0 explicitly here to avoid using the ternary operator.

>  }

Johan

