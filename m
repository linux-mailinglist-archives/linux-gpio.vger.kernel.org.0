Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7FA01E08FE
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 10:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388970AbgEYIi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 04:38:56 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:60051 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388956AbgEYIiz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 04:38:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5E846580667;
        Mon, 25 May 2020 04:38:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 25 May 2020 04:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Ri9qjiyBiEOXkk9sDHg2CFYrqxt
        dn6182rnMUiHzyQg=; b=wPjwDdTkJR4Lp6Yfr/SrGcmK14AkrgGuJKhIUhXtOO7
        kMZI1RHjkF5E7Wzsn7OUnTMhAUKVaLhgbaPTd9DNASGUT+1KlrA8rOgSRxKao7kL
        u+72wmN5nSMzn3/Ghcip9MBKf7R4UjuX3nCzCwR5ffkvMkEBNZpFhAo0uZV5psy7
        981pfkM7r85+Ts+/ZQIAyCjlLBK8eVisb3tt2gYxYtdKlXSW70olDxKvCbzcFLLI
        6hTKRyT+GC28s+5K9P9KRDrioiCnMzxTQcKGIfHnTky10M7eocaOywIYm2TaQL3v
        OsglDFb7zn5QxjszzTRsRrl6nqsjKks7mcWVTopGknQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ri9qji
        yBiEOXkk9sDHg2CFYrqxtdn6182rnMUiHzyQg=; b=uIft9tDeyiLzqqol7PCgsf
        lqMFLj8KRw2qT5IU6ChMSbZbl6uwfC3bZ4KnK+8WjG3ZgI8k1VpJDSm8QTZOH1B2
        x97ycbKQZgOSTENs7sfCiWAz3ZIROAFQSgnhVXVdCrY38ilZzDIuyKFz7yeAA7RO
        s6xH68rFCQz7K1HlSsZtf105gFVsKWHa8aOoyvYy0t/TrJct4lD4tUBMbufezhF0
        j0tBguvumOmy4h2rRA7FNvicKKvvjAZ3AM/IsP+0iayfF+NFS/Fhk5+ltsNKDtnI
        UP1A9TQcNenYXY/pvU4PF2TptCErYeKO7R0hI6D/hGNUMuQvc5BdVXVKezaVAoTg
        ==
X-ME-Sender: <xms:HoTLXjW0aGOkAZeejOU6kHnP1qaX3BZj41LQ9Ky5fi_KmAKMY8lcMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvtddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HoTLXrl0TsQ8zSmmJJv5ZgBg1ACl2BJlMUVdhISRxjEAd9M9UhfsZg>
    <xmx:HoTLXvZAMhI81gTw0m3c6MGE1AFAhP0m_KEUMdcjURChQqeSMryuqw>
    <xmx:HoTLXuUYbmHWrpQMeXxaVRdAYYQbNZ92gl0D1SMVfWj_idoC3VraQg>
    <xmx:HoTLXmdWF94R7p0M4Dtu3DJ7Yw0f0LU2rF7tHaFpPkLX5px-1TZrCQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC7753280059;
        Mon, 25 May 2020 04:38:53 -0400 (EDT)
Date:   Fri, 22 May 2020 17:31:24 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     wens@csie.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
        huangshuosheng@allwinnertech.com, tiny.windzz@gmail.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: allwinner: A100: add support for Allwinner
 Perf1 board
Message-ID: <20200522153124.patpj7r6hubjnpmu@gilmour.lan>
References: <20200522030743.10204-1-frank@allwinnertech.com>
 <20200522030743.10204-5-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kztrqmb2mweybzef"
Content-Disposition: inline
In-Reply-To: <20200522030743.10204-5-frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--kztrqmb2mweybzef
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 22, 2020 at 11:07:43AM +0800, Frank Lee wrote:
> A100 perf1 is an Allwinner A100-based SBC, with the following features:
>=20
> - 1GiB DDR3 DRAM
> - AXP803 PMIC
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - on-board Nand flash
> - =B7=B7=B7
>=20
> Adds initial support for it, including the UART.
>=20
> Signed-off-by: Frank Lee <frank@allwinnertech.com>

Which bootloader have you used to test this?

> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../allwinner/sun50i-a100-allwinner-perf1.dts | 27 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-p=
erf1.dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index e4d3cd0ac5bb..ab780dbdd17b 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinephone-1.1.=
dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinetab.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a100-allwinner-perf1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus-v1.2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-emlid-neutis-n5-devboard.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> new file mode 100644
> index 000000000000..32c9986920ed
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (c) 2020 Frank Lee <frank@allwinner.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a100.dtsi"
> +
> +/{
> +	model =3D "A100 perf1";

Having the same casing and the "brand" would be great here, so something li=
ke
"Allwinner A100 Perf1", or just Perf1 if that name is only ever going to be=
 used
on the A100

> +	compatible =3D "allwinner,a100-perf1", "allwinner,sun50i-a100";

This binding needs to be documented

Maxime

--kztrqmb2mweybzef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXsfwTAAKCRDj7w1vZxhR
xc2nAQDFNKJNA7ecm5DJ6UkyDw3MuKEnfkK0bTsPHjkFxg3Z7AEAzetqnArNS6h2
o2VsK50L0OmgTGiE3EBUOEPJj669XwE=
=5KLY
-----END PGP SIGNATURE-----

--kztrqmb2mweybzef--
