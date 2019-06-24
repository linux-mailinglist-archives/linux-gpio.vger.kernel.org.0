Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0E350AFC
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 14:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfFXMnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 08:43:08 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37979 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFXMnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 08:43:07 -0400
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 111EC1BF206;
        Mon, 24 Jun 2019 12:43:01 +0000 (UTC)
Date:   Mon, 24 Jun 2019 14:43:01 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 9/9] ARM: dts: sun8i: s3: add devicetree for Lichee
 zero plus w/ S3
Message-ID: <20190624124301.chwhfalk5o53fm5x@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-10-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="py4hwz3wgnzkb3bv"
Content-Disposition: inline
In-Reply-To: <20190623043801.14040-10-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--py4hwz3wgnzkb3bv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 23, 2019 at 12:38:01PM +0800, Icenowy Zheng wrote:
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
> Changes in v3:
> - Drop common regulator DTSI usage and added vcc3v3 regulator.
>
>  arch/arm/boot/dts/Makefile                    |  1 +
>  .../boot/dts/sun8i-s3-lichee-zero-plus.dts    |  8 ++++
>  .../dts/sun8i-s3-s3l-lichee-zero-plus.dtsi    | 44 +++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-lichee-zero-plus.dts
>  create mode 100644 arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index c4742afe41a7..d24dec29245e 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1113,6 +1113,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
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
> index 000000000000..e68f738c3046
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3-s3l-lichee-zero-plus.dtsi
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_vcc3v3: vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	status = "okay";
> +};

How can it do OTG if there's no controllable VBUS regulator?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--py4hwz3wgnzkb3bv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRDFVQAKCRDj7w1vZxhR
xVyPAQC4xoOkF/OU5Ri3MaNxHNBSJU4jKHG3k6wvxxc8ao76IAD/dTJSG1W8lufw
RayEbaAS6Ujh3FgQv7u22QzXoCOe9w0=
=ip3c
-----END PGP SIGNATURE-----

--py4hwz3wgnzkb3bv--
