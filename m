Return-Path: <linux-gpio+bounces-889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC3801864
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 01:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EEE21F210EF
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 00:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880FA196;
	Sat,  2 Dec 2023 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KZEsVIWi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38A8133
	for <linux-gpio@vger.kernel.org>; Fri,  1 Dec 2023 16:03:41 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cfd76c5f03so60685ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Dec 2023 16:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701475421; x=1702080221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VZYee4WSq2RYK2ZCsXhdOV0T4Fi/lav5TxPLtBZ8Ac=;
        b=KZEsVIWiLw3sYgmKlJOeB8UfaqmkEhbRpLPH1KHlBy1wpoDBj7pgUczkLecheV3bTA
         a5WYh3vZQAUtO6kP6NJmJzoxqz/cipT2Kj//F71sjLDTUuohSUlyFQYIddbj6BLfEXjK
         zd/nbdi9FpnscQUZa0o4Tkk+hzEVyaaomhT/CTOTbHvpS9oMAjhVlnW8igVf4AxSlQIE
         bZ2q8He61sHLWfZK/9Nfx2qlhIgxplLuSoi3pYS6z5oI2uhS9piv24Dws5Vb/O4e9KMG
         y2EnCPCgGVDutgP0HzqeYgKpnC/MryC7ms0RwpNMXCiHOZO4+X2bHTsDS/VLXG4egPp4
         90FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475421; x=1702080221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VZYee4WSq2RYK2ZCsXhdOV0T4Fi/lav5TxPLtBZ8Ac=;
        b=ahGh7RgvxtGdkn+zqPXiV9EPdXT0j84hNXtVQn2q3dp9pXWOVY533m9z8WDZZoNu/z
         awbVO4fl+GWNciywBQbuup/evSXKMT75TsjXDrfp3DIL1f/oDyBjcM7JpukI93khwfGV
         uvmr4A7gdWcvQRuUhrPRb0WUmcUTiVPPeBKT6eaE6maSYWqyfJ0j7whSL+1l9NoWfYIu
         ArNONJZ9c4x6XEHgvFhmY2yQlnlYvZAJPq2UjBQcBV/tr9zJ9BSVd4Rm1jmOchhdY6Rc
         dX3nkoLQ0jSTma0rjIUokXYtFvwzXO1nzjkcpS7H1wu0HTbtIKllSd6Z0vYiJpBS+dYu
         DNQw==
X-Gm-Message-State: AOJu0YzIEHfOo6bQtVSlMBz0XDxTKbejqCCsxFM1DkPqeeP+J2f8frYY
	cvwp5HBG9wL1CRrDIgkf3xXNmA==
X-Google-Smtp-Source: AGHT+IGGpA4qC4ORYbTgUYVJ0JcFNnObVtfe/SdWwom8APjRzLxaKB8eT6V0HHLMGRyaK3moDDAGPw==
X-Received: by 2002:a17:903:496:b0:1cf:abb3:eb26 with SMTP id jj22-20020a170903049600b001cfabb3eb26mr302842plb.3.1701475421073;
        Fri, 01 Dec 2023 16:03:41 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id e14-20020a170902ed8e00b001d06e385953sm277658plj.69.2023.12.01.16.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 16:03:40 -0800 (PST)
Date: Fri, 1 Dec 2023 16:03:37 -0800
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
Message-ID: <ZWp0WapGiXZLn5xn@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-20-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-20-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> Add initial board support for the Pixel 6 phone code named Oriole. This
> has been tested with a minimal busybox initramfs and boots to a shell.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

--

Verified boot to a busybox console on my oriole device.

Thanks,
Will

> ---
>  arch/arm64/boot/dts/exynos/Makefile           |   2 +
>  arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
>  .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
>  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> 
> diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
> index 6e4ba69268e5..44c24a8ad9e1 100644
> --- a/arch/arm64/boot/dts/exynos/Makefile
> +++ b/arch/arm64/boot/dts/exynos/Makefile
> @@ -1,4 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> +subdir-y += google
> +
>  dtb-$(CONFIG_ARCH_EXYNOS) += \
>  	exynos5433-tm2.dtb		\
>  	exynos5433-tm2e.dtb		\
> diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
> new file mode 100644
> index 000000000000..0a6d5e1fe4ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +dtb-$(CONFIG_ARCH_EXYNOS) += \
> +	gs101-oriole.dtb \
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> new file mode 100644
> index 000000000000..6abd00fa337e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Oriole Device Tree
> + *
> + * Copyright 2021-2023 Google,LLC
> + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "gs101-pinctrl.h"
> +#include "gs101.dtsi"
> +
> +/ {
> +	model = "Oriole";
> +	compatible = "google,gs101-oriole", "google,gs101";
> +
> +	aliases {
> +		serial0 = &serial_0;
> +	};
> +
> +	chosen {
> +		/* Bootloader expects bootargs specified otherwise it crashes */
> +		bootargs = "";
> +		stdout-path = &serial_0;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&key_voldown>, <&key_volup>, <&key_power>;
> +
> +		button-vol-down {
> +			label = "KEY_VOLUMEDOWN";
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpios = <&gpa7 3 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-vol-up {
> +			label = "KEY_VOLUMEUP";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&gpa8 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-power {
> +			label = "KEY_POWER";
> +			linux,code = <KEY_POWER>;
> +			gpios = <&gpa10 1 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
> +&ext_24_5m {
> +	clock-frequency = <24576000>;
> +};
> +
> +&ext_200m {
> +	clock-frequency = <200000000>;
> +};
> +
> +&pinctrl_far_alive {
> +	key_voldown: key-voldown-pins {
> +		samsung,pins = "gpa7-3";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +
> +	key_volup: key-volup-pins {
> +		samsung,pins = "gpa8-1";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&pinctrl_gpio_alive {
> +	key_power: key-power-pins {
> +		samsung,pins = "gpa10-1";
> +		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
> +		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> +		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
> +	};
> +};
> +
> +&serial_0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_bus>;
> +};
> +
> +&usi_uart {
> +	status = "okay";
> +	samsung,clkreq-on; /* needed for UART mode */
> +};
> +
> +&watchdog_cl0 {
> +	timeout-sec = <30>;
> +	status = "okay";
> +};
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 

