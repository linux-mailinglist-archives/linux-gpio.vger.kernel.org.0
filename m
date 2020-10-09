Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC9582888B8
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 14:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbgJIMaj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 08:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgJIMaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 08:30:39 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05684C0613D2;
        Fri,  9 Oct 2020 05:30:39 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f21so9644362wml.3;
        Fri, 09 Oct 2020 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AjmLoetTBObgHXL/i47jeS5ZhvM7sMIdDP4emaMus2g=;
        b=asqqtzCCpWEdFlVVTjiylkeSMp0o1bvIQI1aTOejkiv0XRQUikw9PJN/MKjI6asZC4
         hyDbAFwnS6XAJQ3fc6MoHgDFbSvoAj+NcMiv5Fe4ouKyQlqIBrSwYJGfN9Ul1lFjtXf5
         hdgDBdtiNoR7+IPO7RZprzb+AJjnUNVmzomWZxxs+P/xd5trJwWgez1D1n1tUry9rWpy
         cGcrPblqZzSIcDgG1WIC22eOQndILpt41GaWZGVB9NKz9Wi7Ye8+zFFb48a/pTV38eb8
         Yf5+zkNxaNa2dF7rDlLNTamuoBL7Z/oY9vzJWillNUZHzbglT98WHy3qhWab7KRXPsI3
         Ti/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AjmLoetTBObgHXL/i47jeS5ZhvM7sMIdDP4emaMus2g=;
        b=Wx/5jDJGDavmDDXvYYQ109sQJqpnM5zLtgiERq/xa7rPSnmvM0gq4uGl46ZZ0YCdmC
         h5+aJcQKDCTjUeNLwqvz+w/tsi5rz83hj72t7q7Cl5zCm9yZmYTsa60vZXHIzMOXC3g9
         iHoNEL5NyQ0VQFYpQYW41HX4TKE9Zf8ZIbiCU/j9LWPzNITWBSuVPb2wyG0i1LCu2U6w
         j9hhpPOSgEv3IQBkWpQjarPWAhX5ImSEutd0Tg50XL0Ad6JWI6JeJuw6thI7Ibm7TatB
         tJmKh39oKlc5iqfWWVtfuV/k6Cu46Z5smdpM9WiRjBN5C9V2KrQqFoBff8toc9EJpcNT
         jCfA==
X-Gm-Message-State: AOAM531MOmnCh8dDOeeOpp0MIcX61FMHSUHHfjKcfq7Dmz3Uaow8uApu
        wKyPj69UgBnnoQkQtvuqjek=
X-Google-Smtp-Source: ABdhPJw2Lo8s/yFUlcr8c49/Uewddu9hg079ybrqHjIVWx/YC2AQC7mQhXGMF07QF5gYM3+VLdtnQw==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr1120408wme.116.1602246637515;
        Fri, 09 Oct 2020 05:30:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
        by smtp.gmail.com with ESMTPSA id t124sm12301997wmg.31.2020.10.09.05.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2020 05:30:36 -0700 (PDT)
