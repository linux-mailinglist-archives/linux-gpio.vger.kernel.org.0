Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C810C43FA5A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbhJ2KBb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 06:01:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54496 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231594AbhJ2KBa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 06:01:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635501542; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=UnsNoYW7wP4F8KSJMq0q8k/qnjr/LOlMEp/wGWG3buI=; b=Rwo5NEEDl5Xdy9zizHBz7prfiOssQKk2i1aijLFwENg7DjGyikgp29PUUkZUnFz3FtCbKKwH
 gnB+jpqcyNw//lphkQLyYpwOWMu7AYlERAZpN4HNhY8FrW7A6fRglvBtLMsKm9izHzj+FPhn
 aNqlaXA7WBwzdLT1X2r5Tb65FBk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 617bc5da648aeeca5c8222cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Oct 2021 09:58:50
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5593C43460; Fri, 29 Oct 2021 09:58:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.214.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBEDBC4338F;
        Fri, 29 Oct 2021 09:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DBEDBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
 <YXsrtTGZW66mUtkU@ripper>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <4fda39ce-189e-4873-dd40-3219c0052ffd@codeaurora.org>
Date:   Fri, 29 Oct 2021 15:28:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXsrtTGZW66mUtkU@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/29/2021 4:31 AM, Bjorn Andersson wrote:
> On Tue 26 Oct 05:07 PDT 2021, Rajendra Nayak wrote:
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
>> To support this we add a new function 'egpio' which can be used to
>> set the egpio_enable to 0, for any other TLMM controlled functions
>> we set the egpio_enable to 1.
>>
>> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++--
>>   drivers/pinctrl/qcom/pinctrl-msm.h |  4 ++++
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 8476a8a..bfdba3a 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -185,6 +185,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
>>   	struct irq_data *d = irq_get_irq_data(irq);
>>   	unsigned int gpio_func = pctrl->soc->gpio_func;
>> +	unsigned int egpio_func = pctrl->soc->egpio_func;
>>   	const struct msm_pingroup *g;
>>   	unsigned long flags;
>>   	u32 val, mask;
>> @@ -218,8 +219,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>>   	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>   
>>   	val = msm_readl_ctl(pctrl, g);
>> -	val &= ~mask;
>> -	val |= i << g->mux_bit;
>> +
>> +	if (egpio_func && i == egpio_func) {
>> +		if (val & BIT(g->egpio_present))
>> +			val &= ~BIT(g->egpio_enable);
>> +		else
>> +			return -EINVAL;
> 
> You're returning here with pctrl->lock held and irqs disabled.

argh, right. I will fix that and repost.
I wonder if I should just drop that error handling completely,
we wouldn't end up here unless the platform driver wrongly populates
a pin which does not support egpio with a egpio function.

> 
>> +	} else {
>> +		val &= ~mask;
>> +		val |= i << g->mux_bit;
>> +		/* Check if egpio present and enable that feature */
> 
> I never remember if egpio_enable means apss or lpass, so I think this
> comment would be better as:
> 
> 		/* Claim ownership of pin if egpio capable */

:) makes sense

> 
>> +		if (egpio_func && (val & BIT(g->egpio_present)))
> 
> Can't you drop the parenthesis around the second expression?

yes, will do, thanks for the review.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
