Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDA53CEAC
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390228AbfFKO1t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:27:49 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35815 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390032AbfFKO1t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:27:49 -0400
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1965AE0011;
        Tue, 11 Jun 2019 14:27:40 +0000 (UTC)
Date:   Tue, 11 Jun 2019 16:27:40 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 03/11] pinctrl: sunxi: v3s: introduce support for V3
Message-ID: <20190611142740.2gqm3nxq2nl6sz7w@flea>
References: <20190611140940.14357-1-icenowy@aosc.io>
 <20190611140940.14357-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ttqlhhfclj7eb7xn"
Content-Disposition: inline
In-Reply-To: <20190611140940.14357-4-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ttqlhhfclj7eb7xn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2019 at 10:09:32PM +0800, Icenowy Zheng wrote:
> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Dropped the driver rename patch and apply the changes directly on V3s
>   driver.
>
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 265 +++++++++++++++++++++-
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h     |   2 +
>  2 files changed, 262 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> index 6704ce8e5e3d..9e82fd38cf21 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> @@ -1,5 +1,5 @@
>  /*
> - * Allwinner V3s SoCs pinctrl driver.
> + * Allwinner V3/V3s SoCs pinctrl driver.
>   *
>   * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
>   *
> @@ -77,6 +77,30 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
>  		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PB_EINT9 */
> +	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(B, 10),
> +		  PINCTRL_SUN8I_V3,
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "jtag"),		/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PB_EINT10 */

The alignment should be on the parenthesis

Looks good otherwise

maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ttqlhhfclj7eb7xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP+6WwAKCRDj7w1vZxhR
xWvDAP4sUsS8lzwwMZirLseQPv9XAS76rNYD57+nctEZGaZNQwEAvNAXDoM60OLA
47GX+cRJkvkgdUzlpDnXxMBujGw8qAA=
=z2T/
-----END PGP SIGNATURE-----

--ttqlhhfclj7eb7xn--
