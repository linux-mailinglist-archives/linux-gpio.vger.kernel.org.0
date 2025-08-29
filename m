Return-Path: <linux-gpio+bounces-25182-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B97B3B524
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 10:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACDB87BC010
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 07:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5460028C00C;
	Fri, 29 Aug 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThUpyuCE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A12857CB;
	Fri, 29 Aug 2025 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454170; cv=none; b=AYy9rFT6FwA+DSGDNpxzhtkTyexNz6Ye/MTuFXA7SZ9KRGuAS80Ob3AXCdJ0WDBRNMjGFkS+dh1lXtqbkNrFjfm+ZmyJnhu9rbbL6PR72bQ+GHuTCNXA91f37AiySPFTabbdqMwXXwmXM83L9acgc7KPJWl+I0az6XRmQxdQmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454170; c=relaxed/simple;
	bh=gEVY2TEOLXWuc/PylIHeYa0ayOzElTCYmrn2BP+q/ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPnnwgkBHgPfoaAf24C5C2OcBp8ylnMLSv6wANo0mBtUMCHMDITHUnZjlqZwiqA69yM+56U6439vLcyEDHkE5Z8rKLsGap08lCA4kt+ig23fqszudhD9flifUb5ySgV+SASPfJ7nuAeANGKLaxDfu4zChR8MIyuieD9m6G01ILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThUpyuCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA52BC4CEF0;
	Fri, 29 Aug 2025 07:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454169;
	bh=gEVY2TEOLXWuc/PylIHeYa0ayOzElTCYmrn2BP+q/ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThUpyuCEt+rHjGchX/jdas1nJIAeIqJ6AnMYOF9cySZOYAnrJZYC/QcNcxw2bHsMR
	 f1bS5mUqF9syMOLObU9aoV97mJjLf4lbHaYNHo2UrzxWImgkd3rV7YWUeRrqiu5ujd
	 zdBpWZrXThODYKC6Yay5tyTon+RB67NHLqQYKCalVyKw98bTZgRb927gWS14SJwVS+
	 v+iAlJSdNA69eV935f/yCfNPpnUtlbxGk7DaTpnRylJJJwdhvVh3EJOOo2IRZXw7Va
	 UCO8AhPWZTjqDZXc2LWD7ROB8k2Gtf9BrFLnJNtLT9l+JJEt8BTHB1UXGdssEAkXzj
	 mRAxskbk1f3YA==
Date: Fri, 29 Aug 2025 09:56:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, linus.walleij@linaro.org, 
	tomasz.figa@gmail.com, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com, 
	hgkim05@coasia.com, mingyoungbo@coasia.com, smn1196@coasia.com, 
	pankaj.dubey@samsung.com, shradha.t@samsung.com, inbaraj.e@samsung.com, 
	swathi.ks@samsung.com, hrishikesh.d@samsung.com, dj76.yang@samsung.com, 
	hypmean.kim@samsung.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8
 SoC support
Message-ID: <20250829-attentive-watchful-guan-b79ccc@kuoka>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342@epcas5p3.samsung.com>
 <20250825114436.46882-9-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825114436.46882-9-ravi.patel@samsung.com>

On Mon, Aug 25, 2025 at 05:14:34PM +0530, Ravi Patel wrote:
>  config ARCH_AXIADO
>  	bool "Axiado SoC Family"
>  	select GPIOLIB
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index bdb9e9813e50..bcca63136557 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += axis
>  subdir-y += google
>  
>  dtb-$(CONFIG_ARCH_EXYNOS) += \
> diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> new file mode 100644
> index 000000000000..70bd1dcac85e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Does not match rest of licenses.

> +/*
> + * Axis ARTPEC-8 SoC device tree pinctrl constants
> + *
> + * Copyright (c) 2025 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + * Copyright (c) 2025  Axis Communications AB.
> + *             https://www.axis.com
> + */
> +
> +#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> +#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
> +
> +#define ARTPEC_PIN_PULL_NONE		0
> +#define ARTPEC_PIN_PULL_DOWN		1
> +#define ARTPEC_PIN_PULL_UP		3
> +
> +#define ARTPEC_PIN_FUNC_INPUT		0
> +#define ARTPEC_PIN_FUNC_OUTPUT		1
> +#define ARTPEC_PIN_FUNC_2		2
> +#define ARTPEC_PIN_FUNC_3		3
> +#define ARTPEC_PIN_FUNC_4		4
> +#define ARTPEC_PIN_FUNC_5		5
> +#define ARTPEC_PIN_FUNC_6		6
> +#define ARTPEC_PIN_FUNC_EINT		0xf
> +#define ARTPEC_PIN_FUNC_F		ARTPEC_PIN_FUNC_EINT
> +
> +/* Drive strength for ARTPEC */
> +#define ARTPEC_PIN_DRV_SR1		0x8
> +#define ARTPEC_PIN_DRV_SR2		0x9
> +#define ARTPEC_PIN_DRV_SR3		0xa
> +#define ARTPEC_PIN_DRV_SR4		0xb
> +#define ARTPEC_PIN_DRV_SR5		0xc
> +#define ARTPEC_PIN_DRV_SR6		0xd
> +
> +#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
> diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> new file mode 100644
> index 000000000000..8d239a70f1b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

This is Dual license, so why pincltr header is not?

Best regards,
Krzysztof


