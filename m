Return-Path: <linux-gpio+bounces-29390-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DDFCADF34
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 19:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D393B305B7EC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 18:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB9230BF6;
	Mon,  8 Dec 2025 18:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSRPUnqI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF603B8D53;
	Mon,  8 Dec 2025 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216861; cv=none; b=Y2H7447/OeIpKTGGQN4vBJzWx8v7DappP3gqWKNfmj/Q6eKpHugViTz0N4wHWJRZAr10MrVbKYP3m6mgScnnm/mWX+VQ0d5d5bFhr66hQw3gD9bigIBA6CUXVxC3I6Pe0W1ItilQkf5YIm4YmopsTaKoCSAAJQuFU/Fsp5RDBNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216861; c=relaxed/simple;
	bh=NskBesqA3nqRQR+hbzhe1dt8pc42b5WrjnHJgQLjDoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfwFZZnWe+3Ih3poslq/wxOSYRz247akhNYatW+cCfvtSaSJ6DJZ9nUW4Bx5KgIytooVBdDj5D/z2JtZvtDJ9RAY1yPZxmWWr91IKUDXp6jgadhgHDNMXEN4tx6Hq5oIRcCnRqysf5rFg2W7vpxC0DhrKB1XDRS6qhyu5MLZLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSRPUnqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F4BC4CEF1;
	Mon,  8 Dec 2025 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765216860;
	bh=NskBesqA3nqRQR+hbzhe1dt8pc42b5WrjnHJgQLjDoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSRPUnqIfPvdwld50Qkn93m0//kAWy0d2Wh1B6GtfSCj20X4VoNxv6+SlUUhu4yyW
	 cbfxCYWyfrmg3o+EdjKN+OpNNXCZNbSNavt64FOL3eAnKvhoCYqWlG157qAPDjtYqg
	 7rzlyhNqmZm5mWVFSe97EPTCry+wqA+WbqRa//2+o5Omho1MifErbvre/TPHuzFAgZ
	 k4gafrW5zai+c+hYARD02NLvgMUv79mHbPTa/orYWTq5rhiDnMGguwLdipGRLYwbly
	 cc/6pcyBZYEDPgUaiPioEHo18SluQztl/YpIke4seMIv0O3Wpcz8VieMudZe+RYBGb
	 DJ/aZzaRiPopA==
Date: Mon, 8 Dec 2025 18:00:55 +0000
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
Message-ID: <20251208-headgear-header-e17e162f0f52@spud>
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud>
 <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dA0IuGHmQiFxChdp"
Content-Disposition: inline
In-Reply-To: <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>


