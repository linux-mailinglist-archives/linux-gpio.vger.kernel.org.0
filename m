Return-Path: <linux-gpio+bounces-13400-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF129E0336
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 14:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654BD284A6A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 13:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC81D1FF611;
	Mon,  2 Dec 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsvnnYeR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B061FE469;
	Mon,  2 Dec 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733145580; cv=none; b=f2Q2QljelOLbmADivQxDcVyPtzll1BViL/ahW3Lk5YXIU29dKyp8xAg9IZfo+7PXDALUZfuRtold19vp3fTAlBp//KQbRLoOEUZRfum4+kP/Tkz0CoII2NI9cQB1WLhtdr6LbHiQuf3GbTzymWcPIGBo7zVrGrQHf8Q7cfmYg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733145580; c=relaxed/simple;
	bh=3ANWplAUBgovd+r2c5F0DHHbFkPx0NNGGSzCJkkazTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ca1+UaDD6YTSuNmj8QDd1bi6UM5jopW81KqUgnq59J4qlIayQh35UyzJ1AiVHvJ4oWpXOpONQhcJdKG/epTFgOVnpOr34kpAMrCMTsqrj8M+EB2RVFhtTqTUqXaE9bgfwIoo2/RaUOGjR35ki0r5G/J7hbuSsHbygFagFrO3Efc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsvnnYeR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F154C4CED1;
	Mon,  2 Dec 2024 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733145580;
	bh=3ANWplAUBgovd+r2c5F0DHHbFkPx0NNGGSzCJkkazTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QsvnnYeRmQFOM47DM3aMTxuclN6ixZs73+YJA+Vxitho9R2GoOAN/s5U8Ggl02Dit
	 rVr6QnFKjqYx8mDprfyf6HyqbrxRFNHERZoGuntFWZrMyVIXDAITPihjT/w4mzZQsU
	 b+daFEdL+shpyPrKxCnTwCX1Wsj8M10ooIscN26h2pgfBtWEC7R4XPqQoH7WRCHPA4
	 5dajSumU0us0bWYUJb8lRL5WYHB92MZDGYIBVdE92fX11cpfJZSBbwUVq7TOfQSswU
	 Ezv9aWK6BcoYQv74YHV2tiYZRQ3HsV+wSl1OWYFsgLOkLI9HHS22BHfywXQgd/GYQO
	 hWnle2F0xiEVQ==
Date: Mon, 2 Dec 2024 13:19:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Bough Chen <haibo.chen@nxp.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"brgl@bgdev.pl" <brgl@bgdev.pl>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] gpio: pca953x: do not enable regmap cache when there
 is no regulator
Message-ID: <9b214857-4cea-4480-86b3-0e469ce9e36f@sirena.org.uk>
References: <20241128020042.3124957-1-haibo.chen@nxp.com>
 <f71643eb-ee9c-4b39-af26-738ae82fd4bd@sirena.org.uk>
 <DU0PR04MB9496A16FB98C8492C9F012CD902A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yuASf+FYGuLtSoxu"
Content-Disposition: inline
In-Reply-To: <DU0PR04MB9496A16FB98C8492C9F012CD902A2@DU0PR04MB9496.eurprd04.prod.outlook.com>
X-Cookie: (null cookie


--yuASf+FYGuLtSoxu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2024 at 02:26:13AM +0000, Bough Chen wrote:

> I once thought to move current system PM to NOIRQ PM, but seems not all i2c bus controller support i2c operation during NOIRQ PM.
> Let me think whether there is a better solution, or do you have any suggestion?

I'm not sure we have any better option than also moving the I2C
controllers TBH.

--yuASf+FYGuLtSoxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNs+YACgkQJNaLcl1U
h9Ao1Af/VsL/J5Brjv4Z6AnYFbaiN/Ecg77q9kmJWxki3Sm7JFh6IXJW351neMZT
wd9jnv53TTJJFMsBomhgI2UmkpnGw371HTCW2Io7DiSglJO8RLRZqTkRieiCZ4C8
QKPmlCd8t+HB4PWK6Lsx7OgXGS1YbpdTY9r+U4q8xFLc2OG82oTjgUuQ+lA3FymU
6ifrZcX0fzgxrJuXskmn6IOolUm53muvOSkd9S5q2uDr5hsg3J2hp8tcDjrLK5Jb
x4KuquxoRwQ5W72fK/x6NTwF68Vsh01ee21f5MQaOi40bdfZYC2F6GSjgvkK0GyS
pWbZ6FYbmXPfgzExvbxXxXLtaTmrFA==
=BOsp
-----END PGP SIGNATURE-----

--yuASf+FYGuLtSoxu--

