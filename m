Return-Path: <linux-gpio+bounces-27027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE6BD2D0D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 13:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7AC784E6102
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 11:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52426261B7F;
	Mon, 13 Oct 2025 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoMYs93T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030CE25F797;
	Mon, 13 Oct 2025 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355763; cv=none; b=lLIvdPUf3r5MkNS4m+Wm0TSYjMCwGiI5/xT8SnGjVMz7DRLPhlNlFDAPIj2i4UiflA3iyuU532Z6Tc4IkZwqiz7zw+uJ5LwhLRH5dOefqfpuj9x0Ovcd6lAOmKYcGUCjm0pc7AUJstAfNa2yrfZ4aE5ot7T5MdCEUpxHxmtz1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355763; c=relaxed/simple;
	bh=EHX8Ouxhv6vacj9UYTYHUFbPtj67z1YVK5PC+R0fmc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqFLW1MniqvETZZSPn43dPM5uf+s0t+IaQ01fiBU7z4J0EErHZxpx1NWvknjLtODV1ZNmCqODcLnOgBusk3h55Lehi4i4eTtTWZ0iAlZsG5K6YVwrtSen4mU/KveEoTUqePux9gFHd8BtmFHJHCXUldjmKVNyybGxh2Oei5y6/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoMYs93T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B878C4CEE7;
	Mon, 13 Oct 2025 11:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760355762;
	bh=EHX8Ouxhv6vacj9UYTYHUFbPtj67z1YVK5PC+R0fmc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoMYs93T8XE9MobBc0gGAmdh/5k/qBpR2XB8srD7ZyOgth5EWPTM9UQ92BZW7EFyb
	 nLufVs9sGJk2oWj1WZXsm+1o3/qsEjvCcMur/sdwM9KiAr1dxMBF3f9m3xSUomtDj4
	 L+H22PhT8guhXyWw7XvRr95nCCpwpG0uiKsVLWqw64c3Fqy/Ra7P2KbkJgO1PRMvVG
	 A3/rYwa17RA1L4Fj/a3B2bOORmcg2i4zzjEXOkLK72zkq7XZkXzPBgfEUJu5mKTtbE
	 ixhYAw51EjyUOm0/9ZpaTG2WylyS+2Pthsseb57nNk7YkiyPUKzj4TUI+5GZ1KV5V4
	 yCawrOcIUQJCg==
Date: Mon, 13 Oct 2025 12:42:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
Message-ID: <20251013-spoiling-halogen-4e56c4bc83dd@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <20250926-unshackle-jury-79f701f97e94@spud>
 <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
 <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com>
 <20251001-backless-cattle-a98db634d7f0@spud>
 <CACRpkdaEsa5gSpGxWG8xudMePt12nZaZRCRrW5Bf5JQ0f1K9Zw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m6y+SUB0zgaLbOTz"
Content-Disposition: inline
In-Reply-To: <CACRpkdaEsa5gSpGxWG8xudMePt12nZaZRCRrW5Bf5JQ0f1K9Zw@mail.gmail.com>


--m6y+SUB0zgaLbOTz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 01:02:35PM +0200, Linus Walleij wrote:
> On Wed, Oct 1, 2025 at 5:45=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>=20
> > They're not actually package pins at all that are being configured here,
> > it's internal routing inside the FPGA. It does operate on a function
> > level, but I don't think there's a neat mapping to the pinctrl subsystem
> > which (AFAIU) considers functions to contain groups, which in turn
> > contain pins. I suppose it could be thought of that, for example, spi0
> > is actually a function containing 4 (or 5, don't ask - or do if you want
> > to read a rant about pointlessly confusing design) "pins" in 1 group.
> >
> > If I could just work in terms of functions only, and avoid groups or
> > pins at all, feels (to me ofc) like it'd maybe match the purpose of this
> > aspect of the hardware better.
>=20
> What I would ask myself is whether the abstraction fits the bill,
> like if there is a natural set of functions in the silicon, then the code
> should reflect that.
>=20
> When it comes to those:
>=20
> +static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] =3D {
> +       PINCTRL_PIN(0, "spi0"),
> +       PINCTRL_PIN(1, "spi1"),
>=20
> At least be careful with the nouns used: are they really "pins"?
> Should they be described as "pins"?

I think that my choices if talking to someone outside of the context of
the structure of the pinctrl subsystem would be functions (for what's in
the driver as pins) and routings (instead of groups). pinctrl's function
doesn't really do very much in this context, although the devicetree
function and groups I think actually work fairly well: "function ABC is
assigned to pin 1".
Regarding nouns, I think it depends on how far you go with that...

> Maybe it is best to come up with some custom struct if not?

=2E..because taking that to an extreme means forsaking a lot (all) of the
common pinctrl infrastructure, no? If it's just choosing more apt names
for variables/functions in the driver or redefining PINCTRL_PIN to be
something more suitably named, then sure. But if I have to avoid using
pinctrl_pin_desc et al, am I going to lose out on a bunch of useful
common code?

I'll send my v2 on tomorrow probably, and we can talk about what exact
changes should be made there?

--m6y+SUB0zgaLbOTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOzlrgAKCRB4tDGHoIJi
0gl6AQDUprsE9xfbXid6+gKxP+o0m+3sf3HuFO1j+Fi/WfUNygEApFremBSDWnol
Y2O5ZDHqqfBoT6vzkG1bVxy2Z6XJXwU=
=R3pF
-----END PGP SIGNATURE-----

--m6y+SUB0zgaLbOTz--