--dA0IuGHmQiFxChdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:
> Hi Conor,
>=20
> Sorry for the delayed response. Ive got feedback from the HW team.
>=20
> On Fri, Oct 17, 2025 at 4:33=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Conor,
> >
> > Thank you for the review.
> >
> > On Thu, Oct 16, 2025 at 5:41=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Tue, Oct 14, 2025 at 08:11:20PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Document the pin configuration properties supported by the RZ/T2H p=
inctrl
> > > > driver. The RZ/T2H SoC supports configuring various electrical prop=
erties
> > > > through the DRCTLm (I/O Buffer Function Switching) registers.
> > > >
> > > > Add documentation for the following standard properties:
> > > > - bias-disable, bias-pull-up, bias-pull-down: Control internal
> > > >   pull-up/pull-down resistors (3 options: no pull, pull-up, pull-do=
wn)
> > > > - input-schmitt-enable, input-schmitt-disable: Control Schmitt trig=
ger
> > > >   input
> > > > - slew-rate: Control output slew rate (2 options: slow/fast)
> > > >
> > > > Add documentation for the custom property:
> > > > - renesas,drive-strength: Control output drive strength using discr=
ete
> > > >   levels (0-3) representing low, medium, high, and ultra high stren=
gth.
> > > >   This custom property is needed because the hardware uses fixed di=
screte
> > > >   levels rather than configurable milliamp values.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  .../bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml | 13 +++++++++=
++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a0=
9g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a0=
9g077-pinctrl.yaml
> > > > index 36d665971484..9085d5cfb1c8 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-p=
inctrl.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-p=
inctrl.yaml
> > > > @@ -72,6 +72,19 @@ definitions:
> > > >        input: true
> > > >        input-enable: true
> > > >        output-enable: true
> > > > +      bias-disable: true
> > > > +      bias-pull-down: true
> > > > +      bias-pull-up: true
> > > > +      input-schmitt-enable: true
> > > > +      input-schmitt-disable: true
> > > > +      slew-rate:
> > > > +        enum: [0, 1]
> > >
> > > What are the meanings of "0" and "1" for slew rate? Why isn't this gi=
ven
> > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same val=
ues
> > are programmed in the register to configure the slew rate.
> >
> > > as the actual rates? The docs surely give more detail than just "slow"
> > > and "fast".
> > You mean to represent slew-rate in some sort of a unit?
> >
> Based on the comments from the HW team, there is no numerical
> definition to represent slow/fast It only defines a relative
> relationship.
> > >
> > > > +      renesas,drive-strength:
> > > > +        description:
> > > > +          Drive strength configuration value. Valid values are 0 t=
o 3, representing
> > > > +          increasing drive strength from low, medium, high and ult=
ra high.
> > >
> > > I see what you wrote in the commit message, but I don't really get why
> > > you need a custom property. I would imagine most devices only have so=
me
> > > some small set of "fixed discrete levels", yet manage with milli- or
> > > micro-amps fine. Converting from mA to register values in a driver is
> > > not difficult, and I figure the documentation for the device probably
> > > doesn't just give vague strengths like "medium" or "ultra high", but
> > > probably provides currents?
> > >
> > > I dunno, I am just confused by the need to shove register values into
> > > these properties, rather than using the actual units.
> > >
> > I'm checking this with the HW team. I'll get back on this once I have
> > some feedback.
> >
> The current value is determined by the load on the external circuit
> and is not affected by the choice of drive strength. For example, if a
> 3.3V signal line (H =3D 3.3V, L =3D 0V) has a 3.3k=CE=A9 load, the result=
ing
> current will be 1mA, regardless of whether you select Low, Mid, High,
> or Ultra High drive strength. What changes with Low/Mid/High/Ultra
> High is the =E2=80=9Cslew rate=E2=80=9D of the transitions (H --> L and L=
 --> H), not
> the current itself.
>=20
> Please share your thoughts on how to implement these properties.

ngl, sounds like both of these properties should be strings, but for the
fact that slew-rate is open ended and I am pretty sure used like you are
using it elsewhere.
The second property, I'm not sure what you're trying to say with your
example. Ignoring the specifics of your platform, and using the normal
drive-strength property, I wouldn't expect that, if a given drive strength
can provide 1 mA, that increasing the drive strength would increase the
current. It would be impossible for it to do so!
Remember, drive strength is the current that can be delivered through a
pin, not how much it is delivering at a given point in time.
I would also expect that increasing the drive strength (still using the
regular definition/property) would improve the rate of transition between
states, in addition to increasing the maximum drive, although not the
primary goal.

What I find weird about your explanation is that, taken at face value,
where this vendor specific property has no effect on steady-state drive
strength and only on slew rate, you have two different slew rate
controls. The regular slew-rate with 2 options and this one with 4.
That, combined with the example that doesn't make sense, casts doubt
over the explanation you're providing for what this actually is
controlling. If this truly has no impact on steady-state drive strength,
how do these two slew-rate controls actually interact?=20

--dA0IuGHmQiFxChdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcSVwAKCRB4tDGHoIJi
0q3cAQDK/XmfUrSWcTbRkx2HdIEsQC2f1EKYcb/IXotyLrKe8gD+MfjiHhMYggjh
Ft4grxMCXBFIgRTmdm7wVh4Y1MCaJwQ=
=15sV
-----END PGP SIGNATURE-----

--dA0IuGHmQiFxChdp--

