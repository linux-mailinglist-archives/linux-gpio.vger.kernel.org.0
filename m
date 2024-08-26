Return-Path: <linux-gpio+bounces-9180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267695F65C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 18:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C7951C21937
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 16:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04219539F;
	Mon, 26 Aug 2024 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyvyOAvD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84545194C9E;
	Mon, 26 Aug 2024 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689336; cv=none; b=AhVb/zTy7VL8sdauID0HnuL8qD4b5dTjOvTX3FEPoiSxBmBTLwLbGGKHnw8BtkfODZkXb44jGU/rkgbTAmuI/4QXyUGXDn/Ppl5cja2VdMGrXnyIDrNbTEd9WFITLbx9UIarVidH39BjgmM2oBqWidmPIEhdDYQRbVnNR8/90U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689336; c=relaxed/simple;
	bh=+RTZMx1fzQdb+R5GnKXIaBS0hVNREfRA+TCS9zcwgbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie0bLcHmdqa0EL7IHJtZUzEwIpWrSHIzgxlcETXVl6ES5cQugKKC3stpoHplTe5NWX7N+uo+SMIQkNPYIwb4K30JTWoHIOXr332ZdC9YFfBjO2gmM5zA8lWL9xOyZAyDVmv3cG/g2jDC8JZxeVoBDf6zYMZgO7mVVwDds5FD6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyvyOAvD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4C2C52FC0;
	Mon, 26 Aug 2024 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724689336;
	bh=+RTZMx1fzQdb+R5GnKXIaBS0hVNREfRA+TCS9zcwgbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LyvyOAvDft8diKLOLUx20hHBgtJRj7WlrqbidunMWHGD5BOLkxHTL5o6fY7yT8Gs3
	 DcJbKbnMLgpQyKVvdKGc+flE6lxPFbG4P0K0SNVPn0k/RvbWGO7OgbK/ZEUEIXPd07
	 3E8i+1Nn+9ESLgGww9YjjHr/qrJNLORNHmJQnc5Q5i/Pu3vwPCVJj8Wi3ZYrjR13xc
	 JXCO18OxLNbPaGkIjKdBoOi2U+nPIHr5ipkRWEOmayOa6pyxygSEF9rKm3KsFZG+zZ
	 MjC99H2cFwabwar8EGqf8u7eQG4DStn4QbAn20rnKOmdIwhuoC2NLavgyHVMV4AkM+
	 5264DWAfuAyZQ==
Date: Mon, 26 Aug 2024 17:22:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240826-turbofan-unwound-280af18d60cc@spud>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vv0iS6OPh2q+34gu"
Content-Disposition: inline
In-Reply-To: <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>


--vv0iS6OPh2q+34gu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 03:09:39AM +0000, Yixun Lan wrote:
>=20
> On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> >=20
> > Two vendor specific properties are introduced here, As the pinctrl
> > has dedicated slew rate enable control - bit[7], so we have
> > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > creating spacemit,strong-pull-up for the strong pull up control.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>

I got this mail, and one of your other ones, 5 times. What's going wrong
with your mail setup?=20

| 250   T Aug 25 Yixun Lan       (6.0K) =E2=94=8C=E2=94=80>[PATCH v2 4/4] r=
iscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
| 251 N T Aug 26 Inochi Amaoto   ( 12K) =E2=94=82 =E2=94=8C=E2=94=80>
| 252   T Aug 25 Yixun Lan       (6.8K) =E2=94=9C=E2=94=80>[PATCH v2 3/4] r=
iscv: dts: spacemit: add pinctrl support for K1 SoC
| 253 N T Aug 26 Inochi Amaoto   ( 46K) =E2=94=82 =E2=94=8C=E2=94=80>
| 254   T Aug 25 Yixun Lan       ( 38K) =E2=94=9C=E2=94=80>[PATCH v2 2/4] p=
inctrl: spacemit: add support for SpacemiT K1 SoC
| 255 N T Aug 26 Inochi Amaoto   ( 22K) =E2=94=82 =E2=94=8C=E2=94=80>
| 256   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
| 257   T Aug 26 Yixun Lan       ( 338) =E2=94=82 =E2=94=9C=E2=94=80>
| 258   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
| 259   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
| 260   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
| 261   C Aug 25 Rob Herring (Ar (9.0K) =E2=94=82 =E2=94=9C=E2=94=80>
| 262 N C Aug 26 Krzysztof Kozlo ( 14K) =E2=94=82 =E2=94=82 =E2=94=8C=E2=94=
=80>
| 263 N C Aug 26 Inochi Amaoto   ( 19K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 264   C Aug 26 Yixun Lan       ( 285) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 265   C Aug 26 Yixun Lan       ( 281) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 266 N C Aug 26 Yixun Lan       ( 14K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 267 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 268 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=E2=94=
=80>
| 269   T Aug 25 Krzysztof Kozlo ( 13K) =E2=94=82 =E2=94=9C=E2=94=80>
| 270   T Aug 25 Yixun Lan       ( 14K) =E2=94=9C=E2=94=80>[PATCH v2 1/4] d=
t-binding: pinctrl: spacemit: add documents for K1 SoC
| 271   T Aug 25 Yixun Lan       (8.5K) [PATCH v2 0/4] riscv: spacemit: add=
 pinctrl support to K1 SoC


--vv0iS6OPh2q+34gu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsyrsgAKCRB4tDGHoIJi
0q6hAQDeH2i2SNS/Z13kPou1aa7nn27FSu6SRvKx9lRsDN+A0wD/eqwn/JkSg0bn
sCsM9hBmsqrjbzQW/WiTVKFJWO1kZAk=
=th+c
-----END PGP SIGNATURE-----

--vv0iS6OPh2q+34gu--

