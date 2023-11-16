Return-Path: <linux-gpio+bounces-193-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975BD7EDC71
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 08:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47662280FDD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 07:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA75101CF;
	Thu, 16 Nov 2023 07:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914D119D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 23:56:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3XEr-0008RG-Bx; Thu, 16 Nov 2023 08:56:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3XEp-009P1M-Np; Thu, 16 Nov 2023 08:56:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3XEp-002Wrz-EO; Thu, 16 Nov 2023 08:56:35 +0100
Date: Thu, 16 Nov 2023 08:56:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 00/12] Introduce ExynosAutov920 SoC and SADK board
Message-ID: <20231116075635.onolshbu4waqsqag@pengutronix.de>
References: <CGME20231115095852epcas2p21e067efe75275c6abd2aebf04c5c6166@epcas2p2.samsung.com>
 <20231115095609.39883-1-jaewon02.kim@samsung.com>
 <170005362858.21132.4200897251821879805.b4-ty@linaro.org>
 <6e69df6c-10fa-404a-ac02-4880723b8c50@linaro.org>
 <55a0f27c-ea46-40ae-b1e5-e650802b89a8@linaro.org>
 <d6f3d451-6a53-46b6-2263-cc071a9dc44c@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="deso36yy7zj5rlry"
Content-Disposition: inline
In-Reply-To: <d6f3d451-6a53-46b6-2263-cc071a9dc44c@samsung.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org


--deso36yy7zj5rlry
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 16, 2023 at 12:32:30PM +0900, Jaewon Kim wrote:
> I already checked and there were no warnings or errors as shown below.
>=20
> Did I miss something??
>=20
>=20
> $ make CHECK_DTBS=3Dy ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=20
> exynos/exynosautov920-sadk.dtb
>  =A0 LINT=A0=A0=A0 Documentation/devicetree/bindings
>  =A0 CHKDT Documentation/devicetree/bindings/processed-schema.json
>  =A0 SCHEMA Documentation/devicetree/bindings/processed-schema.json
>  =A0 UPD=A0=A0=A0=A0 include/config/kernel.release
>  =A0 DTC_CHK arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb

https://www.kernel.org/doc/html/latest/process/maintainer-soc-clean-dts.html
also talks about W=3D1 that you didn't pass.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--deso36yy7zj5rlry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVVyzIACgkQj4D7WH0S
/k7Dsgf8CEfnfcBO+X5uEDgo3Y7Z8C4wi5ENcCF2QdbXIn8f3i/0j24kJy5bKnh1
aYEK3ZPy0TCtE9dW8BCoRjv4XyDOhS4gQkvgUGEhz+Y31KZx54rNTK/vPimcVZ51
ykiKjhtT9WSMf8qcEaTdimYtt8+e8iA8WaRmQyMyzxbSCDnTvTXoWzMga77bpqco
uIm0DgPSeMEzVI3tSNzI1DcJHBsR5Vee65E88Wq6jTukkVGtAiS7/mT0BLwhiYWN
mopKsb3BDL1WvwmuJlnf6wleGhZRKWKNChljiPG/N9o7Vtzt6zJht/WOVYx1dmyJ
CjfcU9YKpKwjWMDJ18/Tas3lVVSvEQ==
=qThe
-----END PGP SIGNATURE-----

--deso36yy7zj5rlry--

