Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE9C7BA88B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 19:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjJER7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 13:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbjJER7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 13:59:24 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5137E93
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 10:59:19 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c6193d6bb4so20885ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696528759; x=1697133559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jt1I8fUwgb0+Uzu6956xn2RLmHsgdLP93sEwxqGgGrw=;
        b=zYVo7mgH0jL898ujLUUJWTESGOafHmSv5AJc3oAg4xYWLqMIF8qHn8xecNgO6I1Ugj
         bvqJN5VQ4g7lvi4HF0LWxRL2o3+jUxo8nB7idXTc7pRTEyq8WE2y9pRBe6B9VyUCRtIE
         pJEoevt/qt0MIY5l1jyf3vF1JUGEyEVFNIaFpYo1CNzJOvCSNUhZsECFd1A4i2uOk+Xf
         FCrYMNrH/F/n74HCSWwmOx96rO78r9gYIG3bTd9gVfGXRSu0uSIXVlkFCzH6ucrMcrLD
         z2FRfF+RwUEQchumekTY54T5cyNb6KzYRn5cfemU+lUbjqqMv3ZW16Dot20lEp+WlhMW
         Ct7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696528759; x=1697133559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jt1I8fUwgb0+Uzu6956xn2RLmHsgdLP93sEwxqGgGrw=;
        b=ka2vK9zKgiKC0KJMLu8xNhv6E9/g2H3LnesP9QZcfgyrmybvPbiZnwim/RCo4JvSWg
         n/KXkQOBSYVzCcf5SB3wqAZBjNV4UKGdc5ICeuTK5T8C6q7P1K01Ilwa4c6+0si7j09r
         rzW2QBYm6NniEauHji6z4jlg6cQjHt3SwPc5OZQysCMWmHkR6DdFKIWa9C1U34tKCWTd
         mdAOj5/q86nEu978Pv0ZJqEWnP7tFV2khdgDyKoCdsZ4lfZ40YYAspKdq4JAYxCpUmaT
         tWm/gVnQ3l/lL0lidBCEZabEpWT62JuJT0GSaq8LL32R4HkwRw5zKUAatPwQpBWjy1T/
         iwIA==
X-Gm-Message-State: AOJu0YwZyioMdCj8ewvnxj3dr1fVd+aUOp1FlPzZgqdJ9YSkNWXh2BHE
        EQxyhF5uqz17Y0Qn43zWn4ssTw==
X-Google-Smtp-Source: AGHT+IEsfoMPyQfhZ7gN9pU4kLX3SBH91Whf+l9ARHgqE9mxTZjTQfRhWeXQL8Zauu3Nqri+dlm/rQ==
X-Received: by 2002:a17:903:32c8:b0:1bb:2c7b:6d67 with SMTP id i8-20020a17090332c800b001bb2c7b6d67mr167262plr.11.1696528756714;
        Thu, 05 Oct 2023 10:59:16 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b001bbb25dd3a7sm2022515plg.187.2023.10.05.10.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:59:15 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:59:12 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        gregkh@linuxfoundation.org, kernel-team@google.com
Subject: Re: [PATCH 18/21] arm64: dts: google: Add initial Google gs101 SoC
 support
Message-ID: <ZR75cIvnQS2cqTT3@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-19-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-19-peter.griffin@linaro.org>
X-Spam-Status: No, score=-15.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
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

I'd like to bring up this thread and discuss the option of not introducing
another ARCH_* config:

  https://lore.kernel.org/all/20200306103652.GA3634389@kroah.com/

I especially don't like the "depends on ARCH_EXYNOS" because that forces one to
include all the other Exynos drivers that ARCH_EXYNOS selects that Google
Tensor SoCs don't need. Can we consider using SOC_GOOGLE instead and for all
drivers that actually depend on the SoC hardware, we can just add "depends on
SOC_GOOGLE"?

