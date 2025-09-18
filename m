Return-Path: <linux-gpio+bounces-26327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA3B85720
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 17:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B504170331
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 15:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0A3226861;
	Thu, 18 Sep 2025 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCERJzRw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF90223708;
	Thu, 18 Sep 2025 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758207971; cv=none; b=hfZ2wALEVpH5p/WRhurh9zLVYEVH9erK3lu/krYGYUntFOxTY9HcQ4VOM+fONVSewOB/49EVwQVtYD0HbKoR7VJ0QLbXyKygFhd0KTLZXF7stp3BY7p7yTG6oEO0dAXyFaRrbnank/AFztDon8LSlY8pauRtW1t4B/pqPDKMwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758207971; c=relaxed/simple;
	bh=vKA3fmJbqjvROjkDkbIy2DYmEFF9U5JT6KofB2Oe+D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyPaF5GVMKJ6xYC2zsdf4Znu3Ha3K1ru5o2WKJh687HZ3Kn0w5aWjr0xEmyS1xqadtycuu8OYRrh3BecPioH2K2IERaVFcxSiXE6x84zV2uzsQYsHqKQeAm/M/sHzTJNqqL9hKAAXcuk50EuiwT8M38+kEF6JA5HM6Uo53G1QWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCERJzRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139BAC4CEE7;
	Thu, 18 Sep 2025 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758207970;
	bh=vKA3fmJbqjvROjkDkbIy2DYmEFF9U5JT6KofB2Oe+D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCERJzRwAKxDQ1KvUygEWV1CwZ+LNQrSQZW3Z5Q93OOMf+wsgZfPFpnPvD/poGRIE
	 Xy7nzlzTJfTOkbrArwZuTMWQ6czKgtaTd92hfgVof0fI1x9FQbFCKnsemPm0xhIrpW
	 f6qJmB00FwVbEI1LTqUnUOJpL2bseR1eEG8rOhd74hqecqds6nqLsCbxejTkPqYfuQ
	 RpIDaK2MjAekSAcWWBMaUPYtaQEg8LhsjQAiOG9BTdH5Li+/Y1tRI+wZsZwsJQ3gaY
	 3mj8W81eV9npOYB3kIQyq8boEXamS6oQBjrtqHm715AbvogPdtHnDRlfkFMFE1XDJv
	 DRhk0L/PZuUkA==
Date: Thu, 18 Sep 2025 16:06:04 +0100
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
Subject: Re: [PATCH v3 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1
 GPIO Interrupt Multiplexer
Message-ID: <20250918-majestic-mockup-0a0e090db0a7@spud>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
 <20250918104009.94754-7-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/pCwTkF86qaNRpVh"
Content-Disposition: inline
In-Reply-To: <20250918104009.94754-7-herve.codina@bootlin.com>


--/pCwTkF86qaNRpVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 12:40:04PM +0200, Herve Codina (Schneider Electric)=
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
> ---
>  .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas=
,rzn1-gpioirqmux.yaml

This is an interrupt controller, please move it to that subdirectory.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/pCwTkF86qaNRpVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwf3AAKCRB4tDGHoIJi
0gOcAP99XokItUtuX1ufiP8oJREsjdPE3fkFF7xU0WaEATzS1wD/UTca8xeZ5WSr
4IXQT78rYWreCBOVjUd0cMtb6zr1IAE=
=jKYH
-----END PGP SIGNATURE-----

--/pCwTkF86qaNRpVh--

