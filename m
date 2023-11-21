Return-Path: <linux-gpio+bounces-309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED787F27B6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 09:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A122C1C218D2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57DB1E53A;
	Tue, 21 Nov 2023 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zinUxLYS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35642112
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 00:41:31 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332c82400a5so1190948f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 00:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700556089; x=1701160889; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SCHxMbqw99jM5wJ3HP5Ky8BQ0qy1EingX8oib4vezVc=;
        b=zinUxLYStgiXNpfyvs79ZhCZGSALQTkxdqjcdtuiYi6lyuGLG0t6a43z5zDkhlBk8C
         7G7JhgFaM+HSHq7E7ReB8JcgLOXdzDqU/NGVsC2wCP/Qha05g4R7jQOy5f1CwOvSsntI
         5ZKA6EZUJ+klruAomGV49Asi/bAho5RxnjIBhd587ilqcS0s9f+W6qkA9o7djguHDU9I
         eVieSR8Yo3SPRkTMOAf8mzbeAnFePsD8XkpqInfaMBv5J/N5Ku4ZMjjDCMy6bRk98Log
         T5RAK1p12JFYJuxDHxcHDLGSIqMBtLGfmW62uBr5FCPCt+qvmKhvbmCS0oeezv2A6YVC
         3AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556089; x=1701160889;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SCHxMbqw99jM5wJ3HP5Ky8BQ0qy1EingX8oib4vezVc=;
        b=BtpK/eYmHik8sH0QQcdaYjTbgzSZ5eSmfqSZzKLF3SQjR11I5lNYgQyBPHnOQU5Rjp
         B/wVRt7taZ098+ludke7mSi5mBKziJwX/kS6ljHJ4vTgzocewYKk0nydM+pdXcS7andp
         1sSoYUybf2Hhbft+pbI4DbBEilhmYpoEfYhOFmIN3kugzBByYyueySjzumwi2yOE1AwR
         fh9UExjWpUdU5uqIQuNSQu8O+foODChjKl1EQ8buarvFaPs7MBaW45RRpxuZHU+Pkftj
         1zdSFZR7HwBBhi7gtSqXzLc6xQmGjvmuzhXhfas+bZHlfJl6wASVS/bvuiBuih4xNAjI
         zErQ==
X-Gm-Message-State: AOJu0Yx+6ha19pltonC4O1zYQFJkMhG36wuVAPTe0DpIpnl8Wde/Y55m
	9eYqb4KaYhX0l6CgAHnM7Gxyzg==
X-Google-Smtp-Source: AGHT+IFPRU2ASHglS//FhOGT8YwLtY74wKLDgPgE2pWlmfa1x1pmOlPojboz4Lh+OEQfDXfzzGz8+A==
X-Received: by 2002:adf:ef86:0:b0:331:7799:84d8 with SMTP id d6-20020adfef86000000b00331779984d8mr6187499wro.68.1700556089516;
        Tue, 21 Nov 2023 00:41:29 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id bf14-20020a0560001cce00b0032dde679398sm13885709wrb.8.2023.11.21.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 00:41:29 -0800 (PST)
Message-ID: <b5e7a95ef3ca5323c06f30c6d1d570d8629ad9a5.camel@linaro.org>
Subject: Re: [PATCH v4 02/19] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Tue, 21 Nov 2023 08:41:27 +0000
In-Reply-To: <20231120212037.911774-3-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
	 <20231120212037.911774-3-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-11-20 at 21:20 +0000, Peter Griffin wrote:
