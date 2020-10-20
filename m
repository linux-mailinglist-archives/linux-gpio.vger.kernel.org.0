Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D3D28517C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 20:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgJFSSe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 14:18:34 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38048 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgJFSSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 14:18:34 -0400
Received: by mail-ot1-f66.google.com with SMTP id i12so7352239ota.5;
        Tue, 06 Oct 2020 11:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hy8u4oryHdrJw9k6yxuAVeerYVirHjXzT+ryq/l0sJI=;
        b=gyrEl7BZINBtuln7tBRPfzWbI8rQVMKpfHhzNY/aDejq2Cxv8dgNj4nkJMP+1xNdtS
         X599YKmm0IW6u+X+3hJeJDXY18FMYbuhI580z0dhsNYuwQkAbJtbMi4rkKWkAzY920ar
         /JCfjHImsnweqYz7rSHedGt2rVTX9V18TKvNsAiq2ZEjweBYFklGwVa6WA+i6qR+HQxO
         U89Yqx5B2+cci4+vWIlMjBqmRR76HSiFJYSjoqagcK7KSAAaF+acrH3flJvQI4jQ9+uR
         PTUNCAcMxsLgnjkxGblJyh6L8oQanojDgT7HO6w2Yj1wBoqPimydFv+V5D3RQ6CaF7T3
         8Gog==
X-Gm-Message-State: AOAM531P2O6mEGWTiSzTlY33WLLzetRiK/J8i9y4WYcA1CK5uOwyqNRP
        e1VRbaLWoLYoBjuBNUQb1A==
X-Google-Smtp-Source: ABdhPJwG53MmjyQcM+RFl4ahPLOIQ9AtOizuvfBOaQSuAOXM6QUhNiSQCj7BeFRxNsdfSaTghhRHsA==
X-Received: by 2002:a9d:491:: with SMTP id 17mr3859333otm.338.1602008310942;
        Tue, 06 Oct 2020 11:18:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m187sm1446451oia.39.2020.10.06.11.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 11:18:29 -0700 (PDT)
Received: (nullmailer pid 2571913 invoked by uid 1000);
        Tue, 06 Oct 2020 18:18:28 -0000
Date:   Tue, 6 Oct 2020 13:18:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Varadarajan Narayanan <varada@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, nsekar@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 6/7] arm64: dts: Add ipq5018 SoC and MP03 board support
Message-ID: <20201006181828.GA2554170@bogus>
References: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
 <1601270140-4306-7-git-send-email-varada@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601270140-4306-7-git-send-email-varada@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 10:45:39AM +0530, Varadarajan Narayanan wrote:
> Add initial device tree support for the Qualcomm IPQ5018 SoC and
> MP03.1-C2 board.
> 
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml |   7 +

Bindings and dts files should be separate patches.

>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts  |  30 ++++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi           | 201 ++++++++++++++++++++++++
>  4 files changed, 239 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5018.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 6031aee..694063f 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -28,6 +28,7 @@ description: |
>          apq8074
>          apq8084
>          apq8096
> +        ipq5018
>          ipq6018
>          ipq8074
>          mdm9615
> @@ -49,6 +50,7 @@ description: |
>          hk01
>          idp
>          liquid
> +        mp03
>          mtp
>          qrd
>          sbc
> @@ -142,6 +144,11 @@ properties:
>  
>        - items:
>            - enum:
> +              - qcom,ipq5018-mp03
> +          - const: qcom,ipq5018
> +
> +      - items:
> +          - enum:
>                - qcom,ipq8064-ap148
>            - const: qcom,ipq8064
>  
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d8f1466..3873970 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM) += apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-mp03.1-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts
> new file mode 100644
> index 00000000..41bb3b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)

Your employer is okay with GPL3 (and later)?

> +/*
> + * IPQ5018 CP01 board device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.

It's 2020.

> + */
> +
> +/dts-v1/;
> +
> +#include "ipq5018.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IPQ5018/AP-MP03-C2";
> +	compatible = "qcom,ipq5018-mp03", "qcom,ipq5018";
> +
> +	aliases {
> +		serial0 = &blsp1_uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs-append = " swiotlb=1";

Not an upstream property.

> +	};
> +};
> +
> +&blsp1_uart1 {
> +	pinctrl-0 = <&serial_1_pins>;
> +	pinctrl-names = "default";
> +	status = "ok";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> new file mode 100644
> index 00000000..12492a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * IPQ5018 SoC device tree source
> + *
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-ipq5018.h>
> +#include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	interrupt-parent = <&intc>;
> +
> +	clocks {

Drop the container node.

> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		xo: xo {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		CPU1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x1>;
> +			next-level-cache = <&L2_0>;
> +		};
> +
> +		L2_0: l2-cache {
> +			compatible = "cache";
> +			cache-level = <0x2>;
> +		};
> +	};
> +
> +	pmuv8: pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
> +					 IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	psci: psci {

Drop unused (and likely never needed) labels. 

> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		tz: tz@4ac00000 {
> +			reg = <0x0 0x4ac00000 0x0 0x00400000>;
> +			no-map;
> +		};
> +	};
> +
> +	soc: soc {

soc@0

Build dtbs with W=1 and fix any warnings. This should be one.

> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0 0 0xffffffff>;
> +		dma-ranges;
> +		compatible = "simple-bus";
> +
> +		tlmm: pinctrl@1000000 {
> +			compatible = "qcom,ipq5018-pinctrl";
> +			reg = <0x01000000 0x300000>;
> +			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 80>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			serial_1_pins: serial1-pinmux {
> +				pins = "gpio31", "gpio32", "gpio33", "gpio34";
> +				function = "blsp1_uart1";
> +				drive-strength = <8>;
> +				bias-pull-down;
> +			};
> +		};
> +
> +		gcc: gcc@1800000 {

clock-controller@...

> +			compatible = "qcom,gcc-ipq5018";
> +			reg = <0x01800000 0x80000>;
> +			clocks = <&xo>, <&sleep_clk>;
> +			clock-names = "xo", "sleep_clk";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		blsp1_uart1: serial@78af000 {
> +			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +			reg = <0x078af000 0x200>;
> +			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
> +				<&gcc GCC_BLSP1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +			status = "disabled";
> +		};
> +
> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <0x3>;
> +			reg =   <0x0b000000 0x1000>,  /*GICD*/
> +				<0x0b002000 0x1000>,  /*GICC*/
> +				<0x0b001000 0x1000>,  /*GICH*/
> +				<0x0b004000 0x1000>;  /*GICV*/
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		timer {

Not memory mapped, move to top-level.

> +			compatible = "arm,armv8-timer";
> +			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> +		};
> +
> +		timer@b120000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0b120000 0x1000>;
> +			clock-frequency = <19200000>;
> +
> +			frame@b120000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b121000 0x1000>,
> +				      <0x0b122000 0x1000>;
> +			};
> +
> +			frame@b123000 {
> +				frame-number = <1>;
> +				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0xb123000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b124000 {
> +				frame-number = <2>;
> +				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b124000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b125000 {
> +				frame-number = <3>;
> +				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b125000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b126000 {
> +				frame-number = <4>;
> +				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b126000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b127000 {
> +				frame-number = <5>;
> +				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b127000 0x1000>;
> +				status = "disabled";
> +			};
> +
> +			frame@b128000 {
> +				frame-number = <6>;
> +				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x0b128000 0x1000>;
> +				status = "disabled";
> +			};
> +		};
> +	};

No memory node...

Rob


> +};
> -- 
> 2.7.4
> 
