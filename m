Return-Path: <linux-gpio+bounces-27758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665BC13A3D
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 09:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971D03BE464
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Oct 2025 08:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5232D9ED1;
	Tue, 28 Oct 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fj/WnG8/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43042D948D
	for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2025 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641552; cv=none; b=A2ADJV4yxX2pU8+E+JF+P8LYtcNrxqRsStoqHaGyWW8FNibux1L5tHrQ4r1RpKbuYBIsmKyJ86ecfdx+aD9qBRF84oxo9Z9l5HanX1oHrifvB4OhU1Iqxdw4E51eqsxEl9kny+gM0+HnKOBBiz5xOU4XlLzEkQa4IiIWO/j2I3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641552; c=relaxed/simple;
	bh=Rci8oK8g4zQX2fXCwbMzzvTNYmicOZcufc/ud9MB8Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQnKh0IyzJvqEqkizwwgW6udXmhYp9bHbYNZNPIdpDBOM7b8YA/aAVLRqomZSPhQZuuccCiJs0E2KO7KWFip78tVuE1ya3bMJMTeCwqEXP3zbvbjSAU90CK8EJcZtY1PdSrmRJvKh4PjIuoTBq7Xc9jbXFw1bPciemqyXEQR3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fj/WnG8/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7Y8M
	a93sO96jbEi35vGpFMXIrwy6YnCZ8/pm8+7MgN0=; b=fj/WnG8/Mbcjl86+qfhN
	b+DXh2/PrlnWcDTG+LhX/SEGUOyRJggDaesoz/BpDZgR3cvdV92O+g1amZt/KHVx
	Gc38fp0AH886YeT5JF3NBKyGS4qxQ4jfz6OmZQHQcfDjtA+z/wZ1fD9Hc9nBA7Qf
	6PdQ3tdyv649uILJX/vi3eMnOGPfXRyC0VIZUJ2WUixCbGm1/hQAvaZPftPSJxl6
	4DMW6ZWI/uvsif31BOkBjxDWnSB85/d/Aa53q08jrk1gUd1zQ+VIa+Tt/z2Xuxjs
	jqIZ6SdEHh7YauQV0lAf+GarFlMDtkwLHF6LS7LEfPPAhXRJUK0TN/Jkeb7V5D5u
	EQ==
Received: (qmail 3942912 invoked from network); 28 Oct 2025 09:52:20 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 09:52:20 +0100
X-UD-Smtp-Session: l3s3148p1@0ZIzIjRCTLwujnsk
Date: Tue, 28 Oct 2025 09:52:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH v6 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aQCEQ0tye4vwb4Ej@ninjato>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
 <20251027123601.77216-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TfyCGKJsqzK7IN+Z"
Content-Disposition: inline
In-Reply-To: <20251027123601.77216-8-herve.codina@bootlin.com>


--TfyCGKJsqzK7IN+Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Herve,

On Mon, Oct 27, 2025 at 01:35:59PM +0100, Herve Codina (Schneider Electric)=
 wrote:
> On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
> order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
>=20
> The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> IRQ lines out of the 96 available to wire them to the GIC input lines.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Good news first:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I can access GPIO LEDs on my board and PHY interrupts also work.

> +	if (parent_args->args[1] < RZN1_IRQMUX_GIC_SPI_BASE ||
> +	    parent_args->args[1] >=3D RZN1_IRQMUX_GIC_SPI_BASE + RZN1_IRQMUX_NU=
M_OUTPUTS) {
> +		dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
> +		return -EINVAL;
> +	}

I really like this solution. I think I suggested it before but can't
recall the details. And it is not worth digging it up again. Looks good,
works, perfect.

=2E..

> +static int rzn1_irqmux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	u32 __iomem *regs;
> +
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	return rzn1_irqmux_setup(dev, np, regs);

The only super minor thing is that we could fold rzn1_irqmux_setup()
into probe() according to my taste. But I am also fine as is. Looking
really forward to see this series finally going upstream.

Thanks again for your work on this!

   Wolfram


--TfyCGKJsqzK7IN+Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAhDwACgkQFA3kzBSg
KbZzBQ//dGfSzYjCMDbqSzzH9rp46J9h2ioOYhbgHqWSa38bRcLKNqtJ3hjpmnzi
1qEPdSqdnxRgAxmV+B13czpT5Q9pUE+FFdaQ5vlU8B1fZlKNjj+mDP2Xo8/5KPb9
NcPffqNgK3xqpoGHlYtv6j5/vJY1epinvXe8iqUyAilBToEfQwu1vapRm6jQQwb6
3UeEjfhBrQloIdStvOMnys8NNs/o2ghxzbsWK38CWS1YN9erq3yCAgNqh+4Dlwif
Y4Yqe4kQe8+SW2MZpeZvDX0MhMVFHRZSOBhOKG95YK+cijImA2bxooyr3LN4zZj1
R2Cf1fdDWEhB3O2HqRWCArfYTAbYksYINMuJV/wt87RKx+zANXwwmSie+5f4rBja
B0rXX2HxClE7NlDdVa6fF/3kK//BQ+nvuUwUvePJHNqYdgOwn6VlxSeaSPui/065
su6hY1fupvJOVoEZBJ0ykj9W3/BLs+jkh3rfbBJ6un+JhZ2kIuzo5/v1pZGuUTIT
grpCvlDXFVozNXGhjaUfXG4KmkPchidQ+0bcx3m/AaG5f5jJFnJ1H4xUZIRGC/LJ
vbsFaJxZ/NgPjOOB9f4PQEWAL2anKeoH/YkKPkeF0OBGQ3YZq+XbT5c6QL7MdMGe
wWBWmlyDmnlRLBy5Srs3KtrbUpq2qnCiURddjIeG7ZEJq173gLc=
=o45b
-----END PGP SIGNATURE-----

--TfyCGKJsqzK7IN+Z--

