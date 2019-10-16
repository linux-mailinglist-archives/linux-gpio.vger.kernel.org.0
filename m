Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92DA6D8BAC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 10:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390248AbfJPIsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 04:48:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51776 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388159AbfJPIsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 04:48:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BCDF460CE9; Wed, 16 Oct 2019 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571215700;
        bh=pByBKZqKTYLMqb3/6oK0jVGfJMBeqL08wbli4lZZh34=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZW/L5dGsYStF3beGCsXY3VBnm5E82yUZ9OcqBkYjZoDhhWLfolZS/em5arBwUyjkC
         zgmHSadd79Zk/xoR30s+o4rpOFlfeDicN2r9oxCZHnARXe1bAY3a6QZb7n/e99bSV0
         XAvwWiLboli+Ot6Cl2Gpha8a1ZzP/q4mxdbbfVMQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 2427B60D77;
        Wed, 16 Oct 2019 08:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571215700;
        bh=pByBKZqKTYLMqb3/6oK0jVGfJMBeqL08wbli4lZZh34=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZW/L5dGsYStF3beGCsXY3VBnm5E82yUZ9OcqBkYjZoDhhWLfolZS/em5arBwUyjkC
         zgmHSadd79Zk/xoR30s+o4rpOFlfeDicN2r9oxCZHnARXe1bAY3a6QZb7n/e99bSV0
         XAvwWiLboli+Ot6Cl2Gpha8a1ZzP/q4mxdbbfVMQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 16 Oct 2019 14:18:20 +0530
From:   kgunda@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for
 pm6150/pm6150l
In-Reply-To: <20191016081530.GJ2654@vkoul-mobl>
References: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
 <20191016081530.GJ2654@vkoul-mobl>
Message-ID: <7b50263f2a1450ceab640d6f53b4f7f8@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-10-16 13:45, Vinod Koul wrote:
> On 04-10-19, 16:50, Kiran Gunda wrote:
>> Add support for the PM6150 and PM6150L GPIO support to the
>> Qualcomm PMIC GPIO binding.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
>>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt 
>> b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> index c32bf32..2f48cca 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
>> @@ -23,6 +23,8 @@ PMIC's from Qualcomm.
>>  		    "qcom,pms405-gpio"
>>  		    "qcom,pm8150-gpio"
>>  		    "qcom,pm8150b-gpio"
>> +		    "qcom,pm6150-gpio"
>> +		    "qcom,pm6150l-gpio"
>> 
>>  		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
>>  		    if the device is on an spmi bus or an ssbi bus respectively
>> @@ -100,6 +102,8 @@ to specify in a pin configuration subnode:
>>  					     and gpio8)
>>  		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
>>  		    gpio1-gpio12 for pm8150l (hole on gpio7)
>> +		    gpio1-gpio10 for pm6150
>> +		    gpio1-gpio12 for pm6150l
> 
> No holes on these?
> 
Yes. No holes.
> Other than this:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
>> 
>>  - function:
>>  	Usage: required
>> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c 
>> b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> index f1fece5..387917c 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>> @@ -1121,6 +1121,8 @@ static int pmic_gpio_remove(struct 
>> platform_device *pdev)
>>  	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
>>  	/* pm8150l has 12 GPIOs with holes on 7 */
>>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
>> +	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
>> +	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
>>  	{ },
>>  };
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>>  a Linux Foundation Collaborative Project
