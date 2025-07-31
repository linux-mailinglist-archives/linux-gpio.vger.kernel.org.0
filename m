Return-Path: <linux-gpio+bounces-23920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4912BB17149
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 14:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57D3618887CA
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 12:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BCB35947;
	Thu, 31 Jul 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avfW5821"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B5372;
	Thu, 31 Jul 2025 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753965098; cv=none; b=Pc5rYBUgbaMk80Qq5inHJkZ/GQbtuIUR6yaE1kiZwJGpZ646jM8DsItKCIaM3JCsjesai6medJLWE5bUWHCesISfOQC8V7fKUerCWbHa3QXujikulwj01Y8ih4hwqlESyjZ1zkCdzTHfe5W3epCgI5uhx/iewNvg2bZU8RR8PVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753965098; c=relaxed/simple;
	bh=URBZSbN2RzdOM2Exc3sMWFjQFAV7ao5+tgqtnWBhAXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMiTXym5YrO+rvZS7VwfVq/JFeFGgwag08mGvdht6+d9SafP+0h/arsD4J9bm0aCXSEsm4pSi5gcvfMb7E6ou4P6uEQ52nyOewvgdd4HvXDRPa+dgPxmDbBNzhyCPyWdusgYymdCsHUFKU80yFXoResL9H7AxlKdG4GyWYUkJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avfW5821; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E36EC4CEEF;
	Thu, 31 Jul 2025 12:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753965097;
	bh=URBZSbN2RzdOM2Exc3sMWFjQFAV7ao5+tgqtnWBhAXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=avfW5821/IeJL54S7GPf5gz63Or62vZvwNI6mafxt7CF5iLmKv+RYOjzXeOJ638Y4
	 F6+ss1ngn6hlDO+2UOEfBrPDc1J7auUM9W0feY0W8Q7iqfQ2HmC54EvSlrbwyKdWSp
	 09BrHwH01O8BaLh7KVMOiCSU5cIOnZnC/tSHXWpnsEHIxUjUBo4VXFb8VULcfHJYp+
	 fywRojBq5mSdq+SxFRy6sA4MzD856Z0b9MQBUxPPVJ18/811+9qaOgAwd/G5CCyoet
	 xO4qoC+OXak79YYQ58YziHNlP8n4YFXKfETJz3dXac9nXhM80fdAgBFFEGy1ztTDv7
	 YSH3yGIxMMRvw==
Date: Thu, 31 Jul 2025 13:31:32 +0100
From: Mark Brown <broonie@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7b2vhtQHdqi+SNWF"
Content-Disposition: inline
In-Reply-To: <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
X-Cookie: Gloffing is a state of mine.


--7b2vhtQHdqi+SNWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 31, 2025 at 01:18:19PM +0100, Russell King (Oracle) wrote:

> I can't see that anything has changed in the code with regards to the
> locking, so I think this is a bug that's been present ever since these
> drivers were introduced, and regmap-irq is deficient in that it causes
> the same lockdep lock class to be taken recursively when the IRQ wake
> state changes.

> From what I can see, irq wake support for regmap-irq was added in
> commit a43fd50dc99a5 ("regmap: Implement support for wake IRQs") and
> this is the only operation that is propagated to the parent
> interupt(s). Thus, the above splat is unlikely to occur unless one
> makes use of wake support on a regmap-irq based interrupt whose
> parent is also regmap-irq based.

Yes, your analysis is right here - it's not come up before because it's
very rare to chain regmap-irq chips.

--7b2vhtQHdqi+SNWF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiLYiQACgkQJNaLcl1U
h9DX/gf/fbirGZ9ZCO8YHFRx0zpgHCqt9zASuRFOOroop47HKixQUglB8vsciuhn
fpXUqa6dx/8VARRHj8kJfYr1YoWd7JUW4NwpuWkoXQnkaoBM+VEBg5WsVdb9v10R
SC4DgHf60gBvJqaHCFebocAbSBsxdzTApKvSpYa3Jk+47m7bmOXVYxXg7enEf9m4
/HqdLuiMNCMk4MxgaY1gvkvw8FyOCR5uWI0qoMf7DFgV0CvOxQZ9PYc/C4Hz7O4k
dIPGHzN96zwB0vyPwhK1Yd11WvIosz1eZMdWTutmAb55/Eo60ajfa22K959hpl2S
+KbUPfgEqga8iu+yU7DvBAlghkA0Ng==
=98nN
-----END PGP SIGNATURE-----

--7b2vhtQHdqi+SNWF--

