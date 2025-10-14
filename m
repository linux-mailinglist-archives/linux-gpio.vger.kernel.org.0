Return-Path: <linux-gpio+bounces-27139-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6049BDB183
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 21:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073903E88AB
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 19:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC642D12EB;
	Tue, 14 Oct 2025 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSLN5Hq5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519562D0C69;
	Tue, 14 Oct 2025 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470799; cv=none; b=DkrsnvGU3OogcrRhfOcpiue5MUwpLCUX8cTcf2CWnJWcy9l50+xLyHnHayQjgqH4XpeOGFZZ1BG++wkrVFNX1UNUBYvWdL6tAZIyjhEYZvpHWL6t84EE1g5KJWH8ePO5zh7ZZ7pk6IK19oT2flJdBGuzy6Ak8dvzEYsU8iQo5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470799; c=relaxed/simple;
	bh=O5H/YsuZs738YLiu8CU7UPY57QeILHiPa3/g7uk/1NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWiUntwiIpKoLDDne8Al82qmKNbaHOi5KnhSzR03qHQs+dmjESkR//bx0TUoiEX+PBk8CC/x6XzgvQVigzuTaMnXar5tWjWCDwoAopgyIUgelR8Hx/8S1eCH9Ppi3vqnHnkU3lzKBz7KQvieznSAsoPj53lK1eI3vq0+cYv/pyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSLN5Hq5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D77C4CEE7;
	Tue, 14 Oct 2025 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760470798;
	bh=O5H/YsuZs738YLiu8CU7UPY57QeILHiPa3/g7uk/1NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSLN5Hq5qQqaeRoRL4S6gw3Nbz3N+rvUZnaplautiXAX6nefXQTlvHDiCM4jO2Dxb
	 S5IWLDMMJS9ZSDIPTK2YHsMHutYxBoAxatnzI97AnabTbrkTEaHRYgBKH3RArkCPjA
	 SGFbcnTfbjB+mobrDoGdydj5sZ46yN146NH3xWbjQh6Qn+RVITJ0r3LT5vF/AzLt87
	 gynvyfmfcWo5W1W1MTFLphm4t6YzZgdpKL3klZ1aRsYzb4eOXtKkah5YRJ8iNyId4f
	 ZSXSMipjbBH6H0BhQjiPO8XHU97HxkESsQBDiI++fx+agiP7s158V8c2zSbVpfhUlc
	 NdnPq0J/RJgsA==
Date: Tue, 14 Oct 2025 20:39:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
Message-ID: <20251014-water-gown-11558c4eabe7@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DnZFP0H7yz35f5cB"
Content-Disposition: inline
In-Reply-To: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>


--DnZFP0H7yz35f5cB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 09:33:14PM +0200, Linus Walleij wrote:
> On Tue, Oct 14, 2025 at 8:04=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
>=20
> > > +  skew-delay-input:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      this affects the expected clock skew on input pins.
> > > +      Typically indicates how many double-inverters are used to
> > > +      delay the signal.
> >
> > This property seems to be temporal, I would expect to see a unit of time
> > mentioned here, otherwise it'll totally inconsistent in use between
> > devices, and also a standard unit suffix in the property name.
> > pw-bot: changes-requested
>=20
> Don't blame the messenger, the existing property skew-delay
> says:
>=20
>   skew-delay:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     description:
>       this affects the expected clock skew on input pins
>       and the delay before latching a value to an output
>       pin. Typically indicates how many double-inverters are
>       used to delay the signal.
>=20
> This in turn comes from the original
> Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> document, which in turn comes from this commit:
>=20
> commit e0e1e39de490a2d9b8a173363ccf2415ddada871
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Sat Oct 28 15:37:17 2017 +0200
>=20
>     pinctrl: Add skew-delay pin config and bindings
>=20
>     Some pin controllers (such as the Gemini) can control the
>     expected clock skew and output delay on certain pins with a
>     sub-nanosecond granularity. This is typically done by shunting
>     in a number of double inverters in front of or behind the pin.
>     Make it possible to configure this with a generic binding.
>=20
>     Cc: devicetree@vger.kernel.org
>     Acked-by: Rob Herring <robh@kernel.org>
>     Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>
>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> So by legacy skew-delay is a custom format, usually the number of
> (double) inverters.

Yeah, I actually noticed this after sending the mail. But as you say
below, the new properties can be done with a unit etc

>=20
> I don't recall the reason for this way of defining things, but one reason
> could be that the skew-delay incurred by two inverters is very
> dependent on the production node of the silicon, and can be
> nanoseconds or picoseconds, these days mostly picoseconds.
> Example: Documentation/devicetree/bindings/net/adi,adin.yaml
>=20
> Antonio, what do you say? Do you have the actual skew picosecond
> values for the different settings so we could define this as
>=20
> skew-delay-input-ps:
> skew-delay-output-ps:
>=20
> and translate it to the right register values in the driver?

The patch for the specific binding does have values in units of seconds
assigned to each register value, so I think this should be doable.

>=20
> If we have the proper data this could be a good time to add this
> ISO unit to these two props.
>=20
> Yours,
> Linus Walleij

--DnZFP0H7yz35f5cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6nCQAKCRB4tDGHoIJi
0qLlAP9810SKsRFfc73sjXKlJV1iLRHPiWHn2M7TKwMkhNAhNQEAoJHsRqsTrOZv
DEfxbqgGD+nWjS0Kv0p8dpJZC6EYfw4=
=BzPH
-----END PGP SIGNATURE-----

--DnZFP0H7yz35f5cB--

