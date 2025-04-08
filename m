Return-Path: <linux-gpio+bounces-18503-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FEBA80DE8
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DADF21BA420C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C112A1DF252;
	Tue,  8 Apr 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scNFjOPg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B8B1DE3C0;
	Tue,  8 Apr 2025 14:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122282; cv=none; b=E0FrsnWWOMQ6XBWcB4ySqieB4VQ0cLDkZ2ESkgzlMWS7E8ir+ijFEOPJDo70tm8HwbA9IZISCP0Vx1odLjS+4+Xve0K0OBSZP3+seu4ibOyryDjwHCx74Brs1UeVp4dieuKGAYbnHws4YfP7LJ7gVFHbAai0Mz+7cKwb/gMn+BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122282; c=relaxed/simple;
	bh=tXbsuANvJoHV8Q1QxgHIE9X3itrfJseiK0aegmbHYdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6XhcDzQ0o6QylF3zQ+u++eKII0GjYF4SrFxGzaTS5CRGwCGHBIoV4yZ2L+w3JjMwQ2do77SsWaiBlL2fJ5ooRLvWC4Na2aUEf0xIBndNgZ97mTPAYydiaUjL/7vElw7ABtifozDH4vJT9jaTJnuLGRYooSA7Ta91fVreZcKbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scNFjOPg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB499C4CEE5;
	Tue,  8 Apr 2025 14:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744122282;
	bh=tXbsuANvJoHV8Q1QxgHIE9X3itrfJseiK0aegmbHYdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scNFjOPgVD6aBD1yqql10eu2FTJ7TjvW8nF7BUYeWGCrtxfVC9CoxPUblv2/fWL4R
	 qVTUf66F9GH1OL1CqIj3W98DBVCzVzXFuqJEejkGGS7GBFgG6XswBk59C/iHcqAKR6
	 fGTyl6YPP8hvbgdlP1FMkmpTba8oA4IJrx0g/xmUwvs0VKjK//XBjlZTXRznZOToI8
	 RoNesFmg57pVEWwDeQzFxbhwaPP8U8TPISQyIxwc4HihC13FSKmjZhY8Lvghq+LDJ1
	 E7YoIcTaLVeCrbPx21fXlWObr3EznoO/TWd5CuWA+mXlBcQVXBQ4heSFxrNQQvEOSu
	 K2rV6UHPVUCYg==
Date: Tue, 8 Apr 2025 15:24:35 +0100
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/7] ASoC: codec: cs42l56: Convert to GPIO descriptors
Message-ID: <66db9962-d773-4c7a-bf59-4698eca9eedc@sirena.org.uk>
References: <20250408-asoc-gpio-v1-0-c0db9d3fd6e9@nxp.com>
 <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P/19h47GRqCIxVp5"
Content-Disposition: inline
In-Reply-To: <20250408-asoc-gpio-v1-4-c0db9d3fd6e9@nxp.com>
X-Cookie: Meester, do you vant to buy a duck?


--P/19h47GRqCIxVp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 08, 2025 at 09:40:00AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use devm_gpiod_get_optional to get GPIO descriptor with default
>    polarity GPIOD_OUT_LOW, set consumer name.
>  - Use gpiod_set_value_cansleep to configure output value.

> While at here
>  - reorder the included headers.
>  - Move cs42l56_platform_data from sound/cs42l56.h to driver code
>  - Drop sound/cs42l56.h because no user is creating the device using
>    platform data

This is a good sign that things should be split into multiple patches.
The series would probably be a little more manageable in general if it
were done per driver.

> Per datasheet, the DTS polarity should be GPIOD_ACTIVE_LOW. The binding
> example use value 0(GPIOD_ACTIVE_HIGH) which seems wrong. There is
> no in-tree DTS has the device, so all should be fine.

This is the whole thing where gpiolib introducing inversion causing
confusion.

--P/19h47GRqCIxVp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf1MaMACgkQJNaLcl1U
h9AmWgf+KltdYSprChCcnMOwPG+CsYSZP3KUnCZL3WWOOkYbdRiIk/hGrqeHm/oW
LiWiiyL6ttTJ1Id4bCZvJEiFJWHDVVhSXDBfcUgom4udT9BtiqBzzDoylUaWg4wc
ErU3L8VVSmZfzCverBq5rEfvCefEW3WHCW9GjiWc0ajA3xVnVBxFcWKsPMKtLYOT
sAcm0fW7yVx0acKwz2RaPJDyQ9Trl21DJ0hYwTC7wrHcNbqmfWiwCg0dmdarcg9o
n7iB22a+l8016K+YbOXdDBWNxOukannYaXsVk/+STPwizQSruF8Z86LIco0Y0Pkk
XW08pzT5+UFt55xg3Z2byiaes+8kMQ==
=IIKd
-----END PGP SIGNATURE-----

--P/19h47GRqCIxVp5--

