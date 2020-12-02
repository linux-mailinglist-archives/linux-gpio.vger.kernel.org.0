Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003FC2CC160
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 16:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgLBPxu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 10:53:50 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42679 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgLBPxu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 10:53:50 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 213AA580143;
        Wed,  2 Dec 2020 10:52:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 02 Dec 2020 10:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=mxXJxJpfiuYbbnUOXT8XmP+VV4O
        8v9bcJc9lxq9if9s=; b=GBbr9QGrpkg3RqzaL/4SsXhGUtlU6ZE5INRa3iOpwjY
        m2dNpb9la+Xazp/3Aor2Nx9yLGoajA2S+nBkOKtZNrS15j/AHihM6fCnAkyXLWFZ
        SsROchYfMCepoLwafi9P4g23UERioYIXPNNvxyJyEJAgfcJ/P/2LqKCpTPpHBcX4
        SD6driXBjSCcvKCY4iGqgIL29oj3eX9Pd5xLQEsmqHfEWsocmi5q4IMami1NpPjg
        +IAZuZGTAJYhG0xB2wEgbwhuVV+FpFIc7/bYhjpJGAiTLc3F4O7MCS4h59i8DgQO
        OZCYPQwJ5NVplf/TydkGEPJzvBkarieQKfZ0JqtZGAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mxXJxJ
        pfiuYbbnUOXT8XmP+VV4O8v9bcJc9lxq9if9s=; b=RYQ67ssbFIU0HYO5muRGd+
        VIbLwDOFQXVkVUZysu1J+8s8f3naIqxqvuy8CloBq90GjBhnEkyO2a8SjU21QGD+
        JjiwqW//P+GWceXrc+GmUDLx7VpvzsH2Qh93O/ybAViFRGf30REl4WRrs/3QRMhG
        nyya4yYfkSi2jg00hHSQ8AkXQm/92WzkserdyfDUnMbi1JNttM89ATLJcBg6ZEH9
        E7b0/YSk+Nh//u8d+zUSSuYC8XCCP8gfzqq4eJe70wq1tJBTUT0Ap+A2fy2ldgG+
        cBF3xhGW9bZ3rwOkdXNPZwV9U6KVNAN+/xXCJVmrUq2ReQ6Wvp8WXm010f/W2otg
        ==
X-ME-Sender: <xms:SrjHXz-laOmn_nML9_2WJgBD_C-c1_LTJMxGjbwX1a9ary8UnkZGvw>
    <xme:SrjHX_p2jsZaDkJdFF6NhPicAftyTbuB_xUzArtqBnRV6BzQUOLMbKICiL-nANF9n
    08SAsEFT2iiSjrLsfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:SrjHX945KqXsHsS29PYjSCOTaJiioQAIgExd2UVPk22escsQ3VDcqg>
    <xmx:SrjHX3MES-HR3GKqa7mDoT5QpJEG5RN0q-t7ovKK_a-iri_QXBf-ZA>
    <xmx:SrjHX3NA8zW6wG992kR0oqw8TssycwlLrGdXOk7uOJpeM1cmuy2X7A>
    <xmx:TLjHX02S746TRFoHOPs3R95kQVUFIRovX7uD-Bk7HyfhqLnP2WDx-w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BB09E108005B;
        Wed,  2 Dec 2020 10:52:42 -0500 (EST)
Date:   Wed, 2 Dec 2020 16:52:41 +0100
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
Subject: Re: [PATCH 2/8] pinctrl: sunxi: Add support for the Allwinner H616
 pin controller
Message-ID: <20201202155241.ml4qnkz7xq5lnjln@gilmour>
References: <20201202135409.13683-1-andre.przywara@arm.com>
 <20201202135409.13683-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="svbz3tlercnn2csj"
Content-Disposition: inline
In-Reply-To: <20201202135409.13683-3-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--svbz3tlercnn2csj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 02, 2020 at 01:54:03PM +0000, Andre Przywara wrote:
> Port A is used for an internal connection to some analogue circuitry
> which looks like an AC200 IP (as in the H6), though this is not
> mentioned in the manual.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

There's a bunch of issues with wrapped lines alignment reported by
checkpatch --patch.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--svbz3tlercnn2csj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8e4SQAKCRDj7w1vZxhR
xb0SAP9nISWJMZ0okHmnSvUad2pA4T085UE5tuLTk8Ipuptr4gD/ddVD6320VRIL
O2k+1T0Sg5uUtgcErxTamOmFlknGlgM=
=uPnV
-----END PGP SIGNATURE-----

--svbz3tlercnn2csj--
