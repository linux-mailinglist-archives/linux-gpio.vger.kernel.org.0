Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149E86EED2
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfGTJqf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 05:46:35 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42243 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfGTJqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 05:46:35 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 743D6FF803;
        Sat, 20 Jul 2019 09:46:32 +0000 (UTC)
Date:   Sat, 20 Jul 2019 11:46:32 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 5/8] clk: sunxi-ng: v3s: add Allwinner V3 support
Message-ID: <20190720094632.6plwtvt73xlnucw7@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-6-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qzyk6exegy3asgml"
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-6-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--qzyk6exegy3asgml
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2019 at 11:46:31AM +0800, Icenowy Zheng wrote:
> +		[CLK_MMC1]		= &mmc1_clk.common.hw,
> +		[CLK_MMC1_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
> +		[CLK_MMC2]		= &mmc1_clk.common.hw,
> +		[CLK_MMC2_SAMPLE]	= &mmc1_sample_clk.common.hw,
> +		[CLK_MMC2_OUTPUT]	= &mmc1_output_clk.common.hw,

And there's the same mistake here.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qzyk6exegy3asgml
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXTLi+AAKCRDj7w1vZxhR
xQjRAP9ST2/2c5sjUdw8/ITU0eEvk6+5Bu5SYQ2ltWVX6cOWFgEA9vegVFVC4LnG
ZendV+/AhkM+QvA9ziMPeStbZE5x+A4=
=nSSY
-----END PGP SIGNATURE-----

--qzyk6exegy3asgml--
