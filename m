Return-Path: <linux-gpio+bounces-8374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22993B2AB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 16:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FED61C237FE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2024 14:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7394B15920E;
	Wed, 24 Jul 2024 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vsbrm+AR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D051134DE;
	Wed, 24 Jul 2024 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831382; cv=none; b=hy+/vlc4EayTzNSeXmWq4t0WDAXndEk8krG5812e/B9EXLwzjTqhZF2mt1vmViYD2EzwigYZGSUzUSkOBwCzbu9u6Sp2x6P+LYcntGJ4BKo+e6S5ttsqRO5nqySRbrk4enOKI05z+rA3De0uCLwjx7q/INgRaQM8nZf3SM2w68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831382; c=relaxed/simple;
	bh=A92SMp5L8vHye59S+gIpJ3oRDF6rjc+krm1iL8GTSdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnqbrZ2RJAkDEHfgYCXTSOjn+3450FZxq82S7IXP6k7iRMJcDgD5O9VYtf0c2apIss7PNJGlpSTzPnGAphMsQXlPujBICH6QkkYVGens1RwGcVIHVth2aCTzwsxwyfKTKEgclMQlBJm8inevVnxjuO1kHNL8IABqkMsEtXhijW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vsbrm+AR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F22C32781;
	Wed, 24 Jul 2024 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721831381;
	bh=A92SMp5L8vHye59S+gIpJ3oRDF6rjc+krm1iL8GTSdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vsbrm+ARHzxUB9HwkUDAiki6u1+OirdVz3B5Wyd8s/xnM7KPb20rmiFciMjn6xLo0
	 LUbBmQ/fLjOJB4Hg8N8J9DBNehqWGvfI6BpvBMn3TQkedh96UlfQ4ifXnk7mV356d+
	 3SN3du/McYKnXzJa4uVoV8ylwsOVZGkZD2AMOlP0SGdgmb7JJscB5gd1cI2qbFZp4S
	 5mtaomHVMJt/7GUIV6xEJclBJVIPqz2Kk/gqOl+449TvOG2gm8HegbCkjj+2VgnK3f
	 lI1gbpbd63fgCSiHwfRgePmG+PZmTfqwZB4YVnFMUOqOGYJrq5UedCACMxGkWTY3Xu
	 dZJKwTMnY4INQ==
Date: Wed, 24 Jul 2024 15:29:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 1/6] dt-bindings: gpio: fix microchip,mpfs-gpio
 interrupt descriptions
Message-ID: <20240724-oasis-emerald-a4253b6e73cb@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-trash-issuing-e2bdd55b764e@wendy>
 <b07538f3-44e4-4d98-b64d-0d15428e720f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5uHEoWlbGxcUMhZB"
Content-Disposition: inline
In-Reply-To: <b07538f3-44e4-4d98-b64d-0d15428e720f@kernel.org>


--5uHEoWlbGxcUMhZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 03:25:38PM +0200, Krzysztof Kozlowski wrote:
> On 23/07/2024 13:27, Conor Dooley wrote:
> > The microchip,mpfs-gpio binding suffered greatly due to being written
> > with a narrow minded view of the controller, and the interrupt bits
> > ended up incorrect. It was mistakenly assumed that the interrupt
> > configuration was set by platform firmware, based on the FPGA
> > configuration, and that the GPIO DT nodes were the only way to really
> > communicate interrupt configuration to software.
> >=20
> > Instead, the mux should be a device in its own right, and the GPIO
> > controllers should be connected to it, rather than to the PLIC.
> > Now that a binding exists for that mux, try to fix the misconceptions
> > in the GPIO controller binding.
> >=20
> > Firstly, it's not possible for this controller to have fewer than 14
> > GPIOs, and thus 14 interrupts also. There are three controllers, with
> > 14, 24 & 32 GPIOs each.
> >=20
> > The example is wacky too - it follows from the incorrect understanding
> > that the GPIO controllers are connected to the PLIC directly. They are
> > not however, with a mux sitting in between. Update the example to use
> > the mux as a parent, and the interrupt numbers at the mux for GPIO2 as
> > the example - rather than the strange looking, repeated <53>.
> >=20
>=20
> You make ngpios required, which could be an ABI break except that there
> is no Linux user for this, so there is no ABI break, right? If so, would
> be nice to mention it. Rest looks good:

No upstream user at least, and I don't believe that there are any
non-linux projects using the GPIO controllers via DT. I could, I
suppose, not make it required and use 32 as a default - but that could
cause problems with existing devicetrees where all 3 controllers omitted
the property, despite having differing numbers of GPIOs.

Now that I look again, the driver actually doesn't enforce the presence
of the property and I think it should fail to probe if not present.

--5uHEoWlbGxcUMhZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqEP0AAKCRB4tDGHoIJi
0ryZAQDWgZQTcAZNOZjGXc3UbCVdXHcLhMvUltM54MOZgf2zbQD/YvX+QIIqkjKF
LEjNQ6dPuMCwh7g8e/IKFvQP9VkqkQo=
=R7Eb
-----END PGP SIGNATURE-----

--5uHEoWlbGxcUMhZB--

