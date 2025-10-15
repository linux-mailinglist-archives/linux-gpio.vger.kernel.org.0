Return-Path: <linux-gpio+bounces-27182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA61BDF1A6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 16:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31DA3AC74E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C394283C89;
	Wed, 15 Oct 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1u6Wi/b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EECA26CE06;
	Wed, 15 Oct 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538959; cv=none; b=KTHO16OHkbuLI7DDa7di1bxtyHdBHMbDy5jhrlI2A213qS086nQ5jnszwWatymMBwtZb9Qu9fERYxymkHhO/P33rYon96JMOl6ugAq7CQsKDLtMRLhqnSnQUchB1Co8wEl7a1cbGMPr+tkOe81m7nYeWkAZ1xcGC33YxvcIrlxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538959; c=relaxed/simple;
	bh=CQlnQCZTcQjCMg9gXM5j/h/j9QBEe/QKt7u0yZHQbQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT9o8iBFCHRD7JTgw2W3c4M0XjLK8dO3AMkoNOsSdw2SBRCB9qEGgjpJ8FiDqPM/ZJVJosf3Wi2SWb/oErarjg+p4jOtZ3KihbFet0NclwQ83O53hDpBO1SceT+yW0sur3GYBWzv4EUXOxmdMwkaVysyOKeUIBdAZl1QSifgCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1u6Wi/b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A66C4CEF8;
	Wed, 15 Oct 2025 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760538958;
	bh=CQlnQCZTcQjCMg9gXM5j/h/j9QBEe/QKt7u0yZHQbQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1u6Wi/bA8yzs2VzytUSKwlOdJY627sho9aV934PlC9av+KzwXYa2BrrFU9y6Ptwo
	 J+TUilM0Y8GtatWIY8ATBQIDQwY9kOqNlj344/MlQSTKbJywS1GziAxbxbP9w61X+9
	 A3TSqCq6Yo5Tf/TYyPlYvL0pajqjSFWDamK27jsbDrPDxmEqidk9uRAslM99epdfbh
	 dERs70VvRyfwG7Lez+yG8I2jkm1DQgffLXYES6OtZBxrEGN9KBqYSIg0MKAAG1/igN
	 GjfCspVtrmiKyau0OERse5FwxKji55mnzZwUn3IZ5zfNdpuPYNhdc8/qQS79azJjVh
	 Pxjs2x59J2QEQ==
Date: Wed, 15 Oct 2025 15:35:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 09/10] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <20251015-headstand-impulse-95aa736e7633@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RrT1Ouiw7gUB6N03"
Content-Disposition: inline
In-Reply-To: <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>


--RrT1Ouiw7gUB6N03
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 02:56:56PM +0200, Antonio Borneo wrote:
> On Tue, 2025-10-14 at 19:10 +0100, Conor Dooley wrote:
> > On Tue, Oct 14, 2025 at 04:04:50PM +0200, Antonio Borneo wrote:

> >=20
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 st,io-sync:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 description: |
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IO synchronization through r=
e-sampling or inversion
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0: data or clock GPIO pass-t=
hrough
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1: clock GPIO inverted
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2: data GPIO re-sampled on c=
lock rising edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3: data GPIO re-sampled on c=
lock falling edge
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4: data GPIO re-sampled on b=
oth clock edges
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $ref: /schemas/types.yaml#/definit=
ions/uint32
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum: [0, 1, 2, 3, 4]
> >=20
> > I really don't like this kinds of properties that lead to "random"
> > numbers in devicetree. I'd much rather see a string list here.
>=20
> Agree!
> I just need to figure out some reasonably short but still meaningful
> string for them.

pass-through
inverted
rising-edge
falling-edge
both-edges

perhaps?

--RrT1Ouiw7gUB6N03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO+xRgAKCRB4tDGHoIJi
0lfAAP9Wmew99Hvt1yhCWck5hvyNjlO7jQxH+64gBF5XK6BLXgEAjBA58Y45RCl0
7cO7Pj2cMcMbSBMMf8uhGjNZlOnz5Qs=
=XBKe
-----END PGP SIGNATURE-----

--RrT1Ouiw7gUB6N03--

