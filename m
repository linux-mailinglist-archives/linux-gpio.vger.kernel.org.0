Return-Path: <linux-gpio+bounces-27253-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F3BEA30B
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 17:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9953B1894FB3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 15:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC8A1A0728;
	Fri, 17 Oct 2025 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0KTt603"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3C330B0D;
	Fri, 17 Oct 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715948; cv=none; b=YLuLYD0wmy0Qajw+9vgOx2kq+MfhSCZD5//abyBJIjXSKknNfercZXaADg+BruygjhqVRnWsMgg6K7pHoWlHQZ7dfGRQMhrFj27wG7bda49HFkkEAmLBavIgi6+4vEaHUvU2+AUmFqNOlnS1KKG15/CvyrX2xMEiaTbiBwuGygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715948; c=relaxed/simple;
	bh=e40RiWetjsxLvkNuwYGmbCfc+JdkI+evIoSOLsfzX5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evr+/Gf00xFS0v+It682cXzMGoCPwZw0E9whfgpedENqHJESt9Fi+4rVMjXCGMmlFMTV2tNEHg2GBKFYCFvt9jebLF9D9DiIBmrVwgPlCRMmi+rdo+P70jHs/wBDj/7XXHkZTPnjQ/Y5cuH9ucGVebloL9X0lFeZXTVPJVmSkkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0KTt603; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B41AC4CEFE;
	Fri, 17 Oct 2025 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760715947;
	bh=e40RiWetjsxLvkNuwYGmbCfc+JdkI+evIoSOLsfzX5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0KTt603Yf31FFgAAhASvEZ2oNQ58Cji9gxknQ4KWZAlwFKi3LL31v8VC6QOHOAj+
	 M6gtZL8qw7AEBY6RAvHQjLJW281SB4TIovX0ilHly2zJL4syQ8wjekpq3K7tmPwbGb
	 aIQKYsncha82wYQiSq6tQdMJtbTYAqC2eQWi2T8vv99nvjvI1WzSx/L5EQmAvAvkhQ
	 YRF91VJNtvzVCXjm8hcac6oT8qz5yUP3tI04KEl66zMMTvB3jOBOUOTK5VYumvXI29
	 h2yiEUPE0IamV2CAT3s7TE4as1f205bSvXF+R8EGxR0ciekXaZ31B7LiWNgOgOGwOc
	 L9hp0005Z0WCA==
Date: Fri, 17 Oct 2025 16:45:43 +0100
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
Message-ID: <20251017-anthem-duplicity-c96e4253d986@spud>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud>
 <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E/tp+y/c9Usv3Xlg"
Content-Disposition: inline
In-Reply-To: <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>


--E/tp+y/c9Usv3Xlg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 04:33:56PM +0100, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> Thank you for the review.
>=20
> On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document the pin configuration properties supported by the RZ/T2H pin=
ctrl
> > > driver. The RZ/T2H SoC supports configuring various electrical proper=
ties
> > > through the DRCTLm (I/O Buffer Function Switching) registers.
> > >
> > > Add documentation for the following standard properties:
> > > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> > >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-down)
> > > - input-schmitt-enable, input-schmitt-disable: Control Schmitt trigger
> > >   input
> > > - slew-rate: Control output slew rate (2 options: slow/fast)
> > >
> > > Add documentation for the custom property:
> > > - renesas,drive-strength: Control output drive strength using discrete
> > >   levels (0-3) representing low, medium, high, and ultra high strengt=
h.
> > >   This custom property is needed because the hardware uses fixed disc=
rete
> > >   levels rather than configurable milliamp values.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++++=
++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g=
077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g=
077-pinctrl.yaml
> > > index 36d665971484..9085d5cfb1c8 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pin=
ctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pin=
ctrl.yaml
> > > @@ -72,6 +72,19 @@ definitions:
> > >        input: true
> > >        input-enable: true
> > >        output-enable: true
> > > +      bias-disable: true
> > > +      bias-pull-down: true
> > > +      bias-pull-up: true
> > > +      input-schmitt-enable: true
> > > +      input-schmitt-disable: true
> > > +      slew-rate:
> > > +        enum: [0, 1]
> >
> > What are the meanings of "0" and "1" for slew rate? Why isn't this given
> I'll add a description for it (0 =3D slow, 1 =3D fast) and the same values
> are programmed in the register to configure the slew rate.
>=20
> > as the actual rates? The docs surely give more detail than just "slow"
> > and "fast".
> You mean to represent slew-rate in some sort of a unit?

Usually slew-rate is measured in a unit derived from volts per second.
What rates do "slow" and "fast" actually represent?

> > > +      renesas,drive-strength:
> > > +        description:
> > > +          Drive strength configuration value. Valid values are 0 to =
3, representing
> > > +          increasing drive strength from low, medium, high and ultra=
 high.
> >
> > I see what you wrote in the commit message, but I don't really get why
> > you need a custom property. I would imagine most devices only have some
> > some small set of "fixed discrete levels", yet manage with milli- or
> > micro-amps fine. Converting from mA to register values in a driver is
> > not difficult, and I figure the documentation for the device probably
> > doesn't just give vague strengths like "medium" or "ultra high", but
> > probably provides currents?
> >
> > I dunno, I am just confused by the need to shove register values into
> > these properties, rather than using the actual units.
> >
> I'm checking this with the HW team. I'll get back on this once I have
> some feedback.
>=20
> Cheers,
> Prabhakar

--E/tp+y/c9Usv3Xlg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJkpgAKCRB4tDGHoIJi
0s3MAP9YizOciJUJl7rtAmgZ0KBowiJDC/FYFB0FeHTK47UjkQEA8ndu2smIcIZJ
nOSy5kNBMpmDRVIhroG4JLyImSz1Bg0=
=VFiF
-----END PGP SIGNATURE-----

--E/tp+y/c9Usv3Xlg--

