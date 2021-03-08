Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1FA331279
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCHPp6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:45:58 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:47049 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhCHPp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 10:45:29 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6D77358076B;
        Mon,  8 Mar 2021 10:45:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 08 Mar 2021 10:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qc3IVkUwpKxiQwYWY9vhXc66NlT
        4SAHkuz3yHGTAYnA=; b=XYT8/kpBeWXXKwTXdlPxquUxb5651KDDu2Pc/VqJ9Fw
        BJ9ak9AAI8W5YcJE5p/ertQcBuPT5ioDmhQccf7cA48TdAbvHUxwsukS8VR1TzZO
        KAcV8A1hMZEwGW7xYXMfd9qjZAV8jbPbTJ3rT9LjbHVYluu6/XwxlaOl3lNsl2zD
        UuySP+qOwXo64I30k4codE2HZuIMa2E8FgiFZdBeIH40I+desCVzgJU5NaOKfvPo
        EqF9xgOS8KmkRZWdD7o5RUPlRAhUTB2+ozQQ0pyaTBuFUQ1wLqqBMGpu/O+tkoaE
        kHRgHF8UL2gxyidoUd45PMqUzEakdrKwS7GIf0Od0bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qc3IVk
        UwpKxiQwYWY9vhXc66NlT4SAHkuz3yHGTAYnA=; b=mSviPQk/oIGtwAAt5aW7bN
        5A07xKQaoTH7+zG+Qnt7OhLpLLIqroA0D6IkiuLvwby7EwgHxq3xXnZZkpnDhHED
        mkrdye42tk82Ph1WMFAJb7eXjqDl9SHliuglaREWv8r6kVm0y7QG9bUx6QwPS/wK
        7KZ9CbVGBZz4b/Kryastn6kGz6HY1vpRSE8WowDcOu4ogKEcF6XnnnF7JDfw1SRL
        ieMFWNL4nKMe57jObRsv8LP855JD2adGtQI3K4h2WPdqtyeCHZCOEfxstg/ZptN7
        b+sr1B+ZMZ0zlSEJUXa8EmVgYu4kFtsXRmUfRgYZ+zp+r+AZgJ1cMyMVK8Nh5qhA
        ==
X-ME-Sender: <xms:lEZGYNCarRpb21GEn6Eba_NYl7erMBuE15nr56jvJourkbkn3aevfQ>
    <xme:lEZGYGbUlNpjQHNWbGPR29NgCqna-XD8cHXFUKvAEzi0Oc6eFBxup5FVT5NxVl8cM
    v4fLAWhSOrOhY9924o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lEZGYAbUaG3Tav7JlxVBh1E8BW-poBzRP3nRth0OxEn7YUrGoaYk0w>
    <xmx:lEZGYF-4kdsfmSKR32vdk_N1aFudSxE344fHw0XW6D3uTcT1Hd_eSQ>
    <xmx:lEZGYHjoZJt3BDCkxHiqx6b7j4lrEe4YepGhxFttI5r5yG7gpR7VgA>
    <xmx:mEZGYOJekUwqy4kmwc3GN0f1vE8zC77HFmKZ7Uy_DK9J-Jz7YuB8Hg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6758224005C;
        Mon,  8 Mar 2021 10:45:24 -0500 (EST)
Date:   Mon, 8 Mar 2021 16:45:22 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805
 PMIC connection
Message-ID: <20210308154522.mkbxh3dpxidxhzzs@gilmour>
References: <20210103100007.32867-1-samuel@sholland.org>
 <20210103100007.32867-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wnc5wrbsyokytltm"
Content-Disposition: inline
In-Reply-To: <20210103100007.32867-5-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--wnc5wrbsyokytltm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 04:00:07AM -0600, Samuel Holland wrote:
> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
> PMIC, configure the connection to use the RSB bus rather than the I2C
> bus. Compared to the I2C controller that shares the pins, the RSB
> controller allows a higher bus frequency, and it is more CPU-efficient.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks

Maxime

--wnc5wrbsyokytltm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYEZGkgAKCRDj7w1vZxhR
xV1zAP0dY5wXW8BW5mbE+J3SUziA79rXyUNU7WgazhU7htgleAEA3o5GrAotOGGD
LxGr99nLKfWaa7x2MVKcAgFJOPzIsgM=
=oxjb
-----END PGP SIGNATURE-----

--wnc5wrbsyokytltm--
