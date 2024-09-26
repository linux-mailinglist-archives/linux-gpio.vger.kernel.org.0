Return-Path: <linux-gpio+bounces-10463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B09876A3
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 17:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56A0F1C24B5D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 15:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715AD14F126;
	Thu, 26 Sep 2024 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kT0sjHlx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487A14F9EA;
	Thu, 26 Sep 2024 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365123; cv=none; b=QEkJEuhHCXegfa3moKfOlIoKXn4G5rP0ZqdO2pYDDuUPjXgSVk3iZU9W5RIJkkQB7WKQWEui6RQ/fMDuMYRCtp3AlR0CNNZ8ze8MvaLpK47IFRxZd9ZXuw5CxiR+s9SdYDrZqFZ5oDitSmpthSAc8sPv64x7Mc2uMQAb+CgaIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365123; c=relaxed/simple;
	bh=FPT2YAGW9+hHu5TfpaI/ztalhhPfkbiDDiuJtItLTMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWWrrzLPSxuaPoK79bWzZUzHw2MDAS9CiGkcLB8iYFO42DjEvmIoaY9OAGksHP1rAaZ71a9iUg80OCwK6VFgvhFHsMMmkYfngbDxoG+qGOrPXUqBQiXCGpZR+uD60Da6dwRfHdC6vqsU3uZRw+s0mgGppmVT/Z2JDOCw3B/M84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kT0sjHlx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421CAC4CEC5;
	Thu, 26 Sep 2024 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727365122;
	bh=FPT2YAGW9+hHu5TfpaI/ztalhhPfkbiDDiuJtItLTMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kT0sjHlxptVEDKh1a/WtPaYDym9m/flo9vMG/YA4FiNaDb9w/gETJG5bCirboVjnu
	 KY0whWWWvgBMcvuVJZxrZ2az8NZuo8dXL73pTN7V9MK50GjcOCk1s59/jyoqLuXvoU
	 Jrt0LTTy5LEj6I7sc94la6XYYxh4rRpZPGpnciHqpAHvrI7WmCsbGL8FgTspvBLdEP
	 LTiw7+MjJH1r5jX6eQXZ+EFrhxCjtHfe2cDQZ550TfAEhh6vJVn0EPHlwtJ/1tKwTU
	 MfN8JCrH5KAjAdnZt9bM8yhgCpBwWbjxdKi93E9bmpDwW0LNlB9fHWoLQwVB0qraWH
	 1rrrwU40i2UGQ==
Date: Thu, 26 Sep 2024 16:38:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: gpio: add support for NXP
 S32G2/S32G3 SoCs
Message-ID: <20240926-apricot-unfasten-5577c54a3e2f@spud>
References: <20240926143122.1385658-1-andrei.stefanescu@oss.nxp.com>
 <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJQMIqEvPuySmWWm"
Content-Disposition: inline
In-Reply-To: <20240926143122.1385658-3-andrei.stefanescu@oss.nxp.com>


--IJQMIqEvPuySmWWm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 05:31:19PM +0300, Andrei Stefanescu wrote:
> Add support for the GPIO driver of the NXP S32G2/S32G3 SoCs.
>=20
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

What's up with this SoB chain? You're the author what did
the other 3 people do? Are they missing co-developed-by tags?

> ---
>  .../bindings/gpio/nxp,s32g2-siul2-gpio.yaml   | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,s32g2-siul=
2-gpio.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> new file mode 100644
> index 000000000000..4556505ee9c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,s32g2-siul2-gpio.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright 2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,s32g2-siul2-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2 SIUL2 GPIO controller
> +
> +maintainers:
> +  - Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> +  - Larisa Grigore <larisa.grigore@nxp.com>
> +  - Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> +
> +description:
> +  Support for the SIUL2 GPIOs found on the S32G2 and S32G3
> +  chips. It includes an IRQ controller for all pins which have
> +  an EIRQ associated.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-siul2-gpio
> +      - items:
> +        - const: nxp,s32g3-siul2-gpio
> +        - const: nxp,s32g2-siul2-gpio
> +
> +  reg:
> +    items:
> +      - description: PGPDO (output value) registers for SIUL2_0
> +      - description: PGPDO (output value) registers for SIUL2_1
> +      - description: PGPDI (input value) registers for SIUL2_0
> +      - description: PGPDI (input value) registers for SIUL2_1
> +      - description: EIRQ (interrupt) configuration registers from SIUL2=
_1
> +      - description: EIRQ IMCR registers for interrupt muxing between pa=
ds
> +
> +  reg-names:
> +    items:
> +      - const: opads0
> +      - const: opads1
> +      - const: ipads0
> +      - const: ipads1
> +      - const: eirqs
> +      - const: eirq-imcrs
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 2
> +    maxItems: 2
> +
> +  gpio-reserved-ranges:
> +    minItems: 2
> +
> +patternProperties:
> +  "-hog(-[0-9]+)?$":
> +    required:
> +      - gpio-hog
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - gpio-ranges
> +  - gpio-reserved-ranges
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    gpio@4009d700 {
> +        compatible =3D "nxp,s32g2-siul2-gpio";
> +        reg =3D <0x4009d700 0x10>,
> +              <0x44011700 0x18>,
> +              <0x4009d740 0x10>,
> +              <0x44011740 0x18>,
> +              <0x44010010 0xb4>,
> +              <0x44011078 0x80>;

Huh, I only noticed this now. Are you sure that this is a correct
representation of this device, and it is not really part of some syscon?
The "random" nature of the addresses  and the tiny sizes of the
reservations make it seem that way. What other devices are in these
regions?

Additionally, it looks like "opads0" and "ipads0" are in a different
region to their "1" equivalents. Should this really be represented as
two disctint GPIO controllers?


Cheers,
Conor.

> +        reg-names =3D "opads0", "opads1", "ipads0",
> +                    "ipads1", "eirqs", "eirq-imcrs";
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +                      /* GPIO 0-101 */
> +        gpio-ranges =3D <&pinctrl 0 0 102>,
> +                      /* GPIO 112-190 */
> +                      <&pinctrl 112 112 79>;
> +        gpio-reserved-ranges =3D <102 10>, <123 21>;
> +        interrupts =3D <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +    };
> --=20
> 2.45.2
>=20
>=20

--IJQMIqEvPuySmWWm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvV//QAKCRB4tDGHoIJi
0uOxAQCvz6m4Nw9QLswXja2k1N2xfO+ZWjULc/Bx8JXrdJFUdwEA6cM/JPQkNWzg
eS7vasQdUA/KkS2yHj4qhqW9izZk1gQ=
=aPrA
-----END PGP SIGNATURE-----

--IJQMIqEvPuySmWWm--

