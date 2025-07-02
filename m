Return-Path: <linux-gpio+bounces-22603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA922AF13FF
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 13:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E1E1C26481
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CF7266EF9;
	Wed,  2 Jul 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF+Mxsfn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A25255E4E;
	Wed,  2 Jul 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456216; cv=none; b=dPOuj/c7MvMZntif0WyP4xjhjkezJYqfvGbZ5NHd9xoTk8xpsK4Ec1Y7HAz1R601AlZBCRf8Rmr2phIE3jfCmh8IoXQVlLCqFX2CFuuv7cAbB4093tVA8TqsIJ8yNFg+yoh5q6HcdozQ6pgZ3Lvirc8vSnt5gttltl0F4PDYs/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456216; c=relaxed/simple;
	bh=AR2YdjUQDruKw3xwEOLHDbUEwgTRlLLrLUuQcRkPcwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5Givj2fGDn6bKVJT4F6xVs+3a8TAY1PoCvBQAH0xYJbNhPZkMWli7TbhD6/os3HoXhu+rBZtnN3EgK4VaYjOOyeAw+0oN9w05witmLbvHgwsyBlPutG+EtvIY3CJaFwS+xq79b1t+sfGfT3x2yGY7Y5q27/hWpzEJmiFl89EYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF+Mxsfn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E239DC4CEED;
	Wed,  2 Jul 2025 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751456216;
	bh=AR2YdjUQDruKw3xwEOLHDbUEwgTRlLLrLUuQcRkPcwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mF+MxsfngCXb328CwhUUDfE58INzeO/02EHWhYdfq92zRhxhdu9m3eJy38g/Z2+my
	 PEo2RicQ5A29nvdeyqkEhYXmYPboIIoBnvwoyjTo33CStZrq6JwcxbeXINWGNT7z3f
	 V0h82qzbUvYiU0/w0GdHs6pl8GqKnD7kpM5FIhdB/O3UqCLfHOsR83L6FB+gFjKTY0
	 VvjpbF/cL+u6rtx027/kfZy2nlIfRBljuP/L2/yJYG1Tzj1L1m4ah1WTAD5SV3yc9C
	 atIKqU3Z259Hwdsi1bfTag54achQvlF3vPxb6tcJRRGnxMXaQac8Pe1qjRKwYG5wv2
	 f6PbOLbcQg9gQ==
Date: Wed, 2 Jul 2025 13:36:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v4szwvinjjahevo3"
Content-Disposition: inline
In-Reply-To: <20250701201124.812882-6-paulk@sys-base.io>


--v4szwvinjjahevo3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> The DE mixer clock is currently set to run at 150 MHz, while the
> Allwinner BSP configures it at 300 MHz and other platforms typically
> run at 297 MHz.
>=20
> 150 MHz appears to be enough given the restricted graphics capabilities
> of the SoC (with a work area of only 1024x1024). However it typically
> causes the DE clock to be parented to the periph0 pll instead of the
> video PLL.
>=20
> While this should generally not be a concern, it appears (based on
> experimentation) that both the DE and TCON clocks need to be parented
> to the same PLL for these units to work. While we cannot represent this
> constraint in the clock driver, it appears that the TCON clock will
> often get parented to the video pll (typically running at 297 MHz for
> the CSI units needs), for instance when driving displays with a 33 MHz
> pixel clock (33 being a natural divider of 297).
>=20
> Running the DE clock at 297 MHz will typically result in parenting to
> the video pll instead of the periph0 pll, thus making the display
> output functional.
>=20
> This is all a bit fragile but it solves the issue with displays running
> at 33 Mhz and brings V3s to use the same frequency as other platforms,
> making support more unified.

It's beyond fragile, and doesn't have anything to do with the DRM driver.

You should set up the clock tree properly in the clock driver, and then
add NO_REPARENT to the DE clock to make sure it stays that way.

And then, you can change the clock rate if you want to, but at least you
don't set a rate and hope that the side effects work your way, and won't
happen again.

Maxime

--v4szwvinjjahevo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGUZ0QAKCRAnX84Zoj2+
dkUOAX9QETvGjudIqLH1LHrODK1oz9R7fTZgMW27nwd0xCKcdeLTvQKST2uEzWle
vJapl8MBfAx2o6ST5tt4OTYqAlQbnHgSbySZjkHgRUqtZhP/pvQc99/anfjE9qN1
3VMToXuhRg==
=p0B2
-----END PGP SIGNATURE-----

--v4szwvinjjahevo3--

