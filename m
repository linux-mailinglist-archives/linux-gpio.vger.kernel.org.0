Return-Path: <linux-gpio+bounces-30584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA3D21900
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 23:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 391143025A69
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 22:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14DB328B40;
	Wed, 14 Jan 2026 22:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyREzBrx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47425DAEA;
	Wed, 14 Jan 2026 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429587; cv=none; b=bjp2z3LlKGaXIv6tVUz4wn8ytyk7/lN/MaUZjQ2foTqLIoBySEWcemi2dMMRiycu77s3sdl5881SC2wpymEzXoeNjqKTbL+N1R9B9LInFcwpqQZkTIGOmfLtYgymg4UMhBYkIMFgR3e9njEnvw9lHLOmXvmTbCkQlGiGyU5APeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429587; c=relaxed/simple;
	bh=E23o1WuVCWV4lsZQpavmUfvaAT35SzN5pxwguUo9ASg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX8Ak0oykktCpty9MUBruddZsGP6dHfv4e3HvSpK1WG6YBMAtcCjcd2H1ekoWpmxyYDGRKoCBmA5cp0p85nBQ1zuTv/Itmlq0TaRXMSVsyxl//CFKSg/GnAznFZKXxTa9X0GfP1MBS5ZAm/murb6HlgEcv8/T8H4xKF6DA+Sfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyREzBrx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C397C4CEF7;
	Wed, 14 Jan 2026 22:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429586;
	bh=E23o1WuVCWV4lsZQpavmUfvaAT35SzN5pxwguUo9ASg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyREzBrxP2KEIiRzAKjP6CRaaALpibZspraJYZxrV2N0erA+9u2YTERmy0/yPyO+K
	 hgcYxDpp9HcdyaArIDgiMhD9PHWt4CHMW8wtNvB69IFMEt46JRTqluioeq7rsa+ygD
	 Iv0MrniQRaGZnhGAKaacvnpDNT2XW03OQFNgDui4iLLD0DQSTxhPAvFEYCjX2yQEdl
	 xysxNLVBsMykIHZm5ycX0F9GaAlqFSi2E2zKGw4xPjqyMbLiJlDtBb2VI1gmHgQ1gx
	 WD5J4xbij2cHKdkWWakBj1QUaOWxqujnfhkQfZ8pyf9qq68St2O8WKYyNy5A9hzGWy
	 2abu/B//8upLA==
Date: Wed, 14 Jan 2026 22:26:20 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Message-ID: <20260114-wasabi-roster-77dff5518a79@spud>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud>
 <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud>
 <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TyXLv511dB9v7TLC"
Content-Disposition: inline
In-Reply-To: <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>


--TyXLv511dB9v7TLC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 08:53:12PM +0000, Lad, Prabhakar wrote:
> Hi All,
>=20
> Sorry for the late reply.
>=20
> On Mon, Dec 8, 2025 at 6:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:
> > > Hi Conor,
> > >
> > > Sorry for the delayed response. Ive got feedback from the HW team.
> > >
> > > On Fri, Oct 17, 2025 at 4:33=E2=80=AFPM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > >
> > > > Hi Conor,
> > > >
> > > > Thank you for the review.
> > > >
> > > > On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.=
org> wrote:
> > > > >
> > > > > On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Document the pin configuration properties supported by the RZ/T=
2H pinctrl
> > > > > > driver. The RZ/T2H SoC supports configuring various electrical =
properties
> > > > > > through the DRCTLm (I/O Buffer Function Switching) registers.
> > > > > >
> > > > > > Add documentation for the following standard properties:
> > > > > > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> > > > > >   pull-up/pull-down resistors (3 options: no pull, pull-up, pul=
l-down)
> > > > > > - input-schmitt-enable, input-schmitt-disable: Control Schmitt =
trigger
> > > > > >   input
> > > > > > - slew-rate: Control output slew rate (2 options: slow/fast)
> > > > > >
> > > > > > Add documentation for the custom property:
> > > > > > - renesas,drive-strength: Control output drive strength using d=
iscrete
> > > > > >   levels (0-3) representing low, medium, high, and ultra high s=
trength.
> > > > > >   This custom property is needed because the hardware uses fixe=
d discrete
> > > > > >   levels rather than configurable milliamp values.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > ---
> > > > > >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++=
++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,=
r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,=
r9a09g077-pinctrl.yaml
> > > > > > index 36d665971484..9085d5cfb1c8 100644
> > > > > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g0=
77-pinctrl.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g0=
77-pinctrl.yaml
> > > > > > @@ -72,6 +72,19 @@ definitions:
> > > > > >        input: true
> > > > > >        input-enable: true
> > > > > >        output-enable: true
> > > > > > +      bias-disable: true
> > > > > > +      bias-pull-down: true
> > > > > > +      bias-pull-up: true
> > > > > > +      input-schmitt-enable: true
> > > > > > +      input-schmitt-disable: true
> > > > > > +      slew-rate:
> > > > > > +        enum: [0, 1]
> > > > >
> > > > > What are the meanings of "0" and "1" for slew rate? Why isn't thi=
s given
> > > > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same=
 values
