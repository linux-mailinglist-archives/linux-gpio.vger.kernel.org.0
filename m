Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFE12D99C0
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 15:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgLNOWO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 09:22:14 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49457 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2440120AbgLNOWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 09:22:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5CF64560;
        Mon, 14 Dec 2020 09:21:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 14 Dec 2020 09:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=BwtqYUjEM5HK5CeLB7QlKUDY+Fr
        UbzjldMfZjsiMexA=; b=eijK8TGe+PD/AeF4enheqKELlzQdA4ELRqVUObxQ1yv
        dVDm5kPRMy9ciR27jqEopK2YKIrAAnwhEW1lh/j3yzjeshaHFKuc9BWIaP2JRZ71
        RJKs86OzYyNaLRVf/BW97s8G3EU78xh4hWEETtEokz5PjwRiy5UgS4f1/w//aDpP
        IR3158yF6Wu2UkEU6pqG/3CPBOczsL9GHTG/g3Mde1SP/xEpZPDzeq2X6s6BhGv1
        AzUL4ao5cIWXM6io9h+ybrkvNOu/vYUjlzeMcpS5CNPqokdkr0CXAvtvsHVmTox5
        g1YkHIPaKuluDiW6hKS5F1YS/gNXGzvSyo/JM0D82dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BwtqYU
        jEM5HK5CeLB7QlKUDY+FrUbzjldMfZjsiMexA=; b=mQTsI8adGoXRW6GXO/VD4k
        bPUUj4XcctjHyjNJpfZUcSIPPAYtw41EZHsbKkeo0+F+2p1HrHOpKZmHwMNcn+eX
        iOyKruAqDrte3wz97gMGyEBUYIkkriGkco0CAbfp97NaAuUg8AbX9mx1l6TwDRU+
        pfqitCejj42CCqHPzu09DNpxUiLOB2Usxy3ZTXtcMHiIdAsPCFsC+QXkrcPJ/Hqj
        tSPzdadniATteRpoiC9CVlGu5IfJOQeB77VsQH4Wx/edd+T6RrQHry2G+3avQHwx
        RCAey9wqiVjQogiFcjG5/WIaCFxDSEnu05gKmdyl+TlKDSazzEqdtfE4gdkNjxNQ
        ==
X-ME-Sender: <xms:33TXX9q8krFw6mdnBjNcfOnqUytWTnxmahqajXgVTXKe33D0Ibo2kw>
    <xme:33TXX_pgFN7U0c636kngd9U0eQqseThKFbxw_v_1H34IbEKTaDrBff5bLF9Bot8cM
    EO1hR39ai-znuhsEqo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:33TXX6M-pgdX_ztFnNYd7sZ2wpXCWQzMCQ1XLiWrx7z96DBh7eLqew>
    <xmx:33TXX46JNvt72XDoNi3Q9jDlAt2vUMIDSdzolyEiGe2wzK1c4665dw>
    <xmx:33TXX87p-SRrT4lU7pYjpUXeZCD1bcrhZxQm-zK_9k-ywsJmn2_ffQ>
    <xmx:4HTXX5sM8TnWGojtllc3Cua7IL1rPWjqbltcxR_BJ6LfF6CIg_D2Jg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9B2FA1080059;
        Mon, 14 Dec 2020 09:21:19 -0500 (EST)
Date:   Mon, 14 Dec 2020 15:21:18 +0100
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
Message-ID: <20201214142118.bxdzu7z7cdomhgy7@gilmour>
References: <20201212040157.3639864-1-icenowy@aosc.io>
 <20201212040430.3640418-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rchau4rbhiwycv2k"
Content-Disposition: inline
In-Reply-To: <20201212040430.3640418-2-icenowy@aosc.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--rchau4rbhiwycv2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2020 at 12:04:23PM +0800, Icenowy Zheng wrote:
> V831/V833 are new chips from Allwinner. They're the same die with
> different package.
>=20
> Add a pinctrl driver for them.
>=20
> The difference between V831/V833 pinctrl is implemented based on the
> user manual.
>=20
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/pinctrl/sunxi/Kconfig              |   5 +
>  drivers/pinctrl/sunxi/Makefile             |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c | 743 +++++++++++++++++++++
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h      |   2 +
>  4 files changed, 751 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c
>=20
> diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
> index 593293584ecc..fc13335a3eda 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -73,6 +73,11 @@ config PINCTRL_SUN8I_V3S
>  	default MACH_SUN8I
>  	select PINCTRL_SUNXI
> =20
> +config PINCTRL_SUN8I_V83X
> +	bool "Support for the Allwinner V831/V833 PIO"
> +	default MACH_SUN8I
> +	select PINCTRL_SUNXI
> +

We're not using the wildcard much, and I'd rather be consistent with the
name / Kconfig option scheme used for the clock driver (and the rest of
the SoCs in a similar situation)

Maxime

--rchau4rbhiwycv2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9d03gAKCRDj7w1vZxhR
xbPvAQCq17o8gHL1yUSGIQCGeqX51CHQBMYjDd0RI8x/CV4EuAEA/opdKZPWikSe
DNBii3EVWa8xj+3RRyjhq8gfj/VMwg4=
=HJdK
-----END PGP SIGNATURE-----

--rchau4rbhiwycv2k--
