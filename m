Return-Path: <linux-gpio+bounces-26727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A667BB129E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 17:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 370571947601
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 15:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A9427D780;
	Wed,  1 Oct 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ese3G9sZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F724A076;
	Wed,  1 Oct 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759333547; cv=none; b=mJoq/2OsxLlY7jsmot5iaOv4nuxpEGrlussrMZT67J6uN4GRJ88CxyEPnSYDt/v+op8yJvZCAg8A7zZu6OW3raeKsy+Jt1aopM/U4s1Ecb2RcVcz+/sNeyu9pznds5RRl6LEBr89NupR9IUXuwns7sGZMCRmm+I26tN/NypOZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759333547; c=relaxed/simple;
	bh=x5yZqp2j81o6ikd9WELOhul7OQSX3CvtRTHcmQH7oc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouPiH+AkZu0cSnOIxq01w9/OaNXt8ldgiVn2c1Xlc/D0BcgsuTdMSC8gM89EXHeGQLws8lYogU27kIRtftDquplzzguo64IV9d99TtfgA3oxE9wf97PBm9myyeCttpv+8FP9alAvj5PAHCtIEGNBPro9txvZSWVascsgQle/nlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ese3G9sZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31518C4CEF1;
	Wed,  1 Oct 2025 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759333547;
	bh=x5yZqp2j81o6ikd9WELOhul7OQSX3CvtRTHcmQH7oc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ese3G9sZMvHcld91d8f78fic/QzY+eT35PbYV9gwPsX2j3sRp1/wvJ+PItnAX3Ek9
	 X90lHON/i90ACPFzsrtJRMemxm3NiNionj+O7hs4E8L9N5faO8lJKHahPF5/117SYI
	 AS5Rkv7DRzBsKt5XM+2xIkNCSEXZqF6c+F7YU3ZJjiHQZlGsbpMcji9PnPQdOOTPag
	 1gqJ7jrQPL+QB0lzSq30BhmF13y6Vzl6ijRePxfee4kmuyflHa5Cs/z9ytzmXtJ8ln
	 W+2xZRayKrbV83ouCf3szt4yWtJtYdTWOFlk4l5GSO6CTyqe7I1Q92g1IbTIc9P0yL
	 V8643V28kFusw==
Date: Wed, 1 Oct 2025 16:45:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 3/5] pinctrl: add polarfire soc iomux0 pinmux driver
Message-ID: <20251001-backless-cattle-a98db634d7f0@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <20250926-unshackle-jury-79f701f97e94@spud>
 <CACRpkdZ5RCcaNJB_3ufAgpDtdJBKfOVrMbJVAQWaVSOkY0-XNQ@mail.gmail.com>
 <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kI56dZubP/jGKITa"
Content-Disposition: inline
In-Reply-To: <CACRpkdZo=c0BnSLm=FKRMNYKEaPAHBgtfhD9txhPofts4ApDkw@mail.gmail.com>


--kI56dZubP/jGKITa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 01:36:49PM +0200, Linus Walleij wrote:
> On Wed, Oct 1, 2025 at 1:34=E2=80=AFPM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> > On Fri, Sep 26, 2025 at 4:33=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> >
> > > +static const struct pinctrl_pin_desc mpfs_iomux0_pinctrl_pins[] =3D {
> > > +       PINCTRL_PIN(0, "spi0"),
> > > +       PINCTRL_PIN(1, "spi1"),
> > > +       PINCTRL_PIN(2, "i2c0"),
> > > +       PINCTRL_PIN(3, "i2c1"),
> > > +       PINCTRL_PIN(4, "can0"),
> > > +       PINCTRL_PIN(5, "can1"),
> > > +       PINCTRL_PIN(6, "qspi"),
> > > +       PINCTRL_PIN(7, "uart0"),
> > > +       PINCTRL_PIN(8, "uart1"),
> > > +       PINCTRL_PIN(9, "uart2"),
> > > +       PINCTRL_PIN(10, "uart3"),
> > > +       PINCTRL_PIN(11, "uart4"),
> > > +       PINCTRL_PIN(12, "mdio0"),
> > > +       PINCTRL_PIN(13, "mdio1"),
> >
> > This looks like it is abusing the API. These things do not look like
> > "pins" at all, rather these are all groups, right?
>=20
> Or maybe they are rather functions. Like there is a function spi0
> that can be mapped to a set of pins such as spi0_grp =3D <1, 2, 3, 4...>

They're not actually package pins at all that are being configured here,
it's internal routing inside the FPGA. It does operate on a function
level, but I don't think there's a neat mapping to the pinctrl subsystem
which (AFAIU) considers functions to contain groups, which in turn
contain pins. I suppose it could be thought of that, for example, spi0
is actually a function containing 4 (or 5, don't ask - or do if you want
to read a rant about pointlessly confusing design) "pins" in 1 group.

If I could just work in terms of functions only, and avoid groups or
pins at all, feels (to me ofc) like it'd maybe match the purpose of this
aspect of the hardware better.

> I recommend a refresher with
> https://docs.kernel.org/driver-api/pin-control.html
> and work from there, and avoid looking too much at other
> drivers that don't necessarily do the right thing.


--kI56dZubP/jGKITa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN1MowAKCRB4tDGHoIJi
0gcRAP44XAvGLeqrYk2OkMBa2621o7zkzzEonTIinYljBT17owD/XXq5ppx3h4SQ
2F9fF68YwFSJ+Rm8N0WKHgTB3TWQfwE=
=rJ7h
-----END PGP SIGNATURE-----

--kI56dZubP/jGKITa--

