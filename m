Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC173D2537
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 16:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhGVN3N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 09:29:13 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:39927 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232105AbhGVN3M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 22 Jul 2021 09:29:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 358275C0164;
        Thu, 22 Jul 2021 10:09:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 22 Jul 2021 10:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=fMIyRCILHtleUhWfpXsc7vMymcB
        Fk2L6abLtJS24bJQ=; b=Njqj4cdRmAbN2/g98gTHuHrHlNUaywGNHVPgTX4Zu2n
        7CcWRSEfhKSvHSbQgJfA5fdT1h3E+Rpt7GKtHJ0iYN4G3O3vpwHTht5YRn3PWJrA
        CbEspM7IFNs0dkg9DsU29BCdcHW2OWpixRdHCwZYT6OZ3EfkkAjJ6mXnD+rwsoxe
        eq2Yn9p0rPVYcvdwsRlH9BbZZw9UB/NBy6ki4R7ufjlIIlf0m0/EeHWTNM0QhUES
        eaCmhSRttfWCNdKIsBbI3ejqAnYRkOxVhNuato5OoW3IHJUuEHn7aRo9maN7Tmxg
        5iGSU1rY8cp0zms/u/fIi1Fm+kmHV8TJ46LKtFOTGMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fMIyRC
        ILHtleUhWfpXsc7vMymcBFk2L6abLtJS24bJQ=; b=XqhfMC1+dXkKYbAcws+YkL
        iZlXgAuGGe7nWLV2NwGeKpnzRQz+Wa/iaN2YL2BwPnjUyIPEmrAprCF1dKWjX/de
        WBtX/3wiw1Us4QJseWV8A9VWF62chdegmW6qZ5E4fDIgSpQI75LgJe34LsdY+NfQ
        GEAn4nrScCJO1zShw3207YDALiRJ6tU7qEg94lMF02/T3u7fx+nieFqjosyRS/kQ
        ozpYm59B9X1hyUowZjT+CEPyiQ/nBTeWKwEmY0c4fgr95k/ePzyjRYaUY8Let99s
        0R9vL7plS+fht9z5Dtf9zzSLdTxpSz3zYQfmghwzyJoeMtBJ8f3yq8d6D+vDSN/w
        ==
X-ME-Sender: <xms:KXz5YBXi0tYRy-CELI8Alvaqe3J0AqkBGgXthnTjBx90YL3T2RY_Iw>
    <xme:KXz5YBk9O9iiCgP5B93K9dM4G-t4VQ-hufv2RCld7OTNNwQeWtAXKd00FNXbuFeGs
    egQVp6j-kuph6DqsGY>
X-ME-Received: <xmr:KXz5YNbRiULjngyBMzhfANrGpPCJNwqKA5v1bdJZNKggyD9iO2nSJIKf_HkJb45mfVOl-gxeOhSXg4TukeTmZ0x1uu2yPzu5geBd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeigdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KXz5YEUIYHHOkWnjOV1JK9XkRDNT4FByN9OKT5yTvlra47PFDG5hAQ>
    <xmx:KXz5YLlHMT94vgVNVKQGz3c4OJFR28xcSnO1sN4Vgg6zCjZjp7FisQ>
    <xmx:KXz5YBdc3jtDhpD_rYFzqj77Y3674fV1WhrkTGPoW5AKstUcc8-IQA>
    <xmx:K3z5YJb2QC5N9r9g68L_JE2UMN2vTYuRfvpzJLt5cY-k5dG8D05SVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jul 2021 10:09:45 -0400 (EDT)
Date:   Thu, 22 Jul 2021 16:09:42 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pinctrl: sunxi: Don't underestimate number of functions
Message-ID: <20210722140942.2ew6htf5kmvpldsm@gilmour>
References: <20210722132548.22121-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uprzxwinadb43mu3"
Content-Disposition: inline
In-Reply-To: <20210722132548.22121-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--uprzxwinadb43mu3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 02:25:48PM +0100, Andre Przywara wrote:
> When we are building all the various pinctrl structures for the
> Allwinner pinctrl devices, we do some estimation about the maximum
> number of distinct function (names) that we will need.
>=20
> So far we take the number of pins as an upper bound, even though we
> can actually have up to four special functions per pin. This wasn't a
> problem until now, since we indeed have typically far more pins than
> functions, and most pins share common functions.
>=20
> However the H616 "-r" pin controller has only two pins, but four
> functions, so we run over the end of the array when we are looking for
> a matching function name in sunxi_pinctrl_add_function - there is no
> NULL sentinel left that would terminate the loop:
>=20
> [    8.200648] Unable to handle kernel paging request at virtual address =
fffdff7efbefaff5
> [    8.209179] Mem abort info:
> ....
> [    8.368456] Call trace:
> [    8.370925]  __pi_strcmp+0x90/0xf0
> [    8.374559]  sun50i_h616_r_pinctrl_probe+0x1c/0x28
> [    8.379557]  platform_probe+0x68/0xd8
>=20
> Do an actual worst case allocation (4 functions per pin, three common
> functions and the sentinel) for the initial array allocation. This is
> now heavily overestimating the number of functions in the common case,
> but we will reallocate this array later with the actual number of
> functions, so it's only temporarily.
>=20
> Fixes: 561c1cf17c46 ("pinctrl: sunxi: Add support for the Allwinner H616-=
R pin controller")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--uprzxwinadb43mu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYPl8JgAKCRDj7w1vZxhR
xc6pAP9FWmnMG+2wThYKQA0F6aZPiXi2REY9fahjVY7w+NMy6AEAk1Sf+TU5NY9W
1zeubTfWfaPO/mEG8J3dZ8BTmMEuiQs=
=5TJ+
-----END PGP SIGNATURE-----

--uprzxwinadb43mu3--
