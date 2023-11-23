Return-Path: <linux-gpio+bounces-399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7510F7F5D7A
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 12:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C89F1F20C37
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Nov 2023 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA60722F03;
	Thu, 23 Nov 2023 11:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.b="kwIYoWcK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639E6D4A;
	Thu, 23 Nov 2023 03:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700737905; x=1701342705; i=j.neuschaefer@gmx.net;
	bh=qHIRuVjw/0Toi1F/14ZNchv8iBh7eioF0IAeNc5thr0=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=kwIYoWcKf67p1X692kNow6H37zBF24YUt6Xkd6M4CMY1ehkBcCXux1PX+qqg54+N
	 9W5HjPZfuyjU24UXlxL21Y5aG0uw2a8FCTRtiIuMvjjb4Cza+L1+i4r6+IRExoj/1
	 ZPoTJ0hGvUDDW7uaBo3xIADYrkRSTx7Eed1jd6iyYXeXbjlhRHkecGuyMlrgFBSXD
	 NzLV+8XRXDIjsI5R/tvDH/NazNeskEsLgN02dCTl45HJ9FgunP5ybjZ7KZXLqDWvg
	 BrKopGUqj3c3bs/pULYSpRQT1WIQ1VaSTozOLIDMe2WuAgjqe44VSqoseS10tNbpX
	 VXa3UoVBv797ILuVdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1HZo-1r3NX91GaQ-002snb; Thu, 23
 Nov 2023 12:11:45 +0100
Date: Thu, 23 Nov 2023 12:11:42 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 02/17] pinctrl: nuvoton: Convert to use struct
 pingroup and PINCTRL_PINGROUP()
Message-ID: <ZV8zbizJO8yNEomn@probook>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
 <20231122164040.2262742-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9hHdmhEn3QkQ/1K+"
Content-Disposition: inline
In-Reply-To: <20231122164040.2262742-3-andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:zjNy6ebVKDzd7AEE0/nsnKTw50ViiRNCHikw/qZ5yzvBoxpjpTz
 HuFhbYVNf3YEHc9MbVHMPqFM13ooVqoYIlO28oTqTO3TqRj4iSbysfuAMyOnYgsCh5FQ78z
 P7qOIwLX0a6l3eskPKk8wB5tHRAjmBptshJd+ljjDbEOIKGogudpPxVTdxC+iTqvsT+hcJd
 eDREktDD+IHC114QUAtOw==
UI-OutboundReport: notjunk:1;M01:P0:y+PsMVlI0gs=;Ai/+ZpDC7M5bugNmYWGO9L7vFlz
 2WubMq9jgvakIfRSscOQi5KlOlKYuGVb+i5EPcics8R7b0xcRLibYn4OTTpSNQGaQTOJwGw+8
 W4Q7pdLyoguKl7d5ELtHOlnjYBTnAEchLrHDprAzbT0pm4liSqW8yiHWpqJeT0qPa/DE3Pja3
 Q5Z2Y98XPiMRaRwkVMZc/EkqAP/qgXNkCrQMBJjev4vsYF1CeRJsKYsDu3Y+r5cWsDlip1bbt
 vBgM4fOGvzsRhlEdNat8Y3n/Vgqez30ywuxPD5Gy9T75fx4ADPyPC/zL/O+fAwTPTkCE9w/TH
 nFZXcqSRDEuvtC/cS8QcRdQzyq90i08o/Ne46BrCHyvjRQrgiNDVmhusLkBNG4MX53zGiTLj8
 nt4OD5BbGGo+Je6mXJQELxmwRF6Mb2+7rdL4P03yd1pE/VCccXBX5CbP2bJMM4MyhNvAS4Pai
 mVqi+GCEoLYrGHaqjsPfI4eeU8gaTgM0llwyjOpFhBOVT1be9I+IKHNsFiPSGh1lf1FRKPGl1
 9n1HRfnC1seURAZXzes1f6cqrFKXQ9EfXNRNL8SKKeD0KCBqBzX+v/DHtSP2R19yz34QA+w2l
 pSdPWj6cKhIoQAI1NWcL1OTfCwc5nlAKwOK5emPDX0Y9lwfy69hVy0AM26iQ4Imz0/HOnvlwJ
 E/6O84+5RqeNF7X8N1ENFoobAgv7I3Eowqv2q+cKfY70CU0yACWDlWiqcvbLqGDYdr7gmEFeh
 rtLZS67dX+nGhL6my4VZgHcO4MD7nzV6e6nftkcod5Q9IQLys+9N8X416dOtY1POJVzUdr9Nu
 JjdU+yjhnFPMjzKXoL4TAUV+0nfxg2EeXJkr9WwLuksEvi3MaCIQH0Nxo45AvvtCWNlDRkKKl
 2lecIiakBCmUUHEd+TtOVn7C/tUQpKC4oQkcVFg4MwdOMwcDVpyueYk3V0Kf75V8+Wlv8lXqD
 p/T/U2cfwpE9tGZ5jDR/SNDkWxs=


