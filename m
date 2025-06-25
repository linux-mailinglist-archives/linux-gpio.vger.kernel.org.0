Return-Path: <linux-gpio+bounces-22143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E919EAE7AC1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 10:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B69341BC2448
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01E929AB10;
	Wed, 25 Jun 2025 08:47:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A2228DF36;
	Wed, 25 Jun 2025 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841231; cv=none; b=ir9lKydMHDKN7CY5m1jQ3pCowSxwlQckv1Sbrurehx3xc8QqYq2ccARiTFbUQgLYEG1BetK28SzA6CauiQiaWcbvhz8L9Kh7VHF4Dt5c7pkQYp6JqdytnLCehI4YYqkKdK2KjQe9AV7vyvVDFG8Eqd3mg0yD5q2WcKAJXiwuf1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841231; c=relaxed/simple;
	bh=5DFnaMl8KPQFxZg9FtmxKd82C1J6wGByoHO9CIwmHDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOAWwkWwkdp/iphM1JxTHT/nKcR0seXrJDUopdoFlXMntIMIEwI58HXuLgKN7uhyFMH8b7rDLSjT45Od9+DBMYe72/dlWauv3vRPDYdj33bngbEz/+bijeH8YF4miTIWydz1BA2cBUEDixDkLWhDmQCliu7YFOHZDYHPrdXpDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A55D21F00057;
	Wed, 25 Jun 2025 08:47:00 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A8CA9AC7A6A; Wed, 25 Jun 2025 08:46:57 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B42DBAC7A56;
	Wed, 25 Jun 2025 08:46:54 +0000 (UTC)
Date: Wed, 25 Jun 2025 10:46:52 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Message-ID: <aFu3fAMa8KPwjPbX@shepard>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eDJzuACllP3V3fib"
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>


--eDJzuACllP3V3fib
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi and thanks for your work!

On Fri 27 Dec 24, 16:37, Parthiban Nallathambi wrote:
> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.

Would it also make sense to submit device-tree pin definitions here?

Thanks!

Paul

> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctr=
l/sunxi/pinctrl-sun50i-a100.c
> index df90c75fb3c5..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DP3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DM3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2P */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2N */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKP */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKN */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
>=20
> --=20
> 2.39.5
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--eDJzuACllP3V3fib
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhbt3wACgkQhP3B6o/u
lQyEFg//TrQuoq7rBWw2GiGLkr841GKFMfwbOgCvkZ1O7uCpLuCvW5wITVjF4qW8
flSBcs6qcLbz66ZXQS/86ukYfNUAvm1r4vfhJ3Ptf7m3ko5sCrkCNC3jtlukzG+k
Eq4GzElnseT7TosPmjtImNkDjp3u/Vh/pxOdRnUHzi6N7+jGWLvU72LcF6LJKq4d
ftamg9783Xb1QAjNnot6b+fLooAtozg34ftrIe2SE2KXt+U7qeiXtrxNerNAd6Br
Ld34QB2oMk23sar7GQTPgvoJRCiLUNEV3hJexXf/FNHz9OviwE8irhf6BBjNz7eQ
XwnsDeqkt5p2IF/ClwfrlsviI8HRAzqX1G7WDtuPqHTsDm67QJb8LztQ4hAUqpmS
hUjh+BowsXfez8fVAqyp+onplRVK07SebprsBd026Uhb/cG5kBMtg3Z5H+ENCFXg
TDLc46jsp32Mplo6wP3CVFHz0qurThqF6L8XyzIn6VoreU5uX/FRkN8jAuWtmXup
rYNpDSE54yEL5c5P0bO1fLMtwBNKZlHEhgxHlZJCNvxgegJrtXT9hDJfYC0cnCoa
mjeOwFuo2wZziH22TX/5QxhZzUZzOVR0CeMPn+TjJhX/qgTRXwS4DO8RexsKHHm2
u2Fj8LAaR6bglReFWl4F+LKIeo2AswAzTyS6581R7n62JhNuXGk=
=9BCo
-----END PGP SIGNATURE-----

--eDJzuACllP3V3fib--

