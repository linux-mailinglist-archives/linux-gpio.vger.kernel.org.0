Return-Path: <linux-gpio+bounces-6833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDAF8D3630
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3201C23C50
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1773F1802CA;
	Wed, 29 May 2024 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OPj8tQBm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312223B295;
	Wed, 29 May 2024 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985194; cv=none; b=U9gX6WTT6OhzYvYwlj6OzANuIWPY2TlONb+j3jnbyH1V147wmpEnvlWTN7gZZ0ieytyUekx1U5N7J8BpgTEjOT2quh9nV11rLO6G36aI34IgEurAEZD0ZNC7cPV4VIJ+FlxPrsDJ4BiOWXLbbAhXek7IGxQKWa2FlaFG1W27dTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985194; c=relaxed/simple;
	bh=CWPz6Xw+R/6hqHTBZXF/4XxF7/FtqLA8AQ+Cyvx4n0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdOcJrQ2xB+0swOQKdK99Wfr137tvAq97ADZRoyraoboUaWXwoE6OOHuIh2uHHPcZdls3um3kILXHekKxsZqk4B2O6soNPR/5HJBtS/jJFQn7OK4JkvkTHtpcq5jFyoQ8mtaL7HdRSP/3PqAdSa+lCp+eDx80q2n9eiDTRn564g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OPj8tQBm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=1IwE9ubjZa/q19rvpgXW9y7s5lQvLukWHXDIBxOU368=; b=OPj8tQBmUH5AeKQ3CUKS/wsN66
	iWYd3VoXT8Rr4lGvQBeWxpWNYsIdOi28+FbOLVdpU8xFgj9DUiwIpmm9sragrc9wAeQZ+MFfCYy61
	4Ykjbbf9SwZBgPAzuwzjUYnLqQn/1Qy/ZdxLbggeJAgArZFoVUAruyY++es7b8GndOfc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCIHT-00GFh0-EL; Wed, 29 May 2024 14:19:47 +0200
Date: Wed, 29 May 2024 14:19:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com
Subject: Re: [PATCH 4/8] gpio: tqmx86: introduce _tqmx86_gpio_update_bits()
 helper
Message-ID: <28f4d8aa-917d-4666-b59d-bed3ebfab2e2@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
 <0a21e3f14742e9adcf29361f7f2867199cd0dd4a.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a21e3f14742e9adcf29361f7f2867199cd0dd4a.1716967982.git.matthias.schiffer@ew.tq-group.com>

On Wed, May 29, 2024 at 09:45:16AM +0200, Matthias Schiffer wrote:
> Simplify a lot of code in the driver by introducing helpers for the
> common RMW pattern. No tqmx86_gpio_update_bits() function with builtin
> locking is added, as it would become redundant with the following fixes,
> which further consolidate interrupt configuration register setup.
> 
> No functional change intended.
> 
> Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/gpio/gpio-tqmx86.c | 40 ++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
> index 613ab9ef2e744..7a851e1730dd1 100644
> --- a/drivers/gpio/gpio-tqmx86.c
> +++ b/drivers/gpio/gpio-tqmx86.c
> @@ -54,6 +54,17 @@ static void tqmx86_gpio_write(struct tqmx86_gpio_data *gd, unsigned int reg,
>  	iowrite8(val, gd->io_base + reg);
>  }
>  
> +static void _tqmx86_gpio_update_bits(struct tqmx86_gpio_data *gd,
> +				     unsigned int reg, u8 mask, u8 val)

Why the _ prefix? This is a local function, it is static, so you don't
have name space issues. Functions starting with _ are those you should
not call without a good reason, there is generally a version without
the _ prefix which is the real function to use. So i would drop the _.

This is also not a fix. Please read:

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

and stick to the rules described there.

I don't know how the GPIO tree works, but for netdev, about a week
after fixes are merged, they appear in net-next. So you can then build
on top of them for development work.

	Andrew

