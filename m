Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E5E7BA629
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238967AbjJEQ3C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244276AbjJEQ0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:26:53 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FD326A6
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 09:21:57 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9b27bc8b65eso206560066b.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696522916; x=1697127716; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryeiRAJWRcTX5Wsj4grROtdEuKHEqx2ACBXyAOJg74M=;
        b=Ygl3XzA/dZ1j7vTxQjyCfERdmY+5k+qhup2VVZiLCw9EFr3p/4HzrVsMip8cqkOxSS
         QfGbPBxXpuu9dTDihlllNohX6sTfbd8z5UH6uUI2vUON7oExlNbxhor0moGuhWdf5UUU
         pQKZ7ms+wwZfCxi4iVsU9kd2GBBX3Gncz4Pfp+pIQH+eSsvPyUmIl2l92j3LLYQBTII1
         wmyRZDh5XHe7e1Fu/ZXJmcQ0NCNepHjLtwAdBW7NSqEd/XZw7Gubb99JN5kwqhmcoE9p
         xHoj4QIxARoGvDGMb3yHtOssYXBbEH465zsMinlFBmfAnivdwRDT6iHr6Y+AJgA1LsgO
         mAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696522916; x=1697127716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryeiRAJWRcTX5Wsj4grROtdEuKHEqx2ACBXyAOJg74M=;
        b=gKObzhNDjR3QGUQtxvVsg5bvzY4Q+Kz6F8F8cymgXWdYmV2492E56J2TKWCs3kpCVu
         gDzOCtUU8tbsFnHhSRHqkBa5dDtrwjXndUif0I92OTywFC5DxqkD16QrhQmxSi7sq5wh
         0ZkuCxJ3AQlLtW+mL4+UiU3wO+o1jJjObpdX5AYlQx1Xv5AZkLl4QzgHykSUyHNu8Fpz
         ISOMSQjFR5NIbtHwFUOeziuoitjXo/X22YLhzKMhRSu3QmeHkjO8krtX2Ifm80BsG7tL
         fsp85PVtBMDOUOL/VKgypnpR1T69XfONRSDax/tjqXMt+lED4Ui140M+r6tNEkGjYWQz
         0xFw==
X-Gm-Message-State: AOJu0YwKuQejmoXyBzb1P5cDZR6jj5csMTmVrGnDt1Mhjw4lopyK9RDX
        nX7hClc2j5Yu8x8HeoRYtZdB3A==
X-Google-Smtp-Source: AGHT+IF3uib9NG9znNKabhc2jCI8WCi4PU5AA0P9TduEu7uZ+YtY6L2wBL7GIK9WufE2fouM8dJTNw==
X-Received: by 2002:a17:907:7809:b0:9ae:5be8:ff90 with SMTP id la9-20020a170907780900b009ae5be8ff90mr5303281ejc.68.1696522915728;
        Thu, 05 Oct 2023 09:21:55 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id w13-20020a170906480d00b0098d2d219649sm1426542ejq.174.2023.10.05.09.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 09:21:55 -0700 (PDT)
Message-ID: <2ea8f7d6-efbb-4791-b06e-090f8ef5750d@linaro.org>
Date:   Thu, 5 Oct 2023 18:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Content-Language: en-US
To:     Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
        s.nawrocki@samsung.com, linus.walleij@linaro.org,
        wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, cw00.choi@samsung.com
Cc:     tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231005155618.700312-19-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2023 17:56, Peter Griffin wrote:
> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> phones. It features:
> * 4xA55 little cluster
> * 2xA76 Mid cluster
> * 2xX1 Big cluster
> 
> This commit adds the basic device tree for gs101 (SoC) and oriole
> (pixel 6). Further platform support will be added over time.
> 
> It has been tested with a minimal busybox initramfs and boots to
> a shell.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms                  |    6 +
>  arch/arm64/boot/dts/Makefile                  |    1 +
>  arch/arm64/boot/dts/google/Makefile           |    6 +
>  arch/arm64/boot/dts/google/gs101-oriole.dts   |   68 +
>  arch/arm64/boot/dts/google/gs101-pinctrl.dtsi | 1134 +++++++++++++++++
>  arch/arm64/boot/dts/google/gs101-pinctrl.h    |   17 +
>  arch/arm64/boot/dts/google/gs101.dtsi         |  501 ++++++++

Please split adding DTSI from adding DTS into two patches.

