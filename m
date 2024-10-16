Return-Path: <linux-gpio+bounces-11444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018969A0768
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 12:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2224C1C261CD
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 10:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C82076B2;
	Wed, 16 Oct 2024 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2yf4lTx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6802076AB;
	Wed, 16 Oct 2024 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074548; cv=none; b=JMXRpb8QJvXZCUDqhOgbCKHLx7wwOoO2i1bGK3OgT/4vKHwPHinWGG1gSgstQbmgdv+oDft3CTHfICmVublXzXym2PGASBSIPF9NQm3Wn0oNhnCe9/v9HTwTR0kvicRjko6Jy5sLSeoxfJWhukAyQVsH2ALKvaMhuSR/SPuboMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074548; c=relaxed/simple;
	bh=pg7UYaMPx4mTb52bLj7hgV55+1gGge6GzAJdln6ov9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTSJfT4oOCeoOzrpu9Hyl8DogxEKgYiXVuHEl7VFHu3KIf3nVflypmOWCJybCHSTHBq9qzfbryyDe+QQZt7adlxvleS8qvXG4qROcQobFFECCu3QYx7mALFmaNSTCiN1JPAfX17B8500O9HfuV+AVy7fE4lHR0qMgJqzKfOyXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2yf4lTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CD37C4CECF;
	Wed, 16 Oct 2024 10:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074548;
	bh=pg7UYaMPx4mTb52bLj7hgV55+1gGge6GzAJdln6ov9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2yf4lTx8ojmaCj5oBgFI44qnJKC5wieTTwoGMja4nTY6AiQoxiYgyEUvOgdFEM7q
	 bXxyuRZ/LirXoOcJSfOKuO8+KWJJo/qIgTxUlehM2AUjxKpu2XHwOdcC/BVXLQ8wUM
	 ZYIXRSxoPONaAsPDvg/FoiVNVK8MSHr+kXzcMp3rlG+VAtFApYOKOcA5o7/RkB/cuW
	 eOOmjf7chYKDaPRIEHIz+pfla4DE4cDTrxOZSaehnHPCVibyBHK1Qp6fssXWEAQ8XV
	 kTC5ggwOXEh6heECxbBz8/BZyo7eXll3sjtb1LBudmPZ/2wx67n1g22dYaMpcK9AZl
	 lCTcoL2gr+GwA==
Date: Wed, 16 Oct 2024 11:29:03 +0100
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
Message-ID: <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CmBUU6+EmCtmkoM0"
Content-Disposition: inline
In-Reply-To: <20241016-shallot-nerd-51eeba039ba0@spud>


--CmBUU6+EmCtmkoM0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 10:56:32AM +0100, Conor Dooley wrote:
> On Mon, Aug 05, 2024 at 10:04:53AM +0200, Linus Walleij wrote:
> > On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@micr=
ochip.com> wrote:
> >=20
> >=20
> > > From: Lewis Hanly <lewis.hanly@microchip.com>
> > >
> > > Add a driver to support the Polarfire SoC gpio controller
> > >
> > > Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Just a comment on second thought:
> >=20
> > > +config GPIO_POLARFIRE_SOC
> > > +       bool "Microchip FPGA GPIO support"
> > > +       depends on OF_GPIO
> > > +       select GPIOLIB_IRQCHIP
> >=20
> > select GPIO_GENERIC?
> >=20
> > > +static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned =
int gpio_index)
> > > +{
> > > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > > +       u32 gpio_cfg;
> > > +       unsigned long flags;
> > > +
> > > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > > +
> > > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_inde=
x));
> > > +       gpio_cfg |=3D MPFS_GPIO_EN_IN;
> > > +       gpio_cfg &=3D ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
> >=20
> > OK this part is unique...
> >=20
> > > +static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned=
 int gpio_index, int value)
> > > +{
> > > +       struct mpfs_gpio_chip *mpfs_gpio =3D gpiochip_get_data(gc);
> > > +       u32 gpio_cfg;
> > > +       unsigned long flags;
> > > +
> > > +       raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
> > > +
> > > +       gpio_cfg =3D readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_inde=
x));
> > > +       gpio_cfg |=3D MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
> >=20
> > Also here
> >=20
> > > +static int mpfs_gpio_get_direction(struct gpio_chip *gc,
> > > +                                  unsigned int gpio_index)
> > > +static int mpfs_gpio_get(struct gpio_chip *gc,
> > > +                        unsigned int gpio_index)
> > > +static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_in=
dex, int value)
> >=20
> > But these are just MMIO functions.
> >=20
> > Is it possible to use augmented generic MMIO, i.e just override these
> > two functions that
> > need special handling?
>=20
> So, I've been looking into this again (finally), with an eye to stripping
> the interrupt handling bits out, and trying to upstream this in pieces.
> I dunno if I'm making a mistake here, but I don't know if there's much
> value in implementing this suggestion - as far as I can tell only the
> get()/set() functions can be replaced by what's provided by gpio-mmio.c.
> There are no controller wide registers that control direction and so
> bgpio_get_dir() can't be used - direction is read from the same
> mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index) registers that it is set
> using. Adding bgpio stuff, to just go ahead and overwrite it, to save on
> trivial get()/set() implementations seems to me like adding complication
> rather than removing it. What am I missing here?

What does bring a nice simplification though, IMO, is regmap. I am
pretty sure that using it was one of the suggestions made last time
Lewis submitted this - so I think I'm going to do that instead.

--CmBUU6+EmCtmkoM0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZw+VbgAKCRB4tDGHoIJi
0lJSAP4z+obM5BYOKqwKB2PbdE1VqVeBD3ETy6L0njmh6AlwGwD+Py5sBR753oNR
tRfAkzrBjAI+sykx7zgTzwgeYg8adQg=
=wRDg
-----END PGP SIGNATURE-----

--CmBUU6+EmCtmkoM0--

