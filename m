Return-Path: <linux-gpio+bounces-28857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B19CFC718C3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 01:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8E95F4E1959
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Nov 2025 00:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300E61D8E10;
	Thu, 20 Nov 2025 00:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ryhel1iV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9F1D5CC6;
	Thu, 20 Nov 2025 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763598408; cv=none; b=ZGWajek4/eoMXj2isuOcdfUGmgea1uzZCpfj+cB1WkgiYnGd6LwxPunt8n3ru4r0WpiqJUGeC0tlOhZbx8MNfALXNN0fvMrkfqf4cJxIx29cpGvQFxQW7Y67aJuH7WAaLJsjG/EM/iQ6vz2ikpJza15GmCbf7oTxXSJa665TGao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763598408; c=relaxed/simple;
	bh=JHTxgS6i63wOUdISHaih1cPc2pNBu+ZVJ+UwzHPwjNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDRXVrRSQW+O6CiCaXUJIcKTM1JYi84YQ/PuEwcNS3zY8ykplUCebd8IAX7hobZs+KWpRycr75lK99USwwsZQuF5S/AHGaMmsL/v0B3YdZpG/BWb5nvPnGmHlPNX5ndj37osdM5W/+VtvgWzngNOh8nR6nDZ0cIQbahc3RW4jaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ryhel1iV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A646CC4CEF5;
	Thu, 20 Nov 2025 00:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763598407;
	bh=JHTxgS6i63wOUdISHaih1cPc2pNBu+ZVJ+UwzHPwjNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ryhel1iVVNiUZKZI2LzgvCgfhP/Aak3aQ6xdhBaehF9CRBZsbLXYnqqv/WeCKjGp+
	 mHL+sFbcNYZJoC1UwtPbBNo77pTv70LoaklLj6nRi+3w6HVGTZY4scn1b+f0RNgu05
	 kWX+EKlaWP0PbCeIv8kpuYmjDAt4UlMhu7GFq3D4EiazOKBd0Fz+kRTBGgatP4Wsjm
	 BShoiTDAyE+D0yFclRv0+FwpLfucZDJB9olmL8Wuz34REV3S5yvjxnuQNPtQspvqcu
	 AVi+WYbhrc+l9xt2SX+rzP9VMou4lqiJ5I0Sm9dcpwODd404w6rdSKhbjKOglnaJbd
	 F6OdcbV2YLPSw==
Date: Thu, 20 Nov 2025 00:26:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251120-silicon-oyster-5d973ff822d9@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zTWThl0QcBJpnw0J"
Content-Disposition: inline
In-Reply-To: <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>


--zTWThl0QcBJpnw0J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:48:07PM +0100, Linus Walleij wrote:
> On Wed, Nov 19, 2025 at 7:23=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Wed, Nov 19, 2025 at 01:08:26PM +0100, Linus Walleij wrote:
> > > On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
>=20
> > > > +       //TODO @Linus, it correct to group these 3? There's no cont=
rol over voltage.
> > > > +       case PIN_CONFIG_INPUT_SCHMITT:
> > > > +       case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> > > > +       case PIN_CONFIG_INPUT_SCHMITT_UV:
> > >
> > > Consider not supporting some like PIN_CONFIG_INPUT_SCHMITT_UV
> > > in the bindings if they don't make any sense, and let it just return =
error
> > > if someone tries to do that.
> > >
> > > Isn't PIN_CONFIG_INPUT_SCHMITT_ENABLE the only one that
> > > makes sense for this hardware?
> >
> > Yeah, I just didn't know if having the others was helpful, since they
> > say things like:
> >  * @PIN_CONFIG_INPUT_SCHMITT: this will configure an input pin to run in
> >  *      schmitt-trigger mode. If the schmitt-trigger has adjustable hys=
teresis,
> >  *      the threshold value is given on a custom format as argument when
> >  *      setting pins to this mode.
> > which implies they should be implemented for systen not permitting
> > hysteresis adjustment.
>=20
> I see.
>=20
> I looked at the bindings that look like this and are not 1:1 to the
> in-kernel configs:
>=20
>   input-schmitt-enable:
>     type: boolean
>     description: enable schmitt-trigger mode
>=20
>   input-schmitt-disable:
>     type: boolean
>     description: disable schmitt-trigger mode
>=20
>   input-schmitt-microvolt:
>     description: threshold strength for schmitt-trigger
>=20
> 1. input-schmitt is missing! But it is right there in
> drivers/pinctrl/pinconf-generic.c ... All DTS files appear to be
> using input-schmitt-enable/disable and -microvolt.
>=20
> 2. input-schmitt-microvolt should probably be used separately
> to set the voltage threshold and can be used in conjunction
> with input-schmitt-enable in the same node. In your case
> you probably don't want to use it at all and disallow it.
>=20
> They are all treated individually in the parser.
>=20
> Maybe we could patch the docs in pinconf-generic.h to make it clear that
> they are all mutually exclusive.
>=20
> The DT parser is a bit primitive for these.
> For example right now it is fine with the schema
> to set input-schmitt-enable and input-schmitt-disable at the same time, a=
nd
> the result will be enabled because of parse order :/

> The real trick would be to also make the
> schema in Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> make them at least mutually exclusive and deprecate the
> input-schmitt that noone is using, maybe that is simpler than I think?

I think that this is probably what to do. Mutual exclusion isn't
difficult to set up there and if there's no property for "input-schmitt"
then deprecating it sounds pretty reasonable?

--zTWThl0QcBJpnw0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaR5gQwAKCRB4tDGHoIJi
0ozGAQDueTTfu4Eqcv2GhlVmCt0VpLT0iLQVJ7HYX03eO52/2QEAoode4HwrlMo5
GBVMx6tFH/HyXT7K0Nq7e3aTayk/aQ4=
=zaAd
-----END PGP SIGNATURE-----

--zTWThl0QcBJpnw0J--

