Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8122D9574
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgLNJpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:45:49 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:57843 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725915AbgLNJpt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 04:45:49 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 23F5A5804ED;
        Mon, 14 Dec 2020 04:44:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 04:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=XKcGwNFJ8S2jYlC9CVP6MD9GTEJ
        SheLjaMSdlnbXVRw=; b=kdr/nac+m4TY+HliojMi6gdQuCKSvWCeDrCHLDMbpgg
        EV5DwbUuYWYNeKZM3kKOvcFOEeNuQGRpl1qA5O2H6qHIekW7nh5Oxal1W8sdAQA7
        2TVFgRK2WluLWnT6mhcCWYp+sX57UaQJcl5f24205OY1SY4Vp64eNonNAmkvgj8E
        dufOaefCHVFKkFNp/tTYmcZ/SasTtxYiuDmT2rIsff7Hqmr43qgbmx+pGWprx1s/
        TccCtl3Lzcun7g3JMnQT9eQxOebC4ugchSyepcozK9i8e6bnhQXb7GRe9qmMPlEO
        tR9l5baEviT66O9DTasffm0pZ1v1bZkkjiZqPaNE+gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XKcGwN
        FJ8S2jYlC9CVP6MD9GTEJSheLjaMSdlnbXVRw=; b=AXr9SdKAyy8ApuBvKMC7xH
        gqT/ZNkwPY1fZJCJFF5qGLZb5pWZikbN4wpiFu6f4un3dPMH55s4bnbdd3ULduQn
        xPDCetDXkHpLLS+RgCWx5ohNgXaPve4Guq/UgHWopX+5YJwVy55j0ObmFsKWuQSi
        dZuNsJN9WSDRTRCBAq93gQRlVKR/Lv5N2KN4820UDHS8wlQGULqaN/+HpzwJlMDP
        J4KW3IsblO6cvq1nUl32LmxjovbTOLaEke40zjWQDv/OUlDsl0scLHBqW11PFqIP
        ZNtVh0JmXzdRaoqJ+ZQBgY9DlFEWdR4pOAs0Y4nFDL1x8e8hB+cGSBE2O+TgQm6Q
        ==
X-ME-Sender: <xms:CjTXX3sTHK4PjgnyJAn796H_uLuUkBXRkzUWor6bKdObAhVviqnxGA>
    <xme:CjTXXxYn1f6RVA6wSwOaxsNouaPsJCspehm7hNP_pIBzKYFIMsJSgmbHegDEIYqYN
    Y1OW-LMotq0tp_kC-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CjTXX2WwYHSaQm5GlVoaXTDA6N6FOnMpK4eHTG9Yu8GdA0C12_Ytww>
    <xmx:CjTXX2QaM5aRy-psgXYGDfwnkV-fPckzJT53U8-nJ5Hzmn6zsBhGjw>
    <xmx:CjTXX0NvazIrkO-E2Gfr_jfltOynxz_K1jUQkzhUCdI-YlIQqY2qdQ>
    <xmx:CzTXXzSV08L5O9GgIz2kZ8R-uSprqS5Dqbq6VXrO6DmY9jUV2BuChA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D39F0108006F;
        Mon, 14 Dec 2020 04:44:41 -0500 (EST)
Date:   Mon, 14 Dec 2020 10:44:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.xyz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 03/21] pinctrl: sunxi: Add support for the Allwinner
 H616 pin controller
Message-ID: <20201214094430.m6h3pzhkm3kjl2cl@gilmour>
References: <20201211011934.6171-1-andre.przywara@arm.com>
 <20201211011934.6171-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ddy7lofybnowtr2q"
Content-Disposition: inline
In-Reply-To: <20201211011934.6171-4-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ddy7lofybnowtr2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2020 at 01:19:16AM +0000, Andre Przywara wrote:
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* MCLK */
> +		  SUNXI_FUNCTION(0x3, "clock"),		/* X32KFOUT */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 10)),	/* PG_EINT10 */

It looks like there's no i2s vs h_i2s issue anymore? Maybe we can just
do s/h_i2s/i2s

> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD0 */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA2 */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* DO0 */
> +		  SUNXI_FUNCTION(0x5, "h_i2s0_a"),	/* DI1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 7, 3)),	/* PI_EINT3 */

The way we dealt with this for the A100 is that we put the function as a
suffix which is more natural, so h_i2s0_dout0 and h_i2s0_din1

Maxime

--ddy7lofybnowtr2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9cz/gAKCRDj7w1vZxhR
xZ4mAP0aOwSdv1t8DpTbKvaJdsEXW593SqrJq++ZdvC87hlg9AD/T8ZGrdPoyIW/
FKHiOaYy/KAy7FaHa2u4GVKqxJRKowQ=
=wnrZ
-----END PGP SIGNATURE-----

--ddy7lofybnowtr2q--