> > > > are programmed in the register to configure the slew rate.
> > > >
> > > > > as the actual rates? The docs surely give more detail than just "=
slow"
> > > > > and "fast".
> > > > You mean to represent slew-rate in some sort of a unit?
> > > >
> > > Based on the comments from the HW team, there is no numerical
> > > definition to represent slow/fast It only defines a relative
> > > relationship.
> > > > >
> > > > > > +      renesas,drive-strength:
> > > > > > +        description:
> > > > > > +          Drive strength configuration value. Valid values are=
 0 to 3, representing
> > > > > > +          increasing drive strength from low, medium, high and=
 ultra high.
> > > > >
> I got the feedback from the HW team "The RZ/T2H drive strength
> (driving ability) is expressed using abstract levels such as Low,
> Middle, and High. These values do not correspond directly to specific
> mA units. To determine how much current the pin can actually drive,
> the engineer must refer to the electrical characteristics table.
> Therefore, the drive strength in RZ/T2H is a parameter that switches
> the internal output transistor mode rather than directly representing
> a physical drive current.
> Consequently, expressing RZ/T2H drive strength in milli- or
> micro-amps, as suggested by the reviewer, is inappropriate. To
> accurately reflect the SoC's hardware specification, introducing a
> custom property is essential."

I feel kinda stupid reading the extracted portions of the document, is
it not just telling us what the drive strengths are in the "Conditions"
cell of the output voltage rows?
They don't directly correspond to current values, since it varies based
on the type of buffer and the voltage level. Is that what your hardware
guys are trying to say? That there's not a 1:1 fixed mapping because the
meanings of "low" etc vary based on voltage and buffer?

If that's the case, the voltage is discernible from "power-source", can
the buffer type be determined from the pin number? Or maybe both can be
determined from the pin number?

>=20
> To elaborate more on this [0] has the tables which are extracted from
> the HW manual [1] (which needs login). For example, considering SDHI
> referring to table 58.39 in [0] the drive strength can be calculated
> for SD using  I =3D C =C3=97 (delta V / deltaT).
>=20
> For (SD) SDR104/ (eMMC)HS200 case C =3D 15pf, VDD1833 =3D 1.8 V and
> rise/fall time 1ns that would result to 27.000 mA
> For (SD) SDR50, SDR25, SDR12 (eMMC) High Speed SDR case C =3D 20pf,
> VDD1833 =3D 1.8 V and rise/fall time 2ns that would result to 18.000 mA
>=20
> As the drive strength is varying based on the speeds this cannot be
> tied up to the fixed value. Hence to simplify the Table 58.11 in [0]
> lists out the required drive strength and slew rate based on operating
> voltage levels.
>=20
> [0] https://gist.github.com/prabhakarlad/026a73c3a3922da2b88d0578db68276c
> [1] https://www.renesas.com/en/document/mah/rzt2h-and-rzn2h-groups-users-=
manual-hardware?language=3Den&r=3D25567515
>=20
> Please share your thoughts.
>=20
> Cheers,
> Prabhakar

--TyXLv511dB9v7TLC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWgYDAAKCRB4tDGHoIJi
0n75AQDWg9Glu0MoZ1Ee0MGHGGyz7XnRjnrol7zAhdu2eDWtUQEArNuITtUnpFMx
GVi7aMfMMDK9udygv6tpVhaadBeRNQM=
=d9MZ
-----END PGP SIGNATURE-----

--TyXLv511dB9v7TLC--

