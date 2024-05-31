Return-Path: <linux-gpio+bounces-6991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 160488D5A66
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 08:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3531F23E67
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 06:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F251144C89;
	Fri, 31 May 2024 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Ch+D15+1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y9oqFuNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A736B;
	Fri, 31 May 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717136215; cv=none; b=KQHF9YihQnIljBHysiUkVIgMb7xVLDYsbKGHv1GYwVls4TfH0mp5AfS/KuwIHyddfGn5ACa36QUoBMATC/+8toMh6w++yop05h3ScyQALfmoeiryKfR3cjHYKxJ56XfB4M7jW0FzQQqHMLLw1UI+DIdHvVRAInCHv+L6xampetg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717136215; c=relaxed/simple;
	bh=PU9wADAmKFnxGMyTJINBlux3WHrl1/71rCrm4yjDdt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbQl8J7bASsh9MhcniM6ffzN4zfzpZpw+Cbb7Yexrca76HkZLsLCPX0vb8q8vJ7fzctpPSefwPjBTeCPADRynVy6WB5J4frVtDGJ/yOcLrHmx1n0T3nCTuJp9Dct6kuliIhE21dEnyWsvXABcPROn/1Qbs8UJJIytesyxAwAk44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Ch+D15+1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y9oqFuNv reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1717136212; x=1748672212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BplqydDYpMobXdQpqqvJqm0UHLjyRhrsf41yh2GGcfE=;
  b=Ch+D15+1KTm+eEptbQtQkOqJsU/kFfIhrhyZRLGfOk4gOOJnt3eL5uej
   C1XAcPofinYETv4jjQTfVFuB4Zmn4fQimE9Y6gAUnxV98ToFlnqkuoQgE
   5WPpfCOtxCaFjWbvMo+wrf+Eb/kmZPGojMBM86fbKBbWBcYEyN0OkI6hC
   ZjPXMmRYOJVXww8qzHq42oXk4KUgZPwOHeqybIOIasI7Dge8L38xgfWy4
   JOHfmQMdNgwbaBblrMvxC/VD8SwsMlSS/eJqLHlk9YcY+5I7Y56EncJ1e
   iRAFxOLP4V2WSnsoA8L9BIFq62DBMHCmSPtpDIPWmCJJj2Olmog3qBXfn
   w==;
X-CSE-ConnectionGUID: 1UsTIyD4RAyP9gPTIO8Oww==
X-CSE-MsgGUID: yfHIr/PMTrGQsrQuGrwdeg==
X-IronPort-AV: E=Sophos;i="6.08,203,1712613600"; 
   d="scan'208";a="37152332"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 31 May 2024 08:16:49 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C9E1669A9;
	Fri, 31 May 2024 08:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1717136205;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BplqydDYpMobXdQpqqvJqm0UHLjyRhrsf41yh2GGcfE=;
	b=Y9oqFuNvNbB9GDHQMUxmVtQ4IbFlKbdQPusTXelQmIa26dGXG8W6MbOezTfq7JIgGAZ2PM
	HO+0OLxuQ6wfwiMRR4gfUjmHpCXwmCRXTLRwbbb/vd+Z5OZ99eLdK8UR8sSk2Wb9TzYhi8
	yVuswT7H9OgaSBm8k+i6ps1pbHbRKUXv9grtY6YfGouWlgueYCEI/3QfstsL5CiE4wZXXZ
	Ze1Bs3maywRBl0UXlAv8faK/JCB85YbN4qs+L7d7665OlfBAxQK/kNssmqj84YFFt9ejEg
	OtV0OvHUIklWrOFdibgQmzywHO1J5WhIgoK0SOfxy6I6PVw5fPhik6a0CIdXlg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: robh@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: Frank.Li@nxp.com, brgl@bgdev.pl, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: mpc8xxx: Convert to yaml format
Date: Fri, 31 May 2024 08:16:44 +0200
Message-ID: <2408577.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240530165424.3173673-1-Frank.Li@nxp.com>
References: <20240530165424.3173673-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

thanks for your patch.

