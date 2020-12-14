Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DAF2D9CE6
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 17:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440312AbgLNQny (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 11:43:54 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58975 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2440301AbgLNQnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 11:43:33 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 72FEF3FA;
        Mon, 14 Dec 2020 11:42:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 14 Dec 2020 11:42:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+Z0W6DSS/5RY5S9CO+WB5sz6dtt
        PRA/z0CeH3Ghi4oE=; b=q1yOCS+HteWDw0h4gmyoV76fzY/g8o/rkhFqVIjWaEF
        SOXCSHMcqZzBrPBAF2/JK4g8qmS5CMPXo8gP72XbvgbFeh8UggyyM9XUECguf+MQ
        +CRRDLW57S1N3wqnHtAhnwdXlSEPH5BkVOQl+xt39G8ASNt0dmk2C1DvsKmp2NYX
        0XvwMytaOAwIM2/atZpIsP4JiaNZWwR6+eaz2SBwREol/fHilnU1EZvAq5yeHvV3
        er6NvWGVCbCrrTQ0bcVFKtJqwhU3SDPyA8Nmj7M1PeyLosarXD6lMfqIhv94P0ia
        Mj1H+AsfUFWNvuUyn6w180fye4KV87bS5ix0EhGQiMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+Z0W6D
        SS/5RY5S9CO+WB5sz6dttPRA/z0CeH3Ghi4oE=; b=Dk0es85cfh9cD9DPwtv13e
        Zi6iB5LoBCZi9qo3FPKv57rE9VLiVZG+cHHAWGLoKuZR/QPInGIov9DwcGq5Y+a4
        eSPVT9r445nU3GpCoHi2xiNwVsh6doFBfdrL96Brb14f4tXMjWlvg+M4/rDm9N26
        bfQs2D+UZN4pZxExDNaNRrQWxqD2KE3vtXdaW0/dXPgaUMufq7PHh1qCRNNPd4GB
        OIoTGBUmg3T8jwWJJRw1t76QmS9DgmBagyjvz4XBt3UhKClxKR8VJ+L5g5IinTlP
        EcwaD73IZsJ4JBzGhPsMMvzjZKTvHWYBfO4aBXAtznE1W4HGycwaPHNnSQrlg7iA
        ==
X-ME-Sender: <xms:A5bXX40Oiq0pxpNMl6NGxS35hIGV0lAOGVerfrdIKVAiwTFPzs58HQ>
    <xme:A5bXXyLbPysGJ8gQPjL854JffhMW_kIv6Ihh6IwY3GLsLapH4-5IefJPyCkzx-uvs
    a0Bh0ZA_XkxC_Ojm00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BJbXX3GX9dvfW_BNeIga-imAy6es3d_o1H6FuCRbCKnKqAr-11F8BQ>
    <xmx:BJbXX-UetlxfR69dTvHg5E_2z6NxNxde8wAp0rdS01kz3QKQ4ijk_Q>
    <xmx:BJbXX_xzp1Ki9UCvoD5yW4k8vBXx-APhqyImY8MDGGnxjSHv1zhkGw>
    <xmx:BZbXX8eD5X5DfWsz4FXb9lIpqLYvv4DsVgZCtY9tTd9Cp4_1fvDBRg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C6D1124005D;
        Mon, 14 Dec 2020 11:42:43 -0500 (EST)
Date:   Mon, 14 Dec 2020 17:42:42 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH 05/12] pinctrl: sunxi: add pinctrl driver for
 V831/V833
Message-ID: <20201214164242.aevn5wghn26e74sq@gilmour>
References: <20201212040157.3639864-1-icenowy@aosc.io>
 <20201212040430.3640418-2-icenowy@aosc.io>
 <20201214142118.bxdzu7z7cdomhgy7@gilmour>
 <5C8F8115-4DE6-4000-84DF-8D3BE2574713@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lryc4p36xq4m6xdc"
Content-Disposition: inline
In-Reply-To: <5C8F8115-4DE6-4000-84DF-8D3BE2574713@aosc.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--lryc4p36xq4m6xdc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 11:19:48PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2020=E5=B9=B412=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8810:21:18, Maxime Ripard <maxime@cerno.tech> =E5=86=99=E5=88=B0:
> >On Sat, Dec 12, 2020 at 12:04:23PM +0800, Icenowy Zheng wrote:
> >> V831/V833 are new chips from Allwinner. They're the same die with
> >> different package.
> >>=20
> >> Add a pinctrl driver for them.
> >>=20
> >> The difference between V831/V833 pinctrl is implemented based on the
> >> user manual.
> >>=20
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: linux-gpio@vger.kernel.org
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> ---
> >>  drivers/pinctrl/sunxi/Kconfig              |   5 +
> >>  drivers/pinctrl/sunxi/Makefile             |   1 +
> >>  drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c | 743
> >+++++++++++++++++++++
> >>  drivers/pinctrl/sunxi/pinctrl-sunxi.h      |   2 +
> >>  4 files changed, 751 insertions(+)
> >>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c
> >>=20
> >> diff --git a/drivers/pinctrl/sunxi/Kconfig
> >b/drivers/pinctrl/sunxi/Kconfig
> >> index 593293584ecc..fc13335a3eda 100644
> >> --- a/drivers/pinctrl/sunxi/Kconfig
> >> +++ b/drivers/pinctrl/sunxi/Kconfig
> >> @@ -73,6 +73,11 @@ config PINCTRL_SUN8I_V3S
> >>  	default MACH_SUN8I
> >>  	select PINCTRL_SUNXI
> >> =20
> >> +config PINCTRL_SUN8I_V83X
> >> +	bool "Support for the Allwinner V831/V833 PIO"
> >> +	default MACH_SUN8I
> >> +	select PINCTRL_SUNXI
> >> +
> >
> >We're not using the wildcard much, and I'd rather be consistent with
> >the
> >name / Kconfig option scheme used for the clock driver (and the rest of
> >the SoCs in a similar situation)
>=20
> Well, call everything V831, or call everything V833, or call things usabl=
e=20
> on V831 V831 and things only available to V833 V833?

It would feel more natural to have everything called v831, with things
v833-specific obviously called v833

Maxime

--lryc4p36xq4m6xdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9eWAgAKCRDj7w1vZxhR
xe/dAQDpgTTCJbOrDiCeLVgRzVrqTjXtVMYwgo1nT5k8wHiLHAD/S/zXMmQVxRhq
wXN7VkZ5kBNAAygKElNawmYb1GA6LA4=
=F/ni
-----END PGP SIGNATURE-----

--lryc4p36xq4m6xdc--
