Return-Path: <linux-gpio+bounces-7680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF75916E32
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 18:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 291271C21D87
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2024 16:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2381717333E;
	Tue, 25 Jun 2024 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUL8q5UO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB3E14A0B8;
	Tue, 25 Jun 2024 16:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719333285; cv=none; b=PxjoG7UAl9J2DuCYiOfpTsF+bwNgxGrGpamdKzlZl2r517iquYcc0P4wPK5Lwu60EadpXKm1gCUtpQ4irhbF6CXqN3qhNmyoNb91oVOL8yiBWhDv5UGnc8+uq5RXkCJDDCf7adDYFH3ui/4EXhIuF0I0dhkL2aTuCZbCr+tWfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719333285; c=relaxed/simple;
	bh=q4fE+7eaIIr13+voG5rrTACoPpuwo5LGe0aCY955GSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcqwBTkXvOt2qlkwTgRVxGKLdR/lBtiary6gx7QLhgbK+1x8Q48cSd817D7Wwjn5y/Eez8DjmPlLIUSLyPZZCKBNXpJAs13o5nQkLesvfY/LFc7JvpZqXQ6uVlOOYabd3TvSgB5fVFWStz+JofM37hGOPzcCy/Piddah+8Va15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUL8q5UO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DAA0C32786;
	Tue, 25 Jun 2024 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719333285;
	bh=q4fE+7eaIIr13+voG5rrTACoPpuwo5LGe0aCY955GSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUL8q5UOFj08sDJ0TVVFPZqKLQykvjRO1wzx2LmAXZy2e5iieEra0ofAVrnlI4tk7
	 O/iO+bAsEGB3Hbr6Fx4PbWO8FIOt0R5lmC7LCN0qyBl6Ah5xLzpg61tdThOcFx8xdG
	 ASzQTC/r/1w9FLZ4kQrbdYWBTRtfHsOMhK3RO8s4YQJt6pbQY19Y+FbZjPuGI3Z0ls
	 Eoefo4mv3g0ZgVVhjhAyDtGmnTJR8bxYPqjjrE0hIKrQhgTFBADUehQitO7I0lEwHj
	 y/r/tjIcsscq+yV7GBoIn6/KdLhrbLfaVlpZBEQAtH9i6QV4ySVUXZZlRU8QW999W8
	 +QBK4SW6jRkYA==
Date: Tue, 25 Jun 2024 17:34:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de,
	durai.manickamkr@microchip.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Message-ID: <20240625-clerical-manicure-ebc8a1d1b16b@spud>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="or5R3vZ5mvg49RKg"
Content-Disposition: inline
In-Reply-To: <20240625043525.279711-5-manikandan.m@microchip.com>


--or5R3vZ5mvg49RKg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:05:24AM +0530, Manikandan Muralidharan wrote:
> Convert the Atmel GPIO controller binding document to DT schema format
> using json-schema.
> The compatible string "microchip,sam9x7-gpio" is added as well.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - Fix bot errors with 'make dt_binding_check', missed to add
> "atmel,at91rm9200-gpio" as separate compatible for devices that uses it
> - Remove label from example
> - Add default entry for #gpio-lines property
> - Add new compatible string details in commit message
> ---
>  .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 81 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 -------
>  2 files changed, 81 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm92=
00-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio=
=2Eyaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> new file mode 100644
> index 000000000000..3dd70933ed8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/atmel,at91rm9200-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip GPIO controller (PIO)
> +
> +maintainers:
> +  - Manikandan Muralidharan <manikandan.m@microchip.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - atmel,at91sam9x5-gpio
> +              - microchip,sam9x60-gpio
> +          - const: atmel,at91rm9200-gpio
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-gpio
> +          - const: microchip,sam9x60-gpio
> +          - const: atmel,at91rm9200-gpio

It's worth pointing out that this is required, because the driver
implements a different set of ops for the sam9x60. There's not just more
of them, they're different too.
Are the sam9x60 and at91rm9200 are actually compatible, or is the
fallback here some mistake that originated in the dts?

--or5R3vZ5mvg49RKg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrxoAAKCRB4tDGHoIJi
0ql8AP0cwdCvyag4UWMffdbYolpWJoRGv4r3yRn8ULhaM4CovQEAwn+TazCP90z8
dPd+Hevm548epiRVEwTDWuc8T/sw6gU=
=U0hx
-----END PGP SIGNATURE-----

--or5R3vZ5mvg49RKg--