>  7 files changed, 1733 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/google/gs101-oriole.dts
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/google/gs101-pinctrl.h
>  create mode 100644 arch/arm64/boot/dts/google/gs101.dtsi
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6069120199bb..a5ed1b719488 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -107,6 +107,12 @@ config ARCH_EXYNOS
>  	help
>  	  This enables support for ARMv8 based Samsung Exynos SoC family.
>  
> +config ARCH_GOOGLE_TENSOR
> +	bool "Google Tensor SoC fmaily"
> +	depends on ARCH_EXYNOS
> +	help
> +	  Support for ARMv8 based Google Tensor platforms.
> +
>  config ARCH_SPARX5
>  	bool "Microchip Sparx5 SoC family"
>  	select PINCTRL
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 30dd6347a929..a4ee7b628114 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -13,6 +13,7 @@ subdir-y += broadcom
>  subdir-y += cavium
>  subdir-y += exynos
>  subdir-y += freescale
> +subdir-y += google
>  subdir-y += hisilicon
>  subdir-y += intel
>  subdir-y += lg
> diff --git a/arch/arm64/boot/dts/google/Makefile b/arch/arm64/boot/dts/google/Makefile
> new file mode 100644
> index 000000000000..6d2026a767d4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_GOOGLE_TENSOR) += \
> +	gs101-oriole.dtb \
> +
> +

Too many blank lines

> diff --git a/arch/arm64/boot/dts/google/gs101-oriole.dts b/arch/arm64/boot/dts/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..e531a39a76a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-oriole.dts
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole DVT Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +	model = "Oriole DVT";
> +	compatible = "google,gs101-oriole", "google,gs101";
> +};
> +
> +&pinctrl_1 {
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa7-3";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa8-1";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&pinctrl_0 {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa10-1";
> +		samsung,pin-function = <0xf>;
> +		samsung,pin-pud = <0>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&gpio_keys {

SoC does not have gpio-keys. That's entirely a property of the board.

> +	status = "okay";

Drop

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&key_voldown &key_volup &key_power>;

Blank line

> +	button-vol-down {
> +		label = "KEY_VOLUMEDOWN";
> +		linux,code = <114>;
> +		gpios = <&gpa7 3 0xf>;
> +		wakeup-source;
> +	};

Blank line

> +	button-vol-up {
> +		label = "KEY_VOLUMEUP";
> +		linux,code = <115>;
> +		gpios = <&gpa8 1 0xf>;
> +		wakeup-source;
> +	};

Blank line


> +	button-power {
> +		label = "KEY_POWER";
> +		linux,code = <116>;
> +		gpios = <&gpa10 1 0xf>;
> +		wakeup-source;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/google/gs101-pinctrl.dtsi b/arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
> new file mode 100644
> index 000000000000..24825205ede8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-pinctrl.dtsi
> @@ -0,0 +1,1134 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright 2019-2023 Google LLC
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/gs101.h>
> +#include <arm64/exynos/exynos-pinctrl.h>
> +#include "gs101-pinctrl.h"
> +
> +/ {
> +	/* GPIO_ALIVE */
> +	pinctrl@174d0000 {
> +		gpa0: gpa0-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT0 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT1 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT2 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT3 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT4 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT5 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT6 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT7 ITLH>;
> +		};

Blank line


> +		gpa1: gpa1-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT8 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT9 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT10 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT11 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT12 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT13 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT14 ITLH>;
> +		};
> +		gpa2: gpa2-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT15 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT16 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT17 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT18 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT19 ITLH>;
> +		};
> +		gpa3: gpa3-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT20 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT21 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT22 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT23 ITLH>;
> +		};
> +		gpa4: gpa4-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT24 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT25 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT26 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT27 ITLH>;
> +		};
> +		gpa5: gpa5-gpio-bank  {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT28 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT29 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT30 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT31 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT32 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT33 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT34 ITLH>;
> +		};
> +		gpa9: gpa9-gpio-bank  {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT35 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT36 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT37 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT38 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT39 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT40 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT41 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT42 ITLH>;
> +		};
> +		gpa10: gpa10-gpio-bank  {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT43 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT44 ITLH>;
> +		};
> +
> +		uart15_bus: uart15-bus-pins {
> +		       samsung,pins = "gpa2-3", "gpa2-4";
> +		       samsung,pin-function = <2>;
> +		       samsung,pin-pud = <0>;
> +		};
> +
> +		uart16_bus: uart16-bus-pins {
> +		       samsung,pins = "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
> +		       samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +		       samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;

You should rather create macros for your SoC... unless you are 100% sure
this matches Exynos arm64 pinctrl.


...

> diff --git a/arch/arm64/boot/dts/google/gs101-pinctrl.h b/arch/arm64/boot/dts/google/gs101-pinctrl.h
> new file mode 100644
> index 000000000000..acc77c684f0d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101-pinctrl.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Pinctrl binding constants for GS101
> + *
> + * Copyright (c) 2020-2023 Google, LLC.
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_GS101_H__
> +#define __DT_BINDINGS_PINCTRL_GS101_H__
> +
> +/* GS101 drive strengths */
> +#define GS101_PIN_DRV_2_5_MA		0
> +#define GS101_PIN_DRV_5_MA		1
> +#define GS101_PIN_DRV_7_5_MA		2
> +#define GS101_PIN_DRV_10_MA		3
> +
> +#endif /* __DT_BINDINGS_PINCTRL_GS101_H__ */
> diff --git a/arch/arm64/boot/dts/google/gs101.dtsi b/arch/arm64/boot/dts/google/gs101.dtsi
> new file mode 100644
> index 000000000000..0bd43745f6fa
> --- /dev/null
> +++ b/arch/arm64/boot/dts/google/gs101.dtsi
> @@ -0,0 +1,501 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * GS101 SoC
> + *
> + * Copyright 2019-2023 Google LLC
> + *
> + */
> +
> +#include <dt-bindings/clock/gs101.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/gs101.h>
> +
> +#include "gs101-pinctrl.dtsi"
> +
> +/ {
> +	compatible = "google,gs101";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <1>;
> +
> +	aliases {
> +		pinctrl0 = &pinctrl_0;
> +		pinctrl1 = &pinctrl_1;
> +		pinctrl2 = &pinctrl_2;
> +		pinctrl3 = &pinctrl_3;
> +		pinctrl4 = &pinctrl_4;
> +		pinctrl5 = &pinctrl_5;
> +		pinctrl6 = &pinctrl_6;
> +		pinctrl7 = &pinctrl_7;
> +

Stray blank line

> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};

Blank line

> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +			};

Blank line


> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu6>;
> +				};
> +				core1 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0000>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};

