Return-Path: <linux-gpio+bounces-14770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E56A10539
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 12:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751443A6FAC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 11:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE34728EC84;
	Tue, 14 Jan 2025 11:21:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902AD1D79B8;
	Tue, 14 Jan 2025 11:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736853719; cv=none; b=c06yMbBBEgDKBTA2FDsgBVMzREeMWXkmhPQX0u1YiXifNks6IFrEpeCZF248Mh1lzjaTh0nddE/xk4Eu4GLHCtUiU+HRr/2rHIaj2uIvtlGyYevjCHEq9nXEkyKVUn/AEJnBDMekmOSw37Cams5/FMK3O0ZNtVh8IWfINVh8Iks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736853719; c=relaxed/simple;
	bh=QaLrvM7SFNLtlilHraRkSy3EanVychYDHqY+bkjn3B8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Km2XQZ0WW82xqwMPSIlSkuRUfMsNxwLKxlhgaR2fR/k6wdPDQm9dxv/kpFLGptHabxA+x1NFPEIxUCuU9rXJrq85s5gzlbuUFn/tBo2gBJeENsUSg8C2HDBmUhhGJJw0tPAV8Ew+ifne7Qw80+FvRtDkmhZ8PJfCMYUuVZ+PS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6082E11FB;
	Tue, 14 Jan 2025 03:22:24 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7B83F66E;
	Tue, 14 Jan 2025 03:21:53 -0800 (PST)
Date: Tue, 14 Jan 2025 11:21:49 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner
 A523/T527
Message-ID: <20250114112149.5448baae@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
	<20241111005750.13071-6-andre.przywara@arm.com>
	<CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
	<20241120101228.26bbf100@donnerap.manchester.arm.com>
	<CAGb2v663LeDtk1ZGOAztQ+Sx5OtbSx+xkLgypZYRjXkAr6_GRA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jan 2025 15:01:31 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi Chen-Yu,

before I get to your specific question below: what do you think in
general of the idea of getting rid of that table based approach we use so
far? Is that something worthwhile? I definitely think yes, but wanted to
hear the maintainers' opinion about this. Happy to present some arguments
if need be.

...

> On Wed, Nov 20, 2024 at 6:12=E2=80=AFPM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > On Wed, 13 Nov 2024 16:50:19 +0800
> > Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > Hi Chen-Yu,
> >
> > sorry for the late reply, I was away for a week.
> > =20
> > > On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywar=
a@arm.com> wrote: =20
> > > >
> > > > The A523 contains a pin controller similar to previous SoCs, althou=
gh
> > > > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > > > This introduces a new style of binding, where the pinmux values for=
 each
> > > > pin group is stored in the new "allwinner,pinmux" property in the DT
> > > > node, instead of requiring every driver to store a mapping between =
the
> > > > function names and the required pinmux.
> > > >
> > > > Add the new name to the list of compatible strings, and required it=
 to
> > > > have 10 interrupts described. Also add the new pinmux property.
> > > >
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++=
++--
> > > >  1 file changed, 21 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,su=
n4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,=
sun4i-a10-pinctrl.yaml
> > > > index 4502405703145..6fc18e92e1e94 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10=
-pinctrl.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10=
-pinctrl.yaml
> > > > @@ -56,6 +56,8 @@ properties:
> > > >        - allwinner,sun50i-h6-r-pinctrl
> > > >        - allwinner,sun50i-h616-pinctrl
> > > >        - allwinner,sun50i-h616-r-pinctrl
> > > > +      - allwinner,sun55i-a523-pinctrl
> > > > +      - allwinner,sun55i-a523-r-pinctrl
> > > >        - allwinner,suniv-f1c100s-pinctrl
> > > >        - nextthing,gr8-pinctrl
> > > >
> > > > @@ -64,7 +66,7 @@ properties:
> > > >
> > > >    interrupts:
> > > >      minItems: 1
> > > > -    maxItems: 8
> > > > +    maxItems: 10
> > > >      description:
> > > >        One interrupt per external interrupt bank supported on the
> > > >        controller, sorted by bank number ascending order.
> > > > @@ -119,13 +121,17 @@ patternProperties:
> > > >          $ref: /schemas/types.yaml#/definitions/uint32
> > > >          enum: [10, 20, 30, 40]
> > > >
> > > > +      allwinner,pinmux:
> > > > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        description: pinmux selector for each pin
> > > > + =20
> > >
> > > Why not just the standard "pinmux" property, as given in
> > > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml =20
> >
> > I had it like this in my last post two years ago, but learned from
> > LinusW [1] that the generic pinmux property has a slightly different
> > meaning, and abusing it for just the pinmux index values would not match
> > the generic definition.
> > We *could* use the generic definition, but then this would include what=
's
> > in the "pins" property, like I sketched out in the cover letter, as an
> > alternative to this approach:
> >         pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
> > Where the SUNXI_PIN macro would combine the pin number and the pinmux i=
nto
> > one 32-bit cell. See the Apple GPIO DT nodes for an example.
> > This looks indeed nicer, but requires quite some rewrite of the existing
> > pinctrl driver, AFAICS. =20
>=20
> Sorry for taking so long to get back to this.
>=20
> Could we maybe add a generic replacement of the existing "function"
> property, which takes a string? Like "function-id" or "function-selector"
> that takes u32 (or u8). Then it could be one or the other. Not sure
> if the binding maintainers would accept this or not.

