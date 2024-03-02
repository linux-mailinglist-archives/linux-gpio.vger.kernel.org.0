Return-Path: <linux-gpio+bounces-4066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3186F1B8
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 18:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC77C1F21061
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 17:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A142BB0C;
	Sat,  2 Mar 2024 17:40:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB5722EF2
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709401210; cv=none; b=jWsZIbuPvQ8P0jcGSteRvaW7lv1r8DpmP+85lb/ppHkQufDX9BYPoDpyQXHI0QlTwTQ91AKgtWxyQuhECvTG05oBcdNMqZD2MAbWqIm7q+MwAq8TIL9BjNq1aSiftMg08tPTsCqRXrSpp2fdUBw/13cWI+zJ2+CDn5tAj4vaNDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709401210; c=relaxed/simple;
	bh=codqXmkhcRRuwQv3WVG0HXzNki6+JNXPLptbqTNezBw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1vzb+Za4bnBTzVq96a5XBLiylkBu07//6tApvFj9ieaMR+XUsqeVTaOZ0eEIbymXZUjwBZZ5SJZ9tMbxsn0EXCe45lL24Yxd1z5cXrVlH3xCY8qdj0Lb+fsHdBn04CZOTWA9kI+Z3T3dt1F3V0NTSxPlwuWAzY81pK4y+V1nWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id e816a090-d8bb-11ee-b972-005056bdfda7;
	Sat, 02 Mar 2024 19:40:06 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Mar 2024 19:40:05 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH V2 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Message-ID: <ZeNkdeRoUta-s45T@surfacebook.localdomain>
References: <20240302095430.4871-1-wahrenst@gmx.net>
 <20240302095430.4871-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302095430.4871-2-wahrenst@gmx.net>

Sat, Mar 02, 2024 at 10:54:29AM +0100, Stefan Wahren kirjoitti:
> Even the driver already has implemented pin_dbg_show, it could
> be helpful to implement pin_conf_get for a more generic behavior.
> Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
> the bias config, so the implementation is limited to the basics.

> +	switch (param) {
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		if (fsel != BCM2835_FSEL_GPIO_IN)
> +			return -EINVAL;
> +
> +		*config = pinconf_to_config_packed(param, 1);

> +		return 0;

Either use break here (and in similar situations)...

> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		if (fsel != BCM2835_FSEL_GPIO_OUT)
> +			return -EINVAL;
> +
> +		*config = pinconf_to_config_packed(param, 1);
> +		return 0;
> +
> +	case PIN_CONFIG_OUTPUT:
> +		if (fsel != BCM2835_FSEL_GPIO_OUT)
> +			return -EINVAL;
> +
> +		val = bcm2835_gpio_get_bit(pc, GPLEV0, pin);
> +		*config = pinconf_to_config_packed(param, val);
> +		return 0;
> +
> +	default:
> +		break;

...and return from here directly.

> +	}
> +
>  	return -ENOTSUPP;

I.o.w. it's better to have a single point of returning a success code.

>  }

-- 
With Best Regards,
Andy Shevchenko



