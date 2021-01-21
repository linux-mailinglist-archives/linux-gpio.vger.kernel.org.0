Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B942FF0AD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 17:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbhAUQlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 11:41:39 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39699 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387489AbhAUQla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 11:41:30 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 3EF415C01D2;
        Thu, 21 Jan 2021 11:40:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 21 Jan 2021 11:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=juHRcEeMVZKNRFcN4WekqTV/Dka
        fl+ufNPbmU8vMOGw=; b=qGMe4HLldxJ5tL009Da+FS+uVADr9ftMfdaaEX/A5XG
        mue+IkCUkCty5PfN1O7c4MIGFJMGX6H/28ineJBaHkpqLk7tRU169iO0oVhdNHku
        btScS7P7FU1pKRU1MUVwEHnxqEO9F+4HR32FpakSDInB0WvNJaT0ulStCcnYimvc
        UF9hDcLANaEsUX6YoSX1c4fh9afSMUU2CUCwS4UQI+d4+oYOjx0vuCJVHWy6bkvE
        WGGWM4Wb+V157HoUmgTTMQu01N4rSG188ziBdturiX6cunRKh1z9oVqCUxiEKtS1
        vGVHTyUbRKRvCXoYEzDh4uESEzsxvQ8pNJRaTLgBgKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=juHRcE
        eMVZKNRFcN4WekqTV/Dkafl+ufNPbmU8vMOGw=; b=Lisa+IU7N9cYgUBSEatDPy
        zx0J9y4G/ZNe1dJ7I9Sd2tYA4MkRF2RNh33UEWGGOyIlKlAp79HBzIBvpfBI31Bd
        gOJcWRALArycbJDEvcnK62y7uKQM4E/nsUHntWywhyKMms1KoHl7cb41pDYFERiV
        y4j8gjcmna1oYSD+boz/mqkxGLKJZ2OeTQEWGj75Zj+DJn1w3Ix4KJ2UFnDds609
        z+MtrPZ/Y9L1iD0oDVhcN4/8NaL90r8GtTG5J+EZhmLO8Teq5oCkMY0pJRWSv21O
        AHmoyK/zYWR1fGGqmpHQntJhpEYP7DLY6F6BSkvpf0F77Y5pF5RY+NytQCors0NA
        ==
X-ME-Sender: <xms:bq4JYH5w8prMK1Ejrw95Wt8Mep6DITrkdqcO-OiJicQoCehzcCy0vQ>
    <xme:bq4JYM2a6Cq0mP-mSBoEbr-FlcK6qvg1eCvI6m7fuPzpb9BOSZMnJ3nr1nhMMbmzq
    Ql8dZLMiOa86acd4Wo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bq4JYLUMP1znYviGohik7iukACze7dOQMUp7Wf_Wax5onZngtpiW9A>
    <xmx:bq4JYP7zyVpiWBefm7Vi4j2D30nsg7uxmHC-7s_VgfswgprWzt4h3w>
    <xmx:bq4JYKIgWlrDxamGeUcdu8YbFw7qE6aqIjg6hIuV_RA43pCDifsnug>
    <xmx:cK4JYGFpbCaG0UiCcqhe1ACq41lK9hhDEkpo8lRCYReUzphuOiuBfQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5FF2E1080069;
        Thu, 21 Jan 2021 11:40:14 -0500 (EST)
Date:   Thu, 21 Jan 2021 17:40:13 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Liu Xiang <liu.xiang@zlingsmart.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        wens@csie.org, jernej.skrabec@siol.net,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        liuxiang_1999@126.com
Subject: Re: [PATCH] pinctrl: sunxi: fix use-after-free in sunxi_pmx_free()
Message-ID: <20210121164013.cqfxvach4ugkohm7@gilmour>
References: <20210119062908.20169-1-liu.xiang@zlingsmart.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7o5h6w6sna7w4xki"
Content-Disposition: inline
In-Reply-To: <20210119062908.20169-1-liu.xiang@zlingsmart.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--7o5h6w6sna7w4xki
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 19, 2021 at 02:29:08PM +0800, Liu Xiang wrote:
> When CONFIG_REGULATOR is not set, sunxi_pmx_request() always return
> success. Even a group of pins call sunxi_pmx_request(), the refcount
> is only 1. This can cause a use-after-free warning in sunxi_pmx_free().
> To solve this problem, go to err path if regulator_get() return NULL
> or error.
>=20
> Signed-off-by: Liu Xiang <liu.xiang@zlingsmart.com>

Is there any drawback to depending on CONFIG_REGULATOR?

Given that we need those regulators enabled anyway, I guess we could
just select or depends on it

Maxime

--7o5h6w6sna7w4xki
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAmubQAKCRDj7w1vZxhR
xYLnAQCoVnvqgYNOCD7XrY/g88dCWcaLLFceHcAeb/60OCJd2wD/deGbhmb9+die
jeRU+To65zPfDYtY61jzRQjFPv2odQw=
=VCdd
-----END PGP SIGNATURE-----

--7o5h6w6sna7w4xki--
