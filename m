Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8468478A109
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Aug 2023 20:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjH0SfZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Aug 2023 14:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjH0SfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Aug 2023 14:35:02 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC0A125
        for <linux-gpio@vger.kernel.org>; Sun, 27 Aug 2023 11:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1693161292; x=1693766092; i=j.neuschaefer@gmx.net;
 bh=q8qOp91ajXQ5N9ULNRPI1Tf3vxfmBnNWKVwv/CAFwbU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=bT9Qwe9znZshjBzKoP6gFMMsuEf/XRxWfeVJQ6+jGDwaW3n3jaheQGDaL+ht5j/xi11o9BI
 25bIHEoXISX/LAGKcYt6Oi7ZkzcNvEOMRkQ7g9ckjsqfalMvEtkc+13dlKa3icfVGviZX9vyd
 /OpRubhl2mTKVIWO8xJbTCIFB+vHQ08aRHg6Z6BKwKaZCwv/di7mYMcY2uZbunOd3qEI6iaZT
 2bz2rT2sjPBUCoCAR0dxZG6v3xBUOI1nen645K82l+mswoR9L11e8iJtgaL/v8gkhgxnlAp65
 HpFO8VDoK0TNUqQWZiHfMMllTH8xuN9QdxMN4X7wX/ztukIH3V/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([94.218.119.195]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mjj87-1ppDDL1N5X-00lFl5; Sun, 27
 Aug 2023 20:34:52 +0200
Date:   Sun, 27 Aug 2023 20:34:50 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: Use
 pinconf_generic_dt_node_to_map_all()
Message-ID: <ZOuXSiR9UXtK/SlV@probook>
References: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PKD5bpRMmb7VTSB6"
Content-Disposition: inline
In-Reply-To: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
X-Provags-ID: V03:K1:d69BVgB5H7PHo2Zzpeu8DcinnvOHZzwUjVWSbNyYaTjPZFIWKXe
 OqCRYybb2WMPXES3yefN69c7p6Ig5sFxY0eEdLYYHA5z7y9Io8iRwKhmKtKpRbU66hdOvcb
 hOrRc+C8jdaI2VkhVUW7MERYrLuo7I9+7mJMdgTWw7rttXWyhFNLlFWnd2KQWiKJKc9GiD4
 nLxGyMhvBKcaIRmfBygQA==
UI-OutboundReport: notjunk:1;M01:P0:TVBqo0FURwM=;7uqFbybbjp0ufF2BlEVJyHc/UaE
 WUcyuC/drBe4Cham4ettxNH0mZ3M5fmZwmvtIcHNz6xxdFa0KAXDfevl6QzviQd4T1P6DbU1D
 X6fayN64nJ/M/c5CMspM5x3pjjcSiNzU2iyetikyEXc+ORSm+Ns4/BsZGOnt30KCwEJICbtAE
 MMo11v18njURik1sm2LtdHkOEb0Ep9kuPopPQIF0S0FEDcPuvUI5m+whOJhb0K7htzyBCZjvn
 SWB/id3EgNv9aqgzzGEv/B30CgMp4s4CYijkQfsb5l2Er9IZbS7kyXhuBB2jl7U0PcVWAEt3y
 VsPmppNM79RCtXqd6IgrZWjSLFEigKVHSvht6VC4JnhH7huURdSSps6S06khY6PHNhPtMqJyR
 843kzSNXd+my9TBhue5OKUwS5D9TdKCIKwEsS+RDg50LhXHRlVPEVjdrd4qhkYnwH/S2EF4Kw
 dsmRmTP1md9iQzOnNLmRSSgww0MUH9lEilDC8f01jqYa8udSbxnTM6mWtl/8eKD3RTN/mcIeI
 xDlSqV1RDS0AnEvNgzL8OdUDTCcAgU9sC6Sv/lEX0yAmw6VMozehuXPcjaZBEXbRSh23CnMVB
 l+Mlp5YfRJgDFkYzvEGJDFNFN1r7covaTfH6UDVpT+b1MkVVSTYyulAypYJObrtvKN7gd21Rp
 PeF7PnKC4ziXBL/2DKFFJQQ/8KBy+9S3nT02SxZ4ZeNPEmGtchqT1KAWKfEXpzwmrNAWQxMKJ
 qE8aabZ0ulzMjGlBv9bKVmORMUWhRg/Q35TVQuZO1Ri5pgBrd+pwqAFZphMEZUsDzkaVSXatf
 aQuEHtj4q+nYvOZr8EYSWMsWNEti8N+kSo4AOvIYVMS8YvkuG+cDzQ2TpQXdtvxtq2Xy9p+eJ
 A5IPrnGq7eCTltToexuK6YKnBjiHZ9x3/e0V8u/I8aSoo+M/WwP+BXZ0a7g100mx+ZWu3w47q
 rXCCLR/K771Og6ba6DRS7BDQK8s=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--PKD5bpRMmb7VTSB6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 12:07:44PM +0200, Geert Uytterhoeven wrote:
> Use the pinconf_generic_dt_node_to_map_all() helper instead of
> open-coding the same operation, to avoid having to provide custom
> pinctrl_ops.dt_node_to_map() callbacks.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This does sacrifice a debug print in the process. Does anyone care?
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 15 +--------------
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 12 +-----------
>  2 files changed, 2 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/=
nuvoton/pinctrl-npcm7xx.c
> index 843ffcd968774774..8bdd0124e2eb9467 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1588,19 +1588,6 @@ static int npcm7xx_get_group_pins(struct pinctrl_d=
ev *pctldev,
>  	return 0;
>  }
> =20
> -static int npcm7xx_dt_node_to_map(struct pinctrl_dev *pctldev,
> -				  struct device_node *np_config,
> -				  struct pinctrl_map **map,
> -				  u32 *num_maps)
> -{
> -	struct npcm7xx_pinctrl *npcm =3D pinctrl_dev_get_drvdata(pctldev);
> -
> -	dev_dbg(npcm->dev, "dt_node_to_map: %s\n", np_config->name);
> -	return pinconf_generic_dt_node_to_map(pctldev, np_config,
> -					      map, num_maps,
> -					      PIN_MAP_TYPE_INVALID);
> -}
> -
>  static void npcm7xx_dt_free_map(struct pinctrl_dev *pctldev,
>  				struct pinctrl_map *map, u32 num_maps)
>  {
> @@ -1612,7 +1599,7 @@ static const struct pinctrl_ops npcm7xx_pinctrl_ops=
 =3D {
>  	.get_group_name =3D npcm7xx_get_group_name,
>  	.get_group_pins =3D npcm7xx_get_group_pins,
>  	.pin_dbg_show =3D npcm7xx_pin_dbg_show,
> -	.dt_node_to_map =3D npcm7xx_dt_node_to_map,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
>  	.dt_free_map =3D npcm7xx_dt_free_map,
>  };
> =20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 2d1c1652cfd9d373..6e88ef1ed020fa88 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -858,16 +858,6 @@ static int wpcm450_get_group_pins(struct pinctrl_dev=
 *pctldev,
>  	return 0;
>  }
> =20
> -static int wpcm450_dt_node_to_map(struct pinctrl_dev *pctldev,
> -				  struct device_node *np_config,
> -				  struct pinctrl_map **map,
> -				  u32 *num_maps)
> -{
> -	return pinconf_generic_dt_node_to_map(pctldev, np_config,
> -					      map, num_maps,
> -					      PIN_MAP_TYPE_INVALID);
> -}
> -
>  static void wpcm450_dt_free_map(struct pinctrl_dev *pctldev,
>  				struct pinctrl_map *map, u32 num_maps)
>  {
> @@ -878,7 +868,7 @@ static const struct pinctrl_ops wpcm450_pinctrl_ops =
=3D {
>  	.get_groups_count =3D wpcm450_get_groups_count,
>  	.get_group_name =3D wpcm450_get_group_name,
>  	.get_group_pins =3D wpcm450_get_group_pins,
> -	.dt_node_to_map =3D wpcm450_dt_node_to_map,
> +	.dt_node_to_map =3D pinconf_generic_dt_node_to_map_all,
>  	.dt_free_map =3D wpcm450_dt_free_map,

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


Thanks!

--PKD5bpRMmb7VTSB6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTrlyoACgkQCDBEmo7z
X9uPSQ//XIKtTViuLh2vSpypCuSDz9Q8K2Uy6R09VxFYXaj/h6XqNMZX36pdn2Q4
5dOej4HHqSG4mB553yK03wtglRJi3fx3NTmrjgU+TxynKCkX1EEJRe+F1vbnlods
DMd7sy7QnKz4vqepI02GG25qhBY1WmnpotdeBCq6yY9QyOroco2wnmIUq3VWxFJI
rL2TMns//8+ZKnPsb/L2xh96xlwtyItCIRMzMZv+SDiy69vYxUolLnLgFP1G/mii
+qgLq6epM1c+4u2rKxxsN2JUsH4rWL5xnmcU/R6xoxsrgdMFDCItRVcMFdRadHf4
6ikYPGnLO0oyKpaUdc5fmXvUF9PrtEAyEDThsAoI7CBFYrcCQzYygJDuTeZGIGWk
TPGviT7HrQtf02QM5CaSTwu8F670T7OiL6hbAp1V2U/klH+mRF7u9lEi7aBpGi8r
HlKYLfq+fztiyjNJd0z2Qgzc4T0rmePB6rKRS3MjHg0Wvt800fJff2gttNU5JR45
PuzXKBq2nwhUlod0rPnI1U+UbPufkUfl4bNF4lkfIOCKvEjtR41lzi2yTbJeoDPW
rQ8yn/djNBK4/cqFStHmvghTeQuWmzQYeScaG2HFLvRVz5rQfbcBe/p3ctHooML+
vVaUnjw2Nfis0Q1UdSp9Q2350Oa3VW+buCbAtbJFtXgdMA7f2/Y=
=UZto
-----END PGP SIGNATURE-----

--PKD5bpRMmb7VTSB6--
