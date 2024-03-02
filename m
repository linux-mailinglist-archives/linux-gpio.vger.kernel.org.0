Return-Path: <linux-gpio+bounces-4067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF086F1B9
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 18:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454B11C20FDD
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 17:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA432BB16;
	Sat,  2 Mar 2024 17:42:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F861B298
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709401350; cv=none; b=ADzo0wyOZASbUCN4y4CwdxqhBqWG6nXNvTGkJ1bXRA74EqG+7QLA/RqY1YsB429pyVJX0ggiq5dmebxTaGmaHPQrA2iD+3ypO5MIbTzKnNopskxrLXyxGxqLv/CdMXk3bUTpYHF3BbhZTfdwH2BbuqoVjZnWCV9h469/V0vkbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709401350; c=relaxed/simple;
	bh=0yII0owIVEPUGaCKetIuklA8cKBZiaC6IfZgHBDSKxw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruKvDdxCDKglEkAH28XPY3kXyEOg11jim9GrA2hutAYUvL2DAZe70Clh6DNjkiq8Cd+xSycUiaECIxOaDxl/9459tRp/cLVtQbtqTyTesWpZuogC/QDBcBbOzmvukDvPCocSaXRtQM0IUPak8uBM0lPRZQEk9e51KPVMIfaT85c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 3bd3e3e1-d8bc-11ee-b972-005056bdfda7;
	Sat, 02 Mar 2024 19:42:26 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 2 Mar 2024 19:42:26 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] pinctrl: bcm2835: Implement bcm2711_pinconf_get
Message-ID: <ZeNlAry1QR8B00hH@surfacebook.localdomain>
References: <20240302095430.4871-1-wahrenst@gmx.net>
 <20240302095430.4871-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302095430.4871-3-wahrenst@gmx.net>

Sat, Mar 02, 2024 at 10:54:30AM +0100, Stefan Wahren kirjoitti:
> The BCM2711 allows to read the bias config. So implement pin_conf_get
> accordingly. The pull resistor values has been taken from the
> BCM2711/7211 datasheet.
> 
> This implementation assumes that BCM7211 behaves the same way.

...

> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +		if (((val >> shift) & PUD_2711_MASK) == BCM2711_PULL_NONE)
> +			return 0;
> +		else
> +			return -EINVAL;

Redundant 'else' in all cases. Also as in previous patch, use single return point of success.

		if (((val >> shift) & PUD_2711_MASK) != BCM2711_PULL_NONE)
			return -EINVAL;
		break;

> +	case PIN_CONFIG_BIAS_PULL_UP:
> +		if (((val >> shift) & PUD_2711_MASK) == BCM2711_PULL_UP) {
> +			*config = pinconf_to_config_packed(param, 50000);
> +			return 0;
> +		} else {
> +			return -EINVAL;
> +		}
> +
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		if (((val >> shift) & PUD_2711_MASK) == BCM2711_PULL_DOWN) {
> +			*config = pinconf_to_config_packed(param, 50000);
> +			return 0;
> +		} else {
> +			return -EINVAL;
> +		}
> +
> +	default:
> +		break;

Return directly from here.

		return bcm2835_pinconf_get(pctldev, pin, config);

> +	}
> +
> +	return bcm2835_pinconf_get(pctldev, pin, config);

	return 0;

> +}

-- 
With Best Regards,
Andy Shevchenko



