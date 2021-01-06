Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CD02EBCF3
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 12:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbhAFLEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 06:04:51 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50679 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbhAFLEv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 06:04:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 87F0A580055;
        Wed,  6 Jan 2021 06:04:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 06 Jan 2021 06:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=SG0jngfQb86fRNUTTrwZ6PDjCut
        dxkonMnVRfFVhezw=; b=pIHOT/0WmC9nD1USAxUNB7b1LMUjHaOcQt1j1aPM78X
        +as8WpDs8IP30nbAqM4Y37TmkxYl/E4EV1vIdyhFmN5wrWsqjAEDP+xRCVGSPz12
        d7K+BqHKO1hsWKaWxDCmdQIQ/Rw4y/IVzLu14g1K4Scze6Xgy2M60HC/ICADj+dx
        JFWZW8yW+c7bCBS5Rr+P2fSWgc0wGEsUl/S+Yu2VSf86HYJgNUrw/nsf0e96PAlS
        hTJvLHs+jFEgDz7cLZ6eeJrm9m7Kyov2AV1OtC0xXw8QjOevf6CSY11PKKlqbDH8
        /0whRrslw51+Cc4zBxGxmtS4hBMctSkIMCP+hYlKu/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SG0jng
        fQb86fRNUTTrwZ6PDjCutdxkonMnVRfFVhezw=; b=UQC2yPXQw+pTC+6NnJF9Y3
        XlRT2wfF6j+eQbuVE6KWJHvok/u/DUQmNGIII/qLNvXNy3RpoW3l8K5x7t9SGvxf
        R61GGGE6FnX3g1evbqfYcF46JDrtD+3w1qAZvmlTjWq5qYsoIiP991Jr7B9K86W7
        znmK0P6Qm3hDtlW2AeI3HDy7ZyQ9AfAWBSLEfwTpbbT7wqgIiROlC8nNT5kTfzAr
        P35sitIxILptqsy7pDgaay/bZjOCqEpHigraLBUjQ0w6VhlwFPlg4vYWI6QfLq1O
        Iow2J9AOG3aRh0ydSYhLi0p63b4gRJnoGNqjZ4LFPVPtG3j0KtgjRJ7W+K152/EQ
        ==
X-ME-Sender: <xms:Ipn1XwZ70NTBxx38-HZ7wTlqwgfix_y-vkP-9RwO8Y8iSN6sVTa6gA>
    <xme:Ipn1X7bhydC36R-7bNyjuCb9AoAaKBJTfoHTt8u386SfVB8YLv3BwRE5fGfLmsYad
    FkVRQbq4ej3f0WD2_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Ipn1X6_25iVF8WOEMgP5uyUzkntj1w0LHwIS5Sxi4r4VCS6C6sNzqQ>
    <xmx:Ipn1X6quLxXu_B7DyE1XN7m-r_R1P_r7_L4SlbWgwRSGUsqPEuUsYg>
    <xmx:Ipn1X7reNYk5c8tB38NY8jO6QSbUAqOvnepAfVrcOPkcdBxViCLO2g>
    <xmx:JJn1X5iNBw9Lxke0lHuRVQXaq5f5U00IEwwP5-FKlc6s9_fguwxIfA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2E6E924005A;
        Wed,  6 Jan 2021 06:04:02 -0500 (EST)
Date:   Wed, 6 Jan 2021 12:04:00 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 0/4] Allwinner H6 RSB support
Message-ID: <20210106110400.kjy2zjxgakpgya7z@gilmour>
References: <20210103100007.32867-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="la7j4ywkx3wucev4"
Content-Disposition: inline
In-Reply-To: <20210103100007.32867-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--la7j4ywkx3wucev4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 04:00:03AM -0600, Samuel Holland wrote:
> The Allwinner H6 SoC contains an RSB controller. It is almost completely
> undocumented, so it was missed when doing the initial SoC bringup.
>=20
> This series adds the clock/reset, pin configuration, and device tree
> node needed to use the RSB controller. Since RSB is faster, simpler, and
> generally more reliable than the I2C controller IP in the SoC, switch to
> using it where possible.
>=20
> This was tested on an Orange Pi 3 and a Pine H64 model B. This series
> does not switch the Pine H64 to use RSB, as doing so would prevent
> accessing the external RTC that shares the I2C bus.
>=20
> Changes v1->v2:
>   - Put the new values at the end of the DT binding headers
>=20
> Samuel Holland (4):
>   clk: sunxi-ng: h6-r: Add R_APB2_RSB clock and reset
>   pinctrl: sunxi: h6-r: Add s_rsb pin functions
>   arm64: dts: allwinner: h6: Add RSB controller node
>   arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection

For the whole series,

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--la7j4ywkx3wucev4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/WZIAAKCRDj7w1vZxhR
xYQfAP0d0eZgjSBWZRWwRpGm3npd9OZT4IBHcLq5qGPlR+h4WwEAjcQnNk4svGm7
TgMNdaPKl4FKMqLUEGlbQ2VA7vMmCQw=
=ENtI
-----END PGP SIGNATURE-----

--la7j4ywkx3wucev4--
