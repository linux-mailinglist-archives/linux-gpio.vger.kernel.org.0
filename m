Return-Path: <linux-gpio+bounces-28256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66673C41423
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 19:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2EDE3AA442
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 18:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8863396E7;
	Fri,  7 Nov 2025 18:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5ABhgdB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC932E131;
	Fri,  7 Nov 2025 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762539502; cv=none; b=a67T0H4cmSYkqHvITcEjh9F8tDs8R35WkX5pKLCuSiJxnJD+8obsf2w/7yQRx2YZB9dvvWxA3VE+xjDrCQsJGPvHTy3TP4miAbClJkMQetwCGbZrdl0fG0GbUVkWhmJxwbj3qOOwRXtB8xpA+JFEMDfxQ6/Px0BIxZY28vn6qU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762539502; c=relaxed/simple;
	bh=jaL7jopAFlRxmRbiqtgWDWMCdCil7su+tqIETM3BZ7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGba2jLcWjleISC5EYKwvUQEAIR6M+Q6f4fH/3masb7pCjFDRoIe2JTEu0wtIkRl8zR5s4JDbmQL87OPvlU2z+64269VkaU96AaTQBuX3FphheHZZKy5rdoB9uAE/lr3sZR7Tv6CyJ/AB6pOnnVOvYeT3lDAiFpdXY4dLFi4+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5ABhgdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F5AC19423;
	Fri,  7 Nov 2025 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762539502;
	bh=jaL7jopAFlRxmRbiqtgWDWMCdCil7su+tqIETM3BZ7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5ABhgdBgJ8xkku8oBI1QZi+g2rddDAUmX1HuVzsJzYtRZAuKHAcpYe65se/YObsr
	 +2YdET6sMq/F0s//Nf+oZIxfcHkDGPzh5lgZgSbTxMgI0ngJLdp7rpHS6HYCVTxTyt
	 T9YwgsSJ/T237E8l6wtjs1MeZrdBhQzboBi2VVFCxZTbSObV7IR1DZikAUEOFjP0HA
	 19KN8TQdRTnGimBNtMQ2X5DDitkjiqtNJl55ZxcShALA1IIBs7YTsG64E7NNUxXQFA
	 inkYobUD9mKpsKK12Qgz/qSRAP34nUGbX3Htj8Dv7HBQj++kHiq4M0DXvWTkZAy0Ev
	 zJNnOkz4ySPBw==
Date: Fri, 7 Nov 2025 18:18:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-unvalued-fringe-96724cf9206c@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
 <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
 <690e3351.050a0220.15e225.cf82@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZQCrllx4ihXxMaJD"
Content-Disposition: inline
In-Reply-To: <690e3351.050a0220.15e225.cf82@mx.google.com>


--ZQCrllx4ihXxMaJD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 06:58:38PM +0100, Christian Marangi wrote:
> On Fri, Nov 07, 2025 at 05:55:43PM +0000, Conor Dooley wrote:
> > On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> > > On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > > > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with=
 some
> > > > > minor difference on some function group (PCM and LED gpio).
> > > > >=20
> > > > > To not bloat the EN7581 schema with massive if condition, use a
> > > > > dedicated YAML schema for Airoha AN7583.
> > > >=20
> > > > You went to more effort than I would have here with that conditiona=
l!
> > > >
> > >=20
> > > Well it was suggested by Rob and it's honestly a copy paste of en7581
> > > with the relevant thing changed.
> > >=20
> > > > > +patternProperties:
> > > > > +  '-pins$':
> > > > > +    type: object
> > > > > +
> > > > > +    patternProperties:
> > > > > +      '^mux(-|$)':
> > > > > +        type: object
> > > >=20
> > > > What's up with this regex? Why does it allow either - or $?
> > >=20
> > > It's to permit either mux-* or unique node name with mux. Pattern is
> > > also used by mt7622 or other schema. Other use mux- to require a name
> > > after the mux.
> >=20
> > Ah right, because you can have the config properties like drive
> > strength in the mux node, so sometimes a -pins has one mux node (mux:) =
if
> > all pins share settings and sometimes there could be multiple, which
> > requires a suffix.
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
>=20
> Mhhh why not-applicable ? :(

That's just dt-binding patchwork stuff, it clears it from our queue
since it'll be applied to pinctrl.

--ZQCrllx4ihXxMaJD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ436AAKCRB4tDGHoIJi
0u1rAP4+8ulSe9JeLCu3Gyu4scAX+ZVG1X8+tIGQbmjpnop6AwEAst9/qvwn3IEa
sDwwxMVse34AsCQffwSceZT/1vAWjg0=
=PDnc
-----END PGP SIGNATURE-----

--ZQCrllx4ihXxMaJD--

