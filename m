Return-Path: <linux-gpio+bounces-8596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF922949684
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 19:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFB171C22ED6
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 17:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C54E47772;
	Tue,  6 Aug 2024 17:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgYD7TjT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E795015E8B;
	Tue,  6 Aug 2024 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722964700; cv=none; b=pAsctx0qVHEnOp/BBz8UmjkC1j/f061F0OHeOP5Zw3SZvEk4ez+jFuoVrWGwRXNr40+4S8XK8dXeKcGKxWoU3imNJoRyDFrO1LV+hL+12YUvk7zOt1QhuacHs8XzjWE4lKiGzseJ4Nrm+ul/+4ojYqwAut4lb++oCL2DpaAxTNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722964700; c=relaxed/simple;
	bh=lMmvftXT0qARD9+U3hEsUZ97wDlqfHLC8/iYV0EiQZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxr1i8I+Pk1bN0L8c3cIyl8jMMxJq2WKRT8tnf6KeAlwDsfm2O5gWb/u3WYY0xAQ16p7UzbzElu6zRAc5TFscmXLyhjUZPMOoKU5dlG+31Bv/P8aZlKrhYq8J5+5HgjHJllcGiFVw+YJMgHsHCN1mTfB84a9mKEFIuarH+Vq99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgYD7TjT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EE1C32786;
	Tue,  6 Aug 2024 17:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722964699;
	bh=lMmvftXT0qARD9+U3hEsUZ97wDlqfHLC8/iYV0EiQZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgYD7TjTHhN+UtCwu3JwN6n8a0Lu9XRrHdWoP32RcC2fkiqTv0QuaunvhF6UKxz/w
	 wQ3vazd8pHr/e2Q/pqkGmRY7PkffrkceVCobYin4nVSCiVskuCQvELfxiMwAlNIdCJ
	 VwJ4qupBXhhXVHfnxZqP4NOog64lkRFnpyynkzsryz5ZnqOSrU1KAevuV8FPPrKaOE
	 Ss6aMQfhJpX5sjz50QmuZZqIgqGnAtzP8k4VmPlbGgDNR5A44hszUmz/MaZswP7nyi
	 My5Oi1/7FQZKuqYkqNVDpdcsqdPJTYraT3OOiaYG4gBQUhqfEbWELc1Ay9OHSAPc9G
	 vJQWxkp42O12g==
Date: Tue, 6 Aug 2024 18:18:14 +0100
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
Message-ID: <20240806-breeze-crazily-84d4e4af8f4e@spud>
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
	protocol="application/pgp-signature"; boundary="5jabDj4Nnku3Xl8d"
Content-Disposition: inline
In-Reply-To: <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>


--5jabDj4Nnku3Xl8d
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

I'll look into it - as I mentioned under the --- line, I really didn't
touch most of the driver and there's comments from Lewis' submission
that still apply.

Cheers,
Conor.

--5jabDj4Nnku3Xl8d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrJa1gAKCRB4tDGHoIJi
0jHzAQC+jweV6m+T+08oxGBMTQuSWlDXOqewMXmPVahS1Jv8YQEAxkqQN9tcsEo/
l7nkZLcjH3APpMcJOO3PxtdcaQt9yQI=
=TeP1
-----END PGP SIGNATURE-----

--5jabDj4Nnku3Xl8d--

