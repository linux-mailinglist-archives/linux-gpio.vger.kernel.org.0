Return-Path: <linux-gpio+bounces-23020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90ADAFED4F
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 17:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01D9B4A11C0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 15:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2612E5B0D;
	Wed,  9 Jul 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="FAWPm5uy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7322E2678;
	Wed,  9 Jul 2025 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073762; cv=none; b=IL+wygg+pgY45xR1gtSYAl3EzGMkfOwhOm2E9t/zB3MQlmSVDV4Ivr2b6I85uInM6WgT25ebMMnOPRJ47xcjq/+U462VO3iJ7Ir581U/dCxFPFffU9ykWg8uZbdJXHbNxdcjPX3rsyRDtholFpYeStrniL8Sqyn6U40oPZo2kT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073762; c=relaxed/simple;
	bh=pPy2FKFkThlDVPMouYhG0qFiHsCT6VIKIzN17kas5VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6K3fltPj76vU0tEaGOt6lMAfOGgJY2gCjKsiAoEA5Jv/r6Pf1mRNiGLVxSZZKi7s4MkAAFtuEOAsL4UDCeDUZou/2Z/qhKdcCrAek2zWfy5o/oTqNGXn9qI1W2tw4hTTktfiXHoJ/vhwWpbAcuuUzKTPG4mXWAEda4S1vwjgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=FAWPm5uy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5fTnbnfI2D0SW9Wd78YXcLrbOHt8ziweqWLL9StcYkQ=; b=FAWPm5uy6nPc15hpxU3RR511Jg
	Tc8DelvKLdVlYFxHWtnEt/iAWsIh+jdVvO1PmXKMvvJ8CeE+UqxXKz9HctVZkPkvV7IDZMKkqOLZS
	dtwVH/SZHK7vsK7b1bZSPVjbf3ArK81Px1Jns8WQv17ZTkbeId18fpJmmHcOpVK1y0vQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZWQ9-000xH4-4l; Wed, 09 Jul 2025 17:09:17 +0200
Date: Wed, 9 Jul 2025 17:09:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-5-ioana.ciornei@nxp.com>

On Wed, Jul 09, 2025 at 02:26:53PM +0300, Ioana Ciornei wrote:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS CPLD which are single register fixed-direction. This cannot be
> modeled using the gpio-regmap as-is since there is no way to
> present the true direction of a GPIO line.
> 
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
>  
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> +

This is not my area, so i will deffer to the GPIO
Maintainers. However, it is not clear to me what get_direction()
should return. Is it the current direction, or the supported
directions? Maybe it should be called get_fixed_direction()?

I then wounder how it will be implemented. Since it is fixed, it is
probably just a constant bitmap, and you look at the offset bit in
this batmap? At minimum a ready made helper could be provided, or
rather than have this op, just provide the bitmap, and gpio-regmap.c
can look at the bit in the bitmap?

	Andrew

