Return-Path: <linux-gpio+bounces-11899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 554939ADC03
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05600282B4A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D4F18991B;
	Thu, 24 Oct 2024 06:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCbY/itl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732517DFE4;
	Thu, 24 Oct 2024 06:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750839; cv=none; b=EjExreW0OLY+Bzp6b77fQTIfigqSeJ36q/hQWCzD1lntaCREvepsWcMPYZFjzGH9Tqzjs/XpbORw4KlTfaVtyd7Nd4RW9Go6rBkii6hJaHSoIWvauOAcs8KrD0cAlBzyEHy1qleS0UfQ26hGQZv5g/qkBqzsmdoz3yLsete7VBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750839; c=relaxed/simple;
	bh=F6MJJnnDk0jnO26BG9wROdqp419N4B38VCFEsR5eJe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rc68D7cRG3EkeeEwjbLE3UXy4xsrkf18PwsNWBFaAKb+3cfBUm4g8VU8KoXClqAPNNtPsYhvFsmO6XPjV3NVbo/cIyBpzX4xI169a7LMVX5S8Tcux0r089AdnAIrDfIstR9UcWxSYFgF9NyySaryigvdqqlBs0LlfOkdMACS6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCbY/itl; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a16b310f5so69029666b.0;
        Wed, 23 Oct 2024 23:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729750836; x=1730355636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHiB1nsK1qpZhm/FdPl8dF5UIwuidEAxiYymrmn4Sd0=;
        b=OCbY/itl1m7epQHD0VDi+iBA4SugXfquNBpi5AIyzaDE/6NZz4cBlyB5p6fu7bUSd/
         7/HRDtvLs0+Voh78qAyQor5gFeS73B+Ul05EXaTNlo4Tt40RkZhmP+Bkn8xO4i4tM1vz
         YkakuVkJTrwNswc7hR8MqcIIEy4ajLabd2vk4M01KQQebHOPp+tnkXX0Qmg3ASC+5Rxm
         0V+4PShiYrfNAbEwfxLiW1MuIe7FGlQbqd2Hf8XdT2ZPU5MFenG6DUWfCxX0LPm/CoqJ
         /y3HHkmM/YU7jCeqI1HjY6UjNLkcab7qr2YwmKoATnCEPwD6ZkmhPGPijMpfD1fLxDEa
         l9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750836; x=1730355636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHiB1nsK1qpZhm/FdPl8dF5UIwuidEAxiYymrmn4Sd0=;
        b=OzLbi0RO2b6kFViz6QOLEPGpi2bC/0NHn7IyNuJFXymLXe57wjC8njK3S62E9BClSK
         yxEXGiRrA7DlDM5IUWn/SoVcL9goidndbFcGUQ9LjTiKGBPoEZjWBFnQviqAL1dyiPC/
         F5/E6q/IkmCL+SP0pQgGckx4X92/mnd9cUM+CiwLRa4Q2fO69mftzeZd0BrsSYqK8/NR
         hTJVqGsbyHKAYCotdCt4w185wr9ELdukdRleUcjiot4NjClz5jBAaH66967Ef2OnLXjW
         4FRJW0WM6xZvNglLnve+6u8BCKxvMpkSgPs20Wdua2pqYikeYTIBOc4FpohUZPlD3fzI
         5DMg==
X-Forwarded-Encrypted: i=1; AJvYcCV5+A2Rrghxn6YUaASYXfANFfeAJZqstqcR3UpLgvnGF8ixSOjzVHINkEJl2rnYSTWwB8H9wt2mytae2iKBdkTARe0=@vger.kernel.org, AJvYcCVHtxwGTTpm5rwjgfRIwkPmWkQlc0bE8psuNIy+60v9qB8160SRIejgVP/mLsHsv14cYpN7mQRlghzS7T8q@vger.kernel.org, AJvYcCWmAlRZiSgI3b448FhbmfvPz7JiIQZjA92mx+jZAug91yiR/U02DAEgjsWhZcfPwWbvX97QGk9OumPP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy40w8vJ3jbzQCLmQt3OjsTZcZ08Lw1Y4MvPe5dEq3NgSaw+al
	eqRmwDxCSCE5G0/XhbbmcZabarfa4xSyjqx0zxbxTPHImCDO/O4a
X-Google-Smtp-Source: AGHT+IE2ZpY7TmUgBuR96ZhsvqeyEqfMsfdiuqhfVmq7J7r5uGb4JyadGqwO6kl6EYjCqQuB82Uu0A==
X-Received: by 2002:a17:906:7309:b0:a99:dde6:9f42 with SMTP id a640c23a62f3a-a9abf96ce04mr509757366b.47.1729750835227;
        Wed, 23 Oct 2024 23:20:35 -0700 (PDT)
Received: from [192.168.35.18] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91559dfcsm564188966b.132.2024.10.23.23.20.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 23:20:34 -0700 (PDT)
Message-ID: <596cc7e3-ecba-40f4-a3c1-321c31c0240f@gmail.com>
Date: Thu, 24 Oct 2024 09:20:32 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add initial support for Samsung
 Galaxy S9 (SM-G960F)
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
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
 <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-12-ed14d0d60d08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/24/24 01:36, Markuss Broks wrote:
> Samsung Galaxy S9 (SM-G960F), codenamed starlte, is a mobile phone
> released in 2017. It has 4GB of RAM, 64GB of UFS storage, Exynos9810
> SoC and 1440x2960 Super AMOLED display.
>
> This initial device tree enables the framebuffer pre-initialised
> by bootloader and physical buttons of the device, with more support
> to come in the future.
>
> Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/Makefile               |   1 +
>  arch/arm64/boot/dts/exynos/exynos9810-starlte.dts | 119 ++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
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
> index 0000000000000000000000000000000000000000..f3a1910402b8d686dd7bd156a691ec541e10ad08
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-starlte.dts
> @@ -0,0 +1,119 @@
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
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x3c800000>,
> +		      <0x8 0x80000000 0x80000000>,
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
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&key_voldown &key_volup &key_bixby &key_power>;
Sort alphabetically the same way as the nodes below.
> +		pinctrl-names = "default";
> +
> +		/* In stock firmware used for assistant. Map it as a camera button for now */
> +		bixby-key {
> +			label = "Bixby";
Small nit: isn't it referred to as a "wink" button in downstream? Might be
best to stay consistent with that, like exynos8895-dreamlte.
> +			linux,code = <KEY_CAMERA>;
> +			gpios = <&gpa0 6 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		power-key {
> +			label = "Power";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa2 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		volup-key {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa0 3 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		voldown-key {
> +			label = "Volume Down";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa0 4 GPIO_ACTIVE_LOW>;
> +		};
Sort the nodes alphabetically.
> +	};
> +};
> +
> +&oscclk {
> +	clock-frequency = <26000000>;
> +};
> +
> +&pinctrl_alive {
> +	key_bixby: key-bixby-pins {
> +		samsung,pins = "gpa0-6";
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
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa0-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
> +
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa2-4";
> +		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
> +		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
> +	};
Sort these too.
> +};
>

