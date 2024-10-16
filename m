Return-Path: <linux-gpio+bounces-11428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D149A0634
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E3C1C2311A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF418206954;
	Wed, 16 Oct 2024 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMGuS0Z8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9420607B;
	Wed, 16 Oct 2024 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072597; cv=none; b=nXKFneqRxaW2gjob5B7cu3VjyHZ3/rFWkQ3ncYzM0yEfjg1Oes5gc29+zhvZHS8dXlB3SFLybAxQ7YyE/5Kiz3DZHzCv+FrXAceMFAamIztnVFU0NwkWW1lmHlHT2AQbKmjeFRuUCg0yvCqeYx1mgyvfbuYGHxMNw85wFZShR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072597; c=relaxed/simple;
	bh=uHq88diJm1dWVxmjE2s3IC5aG27pU9tVf1Cdl6SO7SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QITh9j1RVajNwbmnpMOonWjTcu/AlEyMOU1XVoFQOU302QZpmFHUTeavBzmEKADrd2EJk/ez/YrRhaIvBMRHJjzV0l0htwGj3d40qAhUy1Yt0Jq6ZGvexgkWdYe8baPnPqqXoJJ4uSjRbwhOWjMrtYMCytcUAn/2NNu3ERNYxJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMGuS0Z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43752C4CECD;
	Wed, 16 Oct 2024 09:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729072597;
	bh=uHq88diJm1dWVxmjE2s3IC5aG27pU9tVf1Cdl6SO7SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMGuS0Z82CFjZ/mSuxpZsQ4WNn5OYkcC/UShO3npG9FAWIjCi9p3dpvGhvFMN16N0
	 LA/IJiRA6dpp40RyTJ2ZypXwstUzmOzwR3W061jldmzlNkQhZpmBrG7Fh62PCGgU4o
	 C/X4VmlaFpel8ZKOWznCKTyDskr4ACAnMSBa1KGRHJsfLufx1mWgIv12U/6KhNarh1
	 rGNBHEayWjBNZcB2v/ruk9BJ+f7bYDU+Xu3J8XeB2owI0salOZ32epGLEWGJnUhXTM
	 DLcflSfzpGBH5qHgZO0ah4D3AQGfMOIQOIlIMCwAjt8/pKSJSGBEmfrbIb8IWuODKq
	 HYC/cFR4OO0dw==
Date: Wed, 16 Oct 2024 10:56:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241016-shallot-nerd-51eeba039ba0@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8DGd6hZF1FungGf/"
Content-Disposition: inline
In-Reply-To: <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>


--8DGd6hZF1FungGf/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:
> On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
>=20
>=20
> > From: Lewis Hanly <lewis.hanly@microchip.com>
> >
> > Add a driver to support the Polarfire SoC gpio controller
> >
> > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Just a comment on second thought:
>=20
> > +config GPIO_POLARFIRE_SOC
> > +       bool "Microchip FPGA GPIO support"
> > +       depends on OF_GPIO
> > +       select GPIOLIB_IRQCHIP
>=20
> select GPIO_GENERIC?
>=20
> > +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned in=
t gpio_index)
> > +{
> > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> > +
> > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index)=
);
> > +       gpio_cfg |=3D MPFS_GPIO_EN_IN;
> > +       gpio_cfg &=3D ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
>=20
> OK this part is unique...
>=20
> > +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned i=
nt gpio_index, int value)
> > +{
> > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > +       u32 gpio_cfg;
> > +       unsigned long flags;
> > +
> > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > +
> > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index)=
);
> > +       gpio_cfg |=3D MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
>=20
> Also here
>=20
> > +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> > +                                  unsigned int gpio_index)
> > +static int mpfs_gpio_get(struct gpio_chip *gc,
> > +                        unsigned int gpio_index)
> > +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_inde=
x, int value)
>=20
> But these are just MMIO functions.
>=20
> Is it possible to use augmented generic MMIO, i.e just override these
> two functions that
> need special handling?

So, I've been looking into this again (finally), with an eye to stripping
the interrupt handling bits out, and trying to upstream this in pieces.
I dunno if I'm making a mistake here, but I don't know if there's much
value in implementing this suggestion - as far as I can tell only the
get()/set() functions can be replaced by what's provided by gpio-mmio.c.
There are no controller wide registers that control direction and so
bgpio_get_dir() can't be used - direction is read from the same
mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index) registers that it is set
using. Adding bgpio stuff, to just go ahead and overwrite it, to save on
trivial get()/set() implementations seems to me like adding complication
rather than removing it. What am I missing here?

Cheers,
Conor.

--8DGd6hZF1FungGf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw+N0AAKCRB4tDGHoIJi
0ky/AQDkGqoBAGYEZCFxxWUyqZ4vmPR3ldX2O9Zq2lny2GgGNQD/bK8MIRUqZSos
inSPCxcBYpf1M6iVGSB5AkOOp0NPcQs=
=EK75
-----END PGP SIGNATURE-----

--8DGd6hZF1FungGf/--

