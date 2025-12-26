Return-Path: <linux-gpio+bounces-29910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7063CDECCC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E28C83007EDA
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 15:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F38E23C516;
	Fri, 26 Dec 2025 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOKc67Ko"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20786D27E;
	Fri, 26 Dec 2025 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766763040; cv=none; b=ub+eS+uK6twK7XueDHEo11GG14ITOmVZkidAUYDbaJxPELf2jFjriB6vnCVLxd1F8rb64TfHHjfNAM6YwfCsA4cPmLOMeJSkMt1cqm36KJ4Gz9/MYQawfP9zEBh3yIDc17V9QPLAFPTX62zj9v9tPxFbUYLwUMtKNOArAntLVeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766763040; c=relaxed/simple;
	bh=RyZbK7uJYOhWI9dcoiLP7LXlTwKZf+N6eHUD0tVmLKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEOcP/y0MVEEFcM731VriDi2iji5nrGtzVsj/kkAIfzfKOk1UsPTxf1RWSshSKw1wzXD73HgzwVj1pMuh7GcPj/p1n8SCCFaTnPcK7fQmw2VNWtSIeTAVJzWLgDQoZwc/xFK04pD8q35wQh4ZAMopT0Y+afyCfWh9usnBdZg3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOKc67Ko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CA9C116D0;
	Fri, 26 Dec 2025 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766763039;
	bh=RyZbK7uJYOhWI9dcoiLP7LXlTwKZf+N6eHUD0tVmLKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOKc67KonQASLOJpRT1C3yITZWldDUqMnULeHL/+Zis5ZOxt6X7dmWNnfH0CJRoM5
	 p7NZMcsfOgVhMWxFg2zP2WSGuqHexkWDU9TkD7LWH9XMNZcZ9HOghiitLvJdLEzwQg
	 ztzDYeUwO9no08M8NQbDm8FFQfWek52GIjynfJhPmVPgIPUL30G07Iegpi7fb+vHh4
	 AJdlruOhI6dDtRMucpxsFYZqT3znNCrpVajLSOrRAwGsspOCeTl98sYgGBgmkoxwKo
	 zSNsPzt8NDnogyGA1cadVgazQMne0cMyUer52NhvtJfWOFrkWyn7L4FmRNfR+t8Xhi
	 0AGO6VCnjm99g==
Date: Fri, 26 Dec 2025 15:30:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/11] riscv: dts: add initial canmv-k230 and k230-evb
 dts
Message-ID: <20251226-immunity-morale-67aad0a0fda1@spud>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
 <tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com>
 <aUzjn3XHJTSl3vY9@duge-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pv4dX9VFg9vNdESc"
Content-Disposition: inline
In-Reply-To: <aUzjn3XHJTSl3vY9@duge-virtual-machine>


--pv4dX9VFg9vNdESc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 03:11:27PM +0800, Jiayu Du wrote:
> On Sat, Mar 23, 2024 at 08:12:22PM +0800, Yangyu Chen wrote:
> ...
> > diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts=
/canaan/k230.dtsi
> ...
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
>=20
> The aliases should be set in the board-level dts file,
> so please consider removing the aliases.
>=20
> ...
> > +
> > +		plic: interrupt-controller@f00000000 {
> > +			compatible =3D "canaan,k230-plic" ,"thead,c900-plic";
> Incorrect comma separation. It should be: "canaan,k230-plic", "thead,c900=
-plic";

If you send a follow-up patch, I'll squash it into my current k230
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

> > +			reg =3D <0xf 0x00000000 0x0 0x04000000>;
> > +			interrupts-extended =3D <&cpu0_intc 11>, <&cpu0_intc 9>;
> > +			interrupt-controller;
> > +			#address-cells =3D <0>;
> > +			#interrupt-cells =3D <2>;
> ...
> > --=20
> > 2.43.0
> >=20
>=20

--pv4dX9VFg9vNdESc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaU6qGQAKCRB4tDGHoIJi
0k6AAP4u0EmWqs7RVpZTsIhPhImspKGTDirwrgX5zDYM35145wEAnxKsxiCGjnRF
5P5BedAwKl8ThZYT4gBz1GaGGbX1jgw=
=E41A
-----END PGP SIGNATURE-----

--pv4dX9VFg9vNdESc--

