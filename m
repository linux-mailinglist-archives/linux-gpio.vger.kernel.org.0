Return-Path: <linux-gpio+bounces-26331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CDB85B07
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44DF561259
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80885311C33;
	Thu, 18 Sep 2025 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E20hbPfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCD630FC2C;
	Thu, 18 Sep 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209866; cv=none; b=k+Hj3+6BmhbRTZXesxOqvJogkqyjXT5vC2S0fxjxKzh6UU8hn/0ALO6A2tv+ECW7pfBCbpLcWCgZyaUwVo5hDcG9X9dtn4bRkmMqX1maTA+Rjj1luOr6njoNg5Mu3UHRSMXyhms4+FFE/q0rIwxPeRHZqeKJ6nE/WzGDa7xFRBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209866; c=relaxed/simple;
	bh=OediWH/XA9a/MvBEFV1pPkqzahcgcSoJbDioj8i6TiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEeh1RJw3YayVXZxvQV4opsf+u8drTQ1RGcAi7vFrcqp9LSva0JRGGXvqH0ArWOFHyVXSiiLoYyCRLB4SP4fXCJ8t1yqknud+psAi7LXnumUL/sdL6YrxAtKy7k9Z0CkDqBSUdNdAOose8y+e4NMTY5Nhx+CRKRQVA+LH3YUH2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E20hbPfr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0371C4CEE7;
	Thu, 18 Sep 2025 15:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758209865;
	bh=OediWH/XA9a/MvBEFV1pPkqzahcgcSoJbDioj8i6TiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E20hbPfr0XSQmhtjd7h+D82bTG8EroeVLd3jxx1V6b6b50Ao7xD322TqypCpajZBG
	 njMOmDrvmG/5cywM+BlS2WwCnkhLrYMX/ScKvuAtrrX65AC9tMI2b0vBMTNSb9I9PS
	 tIjNrF7YHvcJqfGIvKChvURWnMT8V4MaSZxxAnrXmLIoddQbHXosBuIdHsdyQQ1259
	 B1bKYOPUYXddNiodvoxOb5NhbMGxgMG0VW0dpW4xBeFaxOJYbW3LTaBN8PbIATbSdf
	 Nn1I4IVBpjnNkdBQ7J9KnX9a1Tft81xq97wtCi60hm1ant1k2xL5PeZS+cpYbrAeIg
	 repNm9GJxT3Ng==
Date: Thu, 18 Sep 2025 16:37:39 +0100
From: Conor Dooley <conor@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20250918-sterilize-malt-b0f182256617@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tzSyCJd6sK53Da2+"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-1-herve.codina@bootlin.com>


--tzSyCJd6sK53Da2+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 12:39:58PM +0200, Herve Codina (Schneider Electric)=
 wrote:
> Hi,
>=20
> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.
>=20
> The first patches in this series are related to a new helper introduced
> to parse an interrupt-map property.
>   - patch 1: Introduce the helper (for_each_of_imap_item)
>   - patch 2: Add a unittest for the new helper
>   - patch 3 and 4: convert existing drivers to use this new helper
>=20
> Patch 4 will conflicts with commit 40c26230a1bf ("irqchip: Use int type
> to store negative error codes") available in linux-next.
>=20
> Patch 5 adds support for GPIO (device-tree description)
>=20
> The last patches (6, 7 and 8) of the series are related to GPIO
> interrupts and GPIO IRQ multiplexer.
>=20
> In the RZ/N1 SoCs, GPIO interrupts are wired to a GPIO IRQ multiplexer.
>=20
> This multiplexer does nothing but select 8 GPIO IRQ lines out of the 96
> available to wire them to the GIC input lines.
>=20
> One upstreaming attempt have been done previously by Phil Edworthy [1]
> but the series has never been applied.
>=20
> Based on my understanding, I have fully reworked the driver proposed by
> Phil and removed the IRQ domain. Indeed, the device doesn't handle
> interrupts. It just routes signals.
>=20
> Also, as an interrupt-map property is used, the driver cannot be
> involved as an interrupt controller itself. It is a nexus node.
>=20
> With that in mind,
>   - Patch 6 is related to the irq-mux binding.
>=20
>   - Patch 7 introduces the irq-mux driver.
>     This driver uses the 'for_each_of_imap_item' helper introduced
>     previously. Indeed, the lines routing is defined by the
>     interrupt-map property and the driver needs to set registers to
>     apply this routing.
>=20
>   - Patch 8 is the RZ/N1 device-tree description update to have the
>     support for the GPIO interrupts.
>=20
> [1] https://lore.kernel.org/all/20190219155511.28507-1-phil.edworthy@rene=
sas.com/
>=20
> Best regards,
> Herv=E9

This whole thing is super interesting to me. I have a gpio irq mux of my
own with a driver that is massively more complex than what you have here
(it's a full on irqchip driver). I'm definitely gonna have to see if I
can ape what you have done here and simplify what I have.

--tzSyCJd6sK53Da2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwnQwAKCRB4tDGHoIJi
0j34AQC3P0PuxZC2SxFiex/qr+Yf8kgGuHRjI8JYavUXsV5SGQEA1yVu2nM9t/8F
CEKEQSi23yuWnP9bmfB6IKEfvv/rlww=
=q8VI
-----END PGP SIGNATURE-----

--tzSyCJd6sK53Da2+--

