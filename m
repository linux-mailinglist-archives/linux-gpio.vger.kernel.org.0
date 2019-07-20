Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC1E06EEC4
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfGTJox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 05:44:53 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48111 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbfGTJox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 05:44:53 -0400
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1A045240004;
        Sat, 20 Jul 2019 09:44:49 +0000 (UTC)
Date:   Sat, 20 Jul 2019 11:44:49 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 4/8] clk: sunxi-ng: v3s: add missing clock slices for
 MMC2 module clocks
Message-ID: <20190720094449.dh53rbxz3mc74qls@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-5-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bygt3ojtr3w3kmjg"
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-5-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--bygt3ojtr3w3kmjg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:30AM +0800, Icenowy Zheng wrote:
> The MMC2 clock slices are currently not defined in V3s CCU driver, which
> makes MMC2 not working.
>
> Fix this issue.
>
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> New patch in v4.
>
>  drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index 4eb68243e310..9c88015d4419 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -513,6 +513,9 @@ static struct clk_hw_onecell_data sun8i_v3s_hw_clks = {
>  		[CLK_MMC1]		= &mmc1_clk.common.hw,
>  		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
>  		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
> +		[CLK_MMC2]		= &mmc1_clk.common.hw,
> +		[CLK_MMC2_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC2_OUTPUT]	= &mmc1_output_clk.common.hw,

You're using the same structures than mmc1, I guess it's a copy and
paste mistake?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--bygt3ojtr3w3kmjg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLikQAKCRDj7w1vZxhR
xXstAP4hG1qWU5aKOgq2MiLh0TPYedRrhD3NFX8NrLDp9uXWBAEAzaBusAgbeXvL
Geinke2sdGlDUaGa2D8WiG7b9POqBA4=
=hmf1
-----END PGP SIGNATURE-----

--bygt3ojtr3w3kmjg--
