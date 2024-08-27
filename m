Return-Path: <linux-gpio+bounces-9222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B59610E1
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 17:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE37DB2467C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3BD1C6886;
	Tue, 27 Aug 2024 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1Zaj8U6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206FA1C3F0D;
	Tue, 27 Aug 2024 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771629; cv=none; b=TL/2TNkANW7BzFYr6AL2wn17J8SX90jKKEv8p/CMz3XUaWbxjCGd13Q5GBoOIjoRoULOMTu+EhrnGXVlTyw30ImyWsHhdIw9+siopddyKPWfODaO3HxReP8meWE3IR3+LWMZK3zCsRj51g3i83rlH8xYYfAEI1cxy+nnDoVF1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771629; c=relaxed/simple;
	bh=RVcNBdVAYTptBbubyMnyKBRWzpO4+aKNbz2XLBFAbxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf4aqBzymRQBfFiEHnjljCvaglNbwfJnzBNdrZ69Cm2Rbqh4DkKWAKP1JF/8JfViCplASDDD3CwY/ZNnnFLfL6NlJyv2MG5WPydFYpKtZlfmBK5ToVM2VSkMUE58eptzyd/jq8UAp6M9llf6/m2Ew4thODZ5Y9XetDt6vcK9Nb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1Zaj8U6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660C9C6105F;
	Tue, 27 Aug 2024 15:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724771628;
	bh=RVcNBdVAYTptBbubyMnyKBRWzpO4+aKNbz2XLBFAbxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1Zaj8U6vpme0Vp49C+hK56kdlnuQcIKo90mnsaiTJaH5Hh9emT+WfzmElx7fftmv
	 S/yjR5QHR38xFqTpk9jWiKn9P/kjcS5nJ9Mbm4Fvw82TDFaHO7AIBrHqE5GzB7e54I
	 w1rK47uEGKi3Ey0zp4mATqw/suzS0wuyRgNHgZ4c5mh3La2TsyQSMU91IdiL22GflP
	 TjGF2ZYH7aHmjAKiz3716N/KLpzTHtee/ItrSB12K4A7qz0e/4nCJeKO6QHxILZFqD
	 xzvH81mLH2M4nUkmHalE9Z68yk+Ylt0+f43vokanyRwahU+8mIj9x4h7uOf6PoXxhe
	 uyqFgibOpufdQ==
Date: Tue, 27 Aug 2024 16:13:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <20240827-same-channel-dad1dc97a893@spud>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <66cbf3bb.050a0220.2632ed.b191SMTPIN_ADDED_BROKEN@mx.google.com>
 <20240826-turbofan-unwound-280af18d60cc@spud>
 <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jz0ET5wWh0WKJCpc"
Content-Disposition: inline
In-Reply-To: <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>


--jz0ET5wWh0WKJCpc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 02:23:05AM +0000, Yixun Lan wrote:
> Hi Conor:
>=20
> On 17:22 Mon 26 Aug     , Conor Dooley wrote:
> > On Mon, Aug 26, 2024 at 03:09:39AM +0000, Yixun Lan wrote:
> > >=20
> > > On 13:10 Sun 25 Aug     , Yixun Lan wrote:
> > > > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> > > >=20
> > > > Two vendor specific properties are introduced here, As the pinctrl
> > > > has dedicated slew rate enable control - bit[7], so we have
> > > > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > > > creating spacemit,strong-pull-up for the strong pull up control.
> > > >=20
> > > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> >=20
> > I got this mail, and one of your other ones, 5 times. What's going wrong
> > with your mail setup?=20
> >=20
> Oops, sorry for this, it's the second time you complain this..
> TBO, I have no idea what's happened, asked Yangyu, he didn't have this pr=
oblem
>=20
> I'm using mutt+msmtp to reply, while using b4 to send the patch series,

The patches only appear once, it's the replies that have the problem.

> for all the mails you received, do they all have same message-id?
> I have a local filter for duplicated mails myself, could this help?
>=20
> (I leave only one address of your mail in this reply, see if still have p=
roblem?)

It's nothing to do with me having multiple addresses, the mails have
different message ids, and as you can see below, even different sizes too.
For example, two copies of the current reply came in as:
Message-ID: <66cd38b0.050a0220.113bce.d5acSMTPIN_ADDED_BROKEN@mx.google.com>
Message-ID: <66cd3abe.050a0220.bf184.b4feSMTPIN_ADDED_BROKEN@mx.google.com>

Your mails also don't properly appear on lore, you can see some [not
found] mails there:
https://lore.kernel.org/linux-devicetree/20240827033057.GYB208832.dlan.gent=
oo/

The SMPTIN_ADDED_BROKEN might be a hint as to what is wrong with your
setup?

>=20
> > | 250   T Aug 25 Yixun Lan       (6.0K) =E2=94=8C=E2=94=80>[PATCH v2 4/=
4] riscv: dts: spacemit: add pinctrl property to uart0 in BPI-F3
> > | 251 N T Aug 26 Inochi Amaoto   ( 12K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 252   T Aug 25 Yixun Lan       (6.8K) =E2=94=9C=E2=94=80>[PATCH v2 3/=
4] riscv: dts: spacemit: add pinctrl support for K1 SoC
> > | 253 N T Aug 26 Inochi Amaoto   ( 46K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 254   T Aug 25 Yixun Lan       ( 38K) =E2=94=9C=E2=94=80>[PATCH v2 2/=
4] pinctrl: spacemit: add support for SpacemiT K1 SoC
> > | 255 N T Aug 26 Inochi Amaoto   ( 22K) =E2=94=82 =E2=94=8C=E2=94=80>
> > | 256   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 257   T Aug 26 Yixun Lan       ( 338) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 258   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 259   T Aug 26 Yixun Lan       ( 334) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 260   T Aug 26 Yixun Lan       ( 333) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 261   C Aug 25 Rob Herring (Ar (9.0K) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 262 N C Aug 26 Krzysztof Kozlo ( 14K) =E2=94=82 =E2=94=82 =E2=94=8C=
=E2=94=80>
> > | 263 N C Aug 26 Inochi Amaoto   ( 19K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 264   C Aug 26 Yixun Lan       ( 285) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 265   C Aug 26 Yixun Lan       ( 281) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 266 N C Aug 26 Yixun Lan       ( 14K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 267 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 268 N C Aug 26 Yixun Lan       ( 12K) =E2=94=82 =E2=94=82 =E2=94=9C=
=E2=94=80>
> > | 269   T Aug 25 Krzysztof Kozlo ( 13K) =E2=94=82 =E2=94=9C=E2=94=80>
> > | 270   T Aug 25 Yixun Lan       ( 14K) =E2=94=9C=E2=94=80>[PATCH v2 1/=
4] dt-binding: pinctrl: spacemit: add documents for K1 SoC
> > | 271   T Aug 25 Yixun Lan       (8.5K) [PATCH v2 0/4] riscv: spacemit:=
 add pinctrl support to K1 SoC
> >=20
>=20
>=20
> --=20
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55

--jz0ET5wWh0WKJCpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs3tJwAKCRB4tDGHoIJi
0vHEAP4yzxgAUlp0JW0TlnqXOhzqwyfH3HuKhnoHxjTT+wPzsgEA+cgEMruf5sqY
cIEKgwxApjwyY5e7KMQx1HkEaYETjwA=
=+Ntg
-----END PGP SIGNATURE-----

--jz0ET5wWh0WKJCpc--

