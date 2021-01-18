Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DDA2FA4C5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 16:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405764AbhARPcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 10:32:01 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41273 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405747AbhARP0v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 10:26:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2BA0F580759;
        Mon, 18 Jan 2021 10:26:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 18 Jan 2021 10:26:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=LK5udVspjHQLZOBPj3AOvghu8IB
        7IXzpfmX+3iA0yyM=; b=JUXw6fSJLyuqzUlgdPryxxbBmVR97uUZeEu/DqXnYuQ
        AzPbEFMtfObcCGSi9mha9wJ7c0G0tSRLn+kBA3WFlxO9OAI0+fnCQLY8jQkHXIn8
        8RDrZb1L/JEX5hgv49rJtJU0Rn7xGHhF+i5+5J6lwr2YCs9EqX78NPc0EEHDrE6+
        lCs4+01gYKwpd5hYCd7QuD1TeMOk7HL1wFqnBeBajmijcv55Wm/HLJNaIlNRTthz
        TnzUD9pIRC9kvh/tc2QxODdQYKqpXM6QXymcee2BngqBPp4mPiIb/IGlqFae/kjt
        eRU8JSw5lz0tWobbrs1A52b3qHxarFxFjcPDzlTuWLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LK5udV
        spjHQLZOBPj3AOvghu8IB7IXzpfmX+3iA0yyM=; b=OrDv6EJMxZ8zZSQnaEkBw1
        z/+g0CPgCISMzkLD4SDEwCPa//yimGgSWOyCrVA8uKiNKd4TI4qOIq/1zRSrRLTU
        HkIHRLSZuFFo7yQA1JbxEj+Hg3my0g8KUyDAWGw0xV4bCgl3sOmGMcwglD0KPonu
        ykHpSrPU5Y/gk6UZzS+7HWkX/EnanKkKOcc73PeLkeBKDdbB8QRkhSGnIwC+XUk8
        dk0Ju7zXeMHQtfG7enar56SncOfdk7lcv8Q05l31QmTtUOnoTB7biSzMtma3mH65
        EzPEUHr3mnz9oeCzEgkp7X3KlTklDCAgtyDCqGUKR5SSSPuWkZ2mRr2fV90kKgFQ
        ==
X-ME-Sender: <xms:i6gFYE2EtQxPEONHcpCoOcYQhoaT5ytVahUSen5Eh5Z_0WC7BjORMg>
    <xme:i6gFYPGeGIOHIebhtRJRtuYtaisjsa6bKjSMsSGQPxWGEjrPZNcgV1rSXcRY8UFC_
    lzQ1NWN2Zk3akGp81w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jKgFYM6K1GvqDmNIz05stVJ0mzkLYuZyGBZc87nT3OvDHq9_xXhF-g>
    <xmx:jKgFYN2Z_7yNjXrzgHaldcjZCCOChIsF86VQaP3Pz78_B9fioTMEag>
    <xmx:jKgFYHHVENeUFZCQRz3Hw6a9bUq7yuh3hyV1FmwVNLBZ6u93tu7ckQ>
    <xmx:jagFYO_PKqT9sXh6FheJh6mTE8Zqg2VYuRPlB06nCN93EuITw79jUQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B093524005A;
        Mon, 18 Jan 2021 10:26:03 -0500 (EST)
Date:   Mon, 18 Jan 2021 16:26:01 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/21] pinctrl: sunxi: Add support for the Allwinner
 H616 pin controller
Message-ID: <20210118152601.j4dn27zzhuzds2ya@gilmour>
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3df5e5hjreiqauet"
Content-Disposition: inline
In-Reply-To: <20210118020848.11721-5-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3df5e5hjreiqauet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:08:31AM +0000, Andre Przywara wrote:
> Port A is used for an internal connection to some analogue circuitry
> which looks like an AC200 IP (as in the H6), though this is not
> mentioned in the manual.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--3df5e5hjreiqauet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAWohQAKCRDj7w1vZxhR
xWwgAQDzUsiSsvVWmGYKTIjfAvDSb4cyvKqd41IRoxEonfT0PgEAsDfaZINzDpAE
5B80+1Z81y4fyQd1D7swQqnjvF4/JA0=
=81EK
-----END PGP SIGNATURE-----

--3df5e5hjreiqauet--
