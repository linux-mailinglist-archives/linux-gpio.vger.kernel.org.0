Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4F4839A2B
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 04:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730380AbfFHCqH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 22:46:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57092 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbfFHCqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 22:46:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F0974611FA; Sat,  8 Jun 2019 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559961965;
        bh=LuYcMhOCmjZOSBiOZ6Cxk4Oc3y54/yOla8k85eJQx6M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FWuFeseIeEKbmXiVLfg6jwxzbQz0pNOc5eplGIHSj8PvdxyKBTqyfL07Bas6EUS03
         Ec9ru/sMpI0bxIArE2zNIl25a22/YKV9rtBTcyJ/ejEVLlBH2GnX7gmXn+pY8mWGQE
         0gSyh1vv99O69A3Q0fIHWG4t8vcdj0fUOOn44K1U=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85746607C6;
        Sat,  8 Jun 2019 02:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559961905;
        bh=LuYcMhOCmjZOSBiOZ6Cxk4Oc3y54/yOla8k85eJQx6M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HYlzNtUo3zUb2/+6qjWsgnXhNHz+tZCw5eHWIzOa4J34aFEqhxwWxHvVqre1nZ6P+
         m/1EclxHtPeBJVFIi26PX3cis7phGiehwR2KFsg4SLJYLOLxoK0RSoZiqGowf0Ucpx
         vkRi/ljeH32ujaxLFSsfJ+T5YKFZcOAC2ctMdIOI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85746607C6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     robh+dt@kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org>
 <1559755738-28643-6-git-send-email-sricharan@codeaurora.org>
 <20190605173441.GA9903@e107155-lin>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <f2f13a86-b603-57d7-a06e-5187973bb336@codeaurora.org>
Date:   Sat, 8 Jun 2019 08:14:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605173441.GA9903@e107155-lin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sudeep,

On 6/5/2019 11:04 PM, Sudeep Holla wrote:
> On Wed, Jun 05, 2019 at 10:58:57PM +0530, Sricharan R wrote:
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
> 
> [...]
> 
>> +
>> +		CPU3: cpu@3 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			enable-method = "psci";
>> +			reg = <0x3>;
>> +			next-level-cache = <&L2_0>;
>> +		};
>> +
>> +		L2_0: l2-cache {
>> +			compatible = "cache";
>> +			cache-level = <0x2>;
>> +		};
>> +	};
>> +
>> +	pmuv8: pmu {
>> +		compatible = "arm,armv8-pmuv3";
> 
> We know these are Cortex-A53s, why not update these accordingly ?
> 

Ok, will change this.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