Blank line


> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0100>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0200>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0300>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ANANKE_CPU_SLEEP>;
> +			capacity-dmips-mhz = <250>;
> +			dynamic-power-coefficient = <70>;
> +		};
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0400>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> +			capacity-dmips-mhz = <620>;
> +			dynamic-power-coefficient = <284>;
> +		};
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0500>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&ENYO_CPU_SLEEP>;
> +			capacity-dmips-mhz = <620>;
> +			dynamic-power-coefficient = <284>;
> +		};
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0600>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&HERA_CPU_SLEEP>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <650>;
> +		};
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,armv8";
> +			reg = <0x0 0x0700>;
> +			enable-method = "psci";
> +			cpu-idle-states =  <&HERA_CPU_SLEEP>;
> +			capacity-dmips-mhz = <1024>;
> +			dynamic-power-coefficient = <650>;
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			ANANKE_CPU_SLEEP: cpu-ananke-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <70>;
> +				exit-latency-us = <160>;
> +				min-residency-us = <2000>;
> +				status = "okay";

Drop status. Okay is by default.

> +			};
> +
> +			ENYO_CPU_SLEEP: cpu-enyo-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <150>;
> +				exit-latency-us = <190>;
> +				min-residency-us = <2500>;
> +				status = "okay";


Drop status. Okay is by default.


