Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0582C50AF6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 14:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfFXMmP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 08:42:15 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59829 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbfFXMmP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 08:42:15 -0400
X-Originating-IP: 90.88.16.156
Received: from localhost (aaubervilliers-681-1-41-156.w90-88.abo.wanadoo.fr [90.88.16.156])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 404F240003;
        Mon, 24 Jun 2019 12:42:04 +0000 (UTC)
Date:   Mon, 24 Jun 2019 14:42:03 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 8/9] dt-bindings: arm: sunxi: add binding for Lichee
 Zero Plus core board
Message-ID: <20190624124203.r7vnlt6zzufoarte@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-9-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cy2cjgv5uk45c43g"
Content-Disposition: inline
In-Reply-To: <20190623043801.14040-9-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--cy2cjgv5uk45c43g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Jun 23, 2019 at 12:38:00PM +0800, Icenowy Zheng wrote:
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
> No changes in v3.
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
> +

I didn't notice this before, but since this is not a LicheePi, it
should be before it, not after.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--cy2cjgv5uk45c43g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXRDFGwAKCRDj7w1vZxhR
xWDFAP0Y+QF1gRD03fNZay8zwpfjSHFM4HcoRPfupe69+PB8TAD+O/AyTfqRskCn
LbtnGo65oy2DluEVWm+GvZbBIm5TrwA=
=yx+D
-----END PGP SIGNATURE-----

--cy2cjgv5uk45c43g--
