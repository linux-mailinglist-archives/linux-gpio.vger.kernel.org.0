Return-Path: <linux-gpio+bounces-12088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F629B01DF
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55C81F22CC8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DEF2022E9;
	Fri, 25 Oct 2024 12:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ya7iZDTm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33D18BC1C;
	Fri, 25 Oct 2024 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729857918; cv=none; b=lqtoZRVdCzb/IlepTmjaJ8ASDjA2Puv8JoowX+ef9/X59wpwQkgvGpJGZ+EkwX9qaMDhP135jqYD0Hd2Xh3wtHx6kwlus1lzaPfmURO9M5qbhE6l/69bY3aIFG7gBEi38Laknm6jCAiu2COZq1pGh6Pk0Zlj6B89x+ohBAEUSlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729857918; c=relaxed/simple;
	bh=lHAYnjjJvKtBWzjgUPBA3lwa81rtXcr5PXvNNgnAe24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ey2ZMktNBANTBzF4XgZUjMTNgDwC+usixdl837ivVW3ifAAM2SpsAVYbFapbEfkp5ss4Km06p9F3W5u93ujZ2lRxSFGfhmIdRRy9pik3o1RozxnXLExWygXiBqcQfLd2M8n+WbEgLOVpiVF5sP2Zck25pEe4VLrZ6e5KN67mNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ya7iZDTm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86e9db75b9so265085666b.1;
        Fri, 25 Oct 2024 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729857914; x=1730462714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n55Op3UqcWWU67N4sB49bAMgh41vNphv9As8fpaG8HY=;
        b=Ya7iZDTm8tWqy0WtEGr0CU4MCIF6FmpElzocqARBxszk+qQ+bqmnF645fgvEWrpB+t
         m34A9RQErZiVfi6qnmAvUSL+PYRlfnaqYxRXxvePI4xc03H3pn6IBNbbujuhUJ6a9UOT
         p/fLr0SOLsMGVHPuG94WYDcYBU17zd3ngJakNdzZIZXSf4hfgZ59ELoJi5GLk3ZlHkL+
         IOIfSZNVvf+JvRwhZ9UtpasV/GMb6S7/Ch/NlzEYshvcBmfe2/6gjcpysfJkcWSA13jR
         AH4r4OTyrqYZcoW+Nxxoytipa4H611/SkpnHXMlJ6R4HQ8UXH9Wj5FWYS/ak07Fdueoa
         TGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729857914; x=1730462714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n55Op3UqcWWU67N4sB49bAMgh41vNphv9As8fpaG8HY=;
        b=SOOQXQx+FuBO9fwsEjLoTHQSvFF3WLZ+vqAp9ohRl+Oik7sNyo38tkeB3loI/cTFK/
         engS/Em+uB8Xkrhq8pG7nFsVTBlV/55PW9bj12GLrc9wuklzLIHAnor+hvSg6fffsxsB
         dNGaR+rMsoes+BM7U7r1kh+/UZgZS88LFD4VRFhOCrrZUmr4lE256yqjNoBJbYQUxsBx
         pfUBxL3JfUeezA9djY7Swo5scIdn+L7/tyFnJe2r6lBeqzNLfEqcabkgaNZ0BleLOjgG
         mx6gn3RFzR2uzbMJR7Eq4efTjAXS56fyywksS/xK646rSiaAdoPiv9sLzFT9/YQzDMLA
         ABNA==
X-Forwarded-Encrypted: i=1; AJvYcCVUoba+MLMLfXL+rGRoLJfDsRg8HaJIIuPPjduXds049ajMl6oufzEkyuYavcmVjKSv8koxrgSg65nAUokB@vger.kernel.org, AJvYcCVvqezQLfoZB+DHkl3vULVS1Hrcq6mIVpiPsdYiWlnLmp2Utxmryt6D4l+i7/L6sJb0E/K+Tb+TWhPM@vger.kernel.org, AJvYcCX8vTMJLFqMSOry1dTE2TURq8eIHSEmGRBnfFgy1ozlHorvANUnK2s55be9DTQui+Yf4yUY5iJLZ7V3stAWggUzYA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCrLsnhkO20ezCKGLCD7SArcQHpVu6hdQhEqf3z9xbhjZxvpXT
	kS+xBeL7kE6jHItPfAvkiY3LqtsneG5n0PNviZaDqtvmEC/wUYiU
X-Google-Smtp-Source: AGHT+IEgxndYncmXIKU0ddfgTEva136EAcXhqGZWyYOw+Fz1SxoHJQFDKEucO2k00JnM5YuW4D7XDg==
X-Received: by 2002:a17:907:3dac:b0:a99:ce2f:b0ff with SMTP id a640c23a62f3a-a9abf8a4f1dmr912091766b.33.1729857913759;
        Fri, 25 Oct 2024 05:05:13 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30d6fdd1sm64153366b.170.2024.10.25.05.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 05:05:13 -0700 (PDT)
Message-ID: <77e2f191-3a40-4282-ac1e-d1a9069043d4@gmail.com>
Date: Fri, 25 Oct 2024 15:05:11 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S9 (SM-G960F)
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241025-exynos9810-v2-0-99ca3f316e21@gmail.com>
 <20241025-exynos9810-v2-12-99ca3f316e21@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241025-exynos9810-v2-12-99ca3f316e21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 10/25/24 14:24, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
>
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
>
> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile               |   1 +
>  arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 120 ++++++++++++++++++++++
>  2 files changed, 121 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 7a934499b235892eef38cd926905e02f0ce08278..6760b3d59e819fb52bc8cf4dc6877a0b9db9ce47 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos7885-jackpotlte.dtb	\
>  	exynos850-e850-96.dtb		\
>  	exynos8895-dreamlte.dtb		\
> +	exynos9810-starlte.dtb		\
>  	exynos990-c1s.dtb		\
>  	exynosautov9-sadk.dtb		\
>  	exynosautov920-sadk.dtb
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..7e01118e591284267f155883c236ed811d5c629a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung Galaxy S9 (starlte/SM-G960F) device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +/dts-v1/;
> +#include "exynos9810.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Samsung Galaxy S9 (SM-G960F)";
> +	compatible = "samsung,starlte", "samsung,exynos9810";
> +	chassis-type = "handset";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			width = <1440>;
> +			height = <2960>;
> +			stride = <(1440 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_power &key_voldown &key_volup &key_wink>;
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
> +		/* In stock firmware used for assistant. Map it as a camera button for now */
> +		wink-key {
> +			label = "Camera";
> +			linux,code = <KEY_CAMERA>;
> +			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3c800000>,
> +		      <0x8 0x80000000 0x80000000>,

Sort these.

> +		      <0x0 0xc0000000 0x20000000>,
> +		      <0x0 0xe1900000 0x1e700000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		framebuffer@cc000000 {
> +			reg = <0x0 0xcc000000 (1440 * 2960 * 4)>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa0-3";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +

Drop empty \n.
Otherwise looks OK to me.

Best regards, Ivo

> +
> +	key_wink: key-wink-pins {
> +		samsung,pins = "gpa0-6";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +};
>


