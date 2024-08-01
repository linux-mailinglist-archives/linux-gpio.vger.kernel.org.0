Return-Path: <linux-gpio+bounces-8522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168E944ECC
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 17:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2262728459E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2024 15:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7225013B79F;
	Thu,  1 Aug 2024 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdY7X/tF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2542E3A1DA;
	Thu,  1 Aug 2024 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722524995; cv=none; b=sqkFH4XvCC0CRzBeljBuPeEHKKCDt0Dm6QVWxtSk4ZiDQB9e/UtWsXO3bliusWjTvG52UXSMSxOcPQKV3EmZ2VaLYO4A5/YCYtTUJiPDcZIHA+PIMRrnOzlIi4YqijEoHvkxYGdcTCDdaIAo1hf4cEqby4xNzooQhHCQ/w6XwvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722524995; c=relaxed/simple;
	bh=kbvV4AlvhMw0jKJGpx/bRqh4DWyE7ZqZruWEjEQ6LL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPo7mCSix5DtaC15ZVBYBT3dneueFGsZ9NWafeJDbK/sxKE4B83NP2lE224V7A8fJ0fauTRwKDA/Ul5BpYStCshvmsogfawd3QdNyIExnhTVqSq42HbmZdc0CEUig4TlniD9HkYDbUr+hwIkug9/KlHOBMddU3JROe5MfWGDzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdY7X/tF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8095C32786;
	Thu,  1 Aug 2024 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722524994;
	bh=kbvV4AlvhMw0jKJGpx/bRqh4DWyE7ZqZruWEjEQ6LL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HdY7X/tFmCpcXLqCSIZGKkUOsNwAms3dfdCuzutVEYV21FG9OekVPWjti7ryadq8y
	 SyR+NUgifiWNearG3mufdQdbV/YT0W3ngrOBL8yoziKgZCRh6d8aSzXqw63TgvrXo7
	 4hJ+4wPVPp2Ct+B49GFQVFgGSvt2ihNr2sQxXPk0TjERG8VdtBerrehCFA8aK8Gok6
	 15DhSVzsrv6tCELNnL+6bR0SbQO9F9Pf3kjZ8mINK3ze0Qobr/eyApZ3hWj+WOGxNS
	 ZpVIkR9J0yKI7kBVtYlrjrU/BBCTAqMPNF6tss46OGuonqfTKcSmyKxZsvbwZF/SgU
	 b5GyxIZpx58zQ==
Date: Thu, 1 Aug 2024 16:09:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 3/6] irqchip: add mpfs gpio interrupt mux
Message-ID: <20240801-palpitate-swinger-7bc8ae8deaaf@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-flatworm-cornflake-8023212f6584@wendy>
 <87le1k8oq2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="11AmpaTIfaZfcutl"
Content-Disposition: inline
In-Reply-To: <87le1k8oq2.ffs@tglx>


--11AmpaTIfaZfcutl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 12:41:25PM +0200, Thomas Gleixner wrote:
> On Tue, Jul 23 2024 at 12:27, Conor Dooley wrote:
> > +
> > +struct mpfs_irq_mux_bank_config {
> > +	u32 mask;
> > +	u8 shift;
> > +};
>=20
> Please see:
>=20
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html
>=20
> vs. coding style.
>=20
> > +/*
> > + * Returns an unsigned long, where a set bit indicates the correspondi=
ng
> > + * interrupt is in non-direct/muxed mode for that bank/GPIO controller.
> > + */
> > +static inline unsigned long mpfs_irq_mux_get_muxed_irqs(struct mpfs_ir=
q_mux *priv,
> > +							unsigned int bank)
> > +{
> > +	unsigned long mux_config =3D priv->mux_config, muxed_irqs =3D -1;
> > +	struct mpfs_irq_mux_bank_config bank_config =3D mpfs_irq_mux_bank_con=
figs[bank];
> > +
> > +	/*
> > +	 * If a bit is set in the mux, GPIO the corresponding interrupt from
> > +	 * controller 2 is direct and that controllers 0 or 1 is muxed.
>=20
> This is not a coherent sentence.

It should read "controller 0 or 1;s interrupt is muxed". Does that make
more sense to you?

> > +	 * Invert the bits in the configuration register, so that set bits
> > +	 * equate to non-direct mode, for GPIO controller 2.
> > +	 */
> > +	if (bank =3D=3D 2u)
> > +		mux_config =3D ~mux_config;
> > +
>=20
> > +static int mpfs_irq_mux_nondirect_alloc(struct irq_domain *d, unsigned=
 int virq,
> > +					struct irq_fwspec *fwspec, struct mpfs_irq_mux *priv)
> > +{
> > +	unsigned int bank =3D fwspec->param[0] / MPFS_MAX_IRQS_PER_GPIO;
> > +
> > +	if (bank > 2)
> > +		return -EINVAL;
> > +
> > +	priv->nondirect_irqchips[bank].domain =3D d;
> > +
> > +	irq_domain_set_hwirq_and_chip(d, virq, fwspec->param[0],
> > +				      &mpfs_irq_mux_nondirect_irq_chip, priv);
> > +	irq_set_chained_handler_and_data(virq, handle_untracked_irq,
>=20
> Why does this use handle_untracked_irq()?

I'll have to go and dig back in my notes as to why it is untracked. It
was probably something like irqd_set() in handle_irq_event() blowing up
on the irq_data being invalid (which I figure could relate back to my
questions in the cover letter about issues with irqd_to_hwirq()) - but
I'll double check what exactly prompted it when I get back from my
holidays, but...

> This sets up a chained handler
> but handle_untracked_irq() is a regular interrupt handler.

=2E..what I was likely using before was handle_simple_irq() which isn't
chained either. You're expecting to see mpfs_irq_mux_nondirect_handler()
here I suppose?

>+static void mpfs_irq_mux_nondirect_handler(struct irq_desc *desc)
>+{
>+	struct mpfs_irq_mux_irqchip *irqchip_data =3D irq_desc_get_handler_data(=
desc);
>+	struct mpfs_irq_mux *priv =3D container_of(irqchip_data, struct mpfs_irq=
_mux,
>+						 nondirect_irqchips[irqchip_data->bank]);
>+	unsigned long muxed_irqs;
>+	int pos;
>+
>+	chained_irq_enter(irq_desc_get_chip(desc), desc);
>+
>+	muxed_irqs =3D mpfs_irq_mux_get_muxed_irqs(priv, irqchip_data->bank);
>+
>+	for_each_set_bit(pos, &muxed_irqs, MPFS_MAX_IRQS_PER_GPIO)
>+		generic_handle_domain_irq(irqchip_data->domain, irqchip_data->offset + =
pos);
>+
>+	chained_irq_exit(irq_desc_get_chip(desc), desc);
>+}

Given you've only commented on one significant issue and two minor items,
is it safe to conclude that the overall approach doesn't have you
screaming and running for the hills?

Cheers,
Conor.

> > +					 &priv->nondirect_irqchips[bank]);

--11AmpaTIfaZfcutl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqulPQAKCRB4tDGHoIJi
0sKFAP9oHaSYPhW8FIkf4ssGaWWv0SILb0BeDNlL+8x69V02NwEAiitNydpF/yk7
SFtK2kbzZYCnFccFMEDAeC8qRGJpQQ0=
=MaNi
-----END PGP SIGNATURE-----

--11AmpaTIfaZfcutl--