Subject: Re: [PATCH v10 2/3] arm64: dts: add dts nodes for MT6779
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     mtk01761 <wendell.lin@mediatek.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <847f64e2-8ed6-2e09-5343-2aa70d5937fa@gmail.com>
Date:   Fri, 9 Oct 2020 14:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1596115816-11758-3-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 30/07/2020 15:30, Hanks Chen wrote:
> this adds initial MT6779 dts settings for board support,
> including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt6779-evb.dts |  31 +++
>   arch/arm64/boot/dts/mediatek/mt6779.dtsi    | 271 ++++++++++++++++++++
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a57af9da9f5c..4d1b0f9d8d1c 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -1,6 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> new file mode 100644
> index 000000000000..164f5cbb3821
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + */
> +
> +/dts-v1/;
> +#include "mt6779.dtsi"
> +
> +/ {
> +	model = "MediaTek MT6779 EVB";
> +	compatible = "mediatek,mt6779-evb", "mediatek,mt6779";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0x1e800000>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:921600n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> new file mode 100644
> index 000000000000..370f309d32de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/mt6779-clk.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/mt6779-pinfunc.h>
> +
> +/ {
> +	compatible = "mediatek,mt6779";
> +	interrupt-parent = <&sysirq>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x000>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x100>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x200>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x300>;
> +		};
> +
> +		cpu4: cpu@4 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x400>;
> +		};
> +
> +		cpu5: cpu@5 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			enable-method = "psci";
> +			reg = <0x500>;
> +		};
> +
> +		cpu6: cpu@6 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75";
> +			enable-method = "psci";
> +			reg = <0x600>;
> +		};
> +
> +		cpu7: cpu@7 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a75";
> +			enable-method = "psci";
> +			reg = <0x700>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
> +	};
> +
> +	clk26m: oscillator@0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "clk26m";
> +	};
> +
> +	clk32k: oscillator@1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "clk32k";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@0c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <4>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
> +			      <0 0x0c040000 0 0x200000>; /* GICR */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 \
> +						&cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +
> +		};
> +
> +		sysirq: intpol-controller@0c53a650 {
> +			compatible = "mediatek,mt6779-sysirq",
> +				     "mediatek,mt6577-sysirq";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			reg = <0 0x0c53a650 0 0x50>;

This looks a bit suspicious to me. Unfortunately I'm not able to find any 
reference in the datasheets.

Anyway, patch now applied to v5.10-tmp/dts64

Thanks!
Matthias

> +		};
> +
> +		topckgen: clock-controller@10000000 {
> +			compatible = "mediatek,mt6779-topckgen", "syscon";
> +			reg = <0 0x10000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		infracfg_ao: clock-controller@10001000 {
> +			compatible = "mediatek,mt6779-infracfg_ao", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pio: pinctrl@10005000 {
> +			compatible = "mediatek,mt6779-pinctrl", "syscon";
> +			reg = <0 0x10005000 0 0x1000>,
> +			      <0 0x11c20000 0 0x1000>,
> +			      <0 0x11d10000 0 0x1000>,
> +			      <0 0x11e20000 0 0x1000>,
> +			      <0 0x11e70000 0 0x1000>,
> +			      <0 0x11ea0000 0 0x1000>,
> +			      <0 0x11f20000 0 0x1000>,
> +			      <0 0x11f30000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "gpio", "iocfg_rm",
> +				    "iocfg_br", "iocfg_lm",
> +				    "iocfg_lb", "iocfg_rt",
> +				    "iocfg_lt", "iocfg_tl",
> +				    "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 210>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		apmixed: clock-controller@1000c000 {
> +			compatible = "mediatek,mt6779-apmixed", "syscon";
> +			reg = <0 0x1000c000 0 0xe00>;
> +			#clock-cells = <1>;
> +		};
> +
> +		uart0: serial@11002000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11002000 0 0x400>;
> +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@11003000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11003000 0 0x400>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@11004000 {
> +			compatible = "mediatek,mt6779-uart",
> +				     "mediatek,mt6577-uart";
> +			reg = <0 0x11004000 0 0x400>;
> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +
> +		audio: clock-controller@11210000 {
> +			compatible = "mediatek,mt6779-audio", "syscon";
> +			reg = <0 0x11210000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mfgcfg: clock-controller@13fbf000 {
> +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> +			reg = <0 0x13fbf000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6779-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		imgsys: clock-controller@15020000 {
> +			compatible = "mediatek,mt6779-imgsys", "syscon";
> +			reg = <0 0x15020000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vdecsys: clock-controller@16000000 {
> +			compatible = "mediatek,mt6779-vdecsys", "syscon";
> +			reg = <0 0x16000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		vencsys: clock-controller@17000000 {
> +			compatible = "mediatek,mt6779-vencsys", "syscon";
> +			reg = <0 0x17000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		camsys: clock-controller@1a000000 {
> +			compatible = "mediatek,mt6779-camsys", "syscon";
> +			reg = <0 0x1a000000 0 0x10000>;
> +			#clock-cells = <1>;
> +		};
> +
> +		ipesys: clock-controller@1b000000 {
> +			compatible = "mediatek,mt6779-ipesys", "syscon";
> +			reg = <0 0x1b000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
> +
> +	};
> +};
> 
