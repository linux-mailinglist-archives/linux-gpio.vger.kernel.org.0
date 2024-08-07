Return-Path: <linux-gpio+bounces-8648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CB494A448
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EBA1B2B41D
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543171D0DE3;
	Wed,  7 Aug 2024 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwLcwoDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0484A1D0DC6;
	Wed,  7 Aug 2024 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022532; cv=none; b=m0OfPrlleie2Fk/Tp3CxN1lJULxz8I8VP5q7QaEcQUHk0AZLgn+JKEBYAhwm6P6tiMKKM/bSh+iTd0qNFHOxengXjyIRKK04lGVfQFWOFCq+xV7ao3NEPssgGLGABeRU7aMYE3KjdVvNc1yzroQteN2wS8Inm3RYGc9L8zitMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022532; c=relaxed/simple;
	bh=bNN/+Wa5dpTIeQWMlsY+iSX7qUchaJdnQ6/ELRuwrYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/QwpzycP55sNLSqTKmyQiTdZdyURCRlZPqGfpMT4e6hQzNfwRBLr5wK4VIavkEwjBXRHoMxq81I9iGm5/R2XI9JfCeBWh4jiNCnW4a2LsHxE9jipzYtsNt+kdKaE/USSGwqkLh7IK+ZTUorMWZattvfqpj09OQbRQbYssgUy9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwLcwoDt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8086DC4AF09;
	Wed,  7 Aug 2024 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723022531;
	bh=bNN/+Wa5dpTIeQWMlsY+iSX7qUchaJdnQ6/ELRuwrYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZwLcwoDt1o6T5ieacPvJ8zadfQAqfw0I1qz9U/+QQ6mEEZrKBTJLLpUPlvRGrW39i
	 jr8uvliLMCqhJ8THd7rkcD5pcS5F9HaAK/d2m6LQ1ApKad4SSrESLFnhQyQcRxsfEP
	 emWjR8qJjrcjH341qhSVYWGVlvh9xNJjbWGv5hJgAOmKqiYkAlukR2ihlEIxftwn6R
	 KPPJQTbwpV10eKsWDSBjrIl6SnpQXcH7iQH3t8wTyM0zjk5LAvY0gZvijmc7nhAG8F
	 MAncdk79UuH2UpIHqUoKvOtyjtPv6HM/Pcp8MZQQ6rQdbatH7+o2C0MRwH8PC0VAgF
	 26JnYjTHyOWiw==
Message-ID: <250fc005-3a76-4168-b7d7-b450c5b47e9e@kernel.org>
Date: Wed, 7 Aug 2024 11:22:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S8
To: ivo.ivanov.ivanov1@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807082843.352937-11-ivo.ivanov.ivanov1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240807082843.352937-11-ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> 
> Samsung Galaxy S8 (SM-G950F), codenamed dreamlte, is a mobile phone
> from 2017. It features 4GB RAM, 64GB UFS 2.1, Exynos 8895 SoC and a
> 1440x2960 Super AMOLED display.
> 
> This initial device tree enables SimpleFB, PSTORE and GPIO keys.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
>  .../boot/dts/exynos/exynos8895-dreamlte.dts   | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index d7f2191c2..18f5a3eed 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -7,5 +7,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7-espresso.dtb		\
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
> +	exynos8895-dreamlte.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> new file mode 100644
> index 000000000..5c8351b99
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Samsung Galaxy S8 (dreamlte/SM-G950F) device tree source
> + *
> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + */
> +
> +/dts-v1/;
> +#include "exynos8895.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Samsung Galaxy S8 (SM-G950F)";
> +	compatible = "samsung,dreamlte", "samsung,exynos8895";
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@cc000000 {
> +			status= "okay";

Drop, it was not disabled. Also, please follow DTS coding style
regarding order of properties.

> +			compatible = "simple-framebuffer";
Best regards,
Krzysztof


