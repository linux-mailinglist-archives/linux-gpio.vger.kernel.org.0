Return-Path: <linux-gpio+bounces-27130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A96BDADF6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C975B19A4CA2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E6530748D;
	Tue, 14 Oct 2025 17:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bu/eZlsz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C488273804;
	Tue, 14 Oct 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760464734; cv=none; b=SD587kYrE7rwtxgfwtggI6yYJ7U0UX1tk33LHpjC/Jg2Puf3406bLtV+WTChA9wbrjeFEQueCfj6/WYuRuGAqIoZJsmQgM0YrcgSlR8JJW4BZ7Pzplu//U37fMbUsUMn06+hJeVgokDicSqSPWkVHPwpqmOlO8gN8fOFxZ2QeoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760464734; c=relaxed/simple;
	bh=XDE6Yxeh5XTmulB/+mdNcqgIXS4uoK/1f8lE5Ir5Ezg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s94aD5k/8lc4sdzw+6NamAPv0Wuz0lz+vakkrKrLE3D9IAq3/EIEVugdw3lvpnX3rocb/TInW1t1ZkUzHTEJts5RUMsTNiYH+EAyj4gbT8MuDf/vfnASLSF9jidbQAo7V/LQLzgxAlutPGz6fSyADNDE9nlHWYO1xI3T8TbVhbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bu/eZlsz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0128C4CEE7;
	Tue, 14 Oct 2025 17:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760464733;
	bh=XDE6Yxeh5XTmulB/+mdNcqgIXS4uoK/1f8lE5Ir5Ezg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bu/eZlsz44HxEbI47lj8muJJ1DeQ5g63sPU/8wR/cfumSftjo+mx1WWB7eCjqTgxm
	 mj2N1DKHcHqc9qcyJM+Mme3ktfwcJLpWKUH4l8ExKtww8bTqPCLqgnTqnFZf82fs3C
	 asYvnH6Q/I+Cn6GCWxIDT4B7nijvusMAZ7Mm21vCTz8n6c8KAPw1BYFvf1x6W2I/+d
	 sMGLcrwHMvbNwdKCDHhl7Wl6U39+xof8+9+4vuTPnf6gNjtzPyrt+8BTOeYvA80/e3
	 7HxvHGN1n5aaPHGiwOmDZ4gJWs0n5Y4+NpVa82qK1vqUhAG5ZvkA8tZdDr3xDqqWgV
	 ywhKGFc5I6vkw==
Date: Tue, 14 Oct 2025 18:58:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Gary Yang <gary.yang@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251014-backyard-parted-572627bfc540@spud>
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-2-gary.yang@cixtech.com>
 <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7QY2DKFaWvZjWwF"
Content-Disposition: inline
In-Reply-To: <CACRpkda-2BNj+Pt2kS9u_bbr41bsWGRGDqNd3EXVnys-xSqg0g@mail.gmail.com>


--r7QY2DKFaWvZjWwF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 12:44:15PM +0200, Linus Walleij wrote:
> Hi Gary,
>=20
> thanks for your patch!
>=20
> On Tue, Oct 14, 2025 at 3:57=E2=80=AFAM Gary Yang <gary.yang@cixtech.com>=
 wrote:
>=20
>=20
> > +# Client device subnode's properties
> > +patternProperties:
> > +  'pins$':
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      '(^pins|pins?$)':
> > +        type: object
> > +        additionalProperties: false
> > +        description:
> > +          A pinctrl node should contain at least one subnodes represen=
ting the
> > +          pinctrl groups available on the machine. Each subnode will l=
ist the
> > +          pins it needs, and how they should be configured, with regar=
d to muxer
> > +          configuration, pullups, and drive strength.
> > +
> > +        properties:
> > +          pinmux:
> > +            description:
> > +              Values are constructed from pin number and mux setting a=
nd are
> > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfun=
c.h directly.
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          drive-strength:
> > +            description:
> > +              Can support 15 levels, from DS_LEVEL1 to DS_LEVEL15.
> > +              defined as macros in arch/arm64/boot/dts/cix/sky1-pinfun=
c.h.

Isn't this wrong?
drive-strength is in mA but you're just shoving register values in here.
pw-bot: changes-requested

> > +
> > +        required:
> > +          - pinmux
>=20
> Can't you just include both pinmux-node.yaml and pincfg-node.yaml
> to get validation from the generic schemas?
>=20
> 'pins$':
>   type: object
>   additionalProperties: false
>   patternProperties:
>     '(^pins|pins?$)':

Why does this pattern allow foopin but not pinfoo?
Also seems overkill to have both suffix and prefix options, instead of
just sticking to one!

>       type: object
>       $ref: /schemas/pinctrl/pinmux-node.yaml
>       $ref: /schemas/pinctrl/pincfg-node.yaml
>       additionalProperties: false
>=20
> Something like this, I never get this right before actually testcompiling=
=2E..

spacemit,k1-pinctrl has a node of this type, that can be copied from
Gary. Essentially, you need an allOf: for the two references.

--r7QY2DKFaWvZjWwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6PWQAKCRB4tDGHoIJi
0pbcAQDMSqerReJ65uUM71ikHTc6L6kMQSFvvRzk3Z2gSbEsQQEAxn/UVVjIsZKM
A4ol0es58WdnPRa/MXvsm6KKAtTLrwk=
=9CrM
-----END PGP SIGNATURE-----

--r7QY2DKFaWvZjWwF--

