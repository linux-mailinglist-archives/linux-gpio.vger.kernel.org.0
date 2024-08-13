Return-Path: <linux-gpio+bounces-8731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D4950B98
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA2A283F23
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE341A2C25;
	Tue, 13 Aug 2024 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5/UhpGu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7FF1BC5C;
	Tue, 13 Aug 2024 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571295; cv=none; b=k5WUByrRNH2Rr3f4JhDH/cV0UsGZ7XZ08vSghb5h5Ogz7H5GokvEo1Pq17Jgb6CnQaO+gGflIWs0O5JsFiS/IvFT/bUIODUwS/NDDn7lOhRG8imUorpmcEqyM5+yOkgATsWGiZaeDMc1Qz7E/HGAHyH3yPBXA5HD+E37KGjGmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571295; c=relaxed/simple;
	bh=WE8ITbVyzmCUV4Lw++OtwTduWTg5/B0KnjIq2iAvUUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz504EZX83w3FXotTrXGsNyjGZGeVv5IEJre4NcQgu8lmlOkZA4r3MLVKftd5QQ4NN1/aAcApV0CMDnCi9Z+nxAoCMQhKTxAqKNOHsQG9pp48jrF07eUfdIO8aD/CDdE1Wh/2W6NiycXpegYlZaT/hlgov8YrqGNQWg+QzkA+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5/UhpGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A725C32782;
	Tue, 13 Aug 2024 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571294;
	bh=WE8ITbVyzmCUV4Lw++OtwTduWTg5/B0KnjIq2iAvUUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5/UhpGuyJrZoRud3cCTtYrfXWHO7BdAZUtuk9pSXiD1UE2uGjcoXzlG7XMmeV5Rz
	 61bccschp+uXI+vOrKfZPMuujUjOHNEM4cKYeG5gjKsygibWJHWIHshJwpWCQO7Z/g
	 bIjbaQV/003sWt/X8P6zoanDRqAMcgPsSuK4hyihmtVHZTKGdvsG0mLIV08nJT38f5
	 Q9uOQFhkozP99ky9E62Y9P+GN9NioPeuwJmuREo1OSTc0xroTt0hYXvMxAb5zl/53m
	 GISTdJtHndIQrqmxO7/CrB4Pwuq3L6DQ/anJdafH4DXgbMo/15F/EMZythvrC0P+iP
	 8/LV4pSJ1+u8Q==
Date: Tue, 13 Aug 2024 11:48:13 -0600
From: Rob Herring <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
Message-ID: <20240813174813.GA1402173-robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-9-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-9-ivo.ivanov.ivanov1@gmail.com>

On Wed, Aug 07, 2024 at 12:08:56PM +0300, Ivaylo Ivanov wrote:
> Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
> S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
> 15 Plus (m1891). Add minimal support for that SoC, including:
> 
> - All 8 cores via PSCI
> - ChipID
> - Generic ARMV8 Timer
> - Enumarate all pinctrl nodes
> 
> Further platform support will be added over time.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>  2 files changed, 1631 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
> new file mode 100644
> index 000000000..1dcb61e2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
> @@ -0,0 +1,1378 @@
> +// SPDX-License-Identifier: BSD-3-Clause

Every other Exynos dts file is GPL2. This should match or do dual 
licensing which is preferred.

> +/*
> + * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +	gpa0: gpa0 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa1: gpa1 {

gpio-1

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	gpa2: gpa2 {

gpio-2

> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa3: gpa3 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa4: gpa4 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	bt_hostwake: bt-hostwake {

Name pinctrl nodes with some pattern to distinguish what they are. 
'-pins$' is a common pattern. Looking at the binding patch, you may need 
to split it out since we were probably stuck with no pattern on existing 
chips.

> +		samsung,pins = "gpa2-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
> +		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +	};

