Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DB0251A16
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Aug 2020 15:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgHYNqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Aug 2020 09:46:51 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:59541 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726627AbgHYNgE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Aug 2020 09:36:04 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 65773C85;
        Tue, 25 Aug 2020 09:36:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=7OqFabNyx+N0Z82mQXeN3Hi22DU
        8wzugmpsgcjxxAAc=; b=bcy3JWjzx+Hrq3Y2vqf6elJFYPDP8UYPXP2DSl6og5v
        pmOlZr4RYX4Wm+PUG8fOj1DZTQxVq5rmNvHDeXp3G8p+eM0/YBOYpU6z9HpsGAls
        7Y7TtdzPUOq3MKV1u5qdwlEAZGH+3SUnKgEtHXdXe35U9FbC8uasw3sGHUXU/EEA
        /zic2pXjGQNDmmN0n7Sy5GB+dspDyn+J+/X2SEt2uxdie4wIt6l0hxi19pYQOYta
        Wjvsh0EVk0vGxtWJFFkNLiolJ2k3ZuV8pxY6Ayc3i6tbd4/lEU0owqyqP9wvay1Z
        VjPafE+kqpsWoJnziDVmKvnzskQL6kKlGD0+1Ej4jvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7OqFab
        Nyx+N0Z82mQXeN3Hi22DU8wzugmpsgcjxxAAc=; b=kTspOWsKS7dx/DUFjorrvo
        cbOVDjhIOrrdSn16P3oXbyOJZ5pgHYADYLp9KuPEM5hGpCVdI3F0PBBTl8Fe+x78
        nyZl1zNbaMcxt5fxo8ZmZLsq+boQTiuLFDh1HjK0TyU2KcD3dXs1YnOXEwDpWSxu
        oS7CyeYFjSexWN7wX+70NIy8oWdLpn6uLtUtY3RcrKhsRmHwMqwRRy9PYRongBF/
        /mn8OXc/xjarTdAmYLfvfu7FebEFZdgjpvzFkYks6yFOC2LV2VDbdcGeVk1ogxal
        +bxymr92hQzidW5f/nDbHkEZG3xlt3QI5niiMwvxw5VAdns1CocOS6cPIKUDnEyQ
        ==
X-ME-Sender: <xms:whNFX0opHoAo8zOH5DaQoHaDghlSaewsoXhMVQwR_vr7tArAYzwBzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepleenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:whNFX6osHirBaN3cqxuepOv0L0oBcCpzrrPOFJKK3Ll6tv14ApYabw>
    <xmx:whNFX5MYEpu2NSNwe7Ydk_y3Z4Is2Z3RBlsb38GGDogWicwu9_Bcrw>
    <xmx:whNFX770L69KZDcgt9ltCdNMaUUN475gThDNyVDBOszJui1Wm10qgg>
    <xmx:wxNFX5SpL5JVoSSPlkhgV8mgVNCR8r1WUxllMvmnV49ZdEl9t-Ebkg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9A0453280064;
        Tue, 25 Aug 2020 09:36:02 -0400 (EDT)
Date:   Tue, 25 Aug 2020 10:45:14 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     linus.walleij@linaro.org, wens@csie.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tiny.windzz@gmail.com,
        huangshuosheng@allwinnertech.com, liyong@allwinnertech.com
Subject: Re: [PATCH v5 05/16] pinctrl: sunxi: add support for the Allwinner
 A100 pin controller
Message-ID: <20200825084514.kljtmzsv7ymzwqyv@gilmour.lan>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <4e331a2ed4a30c883df6157bc5c52bb686aa8e0d.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ouzsavz3sasybinc"
Content-Disposition: inline
In-Reply-To: <4e331a2ed4a30c883df6157bc5c52bb686aa8e0d.1595572867.git.frank@allwinnertech.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--ouzsavz3sasybinc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 03:05:49PM +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
>=20
> This commit introduces support for the pin controller on A100.
>=20
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--ouzsavz3sasybinc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0TPmgAKCRDj7w1vZxhR
xY+tAQCy/gnMYHM1LroTlS11DuMFnMSMu7iFA/wfeqT5NiJ16gEAxC0knEzq9YSs
jUScI8/EXdWz5VWRd/JcKCPLrUAE4g4=
=D3rM
-----END PGP SIGNATURE-----

--ouzsavz3sasybinc--
