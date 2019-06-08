Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09DE39A26
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 04:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729924AbfFHCoW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 22:44:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55076 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfFHCoW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 22:44:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7C4856070D; Sat,  8 Jun 2019 02:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559961860;
        bh=oKWJ7IKb+QbAvUpADFLHB7hOUGVmIRjnWSUgva6nGvc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=GkOcePglk59aecjlDAiHgo1albSPlNW3AO+7uBFtBtbjQ6I1m915XtwDeJLN3Ctr/
         tDNlWZkviOHx0RmIrwBUrGtnWDh6fw2/qTdMGNQ91vJnAUsFdaPImmiRkwqmycGoll
         ubQGbXpMh60Q1s7ZSSMtXeKaiowBr5If1JR6oNXo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.6] (unknown [171.60.255.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B499660240;
        Sat,  8 Jun 2019 02:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559961859;
        bh=oKWJ7IKb+QbAvUpADFLHB7hOUGVmIRjnWSUgva6nGvc=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=am4cnrVIkLTW3BjoL2rTfOEK+yBpuSa1p396Q/acd5RAwWAOW57vc/ndv9KH39zwv
         hlJhtxcw733TPFb6sx8APFWX0UtRPuWgiwCpV33PA5fGQZHpictSF270BfkUpWvMCh
         Y2CdwX8/i5UPWVeVdm+13dwQpr45hCrqIDQdVM0E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B499660240
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Marc Zyngier <marc.zyngier@arm.com>, robh+dt@kernel.org,
        sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
 <d313bec5-1115-0ef7-0241-83e20672d2f1@arm.com>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <d0e5f602-34de-f28e-cc11-6ebd1d29b495@codeaurora.org>
Date:   Sat, 8 Jun 2019 08:14:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d313bec5-1115-0ef7-0241-83e20672d2f1@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Marc,

On 6/5/2019 10:56 PM, Marc Zyngier wrote:
> On 05/06/2019 18:16, Sricharan R wrote:
>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>> CP01 evaluation board.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  35 ++++
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 231 +++++++++++++++++++++++++++
>>  3 files changed, 267 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 21d548f..ac22dbb 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -2,6 +2,7 @@
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> new file mode 100644
>> index 0000000..ac7cb22
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IPQ6018 CP01 board device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "ipq6018.dtsi"
>> +
>> +/ {
>> +	#address-cells = <0x2>;
>> +	#size-cells = <0x2>;
>> +	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
>> +	compatible = "qcom,ipq6018-cp01", "qcom,ipq6018";
>> +	interrupt-parent = <&intc>;
>> +};
>> +
>> +&tlmm {
>> +	uart_pins: uart_pins {
>> +		mux {
>> +			pins = "gpio44", "gpio45";
>> +			function = "blsp2_uart";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +	};
>> +};
>> +
>> +&blsp1_uart3 {
>> +	pinctrl-0 = <&uart_pins>;
>> +	pinctrl-names = "default";
>> +	status = "ok";
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> new file mode 100644
>> index 0000000..79cccdd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -0,0 +1,231 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * IPQ6018 SoC device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. IPQ6018";
>> +	compatible = "qcom,ipq6018";
>> +
>> +	chosen {
>> +		bootargs = "console=ttyMSM0,115200,n8 rw init=/init";
>> +		bootargs-append = " swiotlb=1 clk_ignore_unused";
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		tz:tz@48500000 {
>> +			no-map;
>> +			reg = <0x0 0x48500000 0x0 0x00200000>;
>> +		};
>> +	};
>> +
>> +	soc: soc {
>> +		#address-cells = <0x1>;
>> +		#size-cells = <0x1>;
>> +		ranges = <0 0 0 0xffffffff>;
>> +		dma-ranges;
>> +		compatible = "simple-bus";
>> +
>> +		intc: interrupt-controller@b000000 {
>> +			compatible = "qcom,msm-qgic2";
>> +			interrupt-controller;
>> +			#interrupt-cells = <0x3>;
>> +			reg = <0xb000000 0x1000>, <0xb002000 0x1000>;
> 
> Where are the rest of the GICv2 MMIO regions, such as GICV and GICH? And
> the maintenance interrupt?
> 
  GICH - 0xB001000 -- 0xB002000
  GICV - 0xB004000 -- 0xB005000
  Will add this and the PPI as well.

Regards,
 Sricharan

>> +		};
>> +
>> +		timer {
>> +			compatible = "arm,armv8-timer";
>> +			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
>> +				     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> 
> The fact that you expose the EL2 timer interrupt would tend to confirm
> the idea that this system supports virtualization... Hence my questions
> above.
> 
> Thanks,
> 
> 	M.
> 

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
