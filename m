Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF9D4131C1
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 12:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhIUKky (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 06:40:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58373 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231804AbhIUKkx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 06:40:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632220765; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZlzWhpKuD86N3sKF5qadrUe8jAg9wMG0gZHbfTu48XQ=; b=m4V33mTj1ac1fzOjr2ehTZoC13MwxPXW48Gi0Y+R6LSB7Ph8E6Uqc7CItszfe3KyCDEG/lnH
 G9ubU8cdc1o6JAeakinSRIJfGMlSAm8kKrgicasra7oCZm35pbGCSyjhZOKsUZNR7vHkCof1
 IScynye6cHfEsYjclZ/42QzNymg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6149b64e65c3cc8c63b88dba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 10:39:10
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EBB4C43460; Tue, 21 Sep 2021 10:39:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.222.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3DFCCC4338F;
        Tue, 21 Sep 2021 10:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3DFCCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] pinctrl: qcom: Add egpio feature support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>
References: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
 <YUfZbsf3MX1aQJ2+@builder.lan>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <d2f28d34-99b3-30f8-8504-bc819946876f@codeaurora.org>
Date:   Tue, 21 Sep 2021 16:09:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUfZbsf3MX1aQJ2+@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 9/20/2021 6:14 AM, Bjorn Andersson wrote:
> On Fri 17 Sep 01:37 CDT 2021, Rajendra Nayak wrote:
> 
>> From: Prasad Sodagudi <psodagud@codeaurora.org>
>>
>> egpio is a scheme which allows special power Island Domain IOs
>> (LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
>> TLMM functions with Island Domain functions.
>> With this scheme, an IO can be controlled both by the cpu running
>> linux and the Island processor. This provides great flexibility to
>> re-purpose the Island IOs for regular TLMM usecases.
>>
>> 2 new bits are added to ctl_reg, egpio_present is a read only bit
>> which shows if egpio feature is available or not on a given gpio.
>> egpio_enable is the read/write bit and only effective if egpio_present
>> is 1. Once its set, the Island IO is controlled from Chip TLMM.
>> egpio_enable when set to 0 means the GPIO is used as Island Domain IO.
>>
>> The support exists on most recent qcom SoCs, and we add support
>> for sm8150/sm8250/sm8350 and sc7280 as part of this patch.
>>
> 
> I was under the impression that this feature would allow you to
> repurpose pins for use either by the remote island or by apps.

thats right, you can repurpose the pins for usage by apps by setting
the egpio_enable to 1, when set to 0 its owned by the island processor.
  
> 
> But if I understand your proposal, you check to see if the pin is
> "egpio capable" for a pin and if so just sets the bit - muxing it to
> apps (or the island?).

Right, so if there is a request for a egpio-capable pin, the driver
flips the ownership. Are you suggesting having some kind of checks to determine
who should own it?

> It seems reasonable that this would be another pinmux state for these
> pins, rather than just flipping them all in one or the other direction.

hmm, I don't understand. This is not a pinmux state, its a switch to decide
the ownership.
These egpio pins have regulator mux functions, some for apps, some for the
island processor, they might not always be used as gpios.
  
> PS. When I spoke with Prasad about this a couple of years ago, I think
> we talked about representing this as a pinconf property, but it seems to
> make more sense to me now that it would be a pinmux state.
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> [rnayak: rewrite commit log, minor rebase]
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c    | 4 ++++
>>   drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
>>   drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 ++
>>   drivers/pinctrl/qcom/pinctrl-sm8150.c | 2 ++
>>   drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 ++
>>   drivers/pinctrl/qcom/pinctrl-sm8350.c | 2 ++
>>   6 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 8476a8a..f4a2343 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -220,6 +220,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   	val = msm_readl_ctl(pctrl, g);
>>   	val &= ~mask;
>>   	val |= i << g->mux_bit;
>> +	/* Check if egpio present and enable that feature */
>> +	if (val & BIT(g->egpio_present))
>> +		val |= BIT(g->egpio_enable);
>> +
>>   	msm_writel_ctl(val, pctrl, g);
>>   
>>   	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
>> index e31a516..3635b31 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
>> @@ -77,6 +77,8 @@ struct msm_pingroup {
>>   	unsigned drv_bit:5;
>>   
>>   	unsigned od_bit:5;
>> +	unsigned egpio_enable:5;
>> +	unsigned egpio_present:5;
>>   	unsigned oe_bit:5;
>>   	unsigned in_bit:5;
>>   	unsigned out_bit:5;
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
>> index afddf6d..607d459 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
>> @@ -43,6 +43,8 @@
>>   		.mux_bit = 2,			\
>>   		.pull_bit = 0,			\
>>   		.drv_bit = 6,			\
>> +		.egpio_enable = 12,		\
>> +		.egpio_present = 11,		\
>>   		.oe_bit = 9,			\
>>   		.in_bit = 0,			\
>>   		.out_bit = 1,			\
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> index 7359bae..63a625a 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
>> @@ -56,6 +56,8 @@ enum {
>>   		.mux_bit = 2,			\
>>   		.pull_bit = 0,			\
>>   		.drv_bit = 6,			\
>> +		.egpio_enable = 12,		\
>> +		.egpio_present = 11,		\
>>   		.oe_bit = 9,			\
>>   		.in_bit = 0,			\
>>   		.out_bit = 1,			\
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
>> index af144e7..ad4fd94 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
>> @@ -57,6 +57,8 @@ enum {
>>   		.mux_bit = 2,				\
>>   		.pull_bit = 0,				\
>>   		.drv_bit = 6,				\
>> +		.egpio_enable = 12,			\
>> +		.egpio_present = 11,			\
>>   		.oe_bit = 9,				\
>>   		.in_bit = 0,				\
>>   		.out_bit = 1,				\
>> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
>> index 4d8f863..bb436dc 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
>> @@ -46,6 +46,8 @@
>>   		.mux_bit = 2,			\
>>   		.pull_bit = 0,			\
>>   		.drv_bit = 6,			\
>> +		.egpio_enable = 12,		\
>> +		.egpio_present = 11,		\
>>   		.oe_bit = 9,			\
>>   		.in_bit = 0,			\
>>   		.out_bit = 1,			\
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
