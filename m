Return-Path: <linux-gpio+bounces-17669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF78DA646DA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 10:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB7577A3DDC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADD822069F;
	Mon, 17 Mar 2025 09:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eedTo345"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B275130A7D;
	Mon, 17 Mar 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203070; cv=none; b=DKX1aVBWAIlh76qfW2tSm0/2AU0B/XlV6OG6ORGWydtosySaT4yqtu+91nqevEjNTeJybfYftL6JIeOn3Al0CbqWAPdWXGe7PpM+nSX8/H8jtiMilf3Sb5kj+WrMioS44KjT6YbxuuIlX0WaAHH0kZMbMg7lGDplLwjVTHJ83CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203070; c=relaxed/simple;
	bh=C2lOHjL4PYNa3dMu5IqZyg4fIoUD4zdvKW2CVrc01GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5QeTay9y/IIHRA0tEgu3hRKtWmcsip8XJCeVMhY/sYpQB6xIT9+/jQbz8ik0AEEuM22hv0S3E03ZVIto5MoS4e4hi0RmdlS482U8o5NwyvjVUktFan5D57PsAsRKC5SLa0nSCpcHl8G2zQSN4vaFlDhxVLNCU1EcWMgzPl72FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eedTo345; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D3FC4CEE3;
	Mon, 17 Mar 2025 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742203069;
	bh=C2lOHjL4PYNa3dMu5IqZyg4fIoUD4zdvKW2CVrc01GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eedTo345fnkHS0qGxBrQ+6/7yc2f4Lwchy2L/9NfPq0rjnbPlNDm95uoX20SdEm/o
	 YzuwoVFEMxFUG4I+3w059H172FvscGP45E1oxFgGfxH7KjbIHkCFFjXKYMr/+HdEop
	 k4kdXGjfgJfP5i957SF4mo2PitqfRk9CdiYV5HzYAu1C5X1drgtMlur+esR0wTFtxi
	 x/ONi8SIi1VFyAt06cJapA60603S+ngsc18R3Pe0fRRHTnZYCoohP+S7WQufjQ3l23
	 L/I4cj1f7OT2YND6Cjmazylp5RlmFL39wKyOFtFRB9Wk34Lk7NXkiZ27+pnwlk52QE
	 o+nR7QAOl9WuQ==
Date: Mon, 17 Mar 2025 10:17:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: qcom: Add MSM8937 Global
 Clock Controller
Message-ID: <20250317-hot-obedient-sturgeon-394cb8@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>

On Sat, Mar 15, 2025 at 03:57:35PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add device tree bindings for the global clock controller on Qualcomm
> MSM8937 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/clock/qcom,gcc-msm8937.yaml           | 75 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
>  2 files changed, 92 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..3c3f6756048e195671f542b3a=
6cd09057558eafa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8937.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on MSM8937
> +
> +maintainers:
> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and p=
ower
> +  domains on MSM8937.

This is exactly like msm8953, so why it cannot be there?

> +
> +  See also::
> +    include/dt-bindings/clock/qcom,gcc-msm8917.h

typo, 8937

> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8937
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: DSI phy instance 0 dsi clock
> +      - description: DSI phy instance 0 byte clock
> +      - description: DSI phy instance 1 dsi clock
> +      - description: DSI phy instance 1 byte clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: dsi0pll
> +      - const: dsi0pllbyte
> +      - const: dsi1pll
> +      - const: dsi1pllbyte
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#power-domain-cells'
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +
> +    clock-controller@1800000 {
> +      compatible =3D "qcom,gcc-msm8937";
> +      reg =3D <0x01800000 0x80000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      #power-domain-cells =3D <1>;
> +      clocks =3D <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&sleep_clk>,
> +               <&dsi0_phy 1>,
> +               <&dsi0_phy 0>,
> +               <&dsi1_phy 1>,
> +               <&dsi1_phy 0>;
> +      clock-names =3D "xo",
> +                    "sleep_clk",
> +                    "dsi0pll",
> +                    "dsi0pllbyte",
> +                    "dsi1pll",
> +                    "dsi1pllbyte";
> +    };
> +...
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8917.h
> index 4b421e7414b50bef2e2400f868ae5b7212a427bb..ec1f0b261dd5ccfe4896a00ff=
a9cf86de98b9cb3 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
> @@ -170,6 +170,22 @@
>  #define VFE1_CLK_SRC				163
>  #define VSYNC_CLK_SRC				164
>  #define GPLL0_SLEEP_CLK_SRC			165
> +#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
> +#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
> +#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
> +#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169

Why are you adding bindings to 8917? Nothing in commit msg explains
that.

Best regards,
Krzysztof


