Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13A52434DD
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Aug 2020 09:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgHMHWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 03:22:22 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:10519 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726761AbgHMHWV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Aug 2020 03:22:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597303341; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=krSE+uF1gic2FeM5vcsHhpOFH9c/PROsDrQ0oxKuejM=; b=xQD11BWY5ic/a7nM0EcOcfl/C2pyNecZoIec3F2A0cQROhuSsocHyrvBqZZHIpJ6bQykp+y3
 EClBT3iFOC2ASR/yO6CdfAOg8XuOaMklFb+tZ8l8uj+pzdROw4xBeomnZS4OSDVB0i7aKXLh
 gVyMYXAxALy+KyPcCQ7OjQPPP4Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f34ea0dba4c2cd3670fb865 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 07:21:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3830DC43395; Thu, 13 Aug 2020 07:21:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 684DBC433CA;
        Thu, 13 Aug 2020 07:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 684DBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v4 7/7] irqchip: qcom-pdc: Reset all pdc interrupts during
 init
To:     Felipe Balbi <balbi@kernel.org>, bjorn.andersson@linaro.org,
        maz@kernel.org, linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
 <1597058460-16211-8-git-send-email-mkshah@codeaurora.org>
 <87imdqpusi.fsf@kernel.org>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <59e3398e-ec95-0820-c317-156841a46ae7@codeaurora.org>
Date:   Thu, 13 Aug 2020 12:51:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87imdqpusi.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 8/10/2020 5:39 PM, Felipe Balbi wrote:
> Maulik Shah <mkshah@codeaurora.org> writes:
>
>> Clear previous kernel's configuration during init by resetting
>> interrupts in enable bank to zero.
>>
>> Suggested-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/irqchip/qcom-pdc.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
>> index dfcdfc5..80e0dfb 100644
>> --- a/drivers/irqchip/qcom-pdc.c
>> +++ b/drivers/irqchip/qcom-pdc.c
>> @@ -389,7 +389,8 @@ static const struct irq_domain_ops qcom_pdc_gpio_ops = {
>>   
>>   static int pdc_setup_pin_mapping(struct device_node *np)
>>   {
>> -	int ret, n;
>> +	int ret, n, i;
>> +	u32 irq_index, reg_index, val;
>>   
>>   	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
>>   	if (n <= 0 || n % 3)
>> @@ -418,6 +419,15 @@ static int pdc_setup_pin_mapping(struct device_node *np)
>>   						 &pdc_region[n].cnt);
>>   		if (ret)
>>   			return ret;
>> +
>> +		for (i = pdc_region[n].pin_base; i < pdc_region[n].pin_base +
>> +						 pdc_region[n].cnt; i++) {
> how about making the for loop slightly easier to read by moving pin_base
> inside the loop?
>
> 	for (i = 0; i < pdc_region[n].cnt; i++) {
>          	reg_index = (i + pdc_region[n].pin_base) >> 5;
>          	irq_index = (i + pdc_region[n].pin_base) & 0x1f;
>
> 		[...]
>          }

Sure, i will move pin_base inside for loop in v5.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