> Provide dt-schema documentation for Google gs101 SoC clock controller.
> Currently this adds support for cmu_top, cmu_misc and cmu_apm.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../bindings/clock/google,gs101-clock.yaml=C2=A0=C2=A0=C2=A0 | 110 =
+++++++++
> =C2=A0include/dt-bindings/clock/google,gs101.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 232 ++++++++++++++++++
> =C2=A02 files changed, 342 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/clock/google,g=
s101-clock.yaml
> =C2=A0create mode 100644 include/dt-bindings/clock/google,gs101.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.y=
aml b/Documentation/devicetree/bindings/clock/google,gs101-
> clock.yaml
> new file mode 100644
> index 000000000000..4612886fcc15
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google GS101 SoC clock controller
> +
> +maintainers:
> +=C2=A0 - Peter Griffin <peter.griffin@linaro.org>
> +
> +description: |
> +=C2=A0 Google GS101 clock controller is comprised of several CMU units, =
generating
> +=C2=A0 clocks for different domains. Those CMU units are modeled as sepa=
rate device
> +=C2=A0 tree nodes, and might depend on each other. The root clock in tha=
t clock tree
> +=C2=A0 is OSCCLK (24.576 MHz). That external clock must be defined as a =
fixed-rate
> +=C2=A0 clock in dts.
> +
> +=C2=A0 CMU_TOP is a top-level CMU, where all base clocks are prepared us=
ing PLLs and
> +=C2=A0 dividers; all other leaf clocks (other CMUs) are usually derived =
from CMU_TOP.
> +
> +=C2=A0 Each clock is assigned an identifier and client nodes can use thi=
s identifier
> +=C2=A0 to specify the clock which they consume. All clocks available for=
 usage
> +=C2=A0 in clock consumer nodes are defined as preprocessor macros in
> +=C2=A0 'dt-bindings/clock/gs101.h' header.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-top
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-apm
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - google,gs101-cmu-misc
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0 minItems: 1
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 "#clock-cells":
> +=C2=A0=C2=A0=C2=A0 const: 1
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +required:
> +=C2=A0 - compatible
> +=C2=A0 - "#clock-cells"
> +=C2=A0 - clocks
> +=C2=A0 - clock-names
> +=C2=A0 - reg
> +
> +allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-top
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - google,gs101-cmu-apm
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - des=
cription: External reference clock (24.576 MHz)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: oscclk
> +
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
: google,gs101-cmu-misc
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - des=
cription: External reference clock (24.576 MHz)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - des=
cription: Misc bus clock (from CMU_TOP)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: oscclk
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - con=
st: dout_cmu_misc_bus
> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 # Clock controller node for CMU_TOP
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/clock/google,gs101.h>
> +=C2=A0=C2=A0=C2=A0 soc {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <1>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmu_top: clock-controller@1e0=
80000 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compa=
tible =3D "google,gs101-cmu-top";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =
=3D <0x0 0x1e080000 0x8000>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #cloc=
k-cells =3D <1>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock=
s =3D <&ext_24_5m>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock=
-names =3D "oscclk";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0 };
> +
> +...
> diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindin=
gs/clock/google,gs101.h
> new file mode 100644
> index 000000000000..7765ba68f734
> --- /dev/null
> +++ b/include/dt-bindings/clock/google,gs101.h
> @@ -0,0 +1,232 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + * Author: Peter Griffin <peter.griffin@linaro.org>
> + *
> + * Device Tree binding constants for Google gs101 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
> +#define _DT_BINDINGS_CLOCK_GOOGLE_GS101_H
> +
> +/* CMU_TOP PLL*/

Usually there should be a space before */
Same in many other places in this file.

Cheers,
Andr=C3=A9