Am Donnerstag, 30. Mai 2024, 18:54:24 CEST schrieb Frank Li:
> Convert binding doc from txt to yaml.
>=20
> Remove redundated "gpio1: gpio@2300000" example.
> Add gpio-controller at example "gpio@1100".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> Notes:
>     Change from v1 to v2
>      - Add gpio-controller at example "gpio@1100". to fix bot error.
>     Strangely, I can't reproduce locally.
>    =20
>     Pass dt_binding_check
>     make dt_binding_check DT_SCHEMA_FILES=3Dfsl,qoriq-gpio.yaml
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       CHKDT   Documentation/devicetree/bindings
>       LINT    Documentation/devicetree/bindings
>       DTC_CHK Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.examp=
le.dtb
>=20
>  .../bindings/gpio/fsl,qoriq-gpio.yaml         | 82 +++++++++++++++++++
>  .../devicetree/bindings/gpio/gpio-mpc8xxx.txt | 53 ------------
>  2 files changed, 82 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio=
=2Eyaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml b=
/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> new file mode 100644
> index 0000000000000..adc955679d066
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MPC512x/MPC8xxx/QorIQ/Layerscape GPIO controller
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,mpc5121-gpio
> +          - fsl,mpc5125-gpio
> +          - fsl,mpc8349-gpio
> +          - fsl,mpc8572-gpio
> +          - fsl,mpc8610-gpio
> +          - fsl,pq3-gpio
> +      - items:
> +          - enum:
> +              - fsl,ls1021a-gpio
> +              - fsl,ls1028a-gpio
> +              - fsl,ls1043a-gpio
> +              - fsl,ls1088a-gpio
> +              - fsl,ls2080a-gpio
> +          - const: fsl,qoriq-gpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      GPIO registers are used as little endian. If not
> +      present registers are used as big endian by default.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio@1100 {
> +        compatible =3D "fsl,mpc5125-gpio";
> +        reg =3D <0x1100 0x080>;
> +        interrupts =3D <78 0x8>;
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    gpio@2300000 {
> +        compatible =3D "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
> +        reg =3D <0x2300000 0x10000>;
> +        interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +        gpio-controller;
> +        little-endian;
> +        #gpio-cells =3D <2>;

Please keep 'gpio-controller' and '#gpio-cells' together. I would move
little-endian either below reg directly or below interrupts.

Thanks
Alexander

> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> deleted file mode 100644
> index cd28e932bf50e..0000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Freescale MPC512x/MPC8xxx/QorIQ/Layerscape GPIO controller
> -
> -Required properties:
> -- compatible : Should be "fsl,<soc>-gpio"
> -  The following <soc>s are known to be supported:
> -	mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq,
> -	ls1021a, ls1043a, ls2080a, ls1028a, ls1088a.
> -- reg : Address and length of the register set for the device
> -- interrupts : Should be the port interrupt shared by all 32 pins.
> -- #gpio-cells : Should be two.  The first cell is the pin number and
> -  the second cell is used to specify the gpio polarity:
> -      0 =3D active high
> -      1 =3D active low
> -
> -Optional properties:
> -- little-endian : GPIO registers are used as little endian. If not
> -                  present registers are used as big endian by default.
> -
> -Example of gpio-controller node for a mpc5125 SoC:
> -
> -gpio0: gpio@1100 {
> -	compatible =3D "fsl,mpc5125-gpio";
> -	#gpio-cells =3D <2>;
> -	reg =3D <0x1100 0x080>;
> -	interrupts =3D <78 0x8>;
> -};
> -
> -Example of gpio-controller node for a ls2080a SoC:
> -
> -gpio0: gpio@2300000 {
> -	compatible =3D "fsl,ls2080a-gpio", "fsl,qoriq-gpio";
> -	reg =3D <0x0 0x2300000 0x0 0x10000>;
> -	interrupts =3D <0 36 0x4>; /* Level high type */
> -	gpio-controller;
> -	little-endian;
> -	#gpio-cells =3D <2>;
> -	interrupt-controller;
> -	#interrupt-cells =3D <2>;
> -};
> -
> -
> -Example of gpio-controller node for a ls1028a/ls1088a SoC:
> -
> -gpio1: gpio@2300000 {
> -	compatible =3D "fsl,ls1028a-gpio", "fsl,ls1088a-gpio", "fsl,qoriq-gpio";
> -	reg =3D <0x0 0x2300000 0x0 0x10000>;
> -	interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> -	gpio-controller;
> -	#gpio-cells =3D <2>;
> -	interrupt-controller;
> -	#interrupt-cells =3D <2>;
> -	little-endian;
> -};
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