> +			};
> +
> +			HERA_CPU_SLEEP: cpu-hera-sleep {
> +				idle-state-name = "c2";
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				entry-latency-us = <235>;
> +				exit-latency-us = <220>;
> +				min-residency-us = <3500>;
> +				status = "okay";

Drop status. Okay is by default.


> +			};
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		tpu_fw_reserved: tpu_fw@93000000 {

No underscores in node names. Use hyphens.


> +			reg = <0x0 0x93000000 0x1000000>;
> +			no-map;
> +		};
> +
> +		gsa_reserved_protected: gsa@90200000 {
> +			reg = <0x0 0x90200000 0x400000>;
> +			no-map;
> +		};
> +
> +		aoc_reserve: aoc@94000000 {
> +			reg = <0x0 0x94000000 0x03000000>;
> +			no-map;
> +		};
> +
> +		abl_reserved: abl@f8800000 {
> +			reg = <0x0 0xf8800000 0x02000000>;
> +			no-map;
> +		};
> +
> +		dss_log_reserved: dss_log_reserved@fd3f0000 {
> +			reg = <0 0xfd3f0000 0x0000e000>;
> +			no-map;
> +		};
> +
> +		debug_kinfo_reserved: debug_kinfo_reserved@fd3fe000 {
> +			reg = <0 0xfd3fe000 0x00001000>;
> +			no-map;
> +		};
> +
> +		bldr_log_reserved: bldr_log_reserved@fd800000 {
> +			reg = <0 0xfd800000 0x00100000>;
> +			no-map;
> +		};
> +
> +		bldr_log_hist_reserved: bldr_log_hist_reserved@fd900000 {
> +			reg = <0 0xfd900000 0x00002000>;
> +			no-map;
> +		};
> +	};
> +
> +	/* bootloader requires ect node */
> +	ect {
> +		parameter_address = <0x90000000>;
> +		parameter_size = <0x53000>;
> +	};
> +
> +	chosen {

Please order the nodes by name.

> +		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 clk_ignore_unused";

None of these bootargs are suitable for wide, mainline use. Please drop.

> +	};
> +
> +	gic: interrupt-controller@10400000 {

This cannot be outside of SoC.

> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		reg = <0x0 0x10400000 0x10000>,		/* GICD */
> +		      <0x0 0x10440000 0x100000>;	/* GICR * 8 */
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <24576000>;
> +	};
> +
> +	ext_24_5m: ext_24_5m {


clock-1

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +		clock-output-names = "oscclk";
> +	};
> +
> +	ext_200m: ext_200m {

clock-2

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +		clock-output-names = "ext-200m";
> +	};
> +
> +	/* GPIO_ALIVE */
> +	pinctrl_0: pinctrl@174d0000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x174d0000 0x00001000>;

0x0

Please open Tesla FSD or Exynos850 for examples.

Also, this cannot be outside of SoC. There is no way this passes
dtbs_check W=1.

Nodes in MMIO-bus should be ordered by unit address.


