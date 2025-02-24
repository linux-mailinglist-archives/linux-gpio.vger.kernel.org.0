Return-Path: <linux-gpio+bounces-16523-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB396A42DEA
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0F09177D85
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB17F25E47D;
	Mon, 24 Feb 2025 20:32:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE49E2512D3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429165; cv=none; b=ExbgHHtcAFmKv5lW/gDLzz5PvIqr3tOe3JUNzMb0YEsbERkaEgTTg3j6b+3wRM+NwUsjx63IdxvC4ldNcLSCsUGxnOkpNF4lllN4/toeCNmVLI05KMLfRIydV23lHSXE9J6yUs3ZxZU9uhlDc07L82cIwJsAgZkXDHr5r0vSf8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429165; c=relaxed/simple;
	bh=Fo1nhlLcIcQtFBiW5K4QNLHy3ZTDPDcY8zstXVin0wQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKB2KD3qAQq+Kr+vz27M0UA12sAd5TdoR61d9SU8DQKtNawtyInAtOb+uJS59AZJmETmMMZIY7YzGOCme2O9YMDtIlX4+0wQTpiqoYJCYiqajtduikeI6ujTtPRMZ+IfoG35CzJ6s+QLmZyKfXaAlOjt3OCmdk06Rnx/vYFZMpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 7860645e-f2ee-11ef-9d7a-005056bd6ce9;
	Mon, 24 Feb 2025 22:32:30 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 24 Feb 2025 22:32:30 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>,
	Bough Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpio: mmio: Add flag for calling pinctrl back-end
Message-ID: <Z7zXXmtuDFWGRmfm@surfacebook.localdomain>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
 <20250219-vf610-mmio-v3-1-588b64f0b689@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-vf610-mmio-v3-1-588b64f0b689@linaro.org>

Wed, Feb 19, 2025 at 10:04:33PM +0100, Linus Walleij kirjoitti:
> It turns out that with this flag we can switch over an entire
> driver to use gpio-mmio instead of a bunch of custom code,
> also providing get/set_multiple() to it in the process, so it
> seems like a reasonable feature to add.
> 
> The generic pin control backend requires us to call the
> gpiochip_generic_request(), gpiochip_generic_free(),
> pinctrl_gpio_direction_output() and pinctrl_gpio_direction_input()
> callbacks, so if the new flag for a pin control back-end
> is set, we make sure these functions get called as
> expected.

First of all, I like the series and esp. the second patch, thanks!
One small comment below, though.

...

>  static int bgpio_request(struct gpio_chip *chip, unsigned gpio_pin)
>  {
> -	if (gpio_pin < chip->ngpio)
> -		return 0;
> +	if (gpio_pin >= chip->ngpio)
> +		return -EINVAL;
>  
> -	return -EINVAL;
> +	if (chip->bgpio_pinctrl)
> +		return gpiochip_generic_request(chip, gpio_pin);
> +
> +	return 0;
>  }

While I understand the desire to avoid +LoCs, I still think it's better from
maintenance p.o.v. to have a symmetry in APIs, i.e. providing

bgpio_free()  // or whatever name suits with possibility to change the above
{
	if (chip->bgpio_pinctrl)
		gpiochip_generic_free(...);
}

...

> +	if (flags & BGPIOF_PINCTRL_BACKEND) {
> +		gc->bgpio_pinctrl = true;
> +		/* Currently this callback is only used for pincontrol */
> +		gc->free = gpiochip_generic_free;
> +	}

And

	gc->free = gpiochip_generic_free;
	...
	if (flags & BGPIOF_PINCTRL_BACKEND)
		gc->bgpio_pinctrl = true;

here.

The rationale that if we ever add something to the request part, we won't
forget to call it in the free part.

-- 
With Best Regards,
Andy Shevchenko



