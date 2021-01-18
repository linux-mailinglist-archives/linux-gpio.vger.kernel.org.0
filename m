Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FAB2FA1A3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 14:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392269AbhARNah (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 08:30:37 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:34061 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392259AbhARNac (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Jan 2021 08:30:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4AF3C58073D;
        Mon, 18 Jan 2021 08:29:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 18 Jan 2021 08:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=t9OxNww6HWANpl54DQNy0q2p7lT
        jdtSam7hUc9ITNzs=; b=attOfT2JhEVIdl47sbSUK/s47o8YAfdcDGViEkjPbvU
        kN8PHV6KfcrnUlnGI0H/zGWV/lYQ/pducVd00hrRS9hHyg5OfAtW+KJ2R7HwnmfM
        5iq8BYpz51zKcuocrj/vP/AFPEJr6TVyHo59LKoSM2ypTJ3ltvkw7ig3SZRLpt6J
        lHil40Rhw642JFs1NT3z9U4K8NleFiVPQLc4Z9OuIehemycr1YyXyJA5QKrxo70H
        eDLO50qTvALYLnz1Ks4SUZiW4qcyk2hcYolm3Rb5rS0qbMkRO+CHH2VOMDGu+ErN
        xB781iOqbwRtIrqoJ26sBo1Tswut5Ch0qwYcnIjPcpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t9OxNw
        w6HWANpl54DQNy0q2p7lTjdtSam7hUc9ITNzs=; b=JLHGu7fHEcDAC3NTaQcGeg
        2zuGNPvX2PpaqiuoI2b+5uzzAGAZgsRdDByCUBrgB5fy0cMCaP8CRolCKBFlJ/sR
        X1kRLMWD9VZ6my4AMb3FldcOg4/VuN8U/YhM4GT73PUa1F/5q2hVOXgfoYPozTZ5
        aPe+HCCQI4UpJlR3uDhTcIce8tHBGGduqmC3B0l2roCmjTnsJyz7d+k3U/uJrFUm
        13np3cXhXdbg9687Nt2cHPGOEfgZEtC5AmgJGmZTjcnrCkszd6i4m39MRGK1M6rb
        AAPkScJKpYr5N/NKGipPdD39TJBWKAktFxffAtxjpmnUKEjF36E2OMxwMGpWom3g
        ==
X-ME-Sender: <xms:NI0FYLIiNmWXWwbaBOvX3PkXmJan0ViGFZ-ojBJmhyXS1K3iVNa5lw>
    <xme:NI0FYPLNRltU0bDEd2GQ1Xxu5PT-iD6D6C9A7Sk6FAfmmOa9lZLnp7l12gQSmiHRi
    -Zrhngv83FYsfv-lsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NI0FYDt0pSg1-AUo5z1Yvjzoxwbl3xLerUXHPUiBfMJIcKdBKKSBTA>
    <xmx:NI0FYEbrJoo_yNV_QLnwaAmtR3yoHU3_Tjg0sjzAjVTBfcXu1H1P3A>
    <xmx:NI0FYCbVvp5PEZ8UjVR07oNPg80W2GiLGc4M9heDz_EqLypu37LF9w>
    <xmx:NI0FYOQCrC6S2s8pkCXuA9lrz5vEuC25zctrNXBuf5ScukApMwpr8Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D162B240057;
        Mon, 18 Jan 2021 08:29:23 -0500 (EST)
Date:   Mon, 18 Jan 2021 14:29:22 +0100
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
        linux-sunxi@googlegroups.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add Allwinner H616
 compatible strings
Message-ID: <20210118132922.bsq34567ojf3q7mm@gilmour>
References: <20210118020848.11721-1-andre.przywara@arm.com>
 <20210118020848.11721-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7nwyzr24mrjxwgux"
Content-Disposition: inline
In-Reply-To: <20210118020848.11721-4-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--7nwyzr24mrjxwgux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2021 at 02:08:30AM +0000, Andre Przywara wrote:
> A new SoC, a new compatible string.
> Also we were too miserly with just allowing seven interrupt banks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--7nwyzr24mrjxwgux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAWNMgAKCRDj7w1vZxhR
xfN+AP90aYXbY08sDFUSinXCA22Rk+Qm62JSM2tvdDBHmNO2iAEA69kKXTttiaA/
0gVIfdRT6KZpkqlutGYANT73gjGWdgo=
=AJkx
-----END PGP SIGNATURE-----

--7nwyzr24mrjxwgux--
