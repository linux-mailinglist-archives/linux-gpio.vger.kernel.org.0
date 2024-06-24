Return-Path: <linux-gpio+bounces-7653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0E3915376
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 18:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800F61C20DB6
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 16:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964F419DF7F;
	Mon, 24 Jun 2024 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ng+jfuf/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C51719DF63;
	Mon, 24 Jun 2024 16:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246131; cv=none; b=NYgvzaFd+DBYs+5KZnMxsAR5PTOgYdZR5BzeRyKvu5n5EYaMcX7oHUjpbg6FQaYEbrjhr5jtBlLB413OkJzl25A171n4rOwGFiZC/0aKf3b3cPG00gMUNBIcF4RPbftRlSKLscnPOnS+b/qoJJ4hItecgH7OXRVgDQOcGCcWLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246131; c=relaxed/simple;
	bh=zMvz+Gv9NvgZTcXSP4I7e3sdMcxBeebAk4b31+F0GTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlsmYCaTYKxDBumEU4Yx2p0NF1V//dSLVPonsm4X1TtQAEJWpKWia/HCXR3crVD4kEN57TLZjVV6/BytJD4qM7XiQHkHkthR0k9q8EQIreMW3hph1fcTlQWpg2/o4q+ahmMF2UADlcAjE9WHQggMnd8WqmeBUDO2aVKCA4621SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ng+jfuf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E6BC4AF0C;
	Mon, 24 Jun 2024 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719246130;
	bh=zMvz+Gv9NvgZTcXSP4I7e3sdMcxBeebAk4b31+F0GTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng+jfuf/zTupMgZ/PhIAT97RdB6bNRW8KuJ7R1puj32MOV1LRwwtTsAMuY3W2axtD
	 LDKyjupLi8XpW/2q2w3um/sTmlEQnPkDFmhCHugo10uGXXvmChXC8Yh6wy2OoS1mjs
	 kP56+v3/L1iNus3AVKz5zgTpOqHn2UcbuHvXObXO2Zdc5rL5RB1D+LdNt1WVHY7pvl
	 gvnQcxpCuTzWkKoMcQKucc8G+vnFpK9mJQCwDXLPXRWrLwRNaJuGFOHtuTGRw3wZw1
	 0lWmpX51uuhA+F3+eodURxPVaqz0U3s/LkW2WKI6Zy6QYs4xOSUAPSn/v/DmpePCsM
	 J5KIr2t+eNa8Q==
Date: Mon, 24 Jun 2024 17:22:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de,
	durai.manickamkr@microchip.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hari.PrasathGE@microchip.com,
	Balamanikandan.Gunasundar@microchip.com,
	Nayabbasha.Sayed@microchip.com, Dharma.B@microchip.com,
	Varshini.Rajendran@microchip.com, Balakrishnan.S@microchip.com,
	Charan.Pedumuru@microchip.com
Subject: Re: [PATCH 4/5] dt-bindings: gpio: convert Atmel GPIO to json-schema
Message-ID: <20240624-divinity-gonad-e30bb4554403@spud>
References: <20240624100431.191172-1-manikandan.m@microchip.com>
 <20240624100431.191172-5-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MdphJjn9xsPu5pcS"
Content-Disposition: inline
In-Reply-To: <20240624100431.191172-5-manikandan.m@microchip.com>


--MdphJjn9xsPu5pcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 03:34:30PM +0530, Manikandan Muralidharan wrote:
> Convert the Atmel GPIO controller binding document to DT schema format
> using json-schema.

This should mention that there are additional compatible strings added.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../bindings/gpio/atmel,at91rm9200-gpio.yaml  | 78 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio_atmel.txt   | 31 --------
>  2 files changed, 78 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/atmel,at91rm92=
00-gpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio_atmel.txt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio=
=2Eyaml b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> new file mode 100644
> index 000000000000..3ace7ba687fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/atmel,at91rm9200-gpio.yaml
> @@ -0,0 +1,78 @@
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

This is definitely wrong, cos it disallows having
"atmel,at91rm9200-gpio" on it's own.

> +      - items:
> +          - enum:
> +              - microchip,sam9x7-gpio
> +          - const: microchip,sam9x60-gpio
> +          - const: atmel,at91rm9200-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +  gpio-line-names: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#gpio-lines":
> +    description:
> +      Number of gpio, 32 by default if absent

default: 32

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pioA: gpio@fffff400 {

The label here isn't needed.

Thanks,
Conor.

> +            compatible =3D "atmel,at91rm9200-gpio";
> +            reg =3D <0xfffff400 0x200>;
> +            interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH 1>;
> +            #gpio-cells =3D <2>;
> +            gpio-controller;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +            clocks =3D <&pmc PMC_TYPE_PERIPHERAL 2>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio_atmel.txt
> deleted file mode 100644
> index 29416f9c3220..000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio_atmel.txt
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -* Atmel GPIO controller (PIO)
> -
> -Required properties:
> -- compatible: "atmel,<chip>-gpio", where <chip> is at91rm9200 or at91sam=
9x5.
> -- reg: Should contain GPIO controller registers location and length
> -- interrupts: Should be the port interrupt shared by all the pins.
> -- #gpio-cells: Should be two.  The first cell is the pin number and
> -  the second cell is used to specify optional parameters to declare if t=
he GPIO
> -  is active high or low. See gpio.txt.
> -- gpio-controller: Marks the device node as a GPIO controller.
> -- interrupt-controller: Marks the device node as an interrupt controller.
> -- #interrupt-cells: Should be two. The first cell is the pin number and =
the
> -  second cell is used to specify irq type flags, see the two cell descri=
ption
> -  in interrupt-controller/interrupts.txt for details.
> -
> -optional properties:
> -- #gpio-lines: Number of gpio if absent 32.
> -
> -
> -Example:
> -	pioA: gpio@fffff200 {
> -		compatible =3D "atmel,at91rm9200-gpio";
> -		reg =3D <0xfffff200 0x100>;
> -		interrupts =3D <2 4>;
> -		#gpio-cells =3D <2>;
> -		gpio-controller;
> -		#gpio-lines =3D <19>;
> -		interrupt-controller;
> -		#interrupt-cells =3D <2>;
> -	};
> -
> --=20
> 2.25.1
>=20

--MdphJjn9xsPu5pcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmdLAAKCRB4tDGHoIJi
0gfJAP43jmnUWzp4jHeAuoDgfOKxum6Vx7HG8U8ROvnUwO0DpwD9E4g40LqyDENj
/oRX8/bfq4Od5JJyEuqmzXV00QCQNAc=
=rC3a
-----END PGP SIGNATURE-----

--MdphJjn9xsPu5pcS--

