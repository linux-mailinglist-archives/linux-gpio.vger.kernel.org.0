Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1CF12CDFC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 10:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfL3JKP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 04:10:15 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:63184 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727162AbfL3JKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Dec 2019 04:10:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577697013; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=scnmlDxgkOxtUL/+UzPVVikWz+SJ+wQZ6woqtEvg3SU=; b=d8xTT2BeIET0M0thX5a/43gHB6xW6vUGhcUVCzbyyDzfd9175NaqH9992qD0rKrS70E/VJzO
 4uFYQGW/5fdYcsIDm1zy2vB4iw9itT85/6Bq7erQPlvIVfRBL78RDNQ34CMyoM9meNnZ+9Wr
 n8oWhKxDIVKXF6kGgl+mCPPxf4E=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e09bef3.7fc27fe42ae8-smtp-out-n01;
 Mon, 30 Dec 2019 09:10:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACDA1C4479D; Mon, 30 Dec 2019 09:10:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 549C9C43383;
        Mon, 30 Dec 2019 09:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 549C9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH V2 6/7] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        sivaprak@codeaurora.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1576752109-24497-1-git-send-email-sricharan@codeaurora.org>
 <1576752109-24497-7-git-send-email-sricharan@codeaurora.org>
 <20191229032944.GM3755841@builder>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <960d2f8b-800c-10ee-896e-f04d0e680e1a@codeaurora.org>
Date:   Mon, 30 Dec 2019 14:40:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191229032944.GM3755841@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bjorn,
  Thanks again for the review.

On 12/29/2019 8:59 AM, Bjorn Andersson wrote:
> On Thu 19 Dec 02:41 PST 2019, Sricharan R wrote:
> 
>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>> CP01 evaluation board.
>>
> 
> Hi Sricharan, thanks for the rework, this looks pretty good now, just
> some minor comments below.
> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> 
> Should this have some Co-developed-by?
> 

hmm, should be added here as well. will add it.

>> ---
>>
>>  [V2] Sorted nodes based on address, name, label.
>>       Removed unused clock nodes.
>>       Addressed other review comments.
>>
>>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>>  arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts |  41 +++++
>>  arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 215 +++++++++++++++++++++++++++
>>  3 files changed, 257 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>>  create mode 100644 arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6498a1e..2b24998 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -1,6 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> new file mode 100644
>> index 0000000..82a6024
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
>> @@ -0,0 +1,41 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> Please dual license as GPL+BSD
> 

 ok.

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
>> +	model = "Qualcomm Technologies, Inc. IPQ6018/AP-CP01-C1";
>> +	compatible = "qcom,ipq6018-cp01", "qcom,ipq6018";
>> +
>> +	aliases {
>> +		serial0 = &blsp1_uart3;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +		bootargs-append = " swiotlb=1";
>> +	};
>> +};
>> +
>> +&blsp1_uart3 {
>> +	pinctrl-0 = <&uart_pins>;
>> +	pinctrl-names = "default";
>> +	status = "ok";
>> +};
>> +
>> +&tlmm {
>> +	uart_pins: uart_pins {
> 
> Reference the &uart_pins directly, and please use a more specific name.
> 

 ok.

>> +		mux {
> 
> I would suggest that you either flatten the "mux" subnode and define the
> properties directly in &uart_pins; or you split it the functional pieces
> of rx { } tx { }.

 ok.

> 
> And right now you're duplicating the properties between the dtsi and the
> dts, either drop one of them or define the function in the dtsi and add
> the drive-strenght and bias-pull-down here.
> 

 ok, understand, will fix.

>> +			pins = "gpio44", "gpio45";
>> +			function = "blsp2_uart";
>> +			drive-strength = <8>;
>> +			bias-pull-down;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> new file mode 100644
>> index 0000000..269287c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>> @@ -0,0 +1,215 @@
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
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +	interrupt-parent = <&intc>;
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		tz: tz@48500000 {
>> +			reg = <0x0 0x48500000 0x0 0x00200000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	soc: soc {
> 
> soc@0
> 
> Shouldn't this be sorted after 'p'?
> 

 yes, will fix this as well.


Regards,
  Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
