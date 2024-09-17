Return-Path: <linux-gpio+bounces-10210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394597B02E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 570631C22760
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93006173357;
	Tue, 17 Sep 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIH9Rmz8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AD171E5F;
	Tue, 17 Sep 2024 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576567; cv=none; b=siZZJ2nvftQwhydAKbHcvurQy2A1ob7pXW9N7oQJa2UhrHaZUOWtwAxQoG3bOb5c/6KLZVs0E3rG/fYTucZri4wee5s6i3t/h2wx+oGuJx/kVmqHE5nZqA2CzWAViwfvkh0a/Z4Kqk371Kxdwj/W8kEJfiO6A33Izh0V16J0WSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576567; c=relaxed/simple;
	bh=1xgpsPC1N4Zck4v/WlfFqsfVx90D+M+FOYlvwPpRh4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAh4NhzdXyzrjKOohpNdMLLvtRgrRTzfnvzkXiAlwudAO6VScOUzcZOcTl1GR3jrOkrdWTl8ky7+sR/axEndgeIw7Fjm74dLvKVNzPvJC94bRNeVanFfVmPrrbeUrvJ7Bi2cPYbdlAiYQvHknrf/lZ6dGUlwkNZ0f9hdUnsblPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIH9Rmz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA52C4CEC5;
	Tue, 17 Sep 2024 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726576566;
	bh=1xgpsPC1N4Zck4v/WlfFqsfVx90D+M+FOYlvwPpRh4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIH9Rmz8kwrGz1A2+3PqLjKbR9rxFzIe5KPDmckgATgx/rx+wq1e/Ba8FF8eIGyOe
	 ZX4D2CfhiHAmyh5xJylzzOZ4kldoFsbpnwrwm8mXiOo6l9Z6s8j5cPXFQH4saXg8n/
	 yOlj93s7UYDz2SdPOi5W8sAJNZKpgcv8UDuyAIpomb3LAOy/0uRDXS9Vd3rzDpn/J6
	 sA6tYYxy9pPOKF9tVPDK3PRM5fbOwOEpJ6eXe/YUlgkQNslBvhTvH7TVFB7igJNdvH
	 NNhO9iGjnrfNAMdhZMeBuOwdVggipg7O4WcP2KrOPq4IFCR0M8AGu9Pm550Qj4/BXb
	 0JzyqmPMdPTbA==
Date: Tue, 17 Sep 2024 13:36:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Message-ID: <20240917-squander-stunt-c6bec4409491@squawk>
References: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
 <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>
 <20240916-uncut-badge-f31b97d7c375@spud>
 <20240917075259.deuwi5s5gdqo3w6z@DEN-DL-M70577>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XveAeSiRZdiZ+78"
Content-Disposition: inline
In-Reply-To: <20240917075259.deuwi5s5gdqo3w6z@DEN-DL-M70577>


--8XveAeSiRZdiZ+78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 07:52:59AM +0000, Daniel Machon wrote:
> > >    reg:
> > >      items:
> > > @@ -85,6 +95,12 @@ allOf:
> > >            contains:
> > >              enum:
> > >                - microchip,lan966x-pinctrl
> > > +              - microchip,lan9698-pinctrl
> > > +              - microchip,lan9696-pinctrl
> > > +              - microchip,lan9694-pinctrl
> > > +              - microchip,lan9693-pinctrl
> > > +              - microchip,lan9692-pinctrl
> >=20
> > > +              - microchip,lan9691-pinctrl
> >=20
> > This should work on its own, since the other devices here have it as a
> > fallback.
>=20
> Just to be clear - we only need the "microchip,lan9691-pinctrl" here?

Ye, in the enum you should only need that compatible (in addition to the
exsting one) because lan9691 is the fallback for all the others and
therefore the compatible must contain it.

--8XveAeSiRZdiZ+78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZul3tgAKCRB4tDGHoIJi
0gZXAQCcc1h8qFXbH65QYRXQPoCQ1EB4scW9nKsQja2NxoH+BQEAh2HljI6hL3gO
BJY59N+DQkiJbeiX5Y9CJ4fLQj0CwQk=
=YDyf
-----END PGP SIGNATURE-----

--8XveAeSiRZdiZ+78--