> +#define CLK_FOUT_SHARED0_PLL		1
> +#define CLK_FOUT_SHARED1_PLL		2
> +#define CLK_FOUT_SHARED2_PLL		3
> +#define CLK_FOUT_SHARED3_PLL		4
> +#define CLK_FOUT_SPARE_PLL		5
> +
> +/* CMU_TOP MUX*/
> +#define CLK_MOUT_SHARED0_PLL		6
> +#define CLK_MOUT_SHARED1_PLL		7
> +#define CLK_MOUT_SHARED2_PLL		8
> +#define CLK_MOUT_SHARED3_PLL		9
> +#define CLK_MOUT_SPARE_PLL		10
> +#define CLK_MOUT_BUS0_BUS		11
> +#define CLK_MOUT_CMU_BOOST		12
> +#define CLK_MOUT_BUS1_BUS		13
> +#define CLK_MOUT_BUS2_BUS		14
> +#define CLK_MOUT_CORE_BUS		15
> +#define CLK_MOUT_EH_BUS			16
> +#define CLK_MOUT_CPUCL2_SWITCH		17
> +#define CLK_MOUT_CPUCL1_SWITCH		18
> +#define CLK_MOUT_CPUCL0_SWITCH		19
> +#define CLK_MOUT_CPUCL0_DBG		20
> +#define CLK_MOUT_CMU_HPM		21
> +#define CLK_MOUT_G3D_SWITCH		22
> +#define CLK_MOUT_G3D_GLB		23
> +#define CLK_MOUT_DPU_BUS		24
> +#define CLK_MOUT_DISP_BUS		25
> +#define CLK_MOUT_G2D_G2D		26
> +#define CLK_MOUT_G2D_MSCL		27
> +#define CLK_MOUT_HSI0_USB31DRD		28
> +#define CLK_MOUT_HSI0_BUS		29
> +#define CLK_MOUT_HSI0_DPGTC		30
> +#define CLK_MOUT_HSI0_USBDPDGB		31
> +#define CLK_MOUT_HSI1_BUS		32
> +#define CLK_MOUT_HSI1_PCIE		33
> +#define CLK_MOUT_HSI2_BUS		34
> +#define CLK_MOUT_HSI2_PCIE		35
> +#define CLK_MOUT_HSI2_UFS_EMBD		36
> +#define CLK_MOUT_HSI2_MMC_CARD		37
> +#define CLK_MOUT_CSIS			38
> +#define CLK_MOUT_PDP_BUS		39
> +#define CLK_MOUT_PDP_VRA		40
> +#define CLK_MOUT_IPP_BUS		41
> +#define CLK_MOUT_G3AA			42
> +#define CLK_MOUT_ITP			43
> +#define CLK_MOUT_DNS_BUS		44
> +#define CLK_MOUT_TNR_BUS		45
> +#define CLK_MOUT_MCSC_ITSC		46
> +#define CLK_MOUT_MCSC_MCSC		47
> +#define CLK_MOUT_GDC_SCSC		48
> +#define CLK_MOUT_GDC_GDC0		49
> +#define CLK_MOUT_GDC_GDC1		50
> +#define CLK_MOUT_MFC_MFC		51
> +#define CLK_MOUT_MIF_SWITCH		52
> +#define CLK_MOUT_MIF_BUS		53
> +#define CLK_MOUT_MISC_BUS		54
> +#define CLK_MOUT_MISC_SSS		55
> +#define CLK_MOUT_PERIC0_IP		56
> +#define CLK_MOUT_PERIC0_BUS		57
> +#define CLK_MOUT_PERIC1_IP		58
> +#define CLK_MOUT_PERIC1_BUS		59
> +#define CLK_MOUT_TPU_TPU		60
> +#define CLK_MOUT_TPU_TPUCTL		61
> +#define CLK_MOUT_TPU_BUS		62
> +#define CLK_MOUT_TPU_UART		63
> +#define CLK_MOUT_TPU_HPM		64
> +#define CLK_MOUT_BO_BUS			65
> +#define CLK_MOUT_G3D_BUSD		66
> +
> +/* CMU_TOP Dividers*/
> +#define CLK_DOUT_SHARED0_DIV3		67
> +#define CLK_DOUT_SHARED0_DIV2		68
> +#define CLK_DOUT_SHARED0_DIV4		69
> +#define CLK_DOUT_SHARED0_DIV5		70
> +#define CLK_DOUT_SHARED1_DIV3		71
> +#define CLK_DOUT_SHARED1_DIV2		72
> +#define CLK_DOUT_SHARED1_DIV4		73
> +#define CLK_DOUT_SHARED2_DIV2		74
> +#define CLK_DOUT_SHARED3_DIV2		75
> +#define CLK_DOUT_BUS0_BUS		76
> +#define CLK_DOUT_CMU_BOOST		77
> +#define CLK_DOUT_BUS1_BUS		78
> +#define CLK_DOUT_BUS2_BUS		79
> +#define CLK_DOUT_CORE_BUS		80
> +#define CLK_DOUT_EH_BUS			81
> +#define CLK_DOUT_CPUCL2_SWITCH		82
> +#define CLK_DOUT_CPUCL1_SWITCH		83
> +#define CLK_DOUT_CPUCL0_SWITCH		84
> +#define CLK_DOUT_CPUCL0_DBG		85
> +#define CLK_DOUT_CMU_HPM		86
> +#define CLK_DOUT_G3D_SWITCH		87
> +#define CLK_DOUT_G3D_GLB		88
> +#define CLK_DOUT_DPU_BUS		89
> +#define CLK_DOUT_DISP_BUS		90
> +#define CLK_DOUT_G2D_G2D		91
> +#define CLK_DOUT_G2D_MSCL		92
> +#define CLK_DOUT_HSI0_USB31DRD		93
> +#define CLK_DOUT_HSI0_BUS		94
> +#define CLK_DOUT_HSI0_DPGTC		95
> +#define CLK_DOUT_HSI0_USBDPDGB		96
> +#define CLK_DOUT_HSI1_BUS		97
> +#define CLK_DOUT_HSI1_PCIE		98
> +#define CLK_DOUT_HSI2_BUS		100
> +#define CLK_DOUT_HSI2_PCIE		101
> +#define CLK_DOUT_HSI2_UFS_EMBD		102
> +#define CLK_DOUT_HSI2_MMC_CARD		103
> +#define CLK_DOUT_CSIS			104
> +#define CLK_DOUT_PDP_BUS		105
> +#define CLK_DOUT_PDP_VRA		106
> +#define CLK_DOUT_IPP_BUS		107
> +#define CLK_DOUT_G3AA			108
> +#define CLK_DOUT_ITP			109
> +#define CLK_DOUT_DNS_BUS		110
> +#define CLK_DOUT_TNR_BUS		111
> +#define CLK_DOUT_MCSC_ITSC		112
> +#define CLK_DOUT_MCSC_MCSC		113
> +#define CLK_DOUT_GDC_SCSC		114
> +#define CLK_DOUT_GDC_GDC0		115
> +#define CLK_DOUT_GDC_GDC1		116
> +#define CLK_DOUT_MFC_MFC		117
> +#define CLK_DOUT_MIF_BUS		118
> +#define CLK_DOUT_MISC_BUS		119
> +#define CLK_DOUT_MISC_SSS		120
> +#define CLK_DOUT_PERIC0_BUS		121
> +#define CLK_DOUT_PERIC0_IP		122
> +#define CLK_DOUT_PERIC1_BUS		123
> +#define CLK_DOUT_PERIC1_IP		124
> +#define CLK_DOUT_TPU_TPU		125
> +#define CLK_DOUT_TPU_TPUCTL		126
> +#define CLK_DOUT_TPU_BUS		127
> +#define CLK_DOUT_TPU_UART		128
> +#define CLK_DOUT_TPU_HPM		129
> +#define CLK_DOUT_BO_BUS			130
> +
> +/* CMU_TOP Gates*/
> +#define CLK_GOUT_BUS0_BUS		131
> +#define CLK_GOUT_BUS1_BUS		132
> +#define CLK_GOUT_BUS2_BUS		133
> +#define CLK_GOUT_CORE_BUS		134
> +#define CLK_GOUT_EH_BUS			135
> +#define CLK_GOUT_CPUCL2_SWITCH		136
> +#define CLK_GOUT_CPUCL1_SWITCH		137
> +#define CLK_GOUT_CPUCL0_SWITCH		138
> +#define CLK_GOUT_CPUCL0_DBG		139
> +#define CLK_GOUT_CMU_HPM		140
> +#define CLK_GOUT_G3D_SWITCH		141
> +#define CLK_GOUT_G3D_GLB		142
> +#define CLK_GOUT_DPU_BUS		143
> +#define CLK_GOUT_DISP_BUS		144
> +#define CLK_GOUT_G2D_G2D		145
> +#define CLK_GOUT_G2D_MSCL		146
> +#define CLK_GOUT_HSI0_USB31DRD		147
> +#define CLK_GOUT_HSI0_BUS		148
> +#define CLK_GOUT_HSI0_DPGTC		149
> +#define CLK_GOUT_HSI0_USBDPDGB		150
> +#define CLK_GOUT_HSI1_BUS		151
> +#define CLK_GOUT_HSI1_PCIE		152
> +#define CLK_GOUT_HSI2_BUS		153
> +#define CLK_GOUT_HSI2_PCIE		154
> +#define CLK_GOUT_HSI2_UFS_EMBD		155
> +#define CLK_GOUT_HSI2_MMC_CARD		156
> +#define CLK_GOUT_CSIS			157
> +#define CLK_GOUT_PDP_BUS		158
> +#define CLK_GOUT_PDP_VRA		159
> +#define CLK_GOUT_IPP_BUS		160
> +#define CLK_GOUT_G3AA			161
> +#define CLK_GOUT_ITP			162
> +#define CLK_GOUT_DNS_BUS		163
> +#define CLK_GOUT_TNR_BUS		164
> +#define CLK_GOUT_MCSC_ITSC		165
> +#define CLK_GOUT_MCSC_MCSC		166
> +#define CLK_GOUT_GDC_SCSC		167
> +#define CLK_GOUT_GDC_GDC0		168
> +#define CLK_GOUT_GDC_GDC1		169
> +#define CLK_GOUT_MFC_MFC		170
> +#define CLK_GOUT_MIF_SWITCH		171
> +#define CLK_GOUT_MIF_BUS		172
> +#define CLK_GOUT_MISC_BUS		173
> +#define CLK_GOUT_MISC_SSS		174
> +#define CLK_GOUT_PERIC0_BUS		175
> +#define CLK_GOUT_PERIC0_IP		176
> +#define CLK_GOUT_PERIC1_BUS		177
> +#define CLK_GOUT_PERIC1_IP		178
> +#define CLK_GOUT_TPU_TPU		179
> +#define CLK_GOUT_TPU_TPUCTL		180
> +#define CLK_GOUT_TPU_BUS		181
> +#define CLK_GOUT_TPU_UART		182
> +#define CLK_GOUT_TPU_HPM		183
> +#define CLK_GOUT_BO_BUS			184
> +#define CLK_GOUT_CMU_BOOST		185
> +
> +/* CMU_APM */
> +
> +#define CLK_MOUT_APM_FUNC					1
> +#define CLK_MOUT_APM_FUNCSRC					2
> +#define CLK_DOUT_APM_BOOST					3
> +#define CLK_DOUT_APM_USI0_UART					4
> +#define CLK_DOUT_APM_USI0_USI					5
> +#define CLK_DOUT_APM_USI1_UART					6
> +#define CLK_GOUT_APM_FUNC					7
> +#define CLK_GOUT_APM_UID_APBIF_GPIO_ALIVE_IPCLKPORT_PCLK	8
> +#define CLK_GOUT_APM_UID_APBIF_GPIO_FAR_ALIVE_IPCLKPORT_PCLK	9
> +#define CLK_GOUT_APM_UID_APBIF_PMU_ALIVE_IPCLKPORT_PCLK		10
> +#define CLK_GOUT_APM_UID_SYSREG_APM_IPCLKPORT_PCLK		11
> +#define CLK_APM_PLL_DIV2_APM					12
> +#define CLK_APM_PLL_DIV4_APM					13
> +#define CLK_APM_PLL_DIV16_APM					14
> +
> +/* CMU_MISC */
> +
> +#define CLK_MOUT_MISC_BUS_USER					1
> +#define CLK_MOUT_MISC_SSS_USER					2
> +#define CLK_DOUT_MISC_BUSP					3
> +#define CLK_DOUT_MISC_GIC					4
> +#define CLK_GOUT_MISC_PCLK					5
> +#define CLK_GOUT_MISC_SYSREG_PCLK				6
> +#define CLK_GOUT_MISC_WDT_CLUSTER0				7
> +#define CLK_GOUT_MISC_WDT_CLUSTER1				8
> +
> +#endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */


