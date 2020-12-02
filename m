Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2CE2CC162
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 16:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgLBPzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 10:55:12 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36155 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728445AbgLBPzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 10:55:11 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 23BFD580144;
        Wed,  2 Dec 2020 10:54:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 02 Dec 2020 10:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Mmi4j+UTq2FqhYaEBRSBizn96jc
        nUZmACjVfddhLXyk=; b=QoAt1zvQsXpXBQoE9FgFbnYcLY+K6rayWM+ygDHGxNW
        CZf18kpf+rKbiYzDD17i7JlEGSa9/4fEjG95XNv1CdXY47cs65PEkR4YxxflYqeE
        txsOWZQxjaYuiRnvFp1skHqkEKiQZgqu0xdbbgRuXDCIYBgq5uUwRvoYavWEbnIh
        Yeo3zTlY50pHou6esYJj6uxEWJSc0HCZXB8Qp4c+gvNWASHtLIOd9GumE2cnl/7n
        0b929BkhC2khX8F33KKWkAUcsjh+3B/oExzACIAbhT0lYEOIURMUBV26UBElBV5T
        f3Bn5y9RAPNcA8CuDKu7aW0jOvt/LckAwPmaW0m1qfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Mmi4j+
        UTq2FqhYaEBRSBizn96jcnUZmACjVfddhLXyk=; b=BJ0qNLXCX+Tp46fifDqJ+D
        J0nzo1aNVFHEwCyhuW/LrgYGwOIsX/gVimecZQE4RfUacq9wrET9KXNT6tP4jyII
        bqW/r2SaUVXpvvaFA1nSS0FW8XAeGjlLS1NxH2f3lmtJC8GeSqpeXIqsjZEPToON
        0pGVtpzGn1TyZIUfNTKKKF2oMDj5l6NTK5H6wkT/yXbyMnVkbjaLzDay0GulLI8r
        8A9RIBiOhf4PTIqbLIKM7BAaFlKJgWyFwVhsm3x4csCzYABpy6XIv1+xQX7f7Vew
        6rZYPtPm1woukLXMNaSbITtQVafz9LBtHzdGVvPtEbhRP0keFJHSAZ1jwMMjhtsw
        ==
X-ME-Sender: <xms:m7jHXyNmNXsP1a46zIG9kCePAepJKCH6TWXQLcKQtDM8DnWCjqHN2A>
    <xme:m7jHXw8LujnO1I1XJjXt2LVtldiCQqLz0yJwWVipI-AXJQWKdlk2F8Ci6Czi4wlab
    fnxzzmYQQSEo-y2O9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:m7jHX5SHWuWafEONR66r2zlOHKL9rDBkWCkZJV8U9Oruaa6LdSrYSw>
    <xmx:m7jHXyserpbkw3GEMVn0UywRiiQxdeNkpzytWn2MAK1gl0OW9Uq67Q>
    <xmx:m7jHX6c-Je2P4MttFkCFuRYUcCXrwe49P1tLerQ7-bqah35ycR8T7Q>
    <xmx:nbjHXxx9yherwMO8uAFmdNICHiUSH0iJ-Oaibedc2oO0vleaSy9nFQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CB77E240057;
        Wed,  2 Dec 2020 10:54:02 -0500 (EST)
Date:   Wed, 2 Dec 2020 16:54:01 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/8] pinctrl: sunxi: Add support for the Allwinner H616-R
 pin controller
Message-ID: <20201202155401.k2sdaqlsd4usp3fm@gilmour>
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l7azwvyoleq3e2mw"
Content-Disposition: inline
In-Reply-To: <20201202135409.13683-4-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--l7azwvyoleq3e2mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 01:54:04PM +0000, Andre Przywara wrote:
> There are only two pins left now, used to connect to the PMIC via I2C.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--l7azwvyoleq3e2mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8e4mQAKCRDj7w1vZxhR
xedmAQD53NOuiRnfmmo6OKI/kcwTdx7aJhr92jOF3VAoJvZcMQEAjIlWwzvL/L18
JegkfZIWTroS2io838I2IkLJuepyzQ4=
=Ozkh
-----END PGP SIGNATURE-----

--l7azwvyoleq3e2mw--
