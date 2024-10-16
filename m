Return-Path: <linux-gpio+bounces-11399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A929A0201
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D264A1C20A65
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E62F1C07F7;
	Wed, 16 Oct 2024 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="iODSIOfr";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="i1p38VoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26C193408;
	Wed, 16 Oct 2024 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729061945; cv=none; b=edfqySMaUEvJGBoBc2/PxNXt+DOgWYIDyKrdJeqzZe20skqlWQS2LW9DgKrJpS7+gFTWe1wq3C9caUZ3Kt2XJAB/6bvhNwEZQxdqbiLgQeoKKFb1x9+dun7N5IyP+RkzTJjFsEZ9GX/cUsun9TwHr/RXiSa4u01WAAejYauw5vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729061945; c=relaxed/simple;
	bh=5tTt0CYVrlFoN/zPjxeeLXJTuGrDNok35bzaWO14+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYCm/6LtHLCSwg/HgKKpVgFXqbob+WBr5gWNLQOi4/Df2Efgmb+TSBS7Eu/G1qcFvrjWkTca833osHXCJwTkIiYOhjjGKgWG1LTiKUts4+Q4yn0eMZFPEUvqUslZhAKpkX5T8yGK4vRanixwiATCuBCq1yKlXfANoww8pmxsHG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=iODSIOfr; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=i1p38VoJ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1729061940; x=1760597940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h3FiAS2c8YizfFhld4Gkb8iu9XdO1cCizUpi3AL9Jj0=;
  b=iODSIOfr/swbEOI9u8XBgd8wtWEdkpExgVsXzAeB1AxLguKH0PB793zp
   N3goVK4Xdx/2XlLtGItnuq6VKDr1LXXLRojsNBQOMLvDAHX8L/Jnqoeie
   IhWu68+SqhcnPQcQK599o0xs1D+WiTuM40yaojBXLfTGWB1Mi1OG8S8Jj
   VXYLem3LMEpdVppuKq2rI/XtuRMczpRVtssU5gHTfSmFhdb9KzD2En/PC
   1jbs4Q0m3q1HsshfJOmXjtl99mY7fmknbUEuMy7JBceWFsl6FpOQX0o2Y
   zJ5lDqp8Ix8ZafBWq6ihvT/hsMKbH8n3yclWdK0TrM1rxJpGfsf00I4mU
   g==;
X-CSE-ConnectionGUID: Rg86gjIzTH+50giFFivXVQ==
X-CSE-MsgGUID: H1giANbDTES1H3Icy75oUQ==
X-IronPort-AV: E=Sophos;i="6.11,207,1725314400"; 
   d="scan'208";a="39483479"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Oct 2024 08:58:58 +0200
X-CheckPoint: {670F6431-33-BD84CFBF-E7C15A70}
X-MAIL-CPID: 170C6D7412C83B37F70B93F383F63A79_3
X-Control-Analysis: str=0001.0A682F19.670F6432.0044,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2EB216FAFC;
	Wed, 16 Oct 2024 08:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1729061933;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3FiAS2c8YizfFhld4Gkb8iu9XdO1cCizUpi3AL9Jj0=;
	b=i1p38VoJ/6fn8+qB2vEr6ZIOwxGUKXApLYF2RNUVZSGTiT2GVUSIKjakXaa6InFGcTpyrF
	CbXoU3KO6mLiYl2vy6k6OjrIzPheOE565QltyIRibok8Gx+DGGm5+ovFik/qMXAvZjWAlN
	OOJVVfIL5+hV7vpgxubsUFCTanKL7FI+yBlM1EtJviR7aFJpYNUjTUJFDxD8gCnE65MEis
	OjI3mGFAGIBYYSNzP94Z0IZtXygviXpZgvhg6aeLzlsuC6xo2i4xA0SaaLZ0Av8Y0pyyg6
	op9R30679lpT+cu8Hxtcv7Bdnsfoy283dmZlYKCs6p+n1BDJUuh+4U0oeSS+qA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl, imx6ul-pinctrl: Convert i.MX35/5x/6 to YAML
Date: Wed, 16 Oct 2024 08:58:51 +0200
Message-ID: <2205972.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241015232107.100771-1-marex@denx.de>
References: <20241015232107.100771-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Marek,

thanks for the conversion.

