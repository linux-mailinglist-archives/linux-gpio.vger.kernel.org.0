Return-Path: <linux-gpio+bounces-28859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F8DC718DE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4487034649C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152841D90DD;
	Thu, 20 Nov 2025 00:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6gkNEPZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929B16DEB1;
	Thu, 20 Nov 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763598675; cv=none; b=RQYVba5JvV3URZ0Iqq6TTh7i4zktX9DZItrBF7+lf5Y20mK9a+3i94AI0jp214Z4poZRQepVeskZZE+BXvyG0Onx7HyFkCiGEe7AFDfEzuTmFLvSYsRCcK1nyxL/kp6Cr/H75unehbL3xSwNXoJRjd8MWH2rUzZKT1/1O/Slxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763598675; c=relaxed/simple;
	bh=vC5ZsmenMkhitGJQ0ThlsxoDZXm6NpZmMjC1M6Veq0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZVK9J4CbgEYjFiKKMqwC5otoj+sXTiNcklVNv6p69DJaNGozqTjSfAJt2LZ3QK6WTTqKVsuAVFaiQ5x44HQVMV9QndgQH/Nza7a7tyBqFCZC4kS+6vBIxayOZpT4gv0INQwFiIQqsCQQOl46YczYO7Ul9RT1f2yzxW5s0iiMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6gkNEPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A33C4CEF5;
	Thu, 20 Nov 2025 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763598675;
	bh=vC5ZsmenMkhitGJQ0ThlsxoDZXm6NpZmMjC1M6Veq0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6gkNEPZeY9FIh3hEo697fONF+OqlB9eauJ7vGvqWsMup/kNubmhEoe4U1kTL06Rr
	 sDcbt/c4DZoLPKfW4eeakdb1Mjc84E+W6o0d3rq3nVjdySAs2YaSXp6z3tALtsLndU
	 jqv2Uyr9oRrOLCoqJ95/NSWuohl76dvozBNXePAmgJxhc5Vi+tqH5z6RfHjQv2y7mw
	 NjZBO+8c7eug8WXQ3t1L6ymmAdgFgg/S6A2jSUHEsx971+FPNAR8Ub8xM+hFZAXyzl
	 c7m6ofHrzHxb9XKX277Qza9eI+ipBEkSAYTG1K30LHJEFJtlSy1agx0mi1Jenv4k/9
	 FKqfrIaVTynaA==
Date: Thu, 20 Nov 2025 00:31:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
Message-ID: <20251120-evacuee-opulently-8e98840c4ba2@spud>
References: <20251117091427.3624-1-antoniu.miclaus@analog.com>
 <20251117091427.3624-2-antoniu.miclaus@analog.com>
 <20251119-violation-enforcer-1362d3eecb69@spud>
 <CACRpkdayt+upQxxT-GdQOENWjdF2zz3DLEjcvD7sdg9-oaLwoA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8jFdXtNEoClBb2NM"
Content-Disposition: inline
In-Reply-To: <CACRpkdayt+upQxxT-GdQOENWjdF2zz3DLEjcvD7sdg9-oaLwoA@mail.gmail.com>


--8jFdXtNEoClBb2NM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:22:02PM +0100, Linus Walleij wrote:
> On Wed, Nov 19, 2025 at 6:56=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Mon, Nov 17, 2025 at 09:13:22AM +0000, Antoniu Miclaus wrote:
>=20
> > > +  switch-gpios:
> > > +    description: |
> > > +      Array of GPIOs connected to the IN1-IN4 control pins.
> > > +      Index 0 corresponds to IN1 (controls SW1),
> > > +      Index 1 corresponds to IN2 (controls SW2),
> > > +      Index 2 corresponds to IN3 (controls SW3),
> > > +      Index 3 corresponds to IN4 (controls SW4).
> >
> > Did I miss a reply about my comment on this switch-gpios? I was asking
> > if a binding like this, which doesn't permit any of these not being
> > provided is a good idea.
> >
> > > +    minItems: 4
> > > +    maxItems: 4
>=20
> Maybe we should make them named GPIOs after all, as the switch
> has exactly 4 possible GPIOs. It was my request to have an
> array I think, and now I feel a bit stupid about that :(

It might cause havoc dt-schema wise, but is having a switch-gpio-names
a silly suggestion? Seems more usable than having 16 or 32 individual
-gpios properties on a larger device.

> > > +  switch-states:
> > > +    description: |
> > > +      Initial states for the four switches (SW1-SW4).
> >
> > Missing an adi prefix? Also, probably should say initial if it is
> > initial states.
>=20
> It should probably be initial-switch-states.
>=20
> I vote for a generic binding as it is a new "subsystem" in DT,
> and this can be exepected for any new switch.

Cool, prefix-less is fine in the case - although Rob's usual requirement
is two users for some common thing to make sure that it is actually
suitable for being common.

--8jFdXtNEoClBb2NM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR5hTwAKCRB4tDGHoIJi
0tSWAPoD82y5vmd53/Q234BBHyKoR+py3qoQbfuubqcOtaxgnwD+MHsw8Q5cmb+7
EuQ16EGRwyUitBK6EIBAyYEzzG19uAc=
=OFmZ
-----END PGP SIGNATURE-----

--8jFdXtNEoClBb2NM--

