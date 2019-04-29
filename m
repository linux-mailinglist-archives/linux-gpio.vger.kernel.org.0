Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38BBADE16
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 10:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfD2Ii5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 04:38:57 -0400
Received: from ns.iliad.fr ([212.27.33.1]:42016 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbfD2Ii5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Apr 2019 04:38:57 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 481972043B;
        Mon, 29 Apr 2019 10:38:55 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 2FEEC200CA;
        Mon, 29 Apr 2019 10:38:55 +0200 (CEST)
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: Add i2c5 pins
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <ed5b1b55-285a-1c6d-c562-a965119000a5@free.fr>
 <20190427045151.GE3137@builder>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <fcc97e67-3b8e-5b31-866e-6bee62a88fd9@free.fr>
Date:   Mon, 29 Apr 2019 10:38:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190427045151.GE3137@builder>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Apr 29 10:38:55 2019 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27/04/2019 06:51, Bjorn Andersson wrote:

> On Thu 25 Apr 09:06 PDT 2019, Marc Gonzalez wrote:
> 
>> Downstream source:
>> https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi?h=LE.UM.1.3.r3.25#n165
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998-pins.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>> index 6db70acd38ee..d0a95c70d1e7 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
>> @@ -2,6 +2,13 @@
>>  /* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
>>  
>>  &tlmm {
>> +	i2c5_default: i2c5_default {
>> +		pins = "gpio87", "gpio88";
>> +		function = "blsp_i2c5";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
> 
> You need to reference this node for it to make a difference.

Right. I do have a local board file referencing i2c5_default, which I plan
to submit at some point. It contains:

&blsp1_i2c5 {
	status = "ok";
	clock-frequency = <100000>;
	pinctrl-names = "default";
	pinctrl-0 = <&i2c5_default>;
};

> Also the drive-strength and bias are board specific, so please move this
> to your board dts (and reference the node).

Wait... Are you saying there should be no drive-strength nor bias definitions
inside msm8998-pins.dtsi?

$ grep -c 'strength\|bias' arch/arm64/boot/dts/qcom/msm8998-pins.dtsi
18

Why are the SDHC pins different than the I2C pins?

i2c5 is "tied" to gpio87 and gpio88. Could my board designer "reassign"
these pins to a different HW block? Or is that immutable?

Regards.