> +		interrupts = <GIC_SPI IRQ_ALIVE_EINT0 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT1 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT2 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT3 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT4 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT5 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT6 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT7 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT8 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT9 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT10 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT11 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT12 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT13 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT14 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT15 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT16 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT17 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT18 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT19 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT20 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT21 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT22 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT23 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT27 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT28 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT29 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT30 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT31 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT32 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT33 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT34 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT35 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT36 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT37 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT38 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT39 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT40 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT41 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT42 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT43 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT44 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		wakeup-interrupt-controller {
> +			compatible = "google,gs101-wakeup-eint";
> +		};
> +	};
> +
> +	/* GPIO_FAR_ALIVE */
> +	pinctrl_1: pinctrl@174e0000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x174e0000 0x00001000>;
> +		interrupts = <GIC_SPI IRQ_ALIVE_EINT45 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT46 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT47 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT48 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT49 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT50 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT51 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT52 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT53 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT54 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT55 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT56 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT57 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT58 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT59 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT60 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT61 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT62 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT63 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT64 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT65 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI IRQ_ALIVE_EINT66 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		wakeup-interrupt-controller {
> +			compatible = "google,gs101-wakeup-eint";
> +		};
> +	};
> +
> +	/* GPIO_GSACORE */
> +	pinctrl_2: pinctrl@17a80000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x17a80000 0x00001000>;
> +	};
> +	/* GPIO_GSACTRL */
> +	pinctrl_3: pinctrl@17940000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x17940000 0x00001000>;
> +	};
> +	/* GPIO_PERIC0 */
> +	pinctrl_4: pinctrl@10840000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x10840000 0x00001000>;
> +		interrupts = <GIC_SPI IRQ_GPIO_PERIC0_PERIC0 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +	/* GPIO_PERIC1 */
> +	pinctrl_5: pinctrl@10c40000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x10C40000 0x00001000>;
> +		interrupts = <GIC_SPI IRQ_GPIO_PERIC1_PERIC1 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +	/* GPIO_HSI1 */
> +	pinctrl_6: pinctrl@11840000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x11840000 0x00001000>;
> +		interrupts = <GIC_SPI IRQ_GPIO_HSI1_HSI1 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +	/* GPIO_HSI2 */
> +	pinctrl_7: pinctrl@14440000 {
> +		compatible = "google,gs101-pinctrl";
> +		reg = <0x00000000 0x14440000 0x00001000>;
> +		interrupts = <GIC_SPI IRQ_GPIO_HSI2_HSI2 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	sysreg_apm: syscon@174204e0 {
> +		compatible = "google,gs101-apm-sysreg",
> +			     "google,gs101-sysreg", "syscon";
> +		reg = <0x0 0x174204e0 0x1000>;
> +	};
> +
> +	sysreg_peric0: syscon@10821000 {
> +		compatible = "google,gs101-peric0-sysreg",
> +			     "google,gs101-sysreg", "syscon";
> +		reg = <0x0 0x10821000 0x40000>;
> +	};
> +
> +	sysreg_peric1: syscon@10c21000 {
> +		compatible = "google,gs101-peric1-sysreg",
> +			     "google,gs101-sysreg", "syscon";
> +		reg = <0x0 0x10C21000 0x40000>;
> +	};
> +
> +	/* TODO replace with CCF clock */
> +	dummy_clk: oscillator {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency  = <12345>;

One space before =

> +		clock-output-names = "pclk";
> +	};
> +
> +	serial_0: serial@10a00000 {
> +		compatible = "samsung,exynos850-uart";

You need also specific compatible for GS. Fallback can stay.

> +		reg = <0x0 0x10a00000 0xc0>;
> +		reg-io-width = <4>;
> +		samsung,uart-fifosize = <256>;
> +		interrupts = <GIC_SPI IRQ_USI0_UART_PERIC0 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&dummy_clk 0>, <&dummy_clk 0>;
> +		clock-names = "uart", "clk_uart_baud0";
> +		status = "okay";

Drop, it's default.

> +	};
> +
> +	pmu_system_controller: system-controller@17460000 {
> +		compatible = "google,gs101-pmu", "syscon";
> +		reg = <0x0 0x17460000 0x10000>;
> +	};
> +
> +	watchdog_cl0: watchdog@10060000 {
> +		compatible = "google,gs101-wdt";
> +		reg = <0x0 0x10060000 0x100>;
> +		interrupts = <GIC_SPI IRQ_WDT_CLUSTER0_MISC IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0>, <&ext_24_5m>;
> +		clock-names = "watchdog", "watchdog_src";
> +		timeout-sec = <30>;

This is rather property of the board.

> +		samsung,syscon-phandle = <&pmu_system_controller>;
> +		samsung,cluster-index = <0>;
> +	};
> +
> +	watchdog_cl1: watchdog@10070000 {
> +		compatible = "google,gs101-wdt";
> +		reg = <0x0 0x10070000 0x100>;
> +		interrupts = <GIC_SPI IRQ_WDT_CLUSTER1_MISC IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER1>, <&ext_24_5m>;
> +		clock-names = "watchdog", "watchdog_src";
> +		timeout-sec = <30>;
> +		samsung,syscon-phandle = <&pmu_system_controller>;
> +		samsung,cluster-index = <1>;
> +		status = "disabled";
> +	};
> +
> +	cmu_top: clock-controller@1e080000 {
> +		compatible = "google,gs101-cmu-top";
> +		reg = <0x0 0x1e080000 0x8000>;
> +		#clock-cells = <1>;
> +
> +		clocks = <&ext_24_5m>;
> +		clock-names = "oscclk";
> +	};
> +
> +	cmu_apm: clock-controller@17400000 {
> +		compatible = "google,gs101-cmu-apm";
> +		reg = <0x0 0x17400000 0x8000>;
> +		#clock-cells = <1>;
> +
> +		clocks = <&ext_24_5m>;
> +		clock-names = "oscclk";
> +	};
> +
> +	cmu_misc: clock-controller@10010000 {
> +		compatible = "google,gs101-cmu-misc";
> +		reg = <0x0 0x10010000 0x8000>;
> +		#clock-cells = <1>;
> +
> +		clocks =  <&ext_24_5m>, <&cmu_top CLK_DOUT_MISC_BUS>;
> +		clock-names = "oscclk", "dout_cmu_misc_bus";
> +	};
> +
> +	dsu-pmu-0 {
> +		compatible = "arm,dsu-pmu";
> +		interrupts = <GIC_SPI IRQ_CPUCL0_CLUSTERPMUIRQ_CPUCL0 IRQ_TYPE_LEVEL_HIGH>;
> +		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>, <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +	};
> +
> +	gpio_keys: gpio_keys {
> +		compatible = "gpio-keys";

That's not a property of the SoC.

> +	};
> +

Stray blank line.

> +};

Best regards,
Krzysztof