Am Mittwoch, 16. Oktober 2024, 01:20:51 CEST schrieb Marek Vasut:
> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to YAML DT. Remove
> the old text DT bindings description.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> ---
>  .../bindings/pinctrl/fsl,imx35-pinctrl.txt    | 33 --------
>  ...ul-pinctrl.yaml =3D> fsl,imx35-pinctrl.yaml} | 79 +++++++++++++++++--
>  .../bindings/pinctrl/fsl,imx50-pinctrl.txt    | 32 --------
>  .../bindings/pinctrl/fsl,imx51-pinctrl.txt    | 32 --------
>  .../bindings/pinctrl/fsl,imx53-pinctrl.txt    | 32 --------
>  .../bindings/pinctrl/fsl,imx6dl-pinctrl.txt   | 38 ---------
>  .../bindings/pinctrl/fsl,imx6q-pinctrl.txt    | 38 ---------
>  .../bindings/pinctrl/fsl,imx6sl-pinctrl.txt   | 39 ---------
>  .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt  | 40 ----------
>  .../bindings/pinctrl/fsl,imx6sx-pinctrl.txt   | 36 ---------
>  10 files changed, 72 insertions(+), 327 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx35-p=
inctrl.txt
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx6ul-pinctrl.yam=
l =3D> fsl,imx35-pinctrl.yaml} (51%)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx50-p=
inctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx51-p=
inctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx53-p=
inctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6dl-=
pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6q-p=
inctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sl-=
pinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll=
=2Dpinctrl.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sx-=
pinctrl.txt
>=20
> [snip]
> diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl=
=2Eyaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
> similarity index 51%
> rename from Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.=
yaml
> rename to Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
> index 906b264a9e3cd..780d5fe0137e5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx35-pinctrl.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/pinctrl/fsl,imx6ul-pinctrl.yaml#
> +$id: http://devicetree.org/schemas/pinctrl/fsl,imx35-pinctrl.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Freescale IMX6UL IOMUX Controller
> +title: Freescale IMX35/IMX5x/IMX6 IOMUX Controller
> =20
>  maintainers:
>    - Dong Aisheng <aisheng.dong@nxp.com>
> @@ -19,6 +19,15 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx35-iomuxc
> +      - fsl,imx50-iomuxc
> +      - fsl,imx51-iomuxc
> +      - fsl,imx53-iomuxc

imx50.dtsi is using
> "fsl,imx50-iomuxc", "fsl,imx53-iomuxc";

So either the .dtsi or this schema needs to be adjusted.

