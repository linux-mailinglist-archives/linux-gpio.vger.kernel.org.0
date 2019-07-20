Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BE16EEF5
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 12:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfGTKNV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 06:13:21 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:47119 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbfGTKNV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 06:13:21 -0400
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 6C212100008;
        Sat, 20 Jul 2019 10:13:18 +0000 (UTC)
Date:   Sat, 20 Jul 2019 12:13:18 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: sunxi: add binding for Lichee
 Zero Plus core board
Message-ID: <20190720101318.cwrvv5r42wxx5k4r@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-8-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tbawuqihxzlp3rig"
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-8-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--tbawuqihxzlp3rig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:33AM +0800, Icenowy Zheng wrote:
> The Lichee Zero Plus is a core board made by Sipeed, with a microUSB
> connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI Flash.
> It has a gold finger connector for expansion, and UART is available from
> reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 or
> Allwinner V3L SoCs.
>
> Add the device tree binding of the basic version of the core board --
> w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes since v3.
>
> Patch introduced in v2.
>
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 000a00d12d6a..48c126a7a848 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -353,6 +353,11 @@ properties:
>            - const: licheepi,licheepi-zero
>            - const: allwinner,sun8i-v3s
>
> +      - description: Lichee Zero Plus (with S3, without eMMC/SPI Flash)
> +        items:
> +          - const: sipeed,lichee-zero-plus
> +          - const: allwinner,sun8i-s3

If the S3 is just a rebranded V3, then we should have the v3 compatile
in that list too.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--tbawuqihxzlp3rig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLpPgAKCRDj7w1vZxhR
xT52AQD0kOEpggd3u1F6vzeXOaF1YxkUwch5ZW4r06buXM05zwD/Wz2S9sLdf/gQ
ZpMu2hf/5JhGlMh16kEANqiMZGngbws=
=1064
-----END PGP SIGNATURE-----

--tbawuqihxzlp3rig--
