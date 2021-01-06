Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093AC2EBD01
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 12:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbhAFLHe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 06:07:34 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:43431 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726098AbhAFLHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 06:07:33 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B5B995812B2;
        Wed,  6 Jan 2021 06:06:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 06 Jan 2021 06:06:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=pKsVdMArbxuwwiMUH/SwaIc1g1Q
        g7FH/nG0HUKbrznA=; b=jscJijtSsOzPb964OVCl9N7lQ90TfXpDTLUjmE/dONb
        GqJJW9/mW0wQ1/gw/VgMH8+hNRq1AkRR/37mdBMKcYawX7tnWl34cchoLkWpnpVg
        aZ2yy9iYAldGC2XKxg2yEhnMOa+It24zZ+bztZifXjqnyPU7Agiudf+NntcqVdaa
        syI48334WbSofOidM2Dku2tDGgH6EX3wCUSTnXFlMDsU46nrSCcLP80jbemAZ4W/
        xDTHiKPgmwySISq7gVbqsCaFdIHkRBKrs1CdDGPFQOzQVRXNGlxPADo36zUU953u
        EvKdHmOqN+fRPxd/QSpzo/EZrNC384bEgAC4qU0RLEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pKsVdM
        ArbxuwwiMUH/SwaIc1g1Qg7FH/nG0HUKbrznA=; b=ROJ2Iw57s6rFnp4ratvReo
        EqsTahyop2RTg7SQMq2pH2HBBOmNLi8M3lkh9ARNhbcC6sTbY4TzdIbl5VVi8Agq
        8g4xf7lO54H9HtyyJzpNDqc2DTdT3aBqJbEik6tyHmKLNEVOob3WTTrvhKm7Sp88
        65JP2BNPreSnUgMKxcYtToZUeDjI5ot2xxCy7eJX9ccbhAlYe5NHvrFnUK6QIPb5
        qQKSJSDzcGOugmSK/KQEi6jbi3d9eMBWysDFv9xh2z/Tg2k0GswGhFXfrBN2QHUR
        yAZ53mj/Go+/ODOQV9U3VV4scplefOETZl0CF29jc7eL0PN3eHeCdXLGAfWhRfeA
        ==
X-ME-Sender: <xms:xJn1XwvWwTowIblVuTmnbpE2kK4fJT8CkJ9UKXF22VdSc3wE67z11w>
    <xme:xJn1X9cg8E7lhxTl1VLt8qP9KZYavx_4_oP_vMFSklFBklLhz7qwdYbhcpkellDLD
    VGv7r2MfXG3gVKAVtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefledgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xJn1X7x9Uwmd1QE-1kujQeU57fGHymTm6t85qEkunEEIQo6BO4eVaw>
    <xmx:xJn1XzPdtjFZ3hK_Pd1ft98y7V9nmdczUMMGeMmzX5l_tqZnv-zJKw>
    <xmx:xJn1Xw_F39bPmhWJxc8A2SXxyLhfqGsMn7TDF54ETkhEgxegC3PXqA>
    <xmx:xpn1X7XJAv4Q9Q8ZakD7K334YG2CQ2F1pLW9SxHk8V8qWTyHBwek6A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A5F901080068;
        Wed,  6 Jan 2021 06:06:44 -0500 (EST)
Date:   Wed, 6 Jan 2021 12:06:43 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?QW5kcsOp?= Przywara <andre.przywara@arm.com>
Cc:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805
 PMIC connection
Message-ID: <20210106110643.agq3mjyhgvg3w4i6@gilmour>
References: <20210103100007.32867-1-samuel@sholland.org>
 <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zcdfvxiqryncz7fp"
Content-Disposition: inline
In-Reply-To: <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--zcdfvxiqryncz7fp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 10:54:19AM +0000, Andr=E9 Przywara wrote:
> On 03/01/2021 10:00, Samuel Holland wrote:
> > On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> > PMIC, configure the connection to use the RSB bus rather than the I2C
> > bus. Compared to the I2C controller that shares the pins, the RSB
> > controller allows a higher bus frequency, and it is more CPU-efficient.
>=20
> But is it really necessary to change the DTs for those boards in this
> way? It means those newer DTs now become incompatible with older
> kernels, and I don't know if those reasons above really justify this.
>=20
> I understand that we officially don't care about "newer DTs on older
> kernels", but do we really need to break this deliberately, for no
> pressing reasons?
>=20
> P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
> just want to avoid breaking existing ones.

Doing so would also introduce some inconsistencies, one more thing to
consider during reviews, and would require more testing effort.

I'm not sure that stretching our - already fairly sparse - resources
thin would be very wise here, especially for something that we don't
have to do and for a setup that isn't really used that much.

Maxime

--zcdfvxiqryncz7fp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/WZwwAKCRDj7w1vZxhR
xZXjAQDukCQUSLlAvITRHzLuUWbe+mCBztGFHfTNBxJtobY2DQEA6uy0PngjoW4c
SBgn/rWM7lobJgaKVBuQMIemlcNbFwM=
=jmY+
-----END PGP SIGNATURE-----

--zcdfvxiqryncz7fp--
