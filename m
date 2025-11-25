Return-Path: <linux-gpio+bounces-29049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1CC82ED0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 01:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9003A296B
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 00:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172411F0991;
	Tue, 25 Nov 2025 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHJHBreo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF141E1A17;
	Tue, 25 Nov 2025 00:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764030248; cv=none; b=f6s1zG5Acd/Y3kLTlNGyFim/4Y3uHiNyngtZRCySwum9Dk8ofGNnpb3JcAb/OyZB82ODW42+oD5sw2eLvdv3h6nMrhKKmLo5qViqevpNa3VIk2k1zq7A0V7DFq9hX1eEhyrymtY+cNOqF7berTLwMWdQsGqw2NAzJVupCNjQ5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764030248; c=relaxed/simple;
	bh=f1GNtO3uGvmfPfAzL3t9Asd5wo6PssvRIcOCZC66T30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdcKwyrpMqcyRL7Rx98hG3VQknagP3lG9DlnRgtpI3CM06Ph89aDNFxOSXELOt6Y0Pz//wLuofjMb3jSjYQBIDnczfxfgQUej7Q77jp4MFgfO1O4cS0BQCNNeVwluyzqJEaO6tSlfa3ryFacCTPHIgZWJgi5y3xQbxWyWI907u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHJHBreo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9D0C116D0;
	Tue, 25 Nov 2025 00:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764030248;
	bh=f1GNtO3uGvmfPfAzL3t9Asd5wo6PssvRIcOCZC66T30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHJHBreonkr25UphjnQ+Id/lBw47Cj5etcctPFEyexcflZDqOT2CL5vl/rIAzJuZk
	 Vm+i8ics3rxzBYoPTI3x7wI2yHYNLJI9bVAbvOeCUQvQM9JdmqC/feoqvUZMZLOvIV
	 JsZLQyBuYbdX7ZdnI5l+pznRpcN6IJOXj9cFR8v/48Df9fu2M9wQs7+WsCDeJai6No
	 cABaAoqgGp5XKc+GvdgxcUqvLqvycYvqw9WxGibq2IsFdn8RNew8nH6w4U5qYkK+c7
	 XC19RO9yaCvC+nqp4E5iFII1bm/V+AtBC3kziSUp6Z1bHR4R2U8cgYfXXE8sx0EvAC
	 o2pVEKowm1OXQ==
Date: Tue, 25 Nov 2025 00:24:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251125-worsening-campsite-983a1674872b@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
 <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud>
 <20251121-skimpily-flagstone-8b96711443df@spud>
 <CAD++jLm6iDJkUHQyQ+JnH76yC8FcWtjon9s1yhavoX9Y3=wZcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9CvW4pWoTvl5TZTb"
Content-Disposition: inline
In-Reply-To: <CAD++jLm6iDJkUHQyQ+JnH76yC8FcWtjon9s1yhavoX9Y3=wZcA@mail.gmail.com>


--9CvW4pWoTvl5TZTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 01:10:26AM +0100, Linus Walleij wrote:
> On Fri, Nov 21, 2025 at 12:21=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > ngl, I forget if there's a shorthand for the bias part, so I just want
> > to know if is this an accurate summary of what's exclusive?
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml=
 b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > index cbfcf215e571..6865472ac124 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -153,4 +153,66 @@ properties:
> >        pin. Typically indicates how many double-inverters are
> >        used to delay the signal.
> >
> > +allOf:
> > +  - if:
> > +      required:
> > +        - output-disable
> > +    then:
> > +      properties:
> > +        output-enable: false
> > +        output-impedance-ohms: false
>=20
> Looks right.
>=20
> > +  - if:
> > +      required:
> > +        - output-low
> > +    then:
> > +      properties:
> > +        output-high: false
>=20
> Looks right.
>=20
> > +  - if:
> > +      required:
> > +        - low-power-enable
> > +    then:
> > +      properties:
> > +        low-power-disable: false
>=20
> Looks right.
>=20
> > +  - if:
> > +      required:
> > +        - input-schmitt-disable
> > +    then:
> > +      properties:
> > +        input-schmitt-enable: false
> > +        input-schmitt-microvolt: false
>=20
> Looks right.
>=20
> > +  - if:
> > +      required:
> > +        - drive-open-source
> > +    then:
> > +      properties:
> > +        drive-open-drain: false
>=20
> drive-push-pull is mutually exclusive
> with each of these as well.
>=20
> > +  - if:
> > +      anyOf:
> > +        - required:
> > +            - bias-disable
> > +        - required:
> > +            - bias-high-impedance
> > +        - required:
> > +            - bias-hold
> > +        - required:
> > +            - bias-up
> > +        - required:
> > +            - bias-down
> > +        - required:
> > +            - bias-pull-pin-default
> > +    then:
> > +      oneOf:
> > +        - required:
> > +            - bias-disable
> > +        - required:
> > +            - bias-high-impedance
> > +        - required:
> > +            - bias-hold
> > +        - required:
> > +            - bias-up
> > +        - required:
> > +            - bias-down
> > +        - required:
> > +            - bias-pull-pin-default
>=20
> These is a bunch of "pull" infixes missing from the
> above.

lol, that's silly to miss.

> After looking at it for a while I concluded this
> is right as well, if just the right names are added.
> I would add a comment like
>=20
> # We can only ever allow exactly one of these,
> # they are all mutually exclusive.
>=20
> Additionally:
>=20
> drive-strength and drive-strength-microamp are mutually
> exclusive.

Oh right yea, didn't notice that one.

> input-enable and input-disable are mutually exclusive.

And this one I meant to do and forgot.

> low-power-enable and low-power-disable are mutually
> exclusive.

This I did do.

> input-schmitt need to be added as deprecated.

I figured the best way to deprecate it was not add it at all to the
binding? Deprecated properties don't warn, undocumented ones do.

> Can you cook a patch? Maybe test it on the existing
> device trees first to see that it doesn't wreac havoc.

Yeah, I'll send it along with whatever the code equivalent ends up
being. I tested against riscv, which is a tiny sample. I'll probably do
it on the arms before submitting and see.


--9CvW4pWoTvl5TZTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaST3IwAKCRB4tDGHoIJi
0jSMAQDXhfe3WoWhQadg1ttHsHH+4hi9RHrrfDmu94h7mCLsZwD/R0N12NmF7V0h
d6eM81OSl+yDAEvUt4krp3Q1+j8kVQQ=
=E68t
-----END PGP SIGNATURE-----

--9CvW4pWoTvl5TZTb--

