Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD9850AE4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 14:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbfFXMk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 08:40:26 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36429 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbfFXMk0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 08:40:26 -0400
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 285C810000F;
        Mon, 24 Jun 2019 12:40:20 +0000 (UTC)
Date:   Mon, 24 Jun 2019 14:40:19 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 1/9] pinctrl: sunxi: v3s: introduce support for V3
Message-ID: <20190624124019.o6acnnkjikekshl5@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2wajni7mcz7mizzf"
Content-Disposition: inline
In-Reply-To: <20190623043801.14040-2-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--2wajni7mcz7mizzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 23, 2019 at 12:37:53PM +0800, Icenowy Zheng wrote:
> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v3:
> - Fixed code alignment.
> - Fixed LVDS function number.
>
> Changes in v2:
> - Dropped the driver rename patch and apply the changes directly on V3s
>   driver.
>
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 473 +++++++++++++++++-----
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h     |   2 +
>  2 files changed, 366 insertions(+), 109 deletions(-)
>
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> index 6704ce8e5e3d..721c997d472b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
> @@ -1,5 +1,5 @@
>  /*
> - * Allwinner V3s SoCs pinctrl driver.
> + * Allwinner V3/V3s SoCs pinctrl driver.
>   *
>   * Copyright (C) 2016 Icenowy Zheng <icenowy@aosc.xyz>
>   *
> @@ -28,235 +28,433 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> -		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
> -		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PB_EINT0 */
> +		  SUNXI_FUNCTION(0x2, "uart2"),			/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),		/* PB_EINT0 */

I'm not sure why all that churn is needed.

Looks good otherwise.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2wajni7mcz7mizzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRDEswAKCRDj7w1vZxhR
xcUqAP96jDUQxD5ktA8bJadn0csZC5zu80WvAEMGgbNIXKKLTAD/U+6znAbbceG1
7MaO9SVfGDrn45QzR2JTKu4r3t/2VAw=
=tGMg
-----END PGP SIGNATURE-----

--2wajni7mcz7mizzf--
