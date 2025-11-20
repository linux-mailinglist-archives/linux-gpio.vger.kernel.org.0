Return-Path: <linux-gpio+bounces-28856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 41973C718BA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A56B3501E9
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79CC1D86FF;
	Thu, 20 Nov 2025 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMvzvpQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9731D5CF2;
	Thu, 20 Nov 2025 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763598350; cv=none; b=f/4aAiXsjGx3c4tkPzVZZWVGUHpV+E5i6uL/j7OghZvX05kkUzOoHJzr6kpIG5iZN/xRhsjfF+xb9wb9QvSUw3046fch23wRtcWmcftmQyDykvHWabYYLP55QLPUA8nzxN6IP+rCoLRVUVbzyGcyUm+q4YqD6nwqZpFhOzpgu+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763598350; c=relaxed/simple;
	bh=S2XOgunETdCSBuxFCo1EOKgt7OKv3vevGxDiojSL/jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbjrWRSQNgJBzyOq7pDtwMJIqfHh2f1ISKFsnf6SoWZmWVXChVsV8+WX8u7dM1g61WGPTBXGM/nBFjT7UHTj7fVvM7GhnSHkOttSwIBz0ZNbBeNANHSFGw5SMjCui/21jkvZfugvN9HgK9B18fa/dFevOoylfbY514Ozk6EO99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMvzvpQh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60901C4CEF5;
	Thu, 20 Nov 2025 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763598350;
	bh=S2XOgunETdCSBuxFCo1EOKgt7OKv3vevGxDiojSL/jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMvzvpQhJFLosDkES5vRlvcTISZHA9Yo/lyB9WDA6sC5XvacPlYH+jcOZ4V5S7bUB
	 osZKpZB0QBb6dg8X8pKMqZFHFvgvn5htlqgn6iaYjl5SeuoqynzyRsqf2KMHLd0197
	 ExYT87jzl+T9KT9TStPhKEzn0lpafAsuY30ED21aNDmm7Sltbnme9lxidRrt7hT3lN
	 C8sDYS0aY5rK8jhC2O2GRD/vIL8oouwentr3GpObJjk1rcYOpmY9mSEkvrg/vc0Dye
	 /yyP/yXDT3fdIRIhDSBS1Rxrq6Xdf07aw6Fan67rcypEcUKod062CzieVbCQgBW2Kb
	 uO/SR3X59kVlQ==
Date: Thu, 20 Nov 2025 00:25:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v1 0/4] Microchip mpfs/pic64gx pinctrl part 2
Message-ID: <20251120-unguarded-stony-a58ea2401605@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <CACRpkdZuopbAyHaZQpeGh0+V7v6Cg5uJwscmVPCfjHghNbPymg@mail.gmail.com>
 <20251119-citadel-shrine-fabc3fb309ac@spud>
 <CACRpkdZOak-+Aahj7fte9gk9m+76LOguEsO7bBbHTMTfLExWcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/rjLm8t14p4Vpzud"
Content-Disposition: inline
In-Reply-To: <CACRpkdZOak-+Aahj7fte9gk9m+76LOguEsO7bBbHTMTfLExWcA@mail.gmail.com>


--/rjLm8t14p4Vpzud
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:31:47PM +0100, Linus Walleij wrote:
> On Wed, Nov 19, 2025 at 7:06=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Wed, Nov 19, 2025 at 01:16:16PM +0100, Linus Walleij wrote:
> > > On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
>=20
> > > > and b) how the bank voltage
> > > > interacts with the schmitt trigger setting.
> > >
> > > Please check if "bank voltage" is somewhat analogous to
> > > this generic config:
> > >
> > > * @PIN_CONFIG_POWER_SOURCE: if the pin can select between different p=
ower
> > >  *      supplies, the argument to this parameter (on a custom format)=
 tells
> > >  *      the driver which alternative power source to use.
> >
> > It's not pin based, the whole bank it is connected to has to be changed.
>=20
> So there *is* such a thing as a group pin config setting for a
> whole group of pins. Groups are not just for functions...
>=20
> And I don't know what is meant by a bank here, but it seems
> to be exactly a group of pins.

Yeah, it's a whole group of pins. There's two banks that the IOs this
driver controls are split between, they don't really neatly correspond
to a particular function (although the configurator doesn't permit a
function belong to two banks, but it is technically possible for them
to).
>=20
> From arch/arm/boot/dts/gemini/gemini-sq201.dts:
>=20
>  /* Set up drive strength on GMAC0 and GMAC1 to 16 mA */
> conf9 {
>     groups =3D "gmii_gmac0_grp", "gmii_gmac1_grp";
>     drive-strength =3D <16>;
> };
>=20
> If you look in driver/pinctrl/pinctrl-gemini.c you find:
> gemini_pinconf_group_set()
>=20
> static const struct pinconf_ops gemini_pinconf_ops =3D {
>         .pin_config_get =3D gemini_pinconf_get,
>         .pin_config_set =3D gemini_pinconf_set,
>         .pin_config_group_set =3D gemini_pinconf_group_set,
>         .is_generic =3D true,
> };
>=20
> OTOMH it's actually *fine* to *just* use groups for pin config like this
> and *not* use it for muxing, i.e. have this group correspond to
> a bank and not use that group for anything else than to set this
> or any other per-bank property. But have a look!

I could just put it in as a per-pin thing, even if the control isn't
actually that granular. The bank lockdown has a per-pin bit, but is
actually a bank wide toggle in the configurator, it wouldn't be too
different.

--/rjLm8t14p4Vpzud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR5gCgAKCRB4tDGHoIJi
0htdAP9wFCGPx5famwNvCdfiLOLiEh+yaD0+FknUzUTj1jenNwD+IEbetMxWYCkV
vMmxEi7yg7mm8P2qxRXuGtp5k1mmJgA=
=aIi8
-----END PGP SIGNATURE-----

--/rjLm8t14p4Vpzud--

