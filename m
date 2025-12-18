Return-Path: <linux-gpio+bounces-29728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0ECC9F10
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 01:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 755D8300C873
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 00:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCDE242D95;
	Thu, 18 Dec 2025 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhDCcAu8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABF22D4DC;
	Thu, 18 Dec 2025 00:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766019570; cv=none; b=JpzyAm68CAM86OjjQxTFzApNp7tNfAr3ToTQQosOgoO4zUb7/GcOGRDEPCozif5hu08wveARdShMn+olIbMElnPh7oeVZyyHQmbKFEtpY0O3nEIsuBZnF/+ySdwEC5MQmhLhY0K786vuFjuESk2A1+VZ//OjHqAdOsfwPBc8NS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766019570; c=relaxed/simple;
	bh=zeZz6ZRz20D+Tpe2/47XWtE7rt+B8vZA9c/O5ELYilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1FFGCZ9Dm84u3GKwQcYMPssxl2RZygFY8EzeewDHI+Y9vZrCqWdEmZi6GoEdt+6B5hNd8DlSW5v7TvxJpUyuxSfeQMA3hTz5E68DlWfmhgVKLPFjMfOKZS9UMkhfxhQ24y/+pTlTZpP4HVdOXE6RpfCnw949gVTvJ7dRXFqcMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhDCcAu8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14878C4CEF5;
	Thu, 18 Dec 2025 00:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766019569;
	bh=zeZz6ZRz20D+Tpe2/47XWtE7rt+B8vZA9c/O5ELYilY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KhDCcAu8jnTmRtc086afDk1JhDRpo8mimLFyyGNvuXIHC1jlh9n7hzwgRzzu96Z9o
	 Z0Xo5eCYljSDtdX1eJV9YLCnjm7x43rz1pYrGvSAaUS9+1lykII/PKHfeBm/qh95OM
	 iAnE6ju8LbGIiT0OtXwY/8flXmJdpNqZG71TWfLSECwPizLZn6h/W7tThsxkb0taQY
	 6S9MfFeDoqJJtV8zKp+lyOQk+I5xrmyUoxhdaXvITWdJm0gtkz0B97N5MnWOFE8mip
	 dTV8v/ScfuZs+LRT3U/32Td/Sa+xUjJzbOxDQ98tOxFegCaPdZeeNb2re36Rqv8DE1
	 JgphueV1lgQsw==
Date: Thu, 18 Dec 2025 00:59:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v2 1/5] dt-bindings: pinctrl: document polarfire soc mssio
 pin controller
Message-ID: <20251218-stack-trilogy-5ae1d795cb17@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
 <20251127-spousal-bless-199b36f89c80@spud>
 <20251216220624.GA3114300-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FnwZv5Pd/uB4YJe3"
Content-Disposition: inline
In-Reply-To: <20251216220624.GA3114300-robh@kernel.org>


--FnwZv5Pd/uB4YJe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 04:16:31PM -0600, Rob Herring wrote:
> On Thu, Nov 27, 2025 at 10:57:57AM +0000, Conor Dooley wrote:
> > +
> > +          microchip,bank-voltage-microvolt:
> > +            description:
> > +              Which bank voltage to use. This cannot differ for pins i=
n a
> > +              given bank, the whole bank uses the same voltage.
> > +            enum: [ 1200000, 1500000, 1800000, 2500000, 3300000 ]
>=20
> "power-source" serves this purpose. It's not well defined as sometimes=20
> it's a register value and sometimes a voltage (in various units).

I don't recall exactly why I chose not to use that property, because I
did know it existed. I *think* it was because the selection was not per
pin and I wanted to make it clear - but I should probably just use that
property and add the description from above.

>=20
> > +
> > +          microchip,clamp-diode:
> > +            $ref: /schemas/types.yaml#/definitions/flag
> > +            description:
> > +              Reflects the "Clamp Diode" setting in the MSS Configurat=
or for
> > +              this pin. This setting controls whether or not input vol=
tage
> > +              clamping should be enabled.

--FnwZv5Pd/uB4YJe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUNR7QAKCRB4tDGHoIJi
0thMAP0ar2mrnw7/xz8l0Azfe1rDX1TvUjQEqEJCBXbs+oMI0AD+I2b0Opi68IGB
8O0l6EJOp1fcbHpUqeEbTA7aNM0HfQY=
=AN6L
-----END PGP SIGNATURE-----

--FnwZv5Pd/uB4YJe3--

