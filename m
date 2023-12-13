Return-Path: <linux-gpio+bounces-1316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1857D80F244
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 17:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8516281BD4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 16:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3942C77F0F;
	Tue, 12 Dec 2023 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uY9B8bTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0977F02;
	Tue, 12 Dec 2023 16:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFC3C433C7;
	Tue, 12 Dec 2023 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702397929;
	bh=UYaXZrFDR/cy/SyqvoOFltStolzjOE3ACy1szjYwMKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uY9B8bTGeoApiuOFnJoml3G+mhJpKS4M7gpksSdv8eIO/TM1Q/6bOcRWyWMql1eFy
	 SFSeCAMH9JpJCXM3I0ZQNo4gx0/gx2mfxDSluDvRkLk7ceSrpAe5L6CjlFT/HPxtph
	 HfgoyafWpBfd/J1Omjoral0LpYzL6JW3iO28+/0JJ9KBx4v0p72azZZQY5HaztlUHu
	 pWK4DyLohwVfCqhS6MXNbDWZaY6VSla3fyzcjpCe6gogZ3E18mO3j/kgk8YSMePsKW
	 Kbh3wNKfJpD5QNsv1A/S0h3Pk6fkNrtpg3bkzqjyA8fTJVeaslqC7RIDbwlQ621ews
	 vP4J4lK7i8WLQ==
Date: Tue, 12 Dec 2023 16:18:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: arnd@arndb.de, pmenzel@molgen.mpg.de, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: nuvoton: Add NPCM BPC
Message-ID: <20231212-uncut-sixfold-9359b141b149@spud>
References: <20231212100703.3374555-1-tmaimon77@gmail.com>
 <20231212100703.3374555-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EKatXyW3mv8oRlRW"
Content-Disposition: inline
In-Reply-To: <20231212100703.3374555-2-tmaimon77@gmail.com>


--EKatXyW3mv8oRlRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 12:07:01PM +0200, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> Code (BPC).
>=20
> The NPCM BPC monitoring two configurable I/O addresses written by the
> host on the bus.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../soc/nuvoton/nuvoton,npcm-bpc.yaml         | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton=
,npcm-bpc.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-b=
pc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.ya=
ml
> new file mode 100644
> index 000000000000..30033cdac8f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-bpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton BMC NPCM BIOS Post Code (bpc) controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description:
> +  Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> +  addresses written by the host on the bus, the capture data stored in
> +  128-word FIFO.
> +
> +  NPCM BPC supports capture double words, when using capture
> +  double word only I/O address 1 is monitored.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-bpc
> +      - nuvoton,npcm845-bpc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  nuvoton,monitor-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Contain monitor I/O addresses on the bus, at least one monitor I/O
> +      address required.
> +
> +  nuvoton,bpc-en-dwcapture:
> +    description:
> +      If present, Enable FIFO capture of the DWord address according to
> +      one address setting.

This sounds like something you can either infer from the compatible or
is determining software policy. A more detailed
explanation/justification is required here.

Thanks,
Conor.

> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - nuvoton,monitor-ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    bpc: bpc@f0007040 {
> +        compatible =3D "nuvoton,npcm750-bpc";
> +        reg =3D <0xf0007040 0x20>;
> +        interrupts =3D <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +        nuvoton,monitor-ports =3D <0x80>;
> +    };
> +...
> --=20
> 2.34.1
>=20
>=20

--EKatXyW3mv8oRlRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiH4wAKCRB4tDGHoIJi
0sLCAQDUf4LaNco4BW20mKaW2lH+BVibKLD9Jte4xNrK4aGvzQD+O4RM8COYi+g1
NthOdrrQn5Cf2XV545V37YT7QRKckAI=
=Ch0H
-----END PGP SIGNATURE-----

--EKatXyW3mv8oRlRW--

