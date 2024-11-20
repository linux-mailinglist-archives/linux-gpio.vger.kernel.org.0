Return-Path: <linux-gpio+bounces-13155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9B9D380D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 11:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC811F2244F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 10:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844A319D884;
	Wed, 20 Nov 2024 10:12:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF3219CC05;
	Wed, 20 Nov 2024 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732097568; cv=none; b=o594eK5UF0FIy9i2PgwetZnD7203n+4es59iWCDBDwPQw8jaltSX4jvVICxSq6yjncmsAFhEyKms+Juxj4ByD6J+MLK4udSueD0pg9d7nAeg+pzU1ecJQtEF/kBH8gANFrRHx5SNSZ0SKaM9kRhlrA1EuOe82Vec3yqNGHibwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732097568; c=relaxed/simple;
	bh=JLbYvDGabMojfBULJgHCYLpP1TlbXhIpPGTYwRzRmnM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPxIxYYoUl2bcPFv6OPABR5sy3HlsfzRBJvNvi8hVLp2GWGVKKYqnmkrQFrfcGlQFsLqnaOfGJCE1xHkqsLd+Eg431Rhk/9sWGCgeivYkbA2X7TSInOkDXMnE4W5SP4PkqUCGNoU/l1jq6Rrypb6gYpsN5vS3fi2I81wG2VQ4x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B517612FC;
	Wed, 20 Nov 2024 02:13:14 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9EA83F5A1;
	Wed, 20 Nov 2024 02:12:42 -0800 (PST)
Date: Wed, 20 Nov 2024 10:12:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner
 A523/T527
Message-ID: <20241120101228.26bbf100@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
References: <20241111005750.13071-1-andre.przywara@arm.com>
	<20241111005750.13071-6-andre.przywara@arm.com>
	<CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
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

On Wed, 13 Nov 2024 16:50:19 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi Chen-Yu,

sorry for the late reply, I was away for a week.

> On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > The A523 contains a pin controller similar to previous SoCs, although
> > using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> > This introduces a new style of binding, where the pinmux values for each
> > pin group is stored in the new "allwinner,pinmux" property in the DT
> > node, instead of requiring every driver to store a mapping between the
> > function names and the required pinmux.
> >
> > Add the new name to the list of compatible strings, and required it to
> > have 10 interrupts described. Also add the new pinmux property.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4=
i-a10-pinctrl.yaml
> > index 4502405703145..6fc18e92e1e94 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pin=
ctrl.yaml
> > @@ -56,6 +56,8 @@ properties:
> >        - allwinner,sun50i-h6-r-pinctrl
> >        - allwinner,sun50i-h616-pinctrl
> >        - allwinner,sun50i-h616-r-pinctrl
> > +      - allwinner,sun55i-a523-pinctrl
> > +      - allwinner,sun55i-a523-r-pinctrl
> >        - allwinner,suniv-f1c100s-pinctrl
> >        - nextthing,gr8-pinctrl
> >
> > @@ -64,7 +66,7 @@ properties:
> >
> >    interrupts:
> >      minItems: 1
> > -    maxItems: 8
> > +    maxItems: 10
> >      description:
> >        One interrupt per external interrupt bank supported on the
> >        controller, sorted by bank number ascending order.
> > @@ -119,13 +121,17 @@ patternProperties:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [10, 20, 30, 40]
> >
> > +      allwinner,pinmux:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: pinmux selector for each pin
> > + =20
>=20
> Why not just the standard "pinmux" property, as given in
> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

I had it like this in my last post two years ago, but learned from
LinusW [1] that the generic pinmux property has a slightly different
meaning, and abusing it for just the pinmux index values would not match
the generic definition.
We *could* use the generic definition, but then this would include what's
in the "pins" property, like I sketched out in the cover letter, as an
alternative to this approach:
	pinmux =3D <SUNXI_PIN(PB, 9, 2)>, <SUNXI_PIN(PB, 10, 2)>;
Where the SUNXI_PIN macro would combine the pin number and the pinmux into
one 32-bit cell. See the Apple GPIO DT nodes for an example.
This looks indeed nicer, but requires quite some rewrite of the existing
pinctrl driver, AFAICS.

[1] Previous reply from LinusW:
https://lore.kernel.org/linux-sunxi/CACRpkdbMc-Q6wjgsiddu6-tWC1dt2uFk+4Lyer=
MdgFk2KRGK4w@mail.gmail.com/

>=20
> >      required:
> >        - pins
> >        - function =20
>=20
> This section should be made to apply only to the existing
> compatibles? Maybe we could just split the files and have
> a clean slate for sun55i?

Yeah, I couldn't find a good example how to make it *required* for one
compatible and *not allowed* for all the others. But creating a whole new
file is actually a good idea, as this also avoids adding another case to
the already quite indented if-else cascade.

Cheers,
Andre

> ChenYu
>=20
> >      additionalProperties: false
> >
> > -  "^vcc-p[a-ilm]-supply$":
> > +  "^vcc-p[a-klm]-supply$":
> >      description:
> >        Power supplies for pin banks.
> >
> > @@ -156,6 +162,17 @@ allOf:
> >          - interrupts
> >          - interrupt-controller
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> > +            - allwinner,sun55i-a523-pinctrl
> > +
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          minItems: 10
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -166,6 +183,7 @@ allOf:
> >        properties:
> >          interrupts:
> >            minItems: 8
> > +          maxItems: 8
> >
> >    - if:
> >        properties:
> > @@ -244,6 +262,7 @@ allOf:
> >              - allwinner,sun8i-v3s-pinctrl
> >              - allwinner,sun9i-a80-r-pinctrl
> >              - allwinner,sun50i-h6-r-pinctrl
> > +            - allwinner,sun55i-a523-r-pinctrl
> >
> >      then:
> >        properties:
> > --
> > 2.46.2
> > =20


