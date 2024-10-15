Return-Path: <linux-gpio+bounces-11334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3799DF09
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 09:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF921B21657
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 07:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E4E18A6DB;
	Tue, 15 Oct 2024 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpi73S7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120F137930;
	Tue, 15 Oct 2024 07:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728975834; cv=none; b=DJqAOdjwoKbxAPWY94GZNnnIQfNKgfsqdPJOJLohnguyfW2SevSs4JgDZng8AWG+yjOfdyAoMLX9YL0hY/dTHwyU2mltAKYXyE+ZfSmgIOF03EDscCNEXkbZgPdyczwOV4nPcu36kUEGLXfMfuICWPiiXbQs59sB7OcqjrJddIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728975834; c=relaxed/simple;
	bh=QO4NMjC2wozHcV6ZyuyuXOsL0Tv4CXT07K6LUqAlgDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNicFvwBEauUJ58IIvuoNNpEbngymRyIgHjH/jn7aHKstTkHGkw/O0/piFbX1fAdMUvk1a8KUZdeIcHSKmq4oDnw+oklBHhloPvWAX7AdGD29G44493kIU1XSGF/aYTnYnyaMY9pd0iq3KbkZTWflz3mK3g6aFxyFxKGbJ7++lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpi73S7K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD84C4CEC7;
	Tue, 15 Oct 2024 07:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728975833;
	bh=QO4NMjC2wozHcV6ZyuyuXOsL0Tv4CXT07K6LUqAlgDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kpi73S7Kp/Acv8ERbbtjJJ1bD9gw/Tyr2FESk/h0TKwe/kXgCA/lxkfXl/nx9X+yT
	 sHmQptI5F5+obUAKDNKrHEfOfoyeh9jUI8U6QU6Ni1xbO0WTXl44wQZhw/a9CJVt6l
	 UyXq1HAS6kPWGaG6Eqvz/vk08Pa85H/NpWnwdp4JTEbL99EJ1B3Wo/k7iML35g9R47
	 xa/Fan5n9JHdkK8TA3B73acnmx1vDPcp5pRshBmZi5kmUp/V3I3pKIAE9u2R1czn+V
	 YW4P5dpOFCgNM0JAmx9XYSLwX64j8lHtZ1wbv3El97zXjgXJ1yza/oXC1RmADCfQpx
	 TpDH1BncWXiqQ==
Message-ID: <a83f7c01-2375-4fe5-a74c-fe7b644fd949@kernel.org>
Date: Tue, 15 Oct 2024 09:03:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/7] arm64: boot: dts: Add initial support for Samsung
 Galaxy Note20 5G (c1s)
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, david@mainlining.org
References: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
 <20241015062746.713245-8-igor.belwon@mentallysanemainliners.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241015062746.713245-8-igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/2024 08:27, Igor Belwon wrote:
> Add initial support for the Samsung Galaxy Note20 5G (c1s/SM-N981B)
> phone. It was launched in 2020, and it's based on the Exynos 990 SoC. It
> has only one configuration with 8GB of RAM, albeit storage options may
> differ.
> 
> This device tree adds support for the following:
> 
> - SimpleFB
> - 8GB RAM
> - Buttons
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/Makefile          |   1 +
>  arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 111 +++++++++++++++++++

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

>  2 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/exynos990-c1s.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 18f5a3eed523..7a934499b235 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
> +	exynos990-c1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
> new file mode 100644
> index 000000000000..7bff098d7982
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy Note20 5G (c1s/SM-N981B) device tree source
> + *
> + * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
> + */
> +
> +/dts-v1/;
> +#include "exynos990.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	model = "Samsung Galaxy Note20";
> +	compatible = "samsung,c1s", "samsung,exynos990";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@f1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0xf1000000 (1080 * 2400 * 4)>;
> +			width = <1080>;
> +			height = <2400>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	memory@80001000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3ab00000>,
> +		      /* Memory hole */
> +		      <0x0 0xc1200000 0x1ed80000>,
> +		      /* Memory hole */
> +		      <0x0 0xe1900000 0x1a8e9800>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		cont_splash_mem: framebuffer@f1000000 {
> +			reg = <0 0xf1000000 0x13c6800>;
> +			no-map;
> +		};
> +
> +		abox_reserved: audio@f7fb0000 {
> +			reg = <0 0xf7fb0000 0x2a50000>;
> +			no-map;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +

Stray blank line

> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +


Best regards,
Krzysztof


