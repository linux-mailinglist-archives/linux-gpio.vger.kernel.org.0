Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31406EED4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfGTJsS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 05:48:18 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:38997 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727523AbfGTJsS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 05:48:18 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 27AF520006;
        Sat, 20 Jul 2019 09:48:15 +0000 (UTC)
Date:   Sat, 20 Jul 2019 11:48:14 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 6/8] ARM: sunxi: dts: s3/s3l/v3: add DTSI files for
 S3/S3L/V3 SoCs
Message-ID: <20190720094814.s6qik6ja2ympwpmp@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-7-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tszo4ocuvok5y3y2"
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-7-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tszo4ocuvok5y3y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:32AM +0800, Icenowy Zheng wrote:
> The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
> but with more GPIO wired out of the package.
>
> Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
> pinctrl compatible string, and the S3/S3L DTSI files just include the V3
> DTSI file.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes since v2.
>
>  arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
>  arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
>  arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
>  create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi
>
> diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi b/arch/arm/boot/dts/sun8i-s3.dtsi
> new file mode 100644
> index 000000000000..0f41a25ecb30
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include "sun8i-v3.dtsi"
> diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi b/arch/arm/boot/dts/sun8i-s3l.dtsi
> new file mode 100644
> index 000000000000..0f41a25ecb30
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-s3l.dtsi
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include "sun8i-v3.dtsi"
> diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3.dtsi
> new file mode 100644
> index 000000000000..6ae8645ade50
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-v3.dtsi
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include "sun8i-v3s.dtsi"
> +
> +&ccu {
> +	compatible = "allwinner,sun8i-v3-ccu";
> +};
> +
> +&pio {
> +	compatible = "allwinner,sun8i-v3-pinctrl";
> +};

Is there any difference between the S3, S3L and V3?

If not, then we don't need all those DTSI, just add the v3

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tszo4ocuvok5y3y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLjXgAKCRDj7w1vZxhR
xTY0AQCfKKwr5BMF1G0iTCcBBIUMTNJiFvicExk21XH3zaUU7QEA9un9GhY0LMVJ
LLxdD1eA6DtZDwv0b2+187+cUvotawI=
=7um4
-----END PGP SIGNATURE-----

--tszo4ocuvok5y3y2--
