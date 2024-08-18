Return-Path: <linux-gpio+bounces-8784-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60277955D68
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 18:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147601F21322
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 16:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5071428F3;
	Sun, 18 Aug 2024 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJ87jq3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F512F2B;
	Sun, 18 Aug 2024 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997719; cv=none; b=Uxl+6JRPxDXEutHJAbawW/lhYooobauHxYM9Q18GkQYKukFI6GNiZodSZiSQ6KdifaC5C7gxRuBjixpfl3NlIcWloH1mR2r9zcwUvDhdP94jiPMXbSkYkdVL/0sTToJLfUM4qFGoRYcUV+cKe/ynJiPO9Lz93oOSlnD5GueAqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997719; c=relaxed/simple;
	bh=VaBQwb9qR9sQO1ub1AxgD10xLLE6+nsUX8RQUgYGtwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg5t2FDjLM/z1GOFfKPZPW0LW1QzP2L67fGyVM0YjtsWTFKsjfrVCiv/z96RadCee6ig9nnwss6+j6kYyNG70ZqpYTOHr+SOyTiGebIg5aeWYdkRWTlEuO0KFzY5GqZ8AEst7q9u7P5RAXfvQ2FMICFTpVIdzED7YnFjzGE5G9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJ87jq3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54975C32786;
	Sun, 18 Aug 2024 16:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723997719;
	bh=VaBQwb9qR9sQO1ub1AxgD10xLLE6+nsUX8RQUgYGtwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MJ87jq3QfH2iZQMNlJeQN6m1IbKHc921iGXlSLS5iVteQgeTGN0ssu+wbKTGdgqQe
	 iPymZCd2P/8jwSdTexD7e+gScdBPvQ1iNGyWuluKn7Pf5XQL406RMapzPDpv6f3fsm
	 WVuzuTFN1XLwmzyCPvD+Y98xkBzKrd+5dLRpAPFX7nGeVQqiv6O6v2t9A7bl/pqoRs
	 3ahr/xZpzlcJdyO2D16X1JogoIMIX/9bLNU9vu1jDc1ySktJUci1GxyySqX/Os6kT1
	 ZaheY1aiRbf37oblab6I//uRdrueMwY9lakzTHXvx9hsyiNBSkee8VIWENbyZL0K/F
	 eL4qxOtac/0Cw==
Date: Sun, 18 Aug 2024 18:15:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZsIeEitpV9MehqVh@lore-rh-laptop>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KIOrQBlvqenJie0W"
Content-Disposition: inline
In-Reply-To: <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>


--KIOrQBlvqenJie0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 18, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 02:48:05PM +0200, Benjamin Larsson wrote:
> > On 17/08/2024 23:39, Andrew Lunn wrote:
> > > How messy are the GPIO and PWM registers? Are there N blocks of
> > > independent GPIO registers? and M blocks of independent PWM registers?
> > > By that, does one block of GPIO registers contain all you need for one
> > > GPIO controller? One block of PWM registers give you all you need for
> > > one PWM controller? Or are the registers for one GPIO controller
> > > scattered all over the place?
> > >=20
> > > Could you point at a public datasheet?
> > >=20
> > >        Andrew
> > >=20
> > Hi, per my understanding there is no public datasheet/register reference
> > manual.
> >=20
> > But here is the division of regions of the registers in the gpio block =
and
> > how it is currently divided between the drivers (according to my current
> > understanding).
> >=20
> > 1FBF0200, gpio/pinctrl
> > 1FBF0204, gpio/pinctrl
> > 1FBF0208, gpio/pinctrl
> > 1FBF020C, gpio/pinctrl
> > 1FBF0210, gpio/pinctrl
> > 1FBF0214, gpio/pinctrl
>=20
> A typical SoC has multiple instances of a GPIO controller. Each GPIO
> controller typically has 4 or 5 registers: In, Out, Direction,
> Interrupt Enable, Interrupt Status. If these 4 or 5 registers are
> contiguous, you could have one DT node per controller, rather than one
> node for all GPIO controllers.

it is the same for en7581 pinctrl too. I think we can squash most of the
gpio/irq registers into "bigger" io-regions (just keeping a couple of holes
for pwm and leds). It is just a matter of moving the logic from the dts to
the driver. I am currently working on it. I will post v2 soon.

>=20
> If the hardware designer has really messed up and fully interleaved
> GPIO and PWM, it might be better to have an MFD. The MFD node has a
> single reg covering the entire range. The MFD would then map the whole
> range, and provide accessors to the child devices. Hard code the
> knowledge of what registers are where. Given how badly the hardware is
> designed, it is unlikely it will get reused in the future, so there is
> no point putting lots of stuff into DT. Hard code it.

I am not sure it is possible/feasible to implement a MFD device here since
the mapped region is huge and sparse.

Regards,
Lorenzo

>=20
> 	Andrew

--KIOrQBlvqenJie0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsIeDwAKCRA6cBh0uS2t
rG8WAQCOM9FfsuIqInox4vNa4pce4vCRLHiG1gGyr+t084DqmQD/WAORMouBNGcP
YxNJu753I5NPJOvDkIQck7p8t+PNKQE=
=cvb3
-----END PGP SIGNATURE-----

--KIOrQBlvqenJie0W--

