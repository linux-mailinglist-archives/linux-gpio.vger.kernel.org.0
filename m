Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E514607CC
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 18:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhK1RHL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 12:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343786AbhK1RFL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 12:05:11 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E256DC06175A;
        Sun, 28 Nov 2021 09:00:14 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id t83so20225798qke.8;
        Sun, 28 Nov 2021 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ei6OEGcaADQ0WqS+Y/rE3HJLyaa8ot++ONho7WXDJ/E=;
        b=RmNuby9Bn8Em+aPXg0LYzdpUritYNfN+NPv4x9SyXOLRdUM8C4Fg88tQN7DUO859ov
         vvehyDiZiBc0evlr1ge0lAuR5higog/BTmlVpMgGis46eOJDLnKAEV8XNj+YTNkZn2x9
         Fy9lN7G8ZVoYtyfC986I6OYb5SYdYguFwLFLiI/hZUWcAQCMV1VAaYVridkM0EGWhZRx
         PjgejuoSZch9/p4lPMIoI6Z/JIRB15mZykAxp3Dc1oVypisZ9WpaWiqkFQQeVUxr6mLZ
         MUJDPCUbQqKCfhNLAt8645ukFYBHJaPlLe08syj/niCZJccE9PvCwKQQd9GH7Pd+wdSk
         CuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ei6OEGcaADQ0WqS+Y/rE3HJLyaa8ot++ONho7WXDJ/E=;
        b=ap42tf+YpX7JaXUBIdB+yTi6drn6G5KooW4getr8o/ovXnNvtejFyL/pArYz0kWLru
         D0Mdirhq7qkNuFwPndz7+ayj9fX4tw+13NFFPLzQA12EkZJPqGeTZjriKr9afiHmOVL1
         3f8JLiC8jQTMUJDlgrqyMHJu5HaUcruoc7tUp48lS64dmeD2h4g7/B66NTc42cVCwv5P
         YCKqhfxjfVZkPsIIWvbNDC0dxNwlcR0JUz5fc+k0ddbpRb/bdStY2ljpcnd4gjv0qjo6
         x7suNo/5UDfSZuqyVoVznlXBNQptBYuUjp1R5C6oMH+g88MROz8tFEcM+XVs+Ibg0Jle
         nhRg==
X-Gm-Message-State: AOAM531PeBY/ShU9VtU8F5KKcK/klPo9mWpF94m6kfgvFO8jxJkRTFZR
        ZriPdmaBc2QUqOTP2KRufDM=
X-Google-Smtp-Source: ABdhPJyzQwaMTl8kqX2nXvZADozBuCx+7eMnbZicqUCL0N1MrJNufZgo8zhgKGYDxAaudvSXtMY6XQ==
X-Received: by 2002:ae9:e502:: with SMTP id w2mr34315943qkf.315.1638118814021;
        Sun, 28 Nov 2021 09:00:14 -0800 (PST)
Received: from [10.4.10.5] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id 22sm7180098qtw.12.2021.11.28.09.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 09:00:13 -0800 (PST)
Message-ID: <b6b33f15-ead3-d703-47bb-44a1350c0936@gmail.com>
Date:   Sun, 28 Nov 2021 12:00:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 12/13] ARM: dts: imx: add i.MXRT1050-EVK support
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-13-Mr.Bossman075@gmail.com>
 <YaOxu441l41qPvTj@robh.at.kernel.org>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <YaOxu441l41qPvTj@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/28/21 11:43, Rob Herring wrote:
> On Thu, Nov 25, 2021 at 04:14:42PM -0500, Jesse Taube wrote:
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> The NXP i.MXRT1050 Evaluation Kit (EVK) provides a platform for rapid
>> evaluation of the i.MXRT, which features NXP's implementation of the Arm
>> Cortex-M7 core.
>>
>> The EVK provides 32 MB SDRAM, 64 MB Quad SPI flash, Micro SD card socket,
>> USB 2.0 OTG.
>>
>> This patch aims to support the preliminary booting up features
>> as follows:
>> GPIO
>> LPUART
>> SD/MMC
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> [Jesse: Add clock-parents, edma, usdhc, anatop, remove old pinctl]
>> ---
>> V1->V2:
>> * dtsi: Add clock parent definitions
>> * dtsi: Change hex values to lowercase
>> * dtsi: Move anatop definition from driver
>> * dts: Remove unused pin controll (semc)
>> * dts: Use moved pin controll header
>> * Move aliases from dtsi to dts
>> * Change commit description
>> * Change licence to "GPL-2.0+ OR MIT"
>> V2->V3:
>> * Remove bootargs, comments, unused container
>> * Remove unnecessary new lines
>> * Rename imxrt to imxrt1050 for seiral and mmc
>> * GPT uses own clock
>> * fix memory@0
>> * Change GPT compatible handles
>> ---
>>   arch/arm/boot/dts/Makefile          |   2 +
>>   arch/arm/boot/dts/imxrt1050-evk.dts |  72 ++++++++++++
>>   arch/arm/boot/dts/imxrt1050.dtsi    | 165 ++++++++++++++++++++++++++++
>>   3 files changed, 239 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/imxrt1050-evk.dts
>>   create mode 100644 arch/arm/boot/dts/imxrt1050.dtsi
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 8a2dfdf01ce3..d539bf7daa86 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -723,6 +723,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
>>   dtb-$(CONFIG_SOC_IMX7ULP) += \
>>   	imx7ulp-com.dtb \
>>   	imx7ulp-evk.dtb
>> +dtb-$(CONFIG_SOC_IMXRT) += \
>> +	imxrt1050-evk.dtb
>>   dtb-$(CONFIG_SOC_LS1021A) += \
>>   	ls1021a-moxa-uc-8410a.dtb \
>>   	ls1021a-qds.dtb \
>> diff --git a/arch/arm/boot/dts/imxrt1050-evk.dts b/arch/arm/boot/dts/imxrt1050-evk.dts
>> new file mode 100644
>> index 000000000000..6a9c10decf52
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imxrt1050-evk.dts
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019
>> + * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include "imxrt1050.dtsi"
>> +#include "imxrt1050-pinfunc.h"
>> +
>> +/ {
>> +	model = "NXP IMXRT1050-evk board";
>> +	compatible = "fsl,imxrt1050-evk", "fsl,imxrt1050";
>> +
>> +	chosen {
>> +		stdout-path = &lpuart1;
>> +	};
>> +
>> +	aliases {
>> +		gpio0 = &gpio1;
>> +		gpio1 = &gpio2;
>> +		gpio2 = &gpio3;
>> +		gpio3 = &gpio4;
>> +		gpio4 = &gpio5;
>> +		mmc0 = &usdhc1;
>> +		serial0 = &lpuart1;
>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x2000000>;
>> +	};
>> +};
>> +
>> +&lpuart1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_lpuart1>;
>> +	status = "okay";
>> +};
>> +
>> +&iomuxc {
>> +	pinctrl-names = "default";
>> +	pinctrl_lpuart1: lpuart1grp {
>> +		fsl,pins = <
>> +			MXRT1050_IOMUXC_GPIO_AD_B0_12_LPUART1_TXD	0xf1
>> +			MXRT1050_IOMUXC_GPIO_AD_B0_13_LPUART1_RXD	0xf1
>> +		>;
>> +	};
>> +
>> +	pinctrl_usdhc0: usdhc0grp {
>> +		fsl,pins = <
>> +			MXRT1050_IOMUXC_GPIO_B1_12_USDHC1_CD_B		0x1B000
>> +			MXRT1050_IOMUXC_GPIO_B1_14_USDHC1_VSELECT	0xB069
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_00_USDHC1_CMD	0x17061
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_01_USDHC1_CLK	0x17061
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_05_USDHC1_DATA3	0x17061
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_04_USDHC1_DATA2	0x17061
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_03_USDHC1_DATA1	0x17061
>> +			MXRT1050_IOMUXC_GPIO_SD_B0_02_USDHC1_DATA0	0x17061
>> +		>;
>> +	};
>> +};
>> +
>> +&usdhc1 {
>> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
>> +	pinctrl-0 = <&pinctrl_usdhc0>;
>> +	pinctrl-1 = <&pinctrl_usdhc0>;
>> +	pinctrl-2 = <&pinctrl_usdhc0>;
>> +	pinctrl-3 = <&pinctrl_usdhc0>;
>> +	cd-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm/boot/dts/imxrt1050.dtsi b/arch/arm/boot/dts/imxrt1050.dtsi
>> new file mode 100644
>> index 000000000000..35943a6896fa
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/imxrt1050.dtsi
>> @@ -0,0 +1,165 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2019
>> + * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
>> + */
>> +
>> +#include "armv7-m.dtsi"
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/imxrt1050-clock.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +
>> +	clocks {
>> +		osc: osc {
>> +			compatible = "fsl,imx-osc", "fixed-clock";
> 
> fsl,imx-osc is not documented. IMO, just drop it.
Other imx device trees have it, should i still?
> 
>> +			#clock-cells = <0>;
>> +			clock-frequency = <24000000>;
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <0x01>;
>> +		#size-cells = <0x00>;
>> +
>> +		cpu@0 {
>> +			compatible = "arm,cortex-m7";
> 
> Not documented.
> 
> Please run schema validation checks and don't add any new warnings not
> already present for i.MX.
Ah sorry was from u-boot.
> 
>> +			device_type = "cpu";
>> +			reg = <0x00>;
>> +		};
>> +	};
>> +
>> +	soc {
>> +		lpuart1: serial@40184000 {
>> +			compatible = "fsl,imxrt1050-lpuart","fsl,imx8mm-uart", "fsl,imx6q-uart";
> 
> space                                                       ^
> 
>> +			reg = <0x40184000 0x4000>;
>> +			interrupts = <20>;
>> +			clocks = <&clks IMXRT1050_CLK_LPUART1>;
>> +			clock-names = "ipg";
>> +			status = "disabled";
>> +		};
>> +
>> +		iomuxc: iomuxc@401f8000 {
> 
> pinctrl@...
> 
>> +			compatible = "fsl,imxrt1050-iomuxc";
>> +			reg = <0x401f8000 0x4000>;
>> +			fsl,mux_mask = <0x7>;
>> +		};
>> +
>> +		anatop: anatop@400d8000 {
>> +			compatible = "fsl,imxrt-anatop";
>> +			reg = <0x400d8000 0x4000>;
>> +		};
>> +
>> +		clks: ccm@400fc000 {
> 
> clock-controller@...
> 
>> +			compatible = "fsl,imxrt1050-ccm";
>> +			reg = <0x400fc000 0x4000>;
>> +			interrupts = <95>, <96>;
>> +			clocks = <&osc>;
>> +			clock-names = "osc";
>> +			#clock-cells = <1>;
>> +			assigned-clocks = <&clks IMXRT1050_CLK_PLL1_BYPASS>,
>> +				<&clks IMXRT1050_CLK_PLL1_BYPASS>,
>> +				<&clks IMXRT1050_CLK_PLL2_BYPASS>,
>> +				<&clks IMXRT1050_CLK_PLL3_BYPASS>,
>> +				<&clks IMXRT1050_CLK_PLL3_PFD1_664_62M>,
>> +				<&clks IMXRT1050_CLK_PLL2_PFD2_396M>;
>> +			assigned-clock-parents = <&clks IMXRT1050_CLK_PLL1_REF_SEL>,
>> +				<&clks IMXRT1050_CLK_PLL1_ARM>,
>> +				<&clks IMXRT1050_CLK_PLL2_SYS>,
>> +				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
>> +				<&clks IMXRT1050_CLK_PLL3_USB_OTG>,
>> +				<&clks IMXRT1050_CLK_PLL2_SYS>;
>> +		};
>> +
>> +		edma1: dma-controller@400e8000 {
>> +			#dma-cells = <2>;
>> +			compatible = "fsl,imx7ulp-edma";
>> +			reg = <0x400e8000 0x4000>,
>> +				<0x400ec000 0x4000>;
>> +			dma-channels = <32>;
>> +			interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>, <8>,
>> +				<9>, <10>, <11>, <12>, <13>, <14>, <15>, <16>;
>> +			clock-names = "dma", "dmamux0";
>> +			clocks = <&clks IMXRT1050_CLK_DMA>,
>> +				 <&clks IMXRT1050_CLK_DMA_MUX>;
>> +		};
>> +
>> +		usdhc1: mmc@402c0000 {
>> +			compatible ="fsl,imxrt1050-usdhc";
>> +			reg = <0x402c0000 0x4000>;
>> +			interrupts = <110>;
>> +			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
>> +				<&clks IMXRT1050_CLK_OSC>,
>> +				<&clks IMXRT1050_CLK_USDHC1>;
>> +			clock-names = "ipg", "ahb", "per";
>> +			bus-width = <4>;
>> +			fsl,wp-controller;
>> +			no-1-8-v;
>> +			max-frequency = <4000000>;
>> +			fsl,tuning-start-tap = <20>;
>> +			fsl,tuning-step= <2>;
>> +			status = "disabled";
>> +		};
>> +
>> +		gpio1: gpio@401b8000 {
>> +			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
> 
> Not SoC specific?
fsl,imxrt-gpio is a placeholder, it is compatible with imx35.
> 
>> +			reg = <0x401b8000 0x4000>;
>> +			interrupts = <80>, <81>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio2: gpio@401bc000 {
>> +			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +			reg = <0x401bc000 0x4000>;
>> +			interrupts = <82>, <83>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio3: gpio@401c0000 {
>> +			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +			reg = <0x401c0000 0x4000>;
>> +			interrupts = <84>, <85>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio4: gpio@401c4000 {
>> +			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +			reg = <0x401c4000 0x4000>;
>> +			interrupts = <86>, <87>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpio5: gpio@400c0000 {
>> +			compatible = "fsl,imxrt-gpio", "fsl,imx35-gpio";
>> +			reg = <0x400c0000 0x4000>;
>> +			interrupts = <88>, <89>;
>> +			gpio-controller;
>> +			#gpio-cells = <2>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <2>;
>> +		};
>> +
>> +		gpt: timer@401ec000 {
>> +			compatible = "fsl,imxrt1050-gpt", "fsl,imx6dl-gpt", "fsl,imx6sl-gpt";
>> +			reg = <0x401ec000 0x4000>;
>> +			interrupts = <100>;
>> +			clocks = <&clks IMXRT1050_CLK_GPT>;
>> +			clock-names = "per";
>> +		};
>> +	};
>> +};
>> -- 
>> 2.34.0
>>
>>