> +      - fsl,imx6dl-iomuxc
> +      - fsl,imx6q-iomuxc
> +      - fsl,imx6sl-iomuxc
> +      - fsl,imx6sll-iomuxc
> +      - fsl,imx6sx-iomuxc
>        - fsl,imx6ul-iomuxc
>        - fsl,imx6ull-iomuxc-snvs
> =20
> @@ -39,9 +48,9 @@ patternProperties:
>            each entry consists of 6 integers and represents the mux and c=
onfig
>            setting for one pin. The first 5 integers <mux_reg conf_reg in=
put_reg
>            mux_val input_val> are specified using a PIN_FUNC_ID macro, wh=
ich can
> -          be found in <arch/arm/boot/dts/imx6ul-pinfunc.h>. The last int=
eger
> +          be found in <arch/arm/boot/dts/nxp/imx/imx*-pinfunc.h>. The la=
st integer
>            CONFIG is the pad setting value like pull-up on this pin. Plea=
se
> -          refer to i.MX6UL Reference Manual for detailed CONFIG settings.
> +          refer to matching i.MX Reference Manual for detailed CONFIG se=
ttings.
>          $ref: /schemas/types.yaml#/definitions/uint32-matrix
>          items:
>            items:
> @@ -56,7 +65,41 @@ patternProperties:
>              - description: |
>                  "input_val" indicates the select input value to be appli=
ed.
>              - description: |
> -                "pad_setting" indicates the pad configuration value to b=
e applied:
> +                "pad_setting" indicates the pad configuration value to b=
e applied.
> +                Common i.MX35
> +                  PAD_CTL_DRIVE_VOLAGAGE_18       (1 << 13)
> +                  PAD_CTL_DRIVE_VOLAGAGE_33       (0 << 13)
> +                  PAD_CTL_HYS                     (1 << 8)
> +                  PAD_CTL_PKE                     (1 << 7)
> +                  PAD_CTL_PUE                     (1 << 6)
> +                  PAD_CTL_PUS_100K_DOWN           (0 << 4)
> +                  PAD_CTL_PUS_47K_UP              (1 << 4)
> +                  PAD_CTL_PUS_100K_UP             (2 << 4)
> +                  PAD_CTL_PUS_22K_UP              (3 << 4)
> +                  PAD_CTL_ODE_CMOS                (0 << 3)
> +                  PAD_CTL_ODE_OPENDRAIN           (1 << 3)
> +                  PAD_CTL_DSE_NOMINAL             (0 << 1)
> +                  PAD_CTL_DSE_HIGH                (1 << 1)
> +                  PAD_CTL_DSE_MAX                 (2 << 1)
> +                  PAD_CTL_SRE_FAST                (1 << 0)
> +                  PAD_CTL_SRE_SLOW                (0 << 0)
> +                Common i.MX50/i.MX51/i.MX53 bits
> +                  PAD_CTL_HVE                     (1 << 13)
> +                  PAD_CTL_HYS                     (1 << 8)
> +                  PAD_CTL_PKE                     (1 << 7)
> +                  PAD_CTL_PUE                     (1 << 6)
> +                  PAD_CTL_PUS_100K_DOWN           (0 << 4)
> +                  PAD_CTL_PUS_47K_UP              (1 << 4)
> +                  PAD_CTL_PUS_100K_UP             (2 << 4)
> +                  PAD_CTL_PUS_22K_UP              (3 << 4)
> +                  PAD_CTL_ODE                     (1 << 3)
> +                  PAD_CTL_DSE_LOW                 (0 << 1)
> +                  PAD_CTL_DSE_MED                 (1 << 1)
> +                  PAD_CTL_DSE_HIGH                (2 << 1)
> +                  PAD_CTL_DSE_MAX                 (3 << 1)
> +                  PAD_CTL_SRE_FAST                (1 << 0)
> +                  PAD_CTL_SRE_SLOW                (0 << 0)
> +                Common i.MX6 bits
>                    PAD_CTL_HYS                     (1 << 16)
>                    PAD_CTL_PUS_100K_DOWN           (0 << 14)
>                    PAD_CTL_PUS_47K_UP              (1 << 14)
> @@ -69,6 +112,11 @@ patternProperties:
>                    PAD_CTL_SPEED_MED               (1 << 6)
>                    PAD_CTL_SPEED_HIGH              (3 << 6)
>                    PAD_CTL_DSE_DISABLE             (0 << 3)
> +                  PAD_CTL_SRE_FAST                (1 << 0)
> +                  PAD_CTL_SRE_SLOW                (0 << 0)
> +                i.MX6SL/MX6SLL specific bits
> +                  PAD_CTL_LVE                     (1 << 22) (MX6SL/SLL o=
nly)

Is this comment 'MX6SL/SLL only' really needed? This bit is already in the
i.MX6SL/MX6SLL only section.

Despite that, this looks good.
Best regards,
Alexander

> +                i.MX6SLL/i.MX6SX/i.MX6UL/i.MX6ULL specific bits
>                    PAD_CTL_DSE_260ohm              (1 << 3)
>                    PAD_CTL_DSE_130ohm              (2 << 3)
>                    PAD_CTL_DSE_87ohm               (3 << 3)
> @@ -76,8 +124,14 @@ patternProperties:
>                    PAD_CTL_DSE_52ohm               (5 << 3)
>                    PAD_CTL_DSE_43ohm               (6 << 3)
>                    PAD_CTL_DSE_37ohm               (7 << 3)
> -                  PAD_CTL_SRE_FAST                (1 << 0)
> -                  PAD_CTL_SRE_SLOW                (0 << 0)
> +                i.MX6DL/i.MX6Q/i.MX6SL specific bits
> +                  PAD_CTL_DSE_240ohm              (1 << 3)
> +                  PAD_CTL_DSE_120ohm              (2 << 3)
> +                  PAD_CTL_DSE_80ohm               (3 << 3)
> +                  PAD_CTL_DSE_60ohm               (4 << 3)
> +                  PAD_CTL_DSE_48ohm               (5 << 3)
> +                  PAD_CTL_DSE_40ohm               (6 << 3)
> +                  PAD_CTL_DSE_34ohm               (7 << 3)
> =20
>      required:
>        - fsl,pins
> [snip]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



