Return-Path: <linux-gpio+bounces-8597-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4F94969F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 19:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01365281EDE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2024 17:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CBB46450;
	Tue,  6 Aug 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MT9lOAVT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAAB51C3E;
	Tue,  6 Aug 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722965069; cv=none; b=XecBNjr1xubqYLR2cMXtQoFCbOBX3LMdSL24LLqu2nre5vMEQk35w62QJQyfL1rR0loqGszfURVtiiWcC8io1qKtvUFiiPyOijroLKS6nv3dRHvxXUhYeubQpHPQjqRPqNwPRbDQBLhAbcNagotfE0noEbXmcSRABQXmOWG2XGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722965069; c=relaxed/simple;
	bh=wPSRzRGpwzmF82mrv16loYp6AIiurWjq69qMI7IdNjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvuVTLon/ac4Row2KKAv6cQ++9ve5cTgfOnZWVKlRrotUdGxHKZhODZMTMpxkO1EiVaXR+6DrngXdVGjJM/h0iC7OBK1rLvajrtzousy+aS8WuAxGOWXiNVCVLWDCd769qNN4pQLYmSzUqb6yzgVCDDHojZVs6yvS/zccwLcVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MT9lOAVT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 251CCC32786;
	Tue,  6 Aug 2024 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965068;
	bh=wPSRzRGpwzmF82mrv16loYp6AIiurWjq69qMI7IdNjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MT9lOAVT/MW5+lKZD86HtDMYtX+lUJ4jVxLv6qHLRXYRvNAlABzMXBKj8m95OtZSl
	 vRxHJZdv/sEY121ed37HSh6fR6F6sqxtWQOI5pFI4G9X1cs8kgKNXGY4qJHOX66WRZ
	 GaDrku53SSEKzjR+0uRZoWBkUD5EtFK2svhO6Dkks329pkia9vY0O1+XSVh/xegXuS
	 8LRbOtBTElzmfjiEyeAW2dR3WsUDzmQ6N9jtcc+nN032JFIU3wFBxIDCNOpWCtOFHN
	 ArrFvUIYeurTB4yW42lLnQt0dO8eJThG9ZbS9GevKXGjetR6/wOdJD9Y+1K9QZ0L1N
	 iVKwoogYU9A/w==
Date: Tue, 6 Aug 2024 18:24:24 +0100
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
	devicetree@vger.kernel.org
Subject: Re: [RFC v7 5/6] gpio: mpfs: pass gpio line number as irq data
Message-ID: <20240806-baking-frustrate-32d0af5ed39c@spud>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
 <20240723-handoff-race-33160609553f@wendy>
 <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DLvlmKu678eDGQat"
Content-Disposition: inline
In-Reply-To: <CACRpkdYdxdLG8=_Xd7HLwQ5+pxwGw6Xte7=UNbknB8HR474bcQ@mail.gmail.com>


--DLvlmKu678eDGQat
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 10:11:09AM +0200, Linus Walleij wrote:
> Hi Conor,
>=20
> thanks for your patch!
>=20
> On Tue, Jul 23, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
>=20
> > Since the interrupt mux is going to provide us a 1:1 mapping for
> > interrupts, and it is no longer correct to hit all of the set bits in
> > the interrupt handler, store the GPIO that "owns" an interrupt in its
> > data pointer, so that we can determine which bit to clear.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I don't quite get this, the irqchip of the GPIO is clearly hard-coded
> hierarchical, then why don't you:
>=20
> select IRQ_DOMAIN_HIERARCHY
>=20
> And use e.g. girq->child_to_parent_hwirq() to handle the
> hierarchy?
>=20
> See drivers/gpio/gpio-ixp4xx.c for a simple example of a hierarchical
> GPIO interrupt controller.

Cool, I'll check that out. I've got some re-figuring out of the
interrupt controller to do given Thomas' comment there. Maybe the
combination will solve the horrible % 32 hack...

Cheers,
Conor.

--DLvlmKu678eDGQat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZrJcRwAKCRB4tDGHoIJi
0uwCAP9KBPLktC1E1wnlwW7qvgZUaqUS4vNcQJ5ncTOE0NAcpgEA1Fb78h/UyI/0
zjV8D2T7x8EesEC+pTd1Pr7+5l8KsAs=
=8WPg
-----END PGP SIGNATURE-----

--DLvlmKu678eDGQat--