--9hHdmhEn3QkQ/1K+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 06:35:34PM +0200, Andy Shevchenko wrote:
> The pin control header provides struct pingroup and PINCTRL_PINGROUP() ma=
cro.
> Utilize them instead of open coded variants in the driver.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks.

>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/=
nuvoton/pinctrl-wpcm450.c
> index 0cff44b07b29..4589900244c7 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -474,9 +474,8 @@ enum {
>  #undef WPCM450_GRP
>  };
> =20
> -static struct group_desc wpcm450_groups[] =3D {
> -#define WPCM450_GRP(x) { .name =3D #x, .pins =3D x ## _pins, \
> -			.num_pins =3D ARRAY_SIZE(x ## _pins) }
> +static struct pingroup wpcm450_groups[] =3D {
> +#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## =
_pins))
>  	WPCM450_GRPS
>  #undef WPCM450_GRP
>  };
> @@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev =
*pctldev,
>  				  const unsigned int **pins,
>  				  unsigned int *npins)
>  {
> -	*npins =3D wpcm450_groups[selector].num_pins;
> +	*npins =3D wpcm450_groups[selector].npins;
>  	*pins  =3D wpcm450_groups[selector].pins;
> =20
>  	return 0;
> @@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev =
*pctldev,
>  	struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
> =20
>  	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
> -			wpcm450_groups[group].num_pins, function);
> +			wpcm450_groups[group].npins, function);
> =20
>  	return 0;
>  }
> --=20
> 2.43.0.rc1.1.gbec44491f096
>=20

--9hHdmhEn3QkQ/1K+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmVfM24ACgkQCDBEmo7z
X9s6kQ/9FPGH46fURmUk0S/+zlgZKVtDIOldB02JGZTZ/rh43+6rFimcMZyEOlPt
Iv2ayCrzPHBvgeRMsIdjSCQmtd8XYpLMrkvcir3exY+crh1YGKkyV8RdMJH1RY4a
C/vRxiZ0684SCsbp1mF03LBU+b96lpFxbxwSdGvLJJMV3yIxe5eADpzZcmyVWzOy
Q4F7135UoIFZvDgeptqWbygX6poDcHwG4XOPfTYPit1obw4C9lSuIIbepKnWTe9W
Ut2dTCCIhi0as5InSkuHVSdAuTiOtwcaxPe0uxyhlu+2Wup5ibtz8cL5FfJ1cSEu
D6KUjGfNUDovRkcgsDBgPSkLl/6miLMNCZ5bWlTvjYXE3C7hSH9PI1vicWhZh0GB
fLTApAj38g5kdUOcfa+1+Zwv+x2I9dSwdXycqhCF7evDmUbIqwNe1W+dU9RhOX8r
cFCjFW04uG2nR0ivbf6M3vnqwxGyERCVEj3r5SGimlW9h67E4PHou3p7adEGxwOg
Rblhxt6s2TlmUvM07L9tjWYLhWBkOgr1+P5xfMVkpcvwUZAa/dwj5bf+qgtoJk9O
vt8hpySZt8nXp0ynOK9YuVHRdb325ScArKv+sw6rZusAK9Jsq/EIBqOTLvcodCQi
IgttVi+NmWwrA+ZLB5codjpKhZMPXeA0XEaWAxgu0PZ5PlJRvA4=
=f6qz
-----END PGP SIGNATURE-----

--9hHdmhEn3QkQ/1K+--

