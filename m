Return-Path: <linux-gpio+bounces-12634-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB69BEF56
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 948E5B23D20
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0959B1F9EB6;
	Wed,  6 Nov 2024 13:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfRrOfXm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D991F9EAB;
	Wed,  6 Nov 2024 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900621; cv=none; b=Ba8EaKXXmZ21ZuZz100zAMfnCptiIGeW0/BfV8Qt0xKuUxNr9h5JPdr/JIFjYNPzd64MJR+Sytziyt8nhBn7LAYhvMKIsxLqGT5qJMDTk9sdtE3UfzT8XaJjKuVRMRjeO1C5PRLN50tfIesTxt+SjTnqAMRnDfZp6QSjKh7j9IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900621; c=relaxed/simple;
	bh=AvHJghciWDhD/x8KUXSpLz7qHkc2aFQiPOOMs5V1Fv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4dcQivjX19G5DWDcUjkdb8fqqx7RE9J0/tq1kHBzu18VGS4rwEJlHbUjyGsrTRBcUYq7v489Gwgh0OEz8BhUulzg3GA92Kl08em1JTTkFjOOYui2oEe8s1Fg9JZLNJvKbo9krA51SHgVRtYgy8AK3iGwB02UCc0NzSbkpNSwaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfRrOfXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69956C4CECD;
	Wed,  6 Nov 2024 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730900621;
	bh=AvHJghciWDhD/x8KUXSpLz7qHkc2aFQiPOOMs5V1Fv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfRrOfXmESwZyDQhPNkDJgGi8YWbap+zQSnnKTjNRq0K9d9rKEeLHS6ISBOc0j2kr
	 T0QHzq7K9ZnLcN6d6mrBJQs6WBeU6BUvOvI/eGFXtWd9TAftn+cVheqed+TaW5m+CV
	 +4GOrYK3gQL5KFhzalL9L/zI3KX4CE9yoQE/PygkdsjA1rOozplLuj2atjLsNY74RU
	 BymKoASK8FGh9ttmyKOwg/REy7cughmQAKD0hJ1tXZl19CBJPWndXjjJ9UDHX3Ogy2
	 GIxlLPsQIpKQyIWgT71PrAPTYYG03xd8zkC8uFT4SjN9JjkOjnwZVM8KoDdGea14Ou
	 9k0LUcU284nkw==
Date: Wed, 6 Nov 2024 13:43:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com, magnus.damm@gmail.com,
	linus.walleij@linaro.org, support.opensource@diasemi.com,
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
	Adam.Thomson.Opensource@diasemi.com,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 22/31] ASoC: da7213: Populate max_register to
 regmap_config
Message-ID: <d3c28a8b-878c-4894-aa23-5b360153b85d@sirena.org.uk>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-23-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgBjwTwv0FsyKsIO"
Content-Disposition: inline
In-Reply-To: <20241106081826.1211088-23-claudiu.beznea.uj@bp.renesas.com>
X-Cookie: Include me out.


--qgBjwTwv0FsyKsIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 10:18:17AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> On the Renesas RZ/G3S SMARC Carrier II board having a DA7212 codec (using
> da7213 driver) connected to one SSIF-2 available on the Renesas RZ/G3S SoC
> it has been discovered that using the runtime PM API for suspend/resume
> (as will be proposed in the following commits) leads to the codec not
> being propertly initialized after resume. This is because w/o
> max_register populated to regmap_config the regcache_rbtree_sync()
> breaks on base_reg > max condition and the regcache_sync_block() call is
> skipped.
>=20
> Fixes: ef5c2eba2412 ("ASoC: codecs: Add da7213 codec")
> Cc: stable@vger.kernel.org

Why is this a stable fix when it only enables further work?

--qgBjwTwv0FsyKsIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcrcoQACgkQJNaLcl1U
h9B+uAf/T9UHiIXHURIt+YX7P9zWTkwxOYzQrVtIxV9Uz16GFNImxUT3T7ZkDJPm
Erxp7p9mSMTejwQKY8qPBDBgFh00UE8ZNhdcb1PmRZTJ4DeK1mOmjl2SulAB/EM9
v5g+3Cv95GmCpE0FfpsEwuhtz+wPWdJU3lqpG1rVtjMyXzuPqH5Ie4viG/I2pGO5
RNoUFDOHu2pc7f3i3WzmmywjEDJIhOHXv/rQRy8ZG8TZyvNDDX0sP/+y0ElBUBsB
81GcYxUjx+0h5uiE0XlXcfdemDG3L73XccwdWEJZ0xh+XKmrVLm1jFoJqLAiY7gM
jGFGeURWY9VEnaDqJCf33O0nhkmAGQ==
=RpAB
-----END PGP SIGNATURE-----

--qgBjwTwv0FsyKsIO--