Do you mean specifically a *generic* property, as opposed to something
prefixed with a vendor string, and coded up in just the sunxi driver?

Because otherwise "allwinner,pinmux" is that numeric equivalent to
"function". I kept "function", as a string, because the GPIO framework
still needs a string at places, for instance for sysfs. We could create
those strings, based on the node name, by sprintf'ing something, but I
figured we might as well keep "function".
In my U-Boot patches [1] I actually ignore the new pinmux property, and
still use the function name, as it was easier to integrate into the
existing code. U-Boot uses a very limited subset of our current table,
so each new SoC doesn't add much to the code.

[1] https://github.com/apritzel/u-boot/commit/ab4f7ed0879022357646

Code-wise I think we would still need our own driver code, so whether we
use "function-id" or "allwinner,pinmux" in there doesn't make much of a
difference, I think.=20

> I understand that we probably don't want the mux value combined with
> the pin number.

You mean like the Apple GPIO does? I wonder why not, actually? I find this
actually quite clever and compact. Again the "pins" property atm is quite
string-heavy, so the code has to translate this back into a bank and pin
number, then lookup the function string in our table to get the pinmux
value. We could fit all of this information easily into this new
generic "pinmux" property, and the code just needs to mask and shift that
number. Each pin occupies a cell, I don't think we can get much better
than that?

Cheers,
Andre

> ChenYu
>=20
> > [1] Previous reply from LinusW:
> > https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk+4=
LyerMdgFk2KRGK4w@mail.gmail.com/
> > =20
> > > =20
> > > >      required:
> > > >        - pins
> > > >        - function =20
> > >
> > > This section should be made to apply only to the existing
> > > compatibles? Maybe we could just split the files and have
> > > a clean slate for sun55i? =20
> >
> > Yeah, I couldn't find a good example how to make it *required* for one
> > compatible and *not allowed* for all the others. But creating a whole n=
ew
> > file is actually a good idea, as this also avoids adding another case to
> > the already quite indented if-else cascade.
> >
> > Cheers,
> > Andre
> > =20
> > > ChenYu
> > > =20
> > > >      additionalProperties: false
> > > >
> > > > -  "^vcc-p[a-ilm]-supply$":
> > > > +  "^vcc-p[a-klm]-supply$":
> > > >      description:
> > > >        Power supplies for pin banks.
> > > >
> > > > @@ -156,6 +162,17 @@ allOf:
> > > >          - interrupts
> > > >          - interrupt-controller
> > > >
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          enum:
> > > > +            - allwinner,sun55i-a523-pinctrl
> > > > +
> > > > +    then:
> > > > +      properties:
> > > > +        interrupts:
> > > > +          minItems: 10
> > > > +
> > > >    - if:
> > > >        properties:
> > > >          compatible:
> > > > @@ -166,6 +183,7 @@ allOf:
> > > >        properties:
> > > >          interrupts:
> > > >            minItems: 8
> > > > +          maxItems: 8
> > > >
> > > >    - if:
> > > >        properties:
> > > > @@ -244,6 +262,7 @@ allOf:
> > > >              - allwinner,sun8i-v3s-pinctrl
> > > >              - allwinner,sun9i-a80-r-pinctrl
> > > >              - allwinner,sun50i-h6-r-pinctrl
> > > > +            - allwinner,sun55i-a523-r-pinctrl
> > > >
> > > >      then:
> > > >        properties:
> > > > --
> > > > 2.46.2
> > > > =20
> > =20


