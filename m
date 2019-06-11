Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD88E3CEC8
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2019 16:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388492AbfFKOcy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 10:32:54 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43911 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387551AbfFKOcy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 10:32:54 -0400
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5C50FFF812;
        Tue, 11 Jun 2019 14:32:45 +0000 (UTC)
Date:   Tue, 11 Jun 2019 16:32:39 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 11/11] ARM: dts: sun8i: s3: add devicetree for Lichee
 zero plus w/ S3
Message-ID: <20190611143239.zvganlwaiku3bs63@flea>
References: <20190611140940.14357-1-icenowy@aosc.io>
 <20190611140940.14357-12-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6e3io72tcrt3erkz"
Content-Disposition: inline
In-Reply-To: <20190611140940.14357-12-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--6e3io72tcrt3erkz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Jun 11, 2019 at 10:09:40PM +0800, Icenowy Zheng wrote:
> Lichee zero plus is a core board made by Sipeed, which includes on-board
> TF slot or SMT SD NAND, and optional SPI NOR or eMMC, a UART debug
> header, a microUSB slot and a gold finger connector for expansion. It
> can use either Sochip S3 or Allwinner S3L SoC.
>
> Add the basic device tree for the core board, w/o optional onboard
> storage, and with S3 SoC.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> New patch in v2.
>
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |  8 ++++
>  .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    | 39 +++++++++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5559028b770e..2b5e6a1d20ff 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1110,6 +1110,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-r16-nintendo-super-nes-classic.dtb \
>  	sun8i-r16-parrot.dtb \
>  	sun8i-r40-bananapi-m2-ultra.dtb \
> +	sun8i-s3-lichee-zero-plus.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
> new file mode 100644
> index 000000000000..7d2f6b145190
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-s3.dtsi"
> +#include "sun8i-s3-s3l-lichee-zero-plus.dtsi"
> diff --git a/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
> new file mode 100644
> index 000000000000..bb148e796df7
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include "sunxi-common-regulators.dtsi"

If possible, you should get rid of that include. What are you using it
for?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6e3io72tcrt3erkz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP+7hwAKCRDj7w1vZxhR
xXD5AQDzzGjJuMYqZOH2bt2UEka6SvuIrYluNOH8x3D+7GOsJAEA2rH3UjHc3GPu
kpIKRxDM2YMRW103wJicTaDDoRvXeQc=
=ySX5
-----END PGP SIGNATURE-----

--6e3io72tcrt3erkz--