The idea is that drivers should be tied to hardware -- not a specific vendor.
By making drivers depend on ARCH_*, you are introducing an arbitrary vendor
dependency and not a hardware dependency.

Thanks,
Will

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
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&key_voldown &key_volup &key_power>;
> +	button-vol-down {
> +		label = "KEY_VOLUMEDOWN";
> +		linux,code = <114>;
> +		gpios = <&gpa7 3 0xf>;
> +		wakeup-source;
> +	};
> +	button-vol-up {
> +		label = "KEY_VOLUMEUP";
> +		linux,code = <115>;
> +		gpios = <&gpa8 1 0xf>;
> +		wakeup-source;
> +	};
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
> +		};
> +
> +		uart16_bus_rts: uart1-bus-rts-pins {
> +			samsung,pins = "gpa3-2";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-val = <1>;
> +		};
> +
> +		uart16_bus_tx_dat: uart1-bus-tx-dat-pins {
> +			samsung,pins = "gpa3-1";
> +			samsung,pin-val = <1>;
> +		};
> +
> +		uart16_bus_tx_con: uart1-bus-tx-con-pins {
> +			samsung,pins = "gpa3-1";
> +			samsung,pin-function = <1>;
> +		};
> +
> +		uart17_bus: uart17-bus-pins {
> +		       samsung,pins = "gpa4-0", "gpa4-1", "gpa4-2", "gpa4-3";
> +		       samsung,pin-function = <2>;
> +		       samsung,pin-pud = <0>;
> +		};
> +
> +		spi15_bus: spi15-bus-pins {
> +			samsung,pins = "gpa4-0", "gpa4-1", "gpa4-2";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi15_cs: spi15-cs-pins {
> +			samsung,pins = "gpa4-3";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +	};
> +	/* GPIO_FAR_ALIVE */
> +	pinctrl@174e0000 {
> +		gpa6: gpa6-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT45 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT46 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT47 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT48 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT49 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT50 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT51 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT52 ITLH>;
> +		};
> +		gpa7: gpa7-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT53 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT54 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT55 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT56 ITLH>;
> +		};
> +		gpa8: gpa8-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT57 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT58 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT59 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT60 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT61 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT62 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT63 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT64 ITLH>;
> +		};
> +		gpa11: gpa11-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI IRQ_ALIVE_EINT65 ITLH>,
> +				   <GIC_SPI IRQ_ALIVE_EINT66 ITLH>;
> +		};
> +
> +	};
> +	/* GPIO_GSACORE */
> +	pinctrl@17a80000 {
> +		gps0: gps0-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gps1: gps1-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gps2: gps2-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +	/* GPIO_GSACTRL */
> +	pinctrl@17940000 {
> +		gps3: gps3-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +	/* GPIO_HSI1 */
> +	pinctrl@11840000 {
> +		gph0: gph0-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gph1: gph1-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		pcie0_clkreq: pcie0-clkreq-pins{
> +			samsung,pins = "gph0-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
> +			samsung,pin-con-pdn = <3>;
> +			samsung,pin-pud-pdn = <3>;
> +		};
> +		pcie0_perst: pcie0-perst-pins {
> +			samsung,pins = "gph0-0";
> +			samsung,pin-function = <1>;
> +			samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
> +			samsung,pin-con-pdn = <3>;
> +		};
> +	};
> +	/* GPIO_HSI2 */
> +	pinctrl@14440000 {
> +		gph2: gph2-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gph3: gph3-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gph4: gph4-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		sd2_clk: sd2-clk-pins {
> +			samsung,pins = "gph4-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
> +		};
> +
> +		sd2_cmd: sd2-cmd-pins {
> +			samsung,pins = "gph4-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
> +		};
> +
> +		sd2_bus1: sd2-bus-width1-pins {
> +			samsung,pins = "gph4-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
> +		};
> +
> +		sd2_bus4: sd2-bus-width4-pins {
> +			samsung,pins = "gph4-3", "gph4-4", "gph4-5";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
> +		};
> +
> +		sd2_clk_fast_slew_rate_1x: sd2-clk-fast-slew-rate-1x-pins {
> +			samsung,pins = "gph4-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +
> +		sd2_clk_fast_slew_rate_2x: sd2-clk-fast-slew-rate-2x-pins {
> +			samsung,pins = "gph4-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +
> +		sd2_clk_fast_slew_rate_3x: sd2-clk-fast-slew-rate-3x-pins {
> +			samsung,pins = "gph4-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_7_5_MA>;
> +		};
> +
> +		sd2_clk_fast_slew_rate_4x: sd2-clk-fast-slew-rate-4x-pins {
> +			samsung,pins = "gph4-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
> +		};
> +		ufs_rst_n: ufs-rst-n-pins {
> +			samsung,pins = "gph3-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-con-pdn = <3>;
> +			samsung,pin-pud-pdn = <0>;
> +		};
> +
> +		ufs_refclk_out: ufs-refclk-out-pins {
> +			samsung,pins = "gph3-0";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-con-pdn = <3>;
> +			samsung,pin-pud-pdn = <0>;
> +		};
> +		pcie1_clkreq: pcie1-clkreq-pins {
> +			samsung,pins = "gph2-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
> +			samsung,pin-con-pdn = <3>;
> +			samsung,pin-pud-pdn = <3>;
> +		};
> +		pcie1_perst: pcie1-perst-pins {
> +			samsung,pins = "gph2-0";
> +			samsung,pin-function = <1>;
> +			samsung,pin-drv = <GS101_PIN_DRV_10_MA>;
> +			samsung,pin-con-pdn = <3>;
> +		};
> +	};
> +	/* GPIO_PERIC0 */
> +	pinctrl@10840000 {
> +		gpp0: gpp0-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp1: gpp1-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp2: gpp2-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp3: gpp3-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp4: gpp4-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp5: gpp5-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp6: gpp6-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp7: gpp7-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp8: gpp8-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp9: gpp9-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp10: gpp10-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp11: gpp11-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp12: gpp12-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp13: gpp13-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp14: gpp14-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp15: gpp15-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp16: gpp16-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp17: gpp17-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp18: gpp18-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp19: gpp19-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		/* USI_PERIC0_UART_DBG */
> +		uart0_bus: uart0-bus-pins {
> +			samsung,pins = "gpp1-2", "gpp1-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +
> +		disp_te_pri_on: disp-te-pri-on-pins {
> +			samsung,pins = "gpp0-3";
> +			samsung,pin-function = <0xf>;
> +		};
> +
> +		disp_te_pri_off: disp-te-pri-off-pins {
> +			samsung,pins = "gpp0-3";
> +			samsung,pin-function = <0>;
> +		};
> +
> +		disp_te_sec_on: disp-te-sec-on-pins {
> +			samsung,pins = "gpp0-4";
> +			samsung,pin-function = <0xf>;
> +		};
> +
> +		disp_te_sec_off: disp-te-sec-off-pins {
> +			samsung,pins = "gpp0-4";
> +			samsung,pin-function = <0>;
> +		};
> +
> +		sensor_mclk1_out: sensor-mclk1-out-pins {
> +			samsung,pins = "gpp3-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk1_fn: sensor-mclk1-fn-pins {
> +			samsung,pins = "gpp3-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk2_out: sensor-mclk2-out-pins {
> +			samsung,pins = "gpp5-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk2_fn: sensor-mclk2-fn-pins {
> +			samsung,pins = "gpp5-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk3_out: sensor-mclk3-out-pins {
> +			samsung,pins = "gpp7-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk3_fn: sensor-mclk3-fn-pins {
> +			samsung,pins = "gpp7-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk4_out: sensor-mclk4-out-pins {
> +			samsung,pins = "gpp9-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk4_fn: sensor-mclk4-fn-pins {
> +			samsung,pins = "gpp9-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk5_out: sensor-mclk5-out-pins {
> +			samsung,pins = "gpp11-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk5_fn: sensor-mclk5-fn-pins {
> +			samsung,pins = "gpp11-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk6_out: sensor-mclk6-out-pins {
> +			samsung,pins = "gpp13-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk6_fn: sensor-mclk6-fn-pins {
> +			samsung,pins = "gpp13-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk7_out: sensor-mclk7-out-pins {
> +			samsung,pins = "gpp15-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk7_fn: sensor-mclk7-fn-pins {
> +			samsung,pins = "gpp15-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk8_out: sensor-mclk8-out-pins {
> +			samsung,pins = "gpp17-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		sensor_mclk8_fn: sensor-mclk8-fn-pins {
> +			samsung,pins = "gpp17-0";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_5_MA>;
> +		};
> +		hsi2c14_bus: hsi2c14-bus-pins {
> +			samsung,pins = "gpp18-0", "gpp18-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart14_bus_single: uart14-bus-pins {
> +			samsung,pins = "gpp18-0", "gpp18-1",
> +			   "gpp18-2", "gpp18-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi14_bus: spi14-bus-pins {
> +			samsung,pins = "gpp18-0", "gpp18-1", "gpp18-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi14_cs: spi14-cs-pins {
> +			samsung,pins = "gpp18-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi14_cs_func: spi14-cs-func-pins {
> +			samsung,pins = "gpp18-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c8_bus: hsi2c8-bus-pins {
> +			samsung,pins = "gpp16-0", "gpp16-1";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +			samsung,pin-pud-pdn = <EXYNOS_PIN_PDN_OUT0>;
> +		};
> +		uart8_bus_single: uart8-bus-pins {
> +			samsung,pins = "gpp16-0", "gpp16-1", "gpp16-2",
> +			  "gpp16-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi8_bus: spi8-bus-pins {
> +			samsung,pins = "gpp16-0", "gpp16-1", "gpp16-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi8_cs: spi8-cs-pins {
> +			samsung,pins = "gpp16-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi8_cs_func: spi8-cs-func-pins {
> +			samsung,pins = "gpp16-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c7_bus: hsi2c7-bus-pins {
> +			samsung,pins = "gpp14-0", "gpp14-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart7_bus_single: uart7-bus-pins {
> +			samsung,pins = "gpp14-0", "gpp14-1",
> +			      "gpp14-2", "gpp14-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi7_bus: spi7-bus-pins {
> +			samsung,pins = "gpp14-0", "gpp14-1", "gpp14-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi7_cs: spi7-cs-pins {
> +			samsung,pins = "gpp14-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi7_cs_func: spi7-cs-func-pins {
> +			samsung,pins = "gpp14-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c6_bus: hsi2c6-bus-pins {
> +			samsung,pins = "gpp12-0", "gpp12-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart6_bus_single: uart6-bus-pins {
> +			samsung,pins = "gpp12-0", "gpp12-1",
> +			    "gpp12-2", "gpp12-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi6_bus: spi6-bus-pins {
> +			samsung,pins = "gpp12-0", "gpp12-1", "gpp12-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi6_cs: spi6-cs-pins {
> +			samsung,pins = "gpp12-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi6_cs_func: spi6-cs-func-pins {
> +			samsung,pins = "gpp12-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c5_bus: hsi2c5-bus-pins {
> +			samsung,pins = "gpp10-0", "gpp10-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart5_bus_single: uart5-bus-pins {
> +			samsung,pins = "gpp10-0", "gpp10-1",
> +			    "gpp10-2", "gpp10-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi5_bus: spi5-bus-pins {
> +			samsung,pins = "gpp10-0", "gpp10-1", "gpp10-2";
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		};
> +		spi5_cs_func: spi5-cs-func-pins {
> +			samsung,pins = "gpp10-3";
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
> +			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
> +		};
> +		hsi2c4_bus: hsi2c4-bus-pins {
> +			samsung,pins = "gpp8-0", "gpp8-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart4_bus_single: uart4-bus-pins {
> +			samsung,pins = "gpp8-0", "gpp8-1",
> +			    "gpp8-2", "gpp8-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi4_bus: spi4-bus-pins {
> +			samsung,pins = "gpp8-0", "gpp8-1", "gpp8-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi4_cs: spi4-cs-pins {
> +			samsung,pins = "gpp8-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi4_cs_func: spi4-cs-func-pins {
> +			samsung,pins = "gpp8-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c3_bus: hsi2c3-bus-pins {
> +			samsung,pins = "gpp6-0", "gpp6-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart3_bus_single: uart3-bus-pins {
> +			samsung,pins = "gpp6-0", "gpp6-1",
> +			    "gpp6-2", "gpp6-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi3_bus: spi3-bus-pins {
> +			samsung,pins = "gpp6-0", "gpp6-1", "gpp6-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi3_cs: spi3-cs-pins {
> +			samsung,pins = "gpp6-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi3_cs_func: spi3-cs-func-pins {
> +			samsung,pins = "gpp6-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c2_bus: hsi2c2-bus-pins {
> +			samsung,pins = "gpp4-0", "gpp4-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart2_bus_single: uart2-bus-pins {
> +			samsung,pins = "gpp4-0", "gpp4-1",
> +			    "gpp4-2", "gpp4-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi2_bus: spi2-bus-pins {
> +			samsung,pins = "gpp4-0", "gpp4-1", "gpp4-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi2_cs: spi2-cs-pins {
> +			samsung,pins = "gpp4-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi2_cs_func: spi2-cs-func-pins {
> +			samsung,pins = "gpp4-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c1_bus: hsi2c1-bus-pins {
> +			samsung,pins = "gpp2-0", "gpp2-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart1_bus_single: uart1-bus-pins {
> +			samsung,pins = "gpp2-0", "gpp2-1",
> +			    "gpp2-2", "gpp2-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi1_bus: spi1-bus-pins {
> +			samsung,pins = "gpp2-0", "gpp2-1", "gpp2-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi1_cs: spi1-cs-pins {
> +			samsung,pins = "gpp2-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi1_cs_func: spi1-cs-func-pins {
> +			samsung,pins = "gpp2-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +	};
> +	/* GPIO_PERIC1 */
> +	pinctrl@10c40000 {
> +		gpp20: gpp20-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp21: gpp21-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp22: gpp22-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp23: gpp23-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp24: gpp24-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp25: gpp25-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp26: gpp26-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		gpp27: gpp27-gpio-bank {
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		hsi2c13_bus: hsi2c13-bus-pins  {
> +			samsung,pins = "gpp25-0", "gpp25-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart13_bus_single: uart13-bus-pins {
> +		       samsung,pins = "gpp25-0", "gpp25-1",
> +			   "gpp25-2", "gpp25-3";
> +		       samsung,pin-function = <2>;
> +		       samsung,pin-pud = <0>;
> +		};
> +		spi13_bus: spi13-bus-pins {
> +			samsung,pins = "gpp25-0", "gpp25-1", "gpp25-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi13_cs: spi13-cs-pins {
> +			samsung,pins = "gpp25-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi13_cs_func: spi13-cs-func-pins {
> +			samsung,pins = "gpp25-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c12_bus: hsi2c12-bus-pins {
> +			samsung,pins = "gpp23-4", "gpp23-5";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart12_bus_single: uart12-bus-pins {
> +			samsung,pins = "gpp23-4", "gpp23-5",
> +				   "gpp23-6", "gpp23-7";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi12_bus: spi12-bus-pins {
> +			samsung,pins = "gpp23-4", "gpp23-5", "gpp23-6";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi14_cs2: spi14-cs2-pins {
> +			samsung,pins = "gpp23-6";
> +			samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
> +			samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi12_cs: spi12-cs-pins {
> +			samsung,pins = "gpp23-7";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi12_cs_func: spi12-cs-func-pins {
> +			samsung,pins = "gpp23-7";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c11_bus: hsi2c11-bus-pins {
> +			samsung,pins = "gpp23-0", "gpp23-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart11_bus_single: uart11-bus-pins {
> +			samsung,pins = "gpp23-0", "gpp23-1",
> +			    "gpp23-2", "gpp23-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi11_bus: spi11-bus-pins {
> +			samsung,pins = "gpp23-0", "gpp23-1", "gpp23-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi11_cs: spi11-cs-pins {
> +			samsung,pins = "gpp23-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi11_cs_func: spi11-cs-func-pins {
> +			samsung,pins = "gpp23-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c10_bus: hsi2c10-bus-pins {
> +			samsung,pins = "gpp21-0", "gpp21-1";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart10_bus_single: uart10-bus-pins {
> +			samsung,pins = "gpp21-0", "gpp21-1",
> +			    "gpp21-2", "gpp21-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi10_bus: spi10-bus-pins {
> +			samsung,pins = "gpp21-0", "gpp21-1", "gpp21-2";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi10_cs: spi10-cs-pins {
> +			samsung,pins = "gpp21-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi10_cs_func: spi10-cs-func-pins {
> +			samsung,pins = "gpp21-3";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c9_bus: hsi2c9-bus-pins {
> +			samsung,pins = "gpp20-4", "gpp20-5";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart9_bus_single: uart9-bus-pins {
> +			samsung,pins = "gpp20-4", "gpp20-5",
> +			    "gpp20-6", "gpp20-7";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi9_bus: spi9-bus-pins {
> +			samsung,pins = "gpp20-4", "gpp20-5", "gpp20-6";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi9_cs: spi9-cs-pins {
> +			samsung,pins = "gpp20-7";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi9_cs_func: spi9-cs-func-pins {
> +			samsung,pins = "gpp20-7";
> +			samsung,pin-function = <2>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		hsi2c0_bus: hsi2c0-bus-pins {
> +			samsung,pins = "gpp20-0", "gpp20-1";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		uart0_bus_single: uart0-bus-pins {
> +			samsung,pins = "gpp20-0", "gpp20-1",
> +			    "gpp20-2", "gpp20-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +		};
> +		spi0_bus: spi0-bus-pins {
> +			samsung,pins = "gpp20-0", "gpp20-1", "gpp20-2";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi0_cs: spi0-cs-pins {
> +			samsung,pins = "gpp20-3";
> +			samsung,pin-function = <1>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +		spi0_cs_func: spi0-cs-func-pins {
> +			samsung,pins = "gpp20-3";
> +			samsung,pin-function = <3>;
> +			samsung,pin-pud = <0>;
> +			samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +		};
> +	};
> +};
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
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu4>;
> +				};
> +				core1 {
> +					cpu = <&cpu5>;
> +				};
> +			};
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
> +		bootargs = "earlycon=exynos4210,mmio32,0x10A00000 clk_ignore_unused";
> +	};
> +
> +	gic: interrupt-controller@10400000 {
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
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +		clock-output-names = "oscclk";
> +	};
> +
> +	ext_200m: ext_200m {
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
> +		clock-output-names = "pclk";
> +	};
> +
> +	serial_0: serial@10a00000 {
> +		compatible = "samsung,exynos850-uart";
> +		reg = <0x0 0x10a00000 0xc0>;
> +		reg-io-width = <4>;
> +		samsung,uart-fifosize = <256>;
> +		interrupts = <GIC_SPI IRQ_USI0_UART_PERIC0 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&dummy_clk 0>, <&dummy_clk 0>;
> +		clock-names = "uart", "clk_uart_baud0";
> +		status = "okay";
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
> +	};
> +
> +};
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
