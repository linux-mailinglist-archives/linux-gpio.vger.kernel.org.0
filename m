Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6CC304278
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389846AbhAZP0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:26:12 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53361 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391539AbhAZPZR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Jan 2021 10:25:17 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 615C2B47;
        Tue, 26 Jan 2021 10:24:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 26 Jan 2021 10:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=N58P68rmnDJxoYYRk7nViKAuN+J
        BxJrfBhrOUbLBiS8=; b=bMv/TMmgBMOX8kgzlkOTxmHHdgOeJQKfRcSIvfMwu6B
        gNDqqOSaEo5BfkhYgYhFHkjKnwh7mymtcT4EqO5OcWgZQBx+3Gl0pux8H5ZuXLFi
        LPSG7O94PpTMRTaAO9H67HJtzdshOIjNiAl5rkQJscFSsQid9NSm066hr6Snzo2K
        FDtfC/7d4GeB3lO811YglJBK8lyJkkYhSuP+Df35Adx7qn7QTFNOrzwmqTx44yLT
        lGYdN7G5vHuu46i+nB+xllZ94xkXOwopC7cbWReju5N/mQeclN22dQLSUgRSkWxT
        GKaydJni/KvTIVNY7WMI9ZV3FO53Jgg1+b5d8b50tTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N58P68
        rmnDJxoYYRk7nViKAuN+JBxJrfBhrOUbLBiS8=; b=dqNxADrXGnulfEb1fcwQGS
        JKmK6JqjYrmEbtuxDY9X3Fne/f7iEn2neuW3Rj9THnmmwCzDa42g1ysiJtbz/hDT
        RDqZO1D6qS85AqyLFSZFMjgdSqnvkWsZCkONakjM7KXQI09MAgv0a95OrFF+Xr7M
        3H6M0M79HN8Ef8X6g/1OMQ5mFr4TfewdNcUmmP232IRSIr+zrw7gDzv9ObdtouGU
        2Eb443dKT/yENKknDYr66viLHpE+hCIcepk+x9NUQDVsc2BOhB2HFGo+JMT1qn/0
        cmQN6Hgah11w9yMnMeqXFVYQvyCNajfePm5OLFp4/opOgjc/0qwmAPUtbv/UwbSw
        ==
X-ME-Sender: <xms:LDQQYAk2th3yH9GW2Bs341OEuXh8dUU5TcNy1SnzoWEkXFd9NQcJVg>
    <xme:LDQQYP0zY0E5G87x4LV1b5wn6Fw_MB4DhgLmzG55IUMZAofbwigSnqftuDU9u6cbM
    vX6mXgZXtL6YvzrZmU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LDQQYOrIjkK4YsUH8Z00KU-GuAIrFK7iXiYq0Yer5xuNC6IHQzdr3A>
    <xmx:LDQQYMkz6Qf5u4gTfLb4M9sxLmhS5YlT2MbqHgmSBQtOzHrshn-vUw>
    <xmx:LDQQYO1mYSpQPsTPMFokeVZTjly4xr5R6aSgVLpEZ6ot-8KoWUJ_7g>
    <xmx:LTQQYK-qRUMryIfVopHcPNQybCGguCGCoFxozKnNQ6VUoJE3hyJoRw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5F9F4108005B;
        Tue, 26 Jan 2021 10:24:28 -0500 (EST)
Date:   Tue, 26 Jan 2021 16:24:26 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     liu xiang <liu.xiang@zlingsmart.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        liuxiang_1999 <liuxiang_1999@126.com>
Subject: Re: [PATCH] pinctrl: sunxi: fix use-after-free in sunxi_pmx_free()
Message-ID: <20210126152426.pmnuipcyaloaz4tx@gilmour>
References: <20210119062908.20169-1-liu.xiang@zlingsmart.com>
 <20210121164013.cqfxvach4ugkohm7@gilmour>
 <CACRpkdb1gn2e9=ip6ipAwW27vmf1FCs_y1Z=w-K8y8Z9MXVBMw@mail.gmail.com>
 <5c4b7a8c-c549-43ae-8ec6-5ae3ed26d321.liu.xiang@zlingsmart.com>
 <CACRpkdaJQcuWwS2g4UgRpWb+iHYSmWoNj6gEsvGwtPZq+aJBbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3t3ycay2bf7rxezc"
Content-Disposition: inline
In-Reply-To: <CACRpkdaJQcuWwS2g4UgRpWb+iHYSmWoNj6gEsvGwtPZq+aJBbQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3t3ycay2bf7rxezc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 04:03:29PM +0100, Linus Walleij wrote:
> On Tue, Jan 26, 2021 at 7:31 AM liu xiang <liu.xiang@zlingsmart.com> wrot=
e:
>=20
> > > Liu can you make a patch to Kconfig to just select REGULATOR?
> > > Possibly even the specific regulator driver this SoC is using
> > > if it is very specific for this purpose.
> >
> > I found that the regulator driver is related to the specific board, not=
 the SoC.
> > There is no board config for ARM64 SoC like ARM.
> > Is a good idea to select the regulator driver in the pinctrl Konfig? Or=
 just
> > select CONFIG_REGULATOR_FIXED_VOLTAGE to avoid the use-after-free warni=
ng?
>=20
> If that regulator is what the board uses to satisfy this driver then that
> is what you should select. Write some blurb in the commit message
> about what is going on.
>=20
> You can even add a comment in Kconfig like that:
>=20
> # Needed to provide power to rails
> select REGULATOR_FIXED_VOLTAGE

Virtually all the boards will need a regulator, but you can't make the
assumption that this is the driver that is going to be used. In most
case, it isn't.

But it's not really a big deal, we depend on the framework itself being
enabled for regulator_get to return the proper error, not one given
driver.

Maxime

--3t3ycay2bf7rxezc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBA0KgAKCRDj7w1vZxhR
xdm2AP9Vg1fFmdBMLPOzFtzelXWiubltA/UbM3djut80g40SsgEAonnEgt7nnczQ
xpjCO5ObhLC7IWv1ZoKyTSfECCr2SgY=
=NX1o
-----END PGP SIGNATURE-----

--3t3ycay2bf7rxezc--
